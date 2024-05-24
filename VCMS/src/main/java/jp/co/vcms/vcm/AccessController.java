package jp.co.vcms.vcm;

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
public class AccessController {

	// 리스트
	@RequestMapping(value = "/ACCESS_600/accessList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String accessList(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");
		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
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
		dao = new CDao("access.accessCount", IDao.Select);
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

		dao = new CDao("access.accessList", IDao.Select);
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

		return "/access_600/accessList";
	}

	// 개별조회
	@RequestMapping(value = "/ACCESS_600/accessView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String accessView(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		String accAppNo = request.getParameter("accAppNo");

		System.out.println("accAppNoaccAppNoaccAppNo:::::" + accAppNo);

		dao = new CDao("access.accessView", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_ACC_APP_NO", accAppNo);
		System.out.println("2::::");
		List<Map<String, Object>> accessView = dao.ExecuteList();

		cb.SetView("accessView", accessView);

		return "/access_600/accessView";
	}

	// 글쓰기
	@RequestMapping(value = "/ACCESS_600/accessWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String accessWrite(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		// 부서 조회
		dao = new CDao("Common.DepList", IDao.Select);
		List<Map<String, Object>> DepList = dao.ExecuteList();
		cb.SetView("DEPLIST", DepList);
		System.out.println("listCompanylistCompanylistCompany::" + DepList);

		return "/access_600/accessWrite";
	}

	// 글쓰기 런
	@RequestMapping(value = "/ACCESS_600/accessWriteRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String accessWriteRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		String accProjectNm = request.getParameter("accProjectNm");
		String accDpt = request.getParameter("accDpt");
		String accProjectStart = request.getParameter("accProjectStart");
		String accProjectEnd = request.getParameter("accProjectEnd");
		String accEmpNm = request.getParameter("accEmpNm");
		String accAppNm = request.getParameter("accAppNm");
		String accPhone = request.getParameter("accPhone");
		String accSortation = request.getParameter("accSortation");
		String accAppDd = request.getParameter("accAppDd");
		String accWorkNm = request.getParameter("accWorkNm");
		String accAppOrgan = request.getParameter("radiAccess");
		String accOrganLoca = request.getParameter("radiLocation");
		String accAppSave = request.getParameter("accAppSave");
		String accAppGitNm = request.getParameter("accAppGitNm");
		String accAccAppNm = request.getParameter("accAccAppNm");
		String accAffiliation = request.getParameter("accAffiliation");
		String accRemark = request.getParameter("accRemark");

		System.out.println(accProjectNm);
		System.out.println(accDpt);
		System.out.println(accProjectStart);
		System.out.println(accProjectEnd);
		System.out.println(accEmpNm);
		System.out.println(accAppNm);
		System.out.println(accPhone);
		System.out.println(accSortation);
		System.out.println(accAppDd);
		System.out.println(accWorkNm);
		System.out.println(accAppOrgan);
		System.out.println(accOrganLoca);
		System.out.println(accAppSave);
		System.out.println(accAppGitNm);
		System.out.println(accAppGitNm);
		System.out.println(accAccAppNm);
		System.out.println(accAffiliation);
		System.out.println(accRemark);
		System.out.println(userId);

		System.out.println("1");
		dao = new CDao("access.accessWrite", IDao.Insert);
		dao.SetParameter("P_ACC_PROJECT_NM", accProjectNm);
		dao.SetParameter("P_ACC_DPT", accDpt);
		dao.SetParameter("P_ACC_PROJECT_START", accProjectStart);
		dao.SetParameter("P_ACC_PROJECT_END", accProjectEnd);
		dao.SetParameter("P_ACC_EMP_NM", accEmpNm);
		dao.SetParameter("P_ACC_APP_NM", accAppNm);
		dao.SetParameter("P_ACC_PHONE", accPhone);
		dao.SetParameter("P_ACC_SORTATION", accSortation);
		dao.SetParameter("P_ACC_APP_DD", accAppDd);
		dao.SetParameter("P_ACC_WORK_NM", accWorkNm);
		dao.SetParameter("P_ACC_APP_ORGAN", accAppOrgan);
		dao.SetParameter("P_ACC_ORGAN_LOCA", accOrganLoca);
		dao.SetParameter("P_ACC_APP_SAVE", accAppSave);
		dao.SetParameter("P_ACC_APP_GIT_NM", accAppGitNm);
		dao.SetParameter("P_ACC_ACC_APP_NM", accAccAppNm);
		dao.SetParameter("P_ACC_AFFILIATION", accAffiliation);
		dao.SetParameter("P_ACC_REMARK", accRemark);
		dao.SetParameter("P_GIT_ID", userId);

		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");
		System.out.println("MSG::::" + MSG);

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}

		System.out.println("3");

		return "redirect:/ACCESS_600/accessList.do";
	}

	// 수정하기
	@RequestMapping(value = "/ACCESS_600/accessModify.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String accessModify(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String accAppNo = request.getParameter("accAppNo");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		dao = new CDao("Common.DepList", IDao.Select);
		List<Map<String, Object>> DepList = dao.ExecuteList();
		cb.SetView("DEPLIST", DepList);
		System.out.println("DepListDepListDepListDepList::" + DepList);

		System.out.println("accAppNoaccAppNoaccAppNo:::::" + accAppNo);

		dao = new CDao("access.accessView", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_ACC_APP_NO", accAppNo);
		System.out.println("2::::");
		List<Map<String, Object>> accessView = dao.ExecuteList();

		cb.SetView("accessView", accessView);

		return "/access_600/accessModify";
	}

	// 수정 RUN
	@RequestMapping(value = "/ACCESS_600/accessModifyRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String accessModifyRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String accProjectNm = request.getParameter("accProjectNm");
		String accDpt = request.getParameter("accDpt");
		String accProjectStart = request.getParameter("accProjectStart");
		String accProjectEnd = request.getParameter("accProjectEnd");
		String accEmpNm = request.getParameter("accEmpNm");
		String accAppNm = request.getParameter("accAppNm");
		String accPhone = request.getParameter("accPhone");
		String accSortation = request.getParameter("accSortation");
		String accAppDd = request.getParameter("accAppDd");
		String accWorkNm = request.getParameter("accWorkNm");
		String accAppOrgan = request.getParameter("radiAccess");
		String accOrganLoca = request.getParameter("radiLocation");
		String accAppSave = request.getParameter("accAppSave");
		String accAppGitNm = request.getParameter("accAppGitNm");
		String accAccAppNm = request.getParameter("accAccAppNm");
		String accAffiliation = request.getParameter("accAffiliation");
		String accRemark = request.getParameter("accRemark");
		String accAppNo = request.getParameter("accAppNo");

		System.out.println(accProjectNm);
		System.out.println(accDpt);
		System.out.println(accProjectStart);
		System.out.println(accProjectEnd);
		System.out.println(accEmpNm);
		System.out.println(accAppNm);
		System.out.println(accPhone);
		System.out.println(accSortation);
		System.out.println(accAppDd);
		System.out.println(accWorkNm);
		System.out.println(accAppOrgan);
		System.out.println(accOrganLoca);
		System.out.println(accAppSave);
		System.out.println(accAppGitNm);
		System.out.println(accAccAppNm);
		System.out.println(accAffiliation);
		System.out.println(accRemark);
		System.out.println(accAppNo);

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		System.out.println(userId);

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		System.out.println("1");
		dao = new CDao("access.accessModify", IDao.Update);
		dao.SetParameter("P_ACC_PROJECT_NM", accProjectNm);
		dao.SetParameter("P_ACC_DPT", accDpt);
		dao.SetParameter("P_ACC_PROJECT_START", accProjectStart);
		dao.SetParameter("P_ACC_PROJECT_END", accProjectEnd);
		dao.SetParameter("P_ACC_EMP_NM", accEmpNm);
		dao.SetParameter("P_ACC_APP_NM", accAppNm);
		dao.SetParameter("P_ACC_PHONE", accPhone);
		dao.SetParameter("P_ACC_SORTATION", accSortation);
		dao.SetParameter("P_ACC_APP_DD", accAppDd);
		dao.SetParameter("P_ACC_WORK_NM", accWorkNm);
		dao.SetParameter("P_ACC_APP_ORGAN", accAppOrgan);
		dao.SetParameter("P_ACC_ORGAN_LOCA", accOrganLoca);
		dao.SetParameter("P_ACC_APP_SAVE", accAppSave);
		dao.SetParameter("P_ACC_APP_GIT_NM", accAppGitNm);
		dao.SetParameter("P_ACC_ACC_APP_NM", accAccAppNm);
		dao.SetParameter("P_ACC_AFFILIATION", accAffiliation);
		dao.SetParameter("P_ACC_REMARK", accRemark);
		dao.SetParameter("P_ACC_APP_NO", accAppNo);
		dao.SetParameter("P_GIT_ID", userId);

		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/ACCESS_600/accessList.do";
	}

	// 삭제
	@RequestMapping(value = "/ACCESS_600/accessDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String accessDelete(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String accAppNo = request.getParameter("accAppNo");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		System.out.println("accAppNo::::" + accAppNo);
		System.out.println("userId::::" + userId);

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		System.out.println("1");
		dao = new CDao("access.accessDelete", IDao.Update);
		dao.SetParameter("P_ACC_APP_NO", accAppNo);
		dao.SetParameter("P_NOW_ID", userId);
		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/ACCESS_600/accessList.do";
	}

}
