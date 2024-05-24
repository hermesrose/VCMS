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
import jp.co.vcms.common.VCMSUtility;

@Controller
public class AccountController {

	@RequestMapping(value = "/ACCOUNT_300/accountList.do", method = { RequestMethod.GET, RequestMethod.POST })
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
		dao = new CDao("Account.accountCount", IDao.Select);
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

		dao = new CDao("Account.accountList", IDao.Select);
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

		return "/account_300/accountList";
	}

	// 개별 조회
	@RequestMapping(value = "/ACCOUNT_300/accountView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String soureceView(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		String gitAppNo = request.getParameter("gitAppNo");

		dao = new CDao("Account.accountView", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_APP_NO", gitAppNo);
		System.out.println("2::::");
		List<Map<String, Object>> accountGitView = dao.ExecuteList();

		cb.SetView("accountGitView", accountGitView);

		return "/account_300/accountView";
	}

	// 글쓰기
	@RequestMapping(value = "/ACCOUNT_300/accountWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
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
		dao = new CDao("Common.userCompany", IDao.Select);
		List<Map<String, Object>> listCompany = dao.ExecuteList();
		cb.SetView("LISTCOMPANY", listCompany);
		System.out.println("listCompanylistCompanylistCompany::" + listCompany);

		return "/account_300/accountWrite";
	}

	// 글쓰기 런
	@RequestMapping(value = "/ACCOUNT_300/accountWriteRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String accountWriteRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		String gitNm = request.getParameter("gitNm");
		String gitPhone = request.getParameter("gitPhone");
		String gitCompany = request.getParameter("gitCompany");
		String gitDate = request.getParameter("gitDate");
		String gitId = request.getParameter("gitId");
		String gitEmail = request.getParameter("gitEmail");
		String gitRemark = request.getParameter("gitRemark");
		System.out.println("1");
		dao = new CDao("Account.accountWrite", IDao.Insert);
		dao.SetParameter("P_GIT_NM", gitNm);
		dao.SetParameter("P_GIT_PHONE", gitPhone);
		dao.SetParameter("P_GIT_COMPANY", gitCompany);
		dao.SetParameter("P_GIT_DATE", gitDate);
		dao.SetParameter("P_GIT_ID", gitId);
		dao.SetParameter("P_GIT_EMAIL", gitEmail);
		dao.SetParameter("P_GIT_REMARK", gitRemark);
		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/ACCOUNT_300/accountList.do";
	}

	// 수정 화면
	@RequestMapping(value = "/ACCOUNT_300/accountModify.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sourceModify(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String gitAppNo = request.getParameter("gitAppNo");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		// 부서조회
		dao = new CDao("Common.userCompany", IDao.Select);
		List<Map<String, Object>> listCompany = dao.ExecuteList();
		cb.SetView("LISTCOMPANY", listCompany);
		System.out.println("listCompanylistCompanylistCompany::" + listCompany);

		dao = new CDao("Account.accountView", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_APP_NO", gitAppNo);
		System.out.println("2::::");
		List<Map<String, Object>> accountGitView = dao.ExecuteList();

		cb.SetView("accountGitView", accountGitView);

		return "/account_300/accountModify";
	}

	// 수정 런
	@RequestMapping(value = "/ACCOUNT_300/accountModifyRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String accountModifyRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String gitAppNo = request.getParameter("gitAppNo");
		String gitPhone = request.getParameter("gitPhone");
		String gitCompany = request.getParameter("gitCompany");
		String gitDate = request.getParameter("gitDate");
		String gitEmail = request.getParameter("gitEmail");
		String gitRemark = request.getParameter("gitRemark");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		System.out.println("1");
		dao = new CDao("Account.accountModify", IDao.Update);
		dao.SetParameter("P_GIT_APP_NO", gitAppNo);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_PHONE", gitPhone);
		dao.SetParameter("P_GIT_COMPANY", gitCompany);
		dao.SetParameter("P_GIT_DATE", gitDate);
		dao.SetParameter("P_GIT_EMAIL", gitEmail);
		dao.SetParameter("P_GIT_REMARK", gitRemark);
		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/ACCOUNT_300/accountList.do";
	}

	// 삭제하기
	@RequestMapping(value = "/ACCOUNT_300/accountDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String accountDelete(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String gitAppNo = request.getParameter("gitAppNo");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		System.out.println("gitAppNo::::" + gitAppNo);
		System.out.println("userId::::" + userId);

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		System.out.println("1");
		dao = new CDao("Account.accountDelete", IDao.Update);
		dao.SetParameter("P_GIT_APP_NO", gitAppNo);
		dao.SetParameter("P_NOW_ID", userId);
		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/ACCOUNT_300/accountList.do";
	}

}
