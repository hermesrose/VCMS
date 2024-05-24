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
public class AdminDbApoController {

	// 리스트
	@RequestMapping(value = "/ADMIN/dbApoAdminList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String dbApoAdminList(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		String gitDbDateFrom = request.getParameter("gitDbDateFrom");
		String gitDbDateTo = request.getParameter("gitDbDateTo");
		String gitDbWorkNm = request.getParameter("gitDbWorkNm");
		String gitDbAppNm = request.getParameter("gitDbAppNm");
		String gitDbDbNm = request.getParameter("gitDbDbNm");
		String gitDbAppDbNm = request.getParameter("gitDbAppDbNm");
		String gitDbMovnStat = request.getParameter("gitDbMovnStat");

		session.setAttribute("gitDbDateFrom", gitDbDateFrom);
		session.setAttribute("gitDbDateTo", gitDbDateTo);
		session.setAttribute("gitDbWorkNm", gitDbWorkNm);
		session.setAttribute("gitDbAppNm", gitDbAppNm);
		session.setAttribute("gitDbDbNm", gitDbDbNm);
		session.setAttribute("gitDbAppDbNm", gitDbAppDbNm);
		session.setAttribute("gitDbMovnStat", gitDbMovnStat);

		System.out.println("gitDbDateFrom::::" + gitDbDateFrom);
		System.out.println("gitDbDateTo::::" + gitDbDateTo);
		System.out.println("gitDbWorkNm::::" + gitDbWorkNm);
		System.out.println("gitDbAppNm::::" + gitDbAppNm);
		System.out.println("gitDbDbNm::::" + gitDbDbNm);
		System.out.println("gitDbAppDbNm::::" + gitDbAppDbNm);
		System.out.println("gitDbMovnStat::::" + gitDbMovnStat);

		// 카운트 조회
		dao = new CDao("admin.dbApoCount", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_DB_DATE_FROM", gitDbDateFrom);
		dao.SetParameter("P_GIT_DB_DATE_TO", gitDbDateTo);
		dao.SetParameter("P_GIT_DB_WORK_NM", gitDbWorkNm);
		dao.SetParameter("P_GIT_DB_APP_NM", gitDbAppNm);
		dao.SetParameter("P_GIT_DB_DB_NM", gitDbDbNm);
		dao.SetParameter("P_GIT_DB_APP_DB_NM", gitDbAppDbNm);
		dao.SetParameter("P_GIT_DB_MOVN_STAT", gitDbMovnStat);
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

		dao = new CDao("admin.dbApoList", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_DB_DATE_FROM", gitDbDateFrom);
		dao.SetParameter("P_GIT_DB_DATE_TO", gitDbDateTo);
		dao.SetParameter("P_GIT_DB_WORK_NM", gitDbWorkNm);
		dao.SetParameter("P_GIT_DB_APP_NM", gitDbAppNm);
		dao.SetParameter("P_GIT_DB_DB_NM", gitDbDbNm);
		dao.SetParameter("P_GIT_DB_APP_DB_NM", gitDbAppDbNm);
		dao.SetParameter("P_GIT_DB_MOVN_STAT", gitDbMovnStat);
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

		return "/admin/dbapo_400Admin/dbApoAdminList";
	}

	// 개별조회
	@RequestMapping(value = "/ADMIN/dbApoAdminView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String dbApoAdminView(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		String gitDbAppNo = request.getParameter("gitDbAppNo");

		System.out.println("gitDbAppNogitDbAppNo:::::" + gitDbAppNo);

		dao = new CDao("admin.dbApoView", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_DB_APP_NO", gitDbAppNo);
		System.out.println("2::::");
		List<Map<String, Object>> dbApoView = dao.ExecuteList();

		cb.SetView("dbApoView", dbApoView);

		return "/admin/dbapo_400Admin/dbApoAdminView";
	}

	// 관리자 코멘트
	@RequestMapping(value = "/ADMIN/dbApoComentRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String dbApoComentRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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
	
		String gitDbMovnStat = request.getParameter("gitDbMovnStat");
		String gitDbStoAddr = request.getParameter("gitDbStoAddr");
		String gitDbStuCont = request.getParameter("gitDbStuCont");
		String gitDbAppNo = request.getParameter("gitDbAppNo");
       
		System.out.println(gitDbMovnStat);
		System.out.println(gitDbStoAddr);
		System.out.println(gitDbStuCont);
		System.out.println(gitDbAppNo);
		
		System.out.println("1");
		dao = new CDao("admin.dbApoComent", IDao.Insert);
		dao.SetParameter("P_GIT_DB_MOVN_STAT", gitDbMovnStat);
		dao.SetParameter("P_GIT_DB_STO_ADDR", gitDbStoAddr);
		dao.SetParameter("P_GIT_DB_STU_CONT", gitDbStuCont);
		dao.SetParameter("P_GIT_DB_APP_NO", gitDbAppNo);
		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/ADMIN/dbApoAdminList.do";
	}

}
