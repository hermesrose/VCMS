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
public class DbApoController {

	// DB 리스트 조회
	@RequestMapping(value = "/DBAPO_400/dbApoList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String dbApoList(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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
		dao = new CDao("dbApo.dbApoCount", IDao.Select);
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

		startRow = String.valueOf(pageStart); //최종 1
		endRow = String.valueOf(pageEnd); //최종 10
		System.out.println("startRowstartRowstartRow::" + startRow);
		System.out.println("endRowendRowendRow::" + endRow);

		dao = new CDao("dbApo.dbApoList", IDao.Select);
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

		startPageFinal = String.valueOf(startPage); //최종 1
		endPageFinal = String.valueOf(endPage);  // 최종 10

		cb.SetView("startPage", startPageFinal);
		cb.SetView("endPage", endPageFinal);
		cb.SetView("cntRow", cntRow);

		System.out.println("startPagestartPagestartPage:" + startPageFinal);
		System.out.println("endPageendPageendPage:" + endPageFinal);
		System.out.println("cntRowcntRowcntRowcntRow:" + cntRow);

		return "/dbapo_400/dbApoList";
	}

	// [DB] 개별 조회 
	@RequestMapping(value = "/DBAPO_400/dbApoView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String dbApoView(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		String gitDbAppNo = request.getParameter("gitDbAppNo");

		System.out.println("gitDbAppNogitDbAppNo:::::" + gitDbAppNo);

		dao = new CDao("dbApo.dbApoView", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_DB_APP_NO", gitDbAppNo);
		System.out.println("2::::");
		List<Map<String, Object>> dbApoView = dao.ExecuteList();

		cb.SetView("dbApoView", dbApoView);

		return "/dbapo_400/dbApoView";
	}

	// 글쓰기
	@RequestMapping(value = "/DBAPO_400/dbApoWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String dbApoWrite(HttpServletRequest request, HttpServletResponse response, Model modelMap)
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

		return "/dbapo_400/dbApoWrite";
	}

	// 글쓰기 런
	@RequestMapping(value = "/DBAPO_400/dbApoWriteRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String dbApoWriteRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		String gitDbProjectNm = request.getParameter("gitDbProjectNm");
		String gitDbDpt = request.getParameter("gitDbDpt");
		String gitDbProjectStart = request.getParameter("gitDbProjectStart");
		String gitDbProjectEnd = request.getParameter("gitDbProjectEnd");
		String gitDbEmpNm = request.getParameter("gitDbEmpNm");
		String gitDbAppNm = request.getParameter("gitDbAppNm");
		String gitDbWorkNm = request.getParameter("gitDbWorkNm");
		String gitDbAppPhone = request.getParameter("gitDbAppPhone");
		String gitDbSortation = request.getParameter("gitDbSortation");
		String gitDbAppDd = request.getParameter("gitDbAppDd");
		String gitDbAppDbNm = request.getParameter("radiDb");
		String gitDbDbNm = request.getParameter("gitDbDbNm");
		String gitDbRemark = request.getParameter("gitDbRemark");

		System.out.println("1");
		dao = new CDao("dbApo.dbApoWrite", IDao.Insert);

		dao.SetParameter("P_GIT_DB_PROJECT_NM", gitDbProjectNm);
		dao.SetParameter("P_GIT_DB_DPT", gitDbDpt);
		dao.SetParameter("P_GIT_DB_PROJECT_START", gitDbProjectStart);
		dao.SetParameter("P_GIT_DB_PROJECT_END", gitDbProjectEnd);
		dao.SetParameter("P_GIT_DB_EMP_NM", gitDbEmpNm);
		dao.SetParameter("P_GIT_DB_APP_NM", gitDbAppNm);
		dao.SetParameter("P_GIT_DB_WORK_NM", gitDbWorkNm);
		dao.SetParameter("P_GIT_DB_APP_PHONE", gitDbAppPhone);
		dao.SetParameter("P_GIT_DB_SORTATION", gitDbSortation);
		dao.SetParameter("P_GIT_DB_APP_DD", gitDbAppDd);
		dao.SetParameter("P_GIT_DB_APP_DB_NM", gitDbAppDbNm);
		dao.SetParameter("P_GIT_DB_DB_NM", gitDbDbNm);
		dao.SetParameter("P_GIT_DB_REMARK", gitDbRemark);
		dao.SetParameter("P_GIT_ID", userId);

		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/DBAPO_400/dbApoList.do";
	}
	
	// 수정
	@RequestMapping(value = "/DBAPO_400/dbApoModify.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String dbApoModify(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String gitDbAppNo = request.getParameter("gitDbAppNo");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		dao = new CDao("Common.DepList", IDao.Select);
		List<Map<String, Object>> DepList = dao.ExecuteList();
		cb.SetView("DEPLIST", DepList);
		System.out.println("DepListDepListDepListDepList::" + DepList);

		System.out.println("gitDbAppNogitDbAppNo:::::" + gitDbAppNo);

		dao = new CDao("dbApo.dbApoView", IDao.Select);
		dao.SetParameter("P_NOW_ID", userId);
		dao.SetParameter("P_GIT_DB_APP_NO", gitDbAppNo);
		System.out.println("2::::");
		List<Map<String, Object>> dbApoView = dao.ExecuteList();

		cb.SetView("dbApoView", dbApoView);

		return "/dbapo_400/dbApoModify";
	}

	// 수정 RUN
	@RequestMapping(value = "/DBAPO_400/dbApoModifyRun.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String dbApoModifyRun(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {

		CDao dao = null;
		CBase cb = new CBase(request, response);

		String gitDbAppNo = request.getParameter("gitDbAppNo");
		String gitDbProjectNm = request.getParameter("gitDbProjectNm");
		String gitDbDpt = request.getParameter("gitDbDpt");
		String gitDbProjectStart = request.getParameter("gitDbProjectStart");
		String gitDbProjectEnd = request.getParameter("gitDbProjectEnd");
		String gitDbEmpNm = request.getParameter("gitDbEmpNm");
		String gitDbAppNm = request.getParameter("gitDbAppNm");
		String gitDbWorkNm = request.getParameter("gitDbWorkNm");
		String gitDbAppPhone = request.getParameter("gitDbAppPhone");
		String gitDbSortation = request.getParameter("gitDbSortation");
		String gitDbAppDd = request.getParameter("gitDbAppDd");
		String gitDbAppDbNm = request.getParameter("radiDb");
		String gitDbDbNm = request.getParameter("gitDbDbNm");
		String gitDbRemark = request.getParameter("gitDbRemark");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");

		System.out.println("gitDbAppNogitDbAppNogitDbAppNo:::"+gitDbAppNo);
		
		if (session.getAttribute("userInfo") == null || session.getAttribute("userInfo") == "") {
			return "/error/error";
		}

		System.out.println("1");
		dao = new CDao("dbApo.dbApoModify", IDao.Update);
		dao.SetParameter("P_GIT_DB_PROJECT_NM", gitDbProjectNm);
		dao.SetParameter("P_GIT_DB_DPT", gitDbDpt);
		dao.SetParameter("P_GIT_DB_PROJECT_START", gitDbProjectStart);
		dao.SetParameter("P_GIT_DB_PROJECT_END", gitDbProjectEnd);
		dao.SetParameter("P_GIT_DB_EMP_NM", gitDbEmpNm);
		dao.SetParameter("P_GIT_DB_APP_NM", gitDbAppNm);
		dao.SetParameter("P_GIT_DB_WORK_NM", gitDbWorkNm);
		dao.SetParameter("P_GIT_DB_APP_PHONE", gitDbAppPhone);
		dao.SetParameter("P_GIT_DB_SORTATION", gitDbSortation);
		dao.SetParameter("P_GIT_DB_APP_DD", gitDbAppDd);
		dao.SetParameter("P_GIT_DB_APP_DB_NM", gitDbAppDbNm);
		dao.SetParameter("P_GIT_DB_DB_NM", gitDbDbNm);
		dao.SetParameter("P_GIT_DB_REMARK", gitDbRemark);
		dao.SetParameter("P_GIT_DB_APP_NO", gitDbAppNo);
		dao.SetParameter("P_GIT_ID", userId);
		
		
		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);

			return "/error/error";
		}
		System.out.println("3");

		return "redirect:/DBAPO_400/dbApoList.do";
	}
	
	// 삭제
	@RequestMapping(value = "/DBAPO_400/dbApoDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String dbApoDelete(HttpServletRequest request, HttpServletResponse response, Model modelMap)
			throws ClassCastException, IOException, SecurityException, SQLException {
        
		CDao dao = null;
		CBase cb = new CBase(request, response);		
		
		String gitDbAppNo = request.getParameter("gitDbAppNo");
												
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userInfo");
		
		System.out.println("gitDbAppNo::::"+gitDbAppNo);
		System.out.println("userId::::"+userId);
		
		
		if(session.getAttribute("userInfo")==null || session.getAttribute("userInfo") =="") {
			return "/error/error";
		}
	
        System.out.println("1");
		dao = new CDao("dbApo.dbApoDelete", IDao.Update);
		dao.SetParameter("P_GIT_DB_APP_NO", gitDbAppNo);
		dao.SetParameter("P_NOW_ID", userId);					
		dao.Execute();
		System.out.println("2");
		String MSG = (String) dao.paramMap.get("P_MSG");

		if (!"OK".equals(MSG)) {
			System.out.println("MSG::::" + MSG);
        
			return "/error/error";
		}
		 System.out.println("3");

		 return "redirect:/DBAPO_400/dbApoList.do";
	}
	
	

}
