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
public class AdminSourceController {

	// 리스트
	@RequestMapping(value = "/ADMIN/sourceAdminList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sourceAdminList(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		String scmDateFrom = request.getParameter("scmDateFrom");
		String scmDateTo = request.getParameter("scmDateTo");
		String scmChContent = request.getParameter("scmChContent");
		String scmAppNm = request.getParameter("scmAppNm");
		String scmRefFrom = request.getParameter("scmRefFrom");
		String scmRefTo = request.getParameter("scmRefTo");
		String scmConNm = request.getParameter("scmConNm");
		String scmWorkNm = request.getParameter("scmWorkNm");
		String scmMovnStat = request.getParameter("scmMovnStat");

		session.setAttribute("scmDateFrom", scmDateFrom);
		session.setAttribute("scmDateTo", scmDateTo);
		session.setAttribute("scmChContent", scmChContent);
		session.setAttribute("scmAppNm", scmAppNm);
		session.setAttribute("scmRefFrom", scmRefFrom);
		session.setAttribute("scmRefTo", scmRefTo);
		session.setAttribute("scmConNm", scmConNm);
		session.setAttribute("scmWorkNm", scmWorkNm);
		session.setAttribute("scmMovnStat", scmMovnStat);

		System.out.println("scmDateFrom::::" + scmDateFrom);
		System.out.println("scmDateTo::::" + scmDateTo);
		System.out.println("scmChContent::::" + scmChContent);
		System.out.println("scmAppNm::::" + scmAppNm);
		System.out.println("scmRefFrom::::" + scmRefFrom);
		System.out.println("scmRefTo::::" + scmRefTo);
		System.out.println("scmConNm::::" + scmConNm);
		System.out.println("scmWorkNm::::" + scmWorkNm);
		System.out.println("scmMovnStat::::" + scmMovnStat);

		// 카운트 조회
		dao = new CDao("admin.sourceCount", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_SCM_DATE_FROM", scmDateFrom);
		dao.SetParameter("P_SCM_DATE_TO", scmDateTo);
		dao.SetParameter("P_SCM_CH_CONTENT", scmChContent);
		dao.SetParameter("P_SCM_APP_NM", scmAppNm);
		dao.SetParameter("P_SCM_REF_FROM", scmRefFrom);
		dao.SetParameter("P_SCM_REF_TO", scmRefTo);
		dao.SetParameter("P_SCM_CON_NM", scmConNm);
		dao.SetParameter("P_SCM_WORK_NM", scmWorkNm);
		dao.SetParameter("P_SCM_MOVN_STAT", scmMovnStat);
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

		dao = new CDao("admin.sourceList", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_SCM_DATE_FROM", scmDateFrom);
		dao.SetParameter("P_SCM_DATE_TO", scmDateTo);
		dao.SetParameter("P_SCM_CH_CONTENT", scmChContent);
		dao.SetParameter("P_SCM_APP_NM", scmAppNm);
		dao.SetParameter("P_SCM_REF_FROM", scmRefFrom);
		dao.SetParameter("P_SCM_REF_TO", scmRefTo);
		dao.SetParameter("P_SCM_CON_NM", scmConNm);
		dao.SetParameter("P_SCM_WORK_NM", scmWorkNm);
		dao.SetParameter("P_SCM_MOVN_STAT", scmMovnStat);
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

		return "/admin/source_200Admin/sourceAdminList";
	}

	// 개별조회
	@RequestMapping(value = "/ADMIN/sourceAdminView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sourceAdminView(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		String scmAppNo = request.getParameter("scmAppNo");

		System.out.println("scmAppNoscmAppNoscmAppNo:::::" + scmAppNo);

		dao = new CDao("admin.sourceView", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_SCM_APP_NO", scmAppNo);
		System.out.println("2::::");
		List<Map<String, Object>> sourceView = dao.ExecuteList();

		cb.SetView("sourceView", sourceView);

		return "/admin/source_200Admin/sourceAdminView";
	}

	// 관리자 코멘트
	@RequestMapping(value = "/ADMIN/sourceComentRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sourceComentRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		String scmMovnStat = request.getParameter("scmMovnStat");
		String scmStuCont = request.getParameter("scmStuCont");
		String scmAppNo = request.getParameter("scmAppNo");

		System.out.println(scmMovnStat);
		System.out.println(scmStuCont);
		System.out.println(scmAppNo);

		System.out.println("1");
		dao = new CDao("admin.sourceComent", IDao.Insert);
		dao.SetParameter("P_SCM_MOVN_STAT", scmMovnStat);
		dao.SetParameter("P_SCM_STU_CONT", scmStuCont);
		dao.SetParameter("P_SCM_APP_NO", scmAppNo);
		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/ADMIN/sourceAdminList.do";
	}

}
