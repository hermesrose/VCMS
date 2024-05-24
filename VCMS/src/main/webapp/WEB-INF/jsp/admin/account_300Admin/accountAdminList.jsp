<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../shared/header.jsp" %>  

<script>
$(document).ready(function(){
	 //alert("zzz");
	  $("#third1").removeClass();	   
	});	
</script>   


<div style="margin: 0px; margin-left: 400px; margin-right: 200px;"  >
     <div class="page-content">
            <div style="padding-bottom:10px; pading-left:100px">
              <img src="${path}/resources/images/VCMS/headTop.jpg" style="width:100%;" />
        </div>
    </div>
   <header class="section-header">
        <div class="PageTitle2">
            <span>アカウント作成申請管理リスト</span>
        </div>
    </header>
    <section class="card" >
        <div class="card-block" style="padding-top: 0px">
            <div class="row m-t-lg">
                <div class="col-md-12">
                    <div class="form-group">
                            <form action="/VCMS/ADMIN/accountAdminList.do"  id="searchForm" name="searchForm"  method="POST">
                                <div class=SearchBox>
                                    <table class=Layout>
                                        <tbody>
                                            <tr class="First">
                                                <th class="Title list-title-image-dot" ><span>申請日 : </span></TH>
                                                <td class=Value>
                                                    <div class="form-inline">
                                                        <input type="date" class="form-control" id="gitDateFrom" name="gitDateFrom" maxlength="10" style="width: 108px; height: 25px;" value="<c:if test="${empty sessionScope.gitDateFrom}">2024-01-01</c:if>${sessionScope.gitDateFrom}"/>
                                                        <label>~</label>
                                                        <input type="date" class="form-control" id="gitDateTo" name="gitDateTo" maxlength="10" style="width: 108px; height: 25px;" value="<c:if test="${empty sessionScope.gitDateTo}">2025-01-01</c:if>${sessionScope.gitDateTo}"/>
                                                    </div>
                                                </td>
                                                <th class="Title list-title-image-dot" ><span>I D : </span></th>
                                                <td class="Value">
                                                    <input type="text" class="form-control" id="gitId" name="gitId" maxlength="10" style="width: 50%; height: 25px;" value="${sessionScope.gitId}"/>
                                                </td>                                      
                                             </tr>
                                                 <tr class="">
                                                <th class="Title list-title-image-dot" ><span>使用者 : </span></TH>
                                                <td class=Value>
                                                       <input type="text" class="form-control" id="gitNm" name="gitNm" maxlength="10" style="width:33%; height: 25px;" value="${sessionScope.gitNm}"/>
                                                </td>
                                                <th class="Title list-title-image-dot" ><span>メール : </span></TH>
                                               <td class="Value">
                                                    <input type="text" class="form-control" id="gitEmail" name="gitEmail" maxlength="10" style="width: 50%; height: 25px;" value="${sessionScope.gitEmail}"/>
                                                </td>
                                                <td class=Button colspan="2">
                                                    <span class=MBtn>
                                                        <span class=Wrap>                                                        
                                                        </span>
                                                    </span>
                                                </td>
                                             <tr class="">
                                                <th class="Title list-title-image-dot" ><span>所属 : </span></th>
                                                <td class=Value>
                                                    <input type="text" class="form-control" id="gitCompany"  name="gitCompany" maxlength="10" style="width:33%; height: 25px;" value="${sessionScope.gitCompany}"/>
                                                </td> 
                                                <th class="Title list-title-image-dot" ><span>進行状態 : </span></th>
                                                <td class="Value">
                                                    <select class="form-control"  id="gitMovnStat" name="gitMovnStat"   style="width: 50%; height: 25px;">
                                                   <option value=""<c:if test="${sessionScope.gitMovnStat eq ''}">selected</c:if>>全体</option>
                                                   <option value="20" <c:if test="${sessionScope.gitMovnStat eq '20'}">selected</c:if>>申請中</option>
                                                   <option value="21"<c:if test="${sessionScope.gitMovnStat eq '21'}">selected</c:if>>差し戻し</option>
                                                   <option value="22"<c:if test="${sessionScope.gitMovnStat eq '22'}">selected</c:if>>補完要請</option>
                                                   <option value="23"<c:if test="${sessionScope.gitMovnStat eq '23'}">selected</c:if>>完了</option>                                           
                                                 </select>              
                                                </td>                                                            
                                                <td class=Button colspan="2">
                                                    <span class=MBtn>
                                                        <span class=Wrap>
                                                            <button type="submit" class="btn btn-default  btn-sm" id="searchButton" >検索</button>
                                                        </span>
                                                    </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                            <div align="right" class="form-controlbox-third">                    
                          </div>
                        <div style="padding: 5px"></div>
						<div id="targetContainer">                         
							<div style="overflow-x: auto; white-space: nowrap">
								<div class="contentTableList">
									<table cellspacing="0" cellpadding="0" rules="all" border="0"
										summary="내용">
										<colgroup>
											<col style="width: 8%" />
											<col style="width: 15%" />
											<col style="width: 13%" />
											<col style="width: 13%" />
											<col style="width: 24%" />
											<col style="width: 15%" />
											<col style="width: 12%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">申請番号</th>
												<th scope="col">所属</th>
												<th scope="col">申請者</th>
												<th scope="col">I D</th>
												<th scope="col">メール</th>
												<th scope="col">申請日</th>
												<th scope="col">進行状態</th>											
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${LISTSELECT}" var="list" varStatus="status">
										    <tr>
										        <td style="text-align: center;">${list.GIT_APP_NO}</td>
												<td style="text-align: center;">${list.GIT_COMPANY}</td>
												<td style="text-align: center"><a href="javascript:void(0);" onclick="location.href='/VCMS/ADMIN/accountAdminView.do?gitAppNo=${list.GIT_APP_NO}'" >${list.GIT_NM}</a></td>
												<td style="text-align: center">${list.GIT_ID}</td>
												<td style="text-align: center">${list.GIT_EMAIL}</td>
												<td style="text-align: center">${list.GIT_DATE}</td>
												<td style="text-align: center">
												<c:choose>
                                                   <c:when test="${list.GIT_MOVN_STAT eq '21'}">&nbsp;差し戻し </c:when>	
                                                   <c:otherwise>${list.GIT_MOVN_STAT}</c:otherwise>											
 												</c:choose>	
 												</td>	
										    </tr>								
										</c:forEach>																		
										</tbody>
									</table>
								</div>
							</div>
							<div align="center">
								<nav aria-label="Customzing the active number">
									<ul class="pagination justify-content-right" id="main-form-hide-pageing">
										<li class="page-item"><a class="page-link" href="/VCMS/ADMIN/accountAdminList.do?row=${startPage-10}&&gitDateFrom=${gitDateFrom}&&gitDateTo=${gitDateTo}&&gitId=${gitId}&&gitNm=${gitNm}&&gitEmail=${gitEmail}&&gitCompany=${gitCompany}&&gitMovnStat=${gitMovnStat}">以前</a></li>
										<c:forEach begin="${startPage}" end="${endPage}" var="g">	
											<li class="page-item"><a class="page-link"   href="/VCMS/ADMIN/accountAdminList.do?row=${g}&&gitDateFrom=${gitDateFrom}&&gitDateTo=${gitDateTo}&&gitId=${gitId}&&gitNm=${gitNm}&&gitEmail=${gitEmail}&&gitCompany=${gitCompany}&&gitMovnStat=${gitMovnStat}">${g}</a></li>			
										</c:forEach>
										<li class="page-item"><a class="page-link" href="/VCMS/ADMIN/accountAdminList.do?row=${startPage+10}&&gitDateFrom=${gitDateFrom}&&gitDateTo=${gitDateTo}&&gitId=${gitId}&&gitNm=${gitNm}&&gitEmail=${gitEmail}&&gitCompany=${gitCompany}&&gitMovnStat=${gitMovnStat}">次</a></li>
									</ul>
								</nav>
							</div>
						</div>						 
							<div class="alert alert-success" role="alert" style="margin-top:5px">
                            ※ すべての申請件が表記されます。
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../../shared/footer.jsp" %>