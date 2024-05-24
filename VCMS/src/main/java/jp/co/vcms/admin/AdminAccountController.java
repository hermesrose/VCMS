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

@Controller
public class AdminAccountController {

	// 관리자 리스트
	@RequestMapping(value = "/ADMIN/accountAdminList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String soureceList(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		String gitDateFrom = request.getParameter("gitDateFrom");
		String gitDateTo = request.getParameter("gitDateTo");
		String gitId = request.getParameter("gitId");
		String gitNm = request.getParameter("gitNm");
		String gitEmail = request.getParameter("gitEmail");
		String gitCompany = request.getParameter("gitCompany");
		String gitMovnStat = request.getParameter("gitMovnStat");

		session.setAttribute("gitDateFrom", gitDateFrom);
		session.setAttribute("gitDateTo", gitDateTo);
		session.setAttribute("gitId", gitId);
		session.setAttribute("gitNm", gitNm);
		session.setAttribute("gitEmail", gitEmail);
		session.setAttribute("gitCompany", gitCompany);
		session.setAttribute("gitMovnStat", gitMovnStat);

		System.out.println("gitIdgitIdgitId::::" + gitId);
		System.out.println("gitCompanygitCompanygitCompany::::" + gitCompany);
		System.out.println("userIduserIduserId::::" + userId);

		// 카운트
		dao = new CDao("admin.accountCount", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_DATE_FROM", gitDateFrom);
		dao.SetParameter("P_GIT_DATE_TO", gitDateTo);
		dao.SetParameter("P_GIT_ID", gitId);
		dao.SetParameter("P_GIT_NM", gitNm);
		dao.SetParameter("P_GIT_EMAIL", gitEmail);
		dao.SetParameter("P_GIT_COMPANY", gitCompany);
		dao.SetParameter("P_GIT_MOVN_STAT", gitMovnStat);
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

		startRow = String.valueOf(pageStart);
		endRow = String.valueOf(pageEnd);
		System.out.println("startRowstartRowstartRow::" + startRow);
		System.out.println("endRowendRowendRow::" + endRow);

		dao = new CDao("admin.accountList", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_DATE_FROM", gitDateFrom);
		dao.SetParameter("P_GIT_DATE_TO", gitDateTo);
		dao.SetParameter("P_GIT_ID", gitId);
		dao.SetParameter("P_GIT_NM", gitNm);
		dao.SetParameter("P_GIT_EMAIL", gitEmail);
		dao.SetParameter("P_GIT_COMPANY", gitCompany);
		dao.SetParameter("P_GIT_MOVN_STAT", gitMovnStat);
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

		startPageFinal = String.valueOf(startPage);
		endPageFinal = String.valueOf(endPage);

		cb.SetView("startPage", startPageFinal);
		cb.SetView("endPage", endPageFinal);
		cb.SetView("cntRow", cntRow);

		System.out.println("startPagestartPagestartPage:" + startPageFinal);
		System.out.println("endPageendPageendPage:" + endPageFinal);
		System.out.println("cntRowcntRowcntRowcntRow:" + cntRow);

		System.out.println("1111");

		return "/admin/account_300Admin/accountAdminList";
	}

	// 관리자 개별 조회
	@RequestMapping(value = "/ADMIN/accountAdminView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String soureceView(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		String gitAppNo = request.getParameter("gitAppNo");

		dao = new CDao("admin.accountView", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_APP_NO", gitAppNo);
		System.out.println("2::::");
		List<Map<String, Object>> accountGitView = dao.ExecuteList();

		cb.SetView("accountGitView", accountGitView);

		return "/admin/account_300Admin/accountAdminView";
	}

	// 관리자 코멘트
	@RequestMapping(value = "/ADMIN/accountComentRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String accountWriteRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		String gitMovnStat = request.getParameter("gitMovnStat");
		String gitStuCont = request.getParameter("gitStuCont");
		String gitAppNo = request.getParameter("gitAppNo");
		
		System.out.println("1");
		dao = new CDao("admin.accountComent", IDao.Insert);
		dao.SetParameter("P_GIT_MOVN_STAT", gitMovnStat);
		dao.SetParameter("P_GIT_STU_CONT", gitStuCont);
		dao.SetParameter("P_GIT_APP_NO", gitAppNo);
		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/ADMIN/accountAdminList.do";
	}

}
