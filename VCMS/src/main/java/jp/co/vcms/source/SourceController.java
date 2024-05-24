package jp.co.vcms.source;

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
public class SourceController {

	// 리스트
	@RequestMapping(value = "/SOURCE_200/sourceList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String soureceList(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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
		dao = new CDao("source.sourceCount", IDao.Select);
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

		dao = new CDao("source.sourceList", IDao.Select);
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

		return "/source_200/sourceList";
	}

	// 개별 조회
	@RequestMapping(value = "/SOURCE_200/sourceView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String soureceView(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		String scmAppNo = request.getParameter("scmAppNo");

		System.out.println("scmAppNoscmAppNoscmAppNo:::::" + scmAppNo);

		dao = new CDao("source.sourceView", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_SCM_APP_NO", scmAppNo);
		System.out.println("2::::");
		List<Map<String, Object>> sourceView = dao.ExecuteList();

		cb.SetView("sourceView", sourceView);

		return "/source_200/sourceView";
	}

	// 글쓰기
	@RequestMapping(value = "/SOURCE_200/sourceWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sourceWrite(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		return "/source_200/sourceWrite";
	}

	// 글쓰기 런
	@RequestMapping(value = "/SOURCE_200/sourceWriteRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sourceWriteRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		String scmWorkNm = request.getParameter("scmWorkNm");
		String scmAppNm = request.getParameter("scmAppNm");
		String scmChContent = request.getParameter("scmChContent");
		String scmRefDd = request.getParameter("scmRefDd");
		String scmAppDd = request.getParameter("scmAppDd");
		String scmProjectNm = request.getParameter("scmProjectNm");
		String scmDpt = request.getParameter("scmDpt");
		String scmProjectStart = request.getParameter("scmProjectStart");
		String scmProjectEnd = request.getParameter("scmProjectEnd");
		String scmEmpNm = request.getParameter("scmEmpNm");
		String scmAppPhone = request.getParameter("scmAppPhone");
		String scmTarget = request.getParameter("radiProgram");
		String scmWasSortation = request.getParameter("radiWas");
		String scmGitStoAddr = request.getParameter("scmGitStoAddr");
		String scmGitRefId = request.getParameter("scmGitRefId");
		String scmRefServer = request.getParameter("scmRefServer");
		String scmConNm = request.getParameter("scmConNm");
		String scmRestart = request.getParameter("radiRestart");
		String scmDbRefSortation = request.getParameter("radiDb");
		String scmDbIpSid = request.getParameter("scmDbIpSid");
		String scmDbNm = request.getParameter("scmDbNm");
		String scmRemark = request.getParameter("scmRemark");

		System.out.println(scmWorkNm);
		System.out.println(scmAppNm);
		System.out.println(scmChContent);
		System.out.println(scmRefDd);
		System.out.println(scmAppDd);
		System.out.println(scmProjectNm);
		System.out.println(scmDpt);
		System.out.println(scmProjectStart);
		System.out.println(scmProjectEnd);
		System.out.println(scmEmpNm);
		System.out.println(scmAppPhone);
		System.out.println(scmTarget);
		System.out.println(scmWasSortation);
		System.out.println(scmGitStoAddr);
		System.out.println(scmGitRefId);
		System.out.println(scmRefServer);
		System.out.println(scmConNm);
		System.out.println(scmRestart);
		System.out.println(scmDbRefSortation);
		System.out.println(scmDbIpSid);
		System.out.println(scmDbNm);
		System.out.println(scmRemark);
		System.out.println(userId);

		System.out.println("1");
		dao = new CDao("source.sourceWrite", IDao.Insert);
		dao.SetParameter("P_SCM_WORK_NM", scmWorkNm);
		dao.SetParameter("P_SCM_APP_NM", scmAppNm);
		dao.SetParameter("P_SCM_CH_CONTENT", scmChContent);
		dao.SetParameter("P_SCM_REF_DD", scmRefDd);
		dao.SetParameter("P_SCM_APP_DD", scmAppDd);
		dao.SetParameter("P_SCM_PROJECT_NM", scmProjectNm);
		dao.SetParameter("P_SCM_DPT", scmDpt);
		dao.SetParameter("P_SCM_PROJECT_START", scmProjectStart);
		dao.SetParameter("P_SCM_PROJECT_END", scmProjectEnd);
		dao.SetParameter("P_SCM_EMP_NM", scmEmpNm);
		dao.SetParameter("P_SCM_APP_PHONE", scmAppPhone);
		dao.SetParameter("P_SCM_TARGET", scmTarget);
		dao.SetParameter("P_SCM_WAS_SORTATION", scmWasSortation);
		dao.SetParameter("P_SCM_GIT_STO_ADDR", scmGitStoAddr);
		dao.SetParameter("P_SCM_GIT_REF_ID", scmGitRefId);
		dao.SetParameter("P_SCM_REF_SERVER", scmRefServer);
		dao.SetParameter("P_SCM_CON_NM", scmConNm);
		dao.SetParameter("P_SCM_RESTART", scmRestart);
		dao.SetParameter("P_SCM_DB_REF_SORTATION", scmDbRefSortation);
		dao.SetParameter("P_SCM_DB_IP_SID", scmDbIpSid);
		dao.SetParameter("P_SCM_DB_NM", scmDbNm);
		dao.SetParameter("P_SCM_REMARK", scmRemark);
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

		return "redirect:/SOURCE_200/sourceList.do";
	}

	// 글수정
	@RequestMapping(value = "/SOURCE_200/sourceModify.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sourceModify(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String scmAppNo = request.getParameter("scmAppNo");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		dao = new CDao("Common.DepList", IDao.Select);
		List<Map<String, Object>> DepList = dao.ExecuteList();
		cb.SetView("DEPLIST", DepList);
		System.out.println("DepListDepListDepListDepList::" + DepList);

		System.out.println("scmAppNoscmAppNoscmAppNo:::::" + scmAppNo);

		dao = new CDao("source.sourceView", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_SCM_APP_NO", scmAppNo);
		System.out.println("2::::");
		List<Map<String, Object>> sourceView = dao.ExecuteList();

		cb.SetView("sourceView", sourceView);

		return "/source_200/sourceModify";
	}

	// 수정 RUN
	@RequestMapping(value = "/SOURCE_200/sourceModifyRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sourceModifyRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String scmWorkNm = request.getParameter("scmWorkNm");
		String scmAppNm = request.getParameter("scmAppNm");
		String scmChContent = request.getParameter("scmChContent");
		String scmRefDd = request.getParameter("scmRefDd");
		String scmAppDd = request.getParameter("scmAppDd");
		String scmProjectNm = request.getParameter("scmProjectNm");
		String scmDpt = request.getParameter("scmDpt");
		String scmProjectStart = request.getParameter("scmProjectStart");
		String scmProjectEnd = request.getParameter("scmProjectEnd");
		String scmEmpNm = request.getParameter("scmEmpNm");
		String scmAppPhone = request.getParameter("scmAppPhone");
		String scmTarget = request.getParameter("radiProgram");
		String scmWasSortation = request.getParameter("radiWas");
		String scmGitStoAddr = request.getParameter("scmGitStoAddr");
		String scmGitRefId = request.getParameter("scmGitRefId");
		String scmRefServer = request.getParameter("scmRefServer");
		String scmConNm = request.getParameter("scmConNm");
		String scmRestart = request.getParameter("radiRestart");
		String scmDbRefSortation = request.getParameter("radiDb");
		String scmDbIpSid = request.getParameter("scmDbIpSid");
		String scmDbNm = request.getParameter("scmDbNm");
		String scmRemark = request.getParameter("scmRemark");
		String scmAppNo = request.getParameter("scmAppNo");

		System.out.println(scmWorkNm);
		System.out.println(scmAppNm);
		System.out.println(scmChContent);
		System.out.println(scmRefDd);
		System.out.println(scmAppDd);
		System.out.println(scmProjectNm);
		System.out.println(scmDpt);
		System.out.println(scmProjectStart);
		System.out.println(scmProjectEnd);
		System.out.println(scmEmpNm);
		System.out.println(scmAppPhone);
		System.out.println(scmTarget);
		System.out.println(scmWasSortation);
		System.out.println(scmGitStoAddr);
		System.out.println(scmGitRefId);
		System.out.println(scmRefServer);
		System.out.println(scmConNm);
		System.out.println(scmRestart);
		System.out.println(scmDbRefSortation);
		System.out.println(scmDbIpSid);
		System.out.println(scmDbNm);
		System.out.println(scmRemark);
		System.out.println(scmAppNo);

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		System.out.println(userId);

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		System.out.println("1");
		dao = new CDao("source.sourceModify", IDao.Update);
		dao.SetParameter("P_SCM_WORK_NM", scmWorkNm);
		dao.SetParameter("P_SCM_APP_NM", scmAppNm);
		dao.SetParameter("P_SCM_CH_CONTENT", scmChContent);
		dao.SetParameter("P_SCM_REF_DD", scmRefDd);
		dao.SetParameter("P_SCM_APP_DD", scmAppDd);
		dao.SetParameter("P_SCM_PROJECT_NM", scmProjectNm);
		dao.SetParameter("P_SCM_DPT", scmDpt);
		dao.SetParameter("P_SCM_PROJECT_START", scmProjectStart);
		dao.SetParameter("P_SCM_PROJECT_END", scmProjectEnd);
		dao.SetParameter("P_SCM_EMP_NM", scmEmpNm);
		dao.SetParameter("P_SCM_APP_PHONE", scmAppPhone);
		dao.SetParameter("P_SCM_TARGET", scmTarget);
		dao.SetParameter("P_SCM_WAS_SORTATION", scmWasSortation);
		dao.SetParameter("P_SCM_GIT_STO_ADDR", scmGitStoAddr);
		dao.SetParameter("P_SCM_GIT_REF_ID", scmGitRefId);
		dao.SetParameter("P_SCM_REF_SERVER", scmRefServer);
		dao.SetParameter("P_SCM_CON_NM", scmConNm);
		dao.SetParameter("P_SCM_RESTART", scmRestart);
		dao.SetParameter("P_SCM_DB_REF_SORTATION", scmDbRefSortation);
		dao.SetParameter("P_SCM_DB_IP_SID", scmDbIpSid);
		dao.SetParameter("P_SCM_DB_NM", scmDbNm);
		dao.SetParameter("P_SCM_REMARK", scmRemark);
		dao.SetParameter("P_SCM_APP_NO", scmAppNo);
		dao.SetParameter("P_GIT_ID", userId);

		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/SOURCE_200/sourceList.do";
	}

	// 삭제
	@RequestMapping(value = "/SOURCE_200/sourceDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sourceDelete(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String scmAppNo = request.getParameter("scmAppNo");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		System.out.println("scmAppNo::::" + scmAppNo);
		System.out.println("userId::::" + userId);

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		System.out.println("1");
		dao = new CDao("source.sourceDelete", IDao.Update);
		dao.SetParameter("P_SCM_APP_NO", scmAppNo);
		dao.SetParameter("P_NOW_ID", userId);
		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/SOURCE_200/sourceList.do";
	}

}
