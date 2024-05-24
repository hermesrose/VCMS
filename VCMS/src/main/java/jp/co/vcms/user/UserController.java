package jp.co.vcms.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import jp.co.vcms.common.CBase;
import jp.co.vcms.common.CDao;
import jp.co.vcms.common.IDao;
import jp.co.vcms.common.VCMSUtility;

@Controller
public class UserController {

	// 로그인 호출
	@RequestMapping(value = "/USER_100/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainLogin(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		return "/user_100/login";
	}

	// 로그아웃
	@RequestMapping(value = "/USER_100/logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		return "/user_100/logout";
	}

	// 로그인 RUN
	@RequestMapping(value = "/USER_100/loginRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginRun(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap)
			throws Exception {

		CDao dao = null;
		CBase cb = new CBase(request, response);
		String userId = request.getParameter("userId");
		String userPwBefore = request.getParameter("userPw");

		System.out.println("userIduserIduserId::::" + userId);
		System.out.println("userPwBeforeuserPwBeforeuserPwBefore::::" + userPwBefore);

		String userPw = VCMSUtility.SecurityHashingAlgorithm512(userPwBefore);
		System.out.println("userPwuserPw::::" + userPw);
		dao = new CDao("User.userLogin", IDao.Select);
		dao.SetParameter("P_USER_ID", userId);
		dao.SetParameter("P_USER_PW", userPw);
		System.out.println("2::::");
		List<Map<String, Object>> listSelect = dao.ExecuteList();
		System.out.println("3::::");
		cb.SetView("LISTSELECT", listSelect);
		System.out.println("listSelectlistSelectlistSelect" + listSelect);

		if (listSelect.isEmpty()) {
			return "/user_100/login2";
		}

		String userInfo = listSelect.get(0).get("USER_ID").toString();
		System.out.println("userInfouserInfouserInfo::" + userInfo);

		String userNm = listSelect.get(0).get("USER_NM").toString();
		System.out.println("userNmuserNmuserNm::" + userNm);

		// 세션 삽입
		HttpSession session = request.getSession();
		session.setAttribute("userInfo", userInfo);
		session.setAttribute("userNm", userNm);

		return "redirect:/SOURCE_200/sourceList.do";
	}

	// 회원가입 페이지 띄우기
	@RequestMapping(value = "/USER_100/signUp.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String signUp(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		// 부서 조회
		dao = new CDao("Common.userCompany", IDao.Select);
		List<Map<String, Object>> listCompany = dao.ExecuteList();
		cb.SetView("LISTCOMPANY", listCompany);
		System.out.println("listCompanylistCompanylistCompany::" + listCompany);

		return "/user_100/signUp";
	}

	// ID 중복체크
	@ResponseBody
	@RequestMapping(value = "/USER_100/IdCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String IdCheck(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);
		String userId = request.getParameter("userId");
		boolean userCheck = true;
		System.out.println("중복체크userId::::" + userId);

		dao = new CDao("User.userIdCheck", IDao.Select);
		dao.SetParameter("P_USER_ID", userId);
		List<Map<String, Object>> listSelect = dao.ExecuteList();

		System.out.println("listSelect::::" + listSelect);

		// json
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonstr = objectMapper.writeValueAsString(listSelect);

		System.out.println("jsonstrjsonstrjsonstr::::::" + jsonstr);

		return jsonstr;
	}

	// 회원가입 런
	@RequestMapping(value = "/USER_100/signUpRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String signUpRun(HttpServletRequest request, HttpServletResponse response, Model modelMap) throws Exception {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String userCompany = request.getParameter("userCompany");
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");
		String userPwBefore = request.getParameter("userPw");
		String userPhone = request.getParameter("userPhone");

		// System.out.println("userPw::::::" + userPwBefore);

		String userPw = VCMSUtility.SecurityHashingAlgorithm512(userPwBefore);
		// System.out.println("userPw:::::SHA-512:" + userPw);

		dao = new CDao("User.insertUser", IDao.Insert);
		dao.SetParameter("P_USER_COMPANY", userCompany);
		dao.SetParameter("P_USER_NM", userName);
		dao.SetParameter("P_USER_PHONE", userPhone);
		dao.SetParameter("P_USER_ID", userId);
		dao.SetParameter("P_USER_PW", userPw);
		dao.Execute();

		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}

		return "/user_100/login";

	}

	// 유저 수정
	@RequestMapping(value = "/USER_100/userModify.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String userModify(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		// 부서 조회
		dao = new CDao("Common.userCompany", IDao.Select);
		List<Map<String, Object>> listCompany = dao.ExecuteList();
		cb.SetView("LISTCOMPANY", listCompany);
		System.out.println("listCompanylistCompanylistCompany::" + listCompany);

		System.out.println("userIduserIduserId:::::" + userId);

		dao = new CDao("User.userInfo", IDao.Select);
		dao.SetParameter("P_USER_ID", userId);
		System.out.println("2::::");
		List<Map<String, Object>> userInfo = dao.ExecuteList();

		cb.SetView("userInfo", userInfo);

		return "/user_100/userModify";
	}

	// 수정 RUN
	@RequestMapping(value = "/USER_100/userModifyRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String userModifyRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String userCompany = request.getParameter("userCompany");
		String userPhone = request.getParameter("userPhone");
		String userPwBefore = request.getParameter("userPw");

		try { // try
			String userPw = VCMSUtility.SecurityHashingAlgorithm512(userPwBefore);

			System.out.println(userCompany);
			System.out.println(userPhone);
			System.out.println(userPw);

			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("userInfo");
			System.out.println(userId);

			if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
				return "/error/error";
			}

			System.out.println("1");
			dao = new CDao("User.userModify", IDao.Update);
			dao.SetParameter("P_USER_COMPANY", userCompany);
			dao.SetParameter("P_USER_PHONE", userPhone);
			dao.SetParameter("P_USER_PW", userPw);
			dao.SetParameter("P_USER_ID", userId);
			dao.Execute();
			System.out.println("2");
			String MSG = (String) dao.paramMap.get("P_MSG");

			if (!"OK".equals(MSG)) {
				System.out.println("MSG::::" + MSG);

				return "/error/error";
			}
			System.out.println("3");

		} catch (Exception e) {
			e.printStackTrace();
		} // end

		return "redirect:/USER_100/userView.do";
	}

	// 회정 정보 조회
	@RequestMapping(value = "/USER_100/userView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String userView(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		System.out.println("userIduserIduserId:::::" + userId);

		dao = new CDao("User.userInfo", IDao.Select);
		dao.SetParameter("P_USER_ID", userId);
		System.out.println("2::::");
		List<Map<String, Object>> userInfo = dao.ExecuteList();

		cb.SetView("userInfo", userInfo);

		return "/user_100/userView";
	}

}
