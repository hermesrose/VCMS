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
public class WasApoController {

	// 리스트 조회
	@RequestMapping(value = "/WASAPO_500/wasApoList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String wasApoList(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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
		dao = new CDao("wasApo.wasApoCount", IDao.Select);
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

		dao = new CDao("wasApo.wasApoList", IDao.Select);
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

		return "/wasapo_500/wasApoList";
	}

	// 개별 조회
	@RequestMapping(value = "/WASAPO_500/wasApoView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String wasApoView(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		String gitWasAppNo = request.getParameter("gitWasAppNo");

		System.out.println("gitDbAppNogitDbAppNo:::::" + gitWasAppNo);

		dao = new CDao("wasApo.wasApoView", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_WAS_APP_NO", gitWasAppNo);
		System.out.println("2::::");
		List<Map<String, Object>> wasApoView = dao.ExecuteList();

		cb.SetView("wasApoView", wasApoView);

		return "/wasapo_500/wasApoView";
	}

	// 글쓰기
	@RequestMapping(value = "/WASAPO_500/wasApoWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String wasApoWrite(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		return "/wasapo_500/wasApoWrite";
	}

	// 글쓰기 런
	@RequestMapping(value = "/WASAPO_500/wasApoWriteRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String wasApoWriteRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		String gitWasProjectNm = request.getParameter("gitWasProjectNm");
		String gitWasAppNm = request.getParameter("gitWasAppNm");
		String gitWasDpt = request.getParameter("gitWasDpt");
		String gitWasProjectStart = request.getParameter("gitWasProjectStart");
		String gitWasProjectEnd = request.getParameter("gitWasProjectEnd");
		String gitWasEmpNm = request.getParameter("gitWasEmpNm");
		String gitWasAppPhone = request.getParameter("gitWasAppPhone");
		String gitWasSortation = request.getParameter("gitWasSortation");
		String gitWasWorkNm = request.getParameter("gitWasWorkNm");
		String gitWasAppDd = request.getParameter("gitWasAppDd");
		String gitWasConNm = request.getParameter("gitWasConNm");
		String gitWasServer = request.getParameter("radiServer");
		String gitWasAppLocation = request.getParameter("radiLocation");
		String gitWasBeUseWas = request.getParameter("radiWas");
		String gitWasDesireDb = request.getParameter("radiDb");
		String gitWasTestInUrl = request.getParameter("gitWasTestInUrl");
		String gitWasTestOutUrl = request.getParameter("gitWasTestOutUrl");
		String gitWasTestOutMrUrl = request.getParameter("gitWasTestOutMrUrl");
		String gitWasEtcUrl = request.getParameter("gitWasEtcUrl");
		String gitWasDbNm = request.getParameter("gitWasDbNm");
		String gitWasRemark = request.getParameter("gitWasRemark");

		System.out.println(gitWasProjectNm);
		System.out.println(gitWasDpt);
		System.out.println(gitWasProjectStart);
		System.out.println(gitWasProjectEnd);
		System.out.println(gitWasEmpNm);
		System.out.println(gitWasAppPhone);
		System.out.println(gitWasSortation);
		System.out.println(gitWasWorkNm);
		System.out.println(gitWasAppDd);
		System.out.println(gitWasConNm);
		System.out.println(gitWasServer);
		System.out.println(gitWasAppLocation);
		System.out.println(gitWasDesireDb);
		System.out.println(gitWasTestInUrl);
		System.out.println(gitWasTestOutUrl);
		System.out.println(gitWasTestOutMrUrl);
		System.out.println(gitWasEtcUrl);
		System.out.println(gitWasDbNm);
		System.out.println(gitWasRemark);
		System.out.println(userId);

		System.out.println("1");
		dao = new CDao("wasApo.wasApoWrite", IDao.Insert);
		dao.SetParameter("P_GIT_WAS_PROJECT_NM", gitWasProjectNm);
		dao.SetParameter("P_GIT_WAS_APP_NM", gitWasAppNm);
		dao.SetParameter("P_GIT_WAS_WORK_NM", gitWasWorkNm);
		dao.SetParameter("P_GIT_WAS_SERVER", gitWasServer);
		dao.SetParameter("P_GIT_WAS_PHONE", gitWasAppPhone);
		dao.SetParameter("P_GIT_WAS_APP_DD", gitWasAppDd);
		dao.SetParameter("P_GIT_WAS_DPT", gitWasDpt);
		dao.SetParameter("P_GIT_WAS_PROJECT_START", gitWasProjectStart);
		dao.SetParameter("P_GIT_WAS_PROJECT_END", gitWasProjectEnd);
		dao.SetParameter("P_GIT_WAS_EMP_NM", gitWasEmpNm);
		dao.SetParameter("P_GIT_WAS_SORTATION", gitWasSortation);
		dao.SetParameter("P_GIT_WAS_CON_NM", gitWasConNm);
		dao.SetParameter("P_GIT_WAS_APP_LOCATION", gitWasAppLocation);
		dao.SetParameter("P_GIT_WAS_BE_USE_WAS", gitWasBeUseWas);
		dao.SetParameter("P_GIT_WAS_TEST_IN_URL", gitWasTestInUrl);
		dao.SetParameter("P_GIT_WAS_TEST_OUT_URL", gitWasTestOutUrl);
		dao.SetParameter("P_GIT_WAS_TEST_OUT_MR_URL", gitWasTestOutMrUrl);
		dao.SetParameter("P_GIT_WAS_ETC_URL", gitWasEtcUrl);
		dao.SetParameter("P_GIT_WAS_DESIRE_DB", gitWasDesireDb);
		dao.SetParameter("P_GIT_WAS_DB_NM", gitWasDbNm);
		dao.SetParameter("P_GIT_WAS_REMARK", gitWasRemark);
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

		return "redirect:/WASAPO_500/wasApoList.do";
	}

	// 수정
	@RequestMapping(value = "/WASAPO_500/wasApoModify.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String wasApoModify(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String gitWasAppNo = request.getParameter("gitWasAppNo");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		dao = new CDao("Common.DepList", IDao.Select);
		List<Map<String, Object>> DepList = dao.ExecuteList();
		cb.SetView("DEPLIST", DepList);
		System.out.println("DepListDepListDepListDepList::" + DepList);

		System.out.println("gitWasAppNogitWasAppNo:::::" + gitWasAppNo);

		dao = new CDao("wasApo.wasApoView", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_WAS_APP_NO", gitWasAppNo);
		System.out.println("2::::");
		List<Map<String, Object>> wasApoView = dao.ExecuteList();

		cb.SetView("wasApoView", wasApoView);

		return "/wasapo_500/wasApoModify";
	}

	// 수정 RUN
	@RequestMapping(value = "/WASAPO_500/wasApoModifyRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String wasApoModifyRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String gitWasAppNo = request.getParameter("gitWasAppNo");
		String gitWasProjectNm = request.getParameter("gitWasProjectNm");
		String gitWasAppNm = request.getParameter("gitWasAppNm");
		String gitWasDpt = request.getParameter("gitWasDpt");
		String gitWasProjectStart = request.getParameter("gitWasProjectStart");
		String gitWasProjectEnd = request.getParameter("gitWasProjectEnd");
		String gitWasEmpNm = request.getParameter("gitWasEmpNm");
		String gitWasAppPhone = request.getParameter("gitWasAppPhone");
		String gitWasSortation = request.getParameter("gitWasSortation");
		String gitWasWorkNm = request.getParameter("gitWasWorkNm");
		String gitWasAppDd = request.getParameter("gitWasAppDd");
		String gitWasConNm = request.getParameter("gitWasConNm");
		String gitWasServer = request.getParameter("radiServer");
		String gitWasAppLocation = request.getParameter("radiLocation");
		String gitWasBeUseWas = request.getParameter("radiWas");
		String gitWasDesireDb = request.getParameter("radiDb");
		String gitWasTestInUrl = request.getParameter("gitWasTestInUrl");
		String gitWasTestOutUrl = request.getParameter("gitWasTestOutUrl");
		String gitWasTestOutMrUrl = request.getParameter("gitWasTestOutMrUrl");
		String gitWasEtcUrl = request.getParameter("gitWasEtcUrl");
		String gitWasDbNm = request.getParameter("gitWasDbNm");
		String gitWasRemark = request.getParameter("gitWasRemark");

		System.out.println(gitWasAppNo);
		System.out.println(gitWasProjectNm);
		System.out.println(gitWasDpt);
		System.out.println(gitWasProjectStart);
		System.out.println(gitWasProjectEnd);
		System.out.println(gitWasEmpNm);
		System.out.println(gitWasAppPhone);
		System.out.println(gitWasSortation);
		System.out.println(gitWasWorkNm);
		System.out.println(gitWasAppDd);
		System.out.println(gitWasConNm);
		System.out.println(gitWasServer);
		System.out.println(gitWasAppLocation);
		System.out.println(gitWasDesireDb);
		System.out.println(gitWasTestInUrl);
		System.out.println(gitWasTestOutUrl);
		System.out.println(gitWasTestOutMrUrl);
		System.out.println(gitWasEtcUrl);
		System.out.println(gitWasDbNm);
		System.out.println(gitWasRemark);

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		System.out.println(userId);

		System.out.println("gitWasAppNogitWasAppNogitWasAppNo:::" + gitWasAppNo);

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		System.out.println("1");
		dao = new CDao("wasApo.wasApoModify", IDao.Update);
		dao.SetParameter("P_GIT_WAS_APP_NO", gitWasAppNo);
		dao.SetParameter("P_GIT_WAS_PROJECT_NM", gitWasProjectNm);
		dao.SetParameter("P_GIT_WAS_APP_NM", gitWasAppNm);
		dao.SetParameter("P_GIT_WAS_WORK_NM", gitWasWorkNm);
		dao.SetParameter("P_GIT_WAS_SERVER", gitWasServer);
		dao.SetParameter("P_GIT_WAS_PHONE", gitWasAppPhone);
		dao.SetParameter("P_GIT_WAS_APP_DD", gitWasAppDd);
		dao.SetParameter("P_GIT_WAS_DPT", gitWasDpt);
		dao.SetParameter("P_GIT_WAS_PROJECT_START", gitWasProjectStart);
		dao.SetParameter("P_GIT_WAS_PROJECT_END", gitWasProjectEnd);
		dao.SetParameter("P_GIT_WAS_EMP_NM", gitWasEmpNm);
		dao.SetParameter("P_GIT_WAS_SORTATION", gitWasSortation);
		dao.SetParameter("P_GIT_WAS_CON_NM", gitWasConNm);
		dao.SetParameter("P_GIT_WAS_APP_LOCATION", gitWasAppLocation);
		dao.SetParameter("P_GIT_WAS_BE_USE_WAS", gitWasBeUseWas);
		dao.SetParameter("P_GIT_WAS_TEST_IN_URL", gitWasTestInUrl);
		dao.SetParameter("P_GIT_WAS_TEST_OUT_URL", gitWasTestOutUrl);
		dao.SetParameter("P_GIT_WAS_TEST_OUT_MR_URL", gitWasTestOutMrUrl);
		dao.SetParameter("P_GIT_WAS_ETC_URL", gitWasEtcUrl);
		dao.SetParameter("P_GIT_WAS_DESIRE_DB", gitWasDesireDb);
		dao.SetParameter("P_GIT_WAS_DB_NM", gitWasDbNm);
		dao.SetParameter("P_GIT_WAS_REMARK", gitWasRemark);
		dao.SetParameter("P_GIT_ID", userId);

		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/WASAPO_500/wasApoList.do";
	}

	// 삭제
	@RequestMapping(value = "/DBAPO_500/wasApoDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String dbApoDelete(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String gitWasAppNo = request.getParameter("gitWasAppNo");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		System.out.println("gitWasAppNo::::" + gitWasAppNo);
		System.out.println("userId::::" + userId);

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		System.out.println("1");
		dao = new CDao("wasApo.wasApoDelete", IDao.Update);
		dao.SetParameter("P_GIT_WAS_APP_NO", gitWasAppNo);
		dao.SetParameter("P_NOW_ID", userId);
		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/WASAPO_500/wasApoList.do";
	}

}
