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
public class AdminWasApoController {

	// 리스트 조회
	@RequestMapping(value = "/ADMIN/wasApoAdminList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String wasApoAdminList(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		String gitWasDateFrom = request.getParameter("gitWasDateFrom");
		String gitWasDateTo = request.getParameter("gitWasDateTo");
		String gitWasWorkNm = request.getParameter("gitWasWorkNm");
		String gitWasAppNm = request.getParameter("gitWasAppNm");
		String gitWasConNm = request.getParameter("gitWasConNm");
		String gitWasServer = request.getParameter("gitWasServer");
		String gitWasMovnStat = request.getParameter("gitWasMovnStat");

		session.setAttribute("gitWasDateFrom", gitWasDateFrom);
		session.setAttribute("gitWasDateTo", gitWasDateTo);
		session.setAttribute("gitWasWorkNm", gitWasWorkNm);
		session.setAttribute("gitWasAppNm", gitWasAppNm);
		session.setAttribute("gitWasConNm", gitWasConNm);
		session.setAttribute("gitWasServer", gitWasServer);
		session.setAttribute("gitWasMovnStat", gitWasMovnStat);

		System.out.println("gitWasDateFrom::::" + gitWasDateFrom);
		System.out.println("gitWasDateTo::::" + gitWasDateTo);
		System.out.println("gitWasWorkNm::::" + gitWasWorkNm);
		System.out.println("gitWasAppNm::::" + gitWasAppNm);
		System.out.println("gitWasConNm::::" + gitWasConNm);
		System.out.println("gitWasServer::::" + gitWasServer);
		System.out.println("gitWasMovnStat::::" + gitWasMovnStat);

		// 카운트 조회
		dao = new CDao("admin.wasApoCount", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_WAS_DATE_FROM", gitWasDateFrom);
		dao.SetParameter("P_GIT_WAS_DATE_TO", gitWasDateTo);
		dao.SetParameter("P_GIT_WAS_WORK_NM", gitWasWorkNm);
		dao.SetParameter("P_GIT_WAS_APP_NM", gitWasAppNm);
		dao.SetParameter("P_GIT_WAS_CON_NM", gitWasConNm);
		dao.SetParameter("P_GIT_WAS_SERVER", gitWasServer);
		dao.SetParameter("P_GIT_WAS_MOVN_STAT", gitWasMovnStat);
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

		dao = new CDao("admin.wasApoList", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_WAS_DATE_FROM", gitWasDateFrom);
		dao.SetParameter("P_GIT_WAS_DATE_TO", gitWasDateTo);
		dao.SetParameter("P_GIT_WAS_WORK_NM", gitWasWorkNm);
		dao.SetParameter("P_GIT_WAS_APP_NM", gitWasAppNm);
		dao.SetParameter("P_GIT_WAS_CON_NM", gitWasConNm);
		dao.SetParameter("P_GIT_WAS_SERVER", gitWasServer);
		dao.SetParameter("P_GIT_WAS_MOVN_STAT", gitWasMovnStat);
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

		return "/admin/wasapo_500Admin/wasApoAdminList";
	}

	// 개별조회
	@RequestMapping(value = "/ADMIN/wasApoAdminView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String wasApoAdminView(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		String gitWasAppNo = request.getParameter("gitWasAppNo");

		System.out.println("gitDbAppNogitDbAppNo:::::" + gitWasAppNo);

		dao = new CDao("admin.wasApoView", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_WAS_APP_NO", gitWasAppNo);
		System.out.println("2::::");
		List<Map<String, Object>> wasApoView = dao.ExecuteList();

		cb.SetView("wasApoView", wasApoView);

		return "/admin/wasapo_500Admin/wasApoAdminView";
	}

	// 관리자 코멘트
	@RequestMapping(value = "/ADMIN/wasApoComentRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String wasApoComentRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		String gitWasMovnStat = request.getParameter("gitWasMovnStat");
		String gitWasStuCont = request.getParameter("gitWasStuCont");
		String gitWasAppNo = request.getParameter("gitWasAppNo");

		System.out.println(gitWasMovnStat);
		System.out.println(gitWasStuCont);
		System.out.println(gitWasAppNo);

		System.out.println("1");
		dao = new CDao("admin.wasApoComent", IDao.Insert);
		dao.SetParameter("P_GIT_WAS_MOVN_STAT", gitWasMovnStat);
		dao.SetParameter("P_GIT_WAS_STU_CONT", gitWasStuCont);
		dao.SetParameter("P_GIT_WAS_APP_NO", gitWasAppNo);
		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/ADMIN/wasApoAdminList.do";
	}

}
