package jp.co.vcms.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jp.co.vcms.common.CBase;
import jp.co.vcms.common.CDao;
import jp.co.vcms.common.IDao;
import jp.co.vcms.common.VCMSUtility;

@Controller
public class AdminUserController {

	// 리스트
	@RequestMapping(value = "/ADMIN/userAdminList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String userAdminList(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");
		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		// 슈퍼관리자 체크
		dao = new CDao("admin.adminCheck", IDao.Select);
		Map<String, Object> adminCheck = dao.ExecuteMap();
		System.out.println("adminCheck:::" + adminCheck);

		String adminId = adminCheck.get("SUPER_ID").toString();
		System.out.println("adminIdadminIdadminId:::" + adminId);
		System.out.println("userIduserIduserId:::" + userId);
		// userId != adminId
		if (!userId.equals(adminId)) {
			return "/error/error";
		}

		String startRow = "";
		String endRow = "";
		int pageBlock = 10;

		String row = request.getParameter("row");

		String userDateFrom = request.getParameter("userDateFrom");
		String userDateTo = request.getParameter("userDateTo");
		String userIdNm = request.getParameter("userIdNm");
		String userNm = request.getParameter("userNm");
		String userPhone = request.getParameter("userPhone");
		String userCompany = request.getParameter("userCompany");

		session.setAttribute("userDateFrom", userDateFrom);
		session.setAttribute("userDateTo", userDateTo);
		session.setAttribute("userIdNm", userIdNm);
		session.setAttribute("userNm", userNm);
		session.setAttribute("userPhone", userPhone);
		session.setAttribute("userCompany", userCompany);

		System.out.println("userDateFrom::::" + userDateFrom);
		System.out.println("userDateTo::::" + userDateTo);
		System.out.println("userIdNm::::" + userIdNm);
		System.out.println("userNm::::" + userNm);
		System.out.println("userPhone::::" + userPhone);
		System.out.println("userCompany::::" + userCompany);

		// 카운트 조회
		dao = new CDao("admin.userCount", IDao.Select);
		dao.SetParameter("P_USER_DATE_FROM", userDateFrom);
		dao.SetParameter("P_USER_DATE_TO", userDateTo);
		dao.SetParameter("P_USER_ID", userIdNm);
		dao.SetParameter("P_USER_NM", userNm);
		dao.SetParameter("P_USER_PHONE", userPhone);
		dao.SetParameter("P_USER_COMPANY", userCompany);
		Map<String, Object> listCount = dao.ExecuteMap();
		System.out.println("listCountlistCountlistCount:::" + listCount);

		String listCountFinal = listCount.get("COUNT(*)").toString();
		System.out.println("ListCountFinalListCountFinalListCountFinal:::" + listCountFinal);

		int listCountNum = Integer.parseInt(listCountFinal);
		int count = listCountNum / 10 + 1; // 42

		cb.SetView("COUNT", count);
		System.out.println("count:::::::::::::::::::::::" + count);
		if (row == null) {
			row = "1";
		}

		System.out.println("row:::::::::::::::::::::::" + row);

		int PageNext = Integer.parseInt(row);

		if ((PageNext > count) && (PageNext % 10 == 0)) {

			PageNext = count - 1;
		}
		System.out.println("PageNext:::check::::" + PageNext);
		System.out.println("count:::::check::" + count);

		int pageStart = PageNext * 10 - 9;
		int pageEnd = PageNext * 10;

		if (pageStart < 0) {
			pageStart = 1;
			pageEnd = 10;
		}

		if (pageEnd > listCountNum) {
			pageEnd = count * 10;
			pageStart = pageEnd - 9;
		}

		startRow = String.valueOf(pageStart); // 최종 1
		endRow = String.valueOf(pageEnd); // 최종 10
		System.out.println("startRowstartRowstartRow::" + startRow);
		System.out.println("endRowendRowendRow::" + endRow);

		dao = new CDao("admin.userList", IDao.Select);
		dao.SetParameter("P_USER_DATE_FROM", userDateFrom);
		dao.SetParameter("P_USER_DATE_TO", userDateTo);
		dao.SetParameter("P_USER_ID", userIdNm);
		dao.SetParameter("P_USER_NM", userNm);
		dao.SetParameter("P_USER_PHONE", userPhone);
		dao.SetParameter("P_USER_COMPANY", userCompany);
		dao.SetParameter("P_START_ROW", startRow);
		dao.SetParameter("P_END_ROW", endRow);
		System.out.println("2::::");
		List<Map<String, Object>> listSelect = dao.ExecuteList();
		System.out.println("3::::");
		cb.SetView("LISTSELECT", listSelect);
		System.out.println("listSelectlistSelectlistSelect" + listSelect);

		int cntRow = Integer.parseInt(row);
		int startPage = cntRow - (cntRow % pageBlock) + 1;
		int endPage = cntRow - (cntRow % pageBlock) + 10;

		if (startPage > count) {
			startPage = count;
			endPage = count;
		}

		if (endPage > count) {
			endPage = count;
		}

		String startPageFinal;
		String endPageFinal;

		System.out.println("listCountNumNomail::" + listCountNum);
		if (listCountNum % 10 == 0) {
			endPage = endPage - 1;
			System.out.println("endPageif::" + endPage);
		}

		startPageFinal = String.valueOf(startPage); // 최종 1
		endPageFinal = String.valueOf(endPage); // 최종 10

		cb.SetView("startPage", startPageFinal);
		cb.SetView("endPage", endPageFinal);
		cb.SetView("cntRow", cntRow);

		System.out.println("startPagestartPagestartPage:" + startPageFinal);
		System.out.println("endPageendPageendPage:" + endPageFinal);
		System.out.println("cntRowcntRowcntRowcntRow:" + cntRow);

		return "/admin/user_100Admin/userAdminList";
	}

	// 개별 조회
	@RequestMapping(value = "/ADMIN/userAdminView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String userAdminView(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		// 슈퍼관리자 체크
		dao = new CDao("admin.adminCheck", IDao.Select);
		Map<String, Object> adminCheck = dao.ExecuteMap();
		System.out.println("adminCheck:::" + adminCheck);

		String adminId = adminCheck.get("SUPER_ID").toString();
		System.out.println("adminIdadminIdadminId:::" + adminId);
		System.out.println("userIduserIduserId:::" + userId);
		// userId != adminId
		if (!userId.equals(adminId)) {
			return "/error/error";
		}

		String userNo = request.getParameter("userNo");

		System.out.println("userNouserNouserNo:::::" + userNo);

		dao = new CDao("admin.userView", IDao.Select);
		dao.SetParameter("P_USER_NO", userNo);
		System.out.println("2::::");
		List<Map<String, Object>> userView = dao.ExecuteList();

		cb.SetView("userView", userView);

		return "/admin/user_100Admin/userAdminView";
	}

	// 수정
	@RequestMapping(value = "/ADMIN/userAdminModify.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String userAdminModify(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		// 슈퍼관리자 체크
		dao = new CDao("admin.adminCheck", IDao.Select);
		Map<String, Object> adminCheck = dao.ExecuteMap();
		System.out.println("adminCheck:::" + adminCheck);

		String adminId = adminCheck.get("SUPER_ID").toString();
		System.out.println("adminIdadminIdadminId:::" + adminId);
		System.out.println("userIduserIduserId:::" + userId);
		// userId != adminId
		if (!userId.equals(adminId)) {
			return "/error/error";
		}

		// 부서 조회
		dao = new CDao("Common.userCompany", IDao.Select);
		List<Map<String, Object>> listCompany = dao.ExecuteList();
		cb.SetView("LISTCOMPANY", listCompany);
		System.out.println("listCompanylistCompanylistCompany::" + listCompany);

		String userNo = request.getParameter("userNo");
		System.out.println("userNo:::::" + userNo);

		dao = new CDao("admin.userView", IDao.Select);
		dao.SetParameter("P_USER_NO", userNo);
		System.out.println("2::::");
		List<Map<String, Object>> userView = dao.ExecuteList();

		cb.SetView("userView", userView);

		return "/admin/user_100Admin/userAdminModify";
	}

	// 수정 RUN
	@RequestMapping(value = "/ADMIN/userAdminModifyRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String userModifyRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String userNo = request.getParameter("userNo");
		String userCompany = request.getParameter("userCompany");
		String userPhone = request.getParameter("userPhone");
		String userPwBefore = request.getParameter("userPw");

		try { // try
			String userPw = VCMSUtility.SecurityHashingAlgorithm512(userPwBefore);

			System.out.println(userNo);
			System.out.println(userCompany);
			System.out.println(userPhone);
			System.out.println(userPw);

			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("userInfo");
			System.out.println(userId);

			if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
				return "/error/error";
			}

			// 슈퍼관리자 체크
			dao = new CDao("admin.adminCheck", IDao.Select);
			Map<String, Object> adminCheck = dao.ExecuteMap();
			System.out.println("adminCheck:::" + adminCheck);

			String adminId = adminCheck.get("SUPER_ID").toString();
			System.out.println("adminIdadminIdadminId:::" + adminId);
			System.out.println("userIduserIduserId:::" + userId);
			// userId != adminId
			if (!userId.equals(adminId)) {
				return "/error/error";
			}

			System.out.println("1");
			dao = new CDao("admin.userModify", IDao.Update);
			dao.SetParameter("P_USER_COMPANY", userCompany);
			dao.SetParameter("P_USER_PHONE", userPhone);
			dao.SetParameter("P_USER_PW", userPw);
			dao.SetParameter("P_USER_NO", userNo);
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

		return "redirect:/ADMIN/userAdminList.do";
	}

	// 삭제
	@RequestMapping(value = "/ADMIN/userDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sourceDelete(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String userNo = request.getParameter("userNo");
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		System.out.println("userNo::::" + userNo);

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		// 슈퍼관리자 체크
		dao = new CDao("admin.adminCheck", IDao.Select);
		Map<String, Object> adminCheck = dao.ExecuteMap();
		System.out.println("adminCheck:::" + adminCheck);

		String adminId = adminCheck.get("SUPER_ID").toString();
		System.out.println("adminIdadminIdadminId:::" + adminId);
		System.out.println("userIduserIduserId:::" + userId);
		// userId != adminId
		if (!userId.equals(adminId)) {
			return "/error/error";
		}

		System.out.println("1");
		dao = new CDao("admin.userDelete", IDao.Update);
		dao.SetParameter("P_USER_NO", userNo);
		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/ADMIN/userAdminList.do";
	}

}
