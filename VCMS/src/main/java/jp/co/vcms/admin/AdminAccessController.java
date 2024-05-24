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
public class AdminAccessController {

	// 리스트
	@RequestMapping(value = "/ADMIN/accessAdminList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String accessAdminList(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		String accDateFrom = request.getParameter("accDateFrom");
		String accDateTo = request.getParameter("accDateTo");
		String accAppNm = request.getParameter("accAppNm");
		String accWorkNm = request.getParameter("accWorkNm");
		String accAppOrgan = request.getParameter("accAppOrgan");
		String accOrganLoca = request.getParameter("accOrganLoca");
		String accMovnStat = request.getParameter("accMovnStat");
		String accAppSave = request.getParameter("accAppSave");

		session.setAttribute("accDateFrom", accDateFrom);
		session.setAttribute("accDateTo", accDateTo);
		session.setAttribute("accAppNm", accAppNm);
		session.setAttribute("accWorkNm", accWorkNm);
		session.setAttribute("accAppOrgan", accAppOrgan);
		session.setAttribute("accOrganLoca", accOrganLoca);
		session.setAttribute("accMovnStat", accMovnStat);
		session.setAttribute("accAppSave", accAppSave);

		System.out.println("accDateFrom::::" + accDateFrom);
		System.out.println("accDateTo::::" + accDateTo);
		System.out.println("accAppNm::::" + accAppNm);
		System.out.println("accWorkNm::::" + accWorkNm);
		System.out.println("accAppOrgan::::" + accAppOrgan);
		System.out.println("accOrganLoca::::" + accOrganLoca);
		System.out.println("accMovnStat::::" + accMovnStat);
		System.out.println("accAppSave::::" + accAppSave);

		// 카운트 조회
		dao = new CDao("admin.accessCount", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_ACC_DATE_FROM", accDateFrom);
		dao.SetParameter("P_ACC_DATE_TO", accDateTo);
		dao.SetParameter("P_ACC_APP_NM", accAppNm);
		dao.SetParameter("P_ACC_WORK_NM", accWorkNm);
		dao.SetParameter("P_ACC_APP_ORGAN", accAppOrgan);
		dao.SetParameter("P_ACC_ORGAN_LOCA", accOrganLoca);
		dao.SetParameter("P_ACC_MOVN_STAT", accMovnStat);
		dao.SetParameter("P_ACC_APP_SAVE", accAppSave);
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

		dao = new CDao("admin.accessList", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_ACC_DATE_FROM", accDateFrom);
		dao.SetParameter("P_ACC_DATE_TO", accDateTo);
		dao.SetParameter("P_ACC_APP_NM", accAppNm);
		dao.SetParameter("P_ACC_WORK_NM", accWorkNm);
		dao.SetParameter("P_ACC_APP_ORGAN", accAppOrgan);
		dao.SetParameter("P_ACC_ORGAN_LOCA", accOrganLoca);
		dao.SetParameter("P_ACC_MOVN_STAT", accMovnStat);
		dao.SetParameter("P_ACC_APP_SAVE", accAppSave);
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

		return "/admin/access_600Admin/accessAdminList";
	}

	// 개별조회
	@RequestMapping(value = "/ADMIN/accessAdminView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String accessAdminView(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		String accAppNo = request.getParameter("accAppNo");

		System.out.println("accAppNoaccAppNoaccAppNo:::::" + accAppNo);

		dao = new CDao("admin.accessView", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_ACC_APP_NO", accAppNo);
		System.out.println("2::::");
		List<Map<String, Object>> accessView = dao.ExecuteList();

		cb.SetView("accessView", accessView);

		return "/admin/access_600Admin/accessAdminView";
	}

	// 관리자 코멘트
	@RequestMapping(value = "/ADMIN/accessComentRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String accessComentRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		String accMovnStat = request.getParameter("accMovnStat");
		String accStuCont = request.getParameter("accStuCont");
		String accAppNo = request.getParameter("accAppNo");

		System.out.println(accMovnStat);
		System.out.println(accStuCont);
		System.out.println(accAppNo);

		System.out.println("1");
		dao = new CDao("admin.accessComent", IDao.Insert);
		dao.SetParameter("P_ACC_MOVN_STAT", accMovnStat);
		dao.SetParameter("P_ACC_STU_CONT", accStuCont);
		dao.SetParameter("P_ACC_APP_NO", accAppNo);
		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/ADMIN/accessAdminList.do";
	}

}
