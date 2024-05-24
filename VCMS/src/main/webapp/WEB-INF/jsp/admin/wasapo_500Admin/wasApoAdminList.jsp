<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../shared/header.jsp" %>   

 <script>
$(document).ready(function(){
	 //alert("zzz");
	  $("#third3").removeClass();	   
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
            <span>WASリポジトリ生成申請管理リスト</span>
        </div>
    </header>
   <section class="card" >
        <div class="card-block" style="padding-top: 0px">
            <div class="row m-t-lg">
                <div class="col-md-12">
                    <div class="form-group">
                            <form action="/VCMS/ADMIN/wasApoAdminList.do"  id="searchForm" name="searchForm"  method="POST">
                                <div class=SearchBox>
                                    <table class=Layout>
                                        <tbody>
                                            <tr class="First">
                                                <th class="Title list-title-image-dot" ><span>申請日 : </span></TH>
                                                <td class=Value>
                                                    <div class="form-inline">
                                                        <input type="date" class="form-control" id="gitWasDateFrom" name="gitWasDateFrom" maxlength="10" style="width: 108px; height: 25px;" value="<c:if test="${empty sessionScope.gitWasDateFrom}">2024-01-01</c:if>${sessionScope.gitWasDateFrom}"/>
                                                        <label>~</label>
                                                        <input type="date" class="form-control" id="gitWasDateTo" name="gitWasDateTo" maxlength="10" style="width: 108px; height: 25px;" value="<c:if test="${empty sessionScope.gitWasDateTo}">2025-01-01</c:if>${sessionScope.gitWasDateTo}"/>
                                                    </div>
                                                </td>
                                                <th class="Title list-title-image-dot" ><span>業務名 : </span></th>
                                                <td class="Value">
                                                    <input type="text" class="form-control" id="gitWasWorkNm" name="gitWasWorkNm" maxlength="10" style="width: 50%; height: 25px;" value="${sessionScope.gitWasWorkNm}"/>
                                                </td>                                      
                                             </tr>
                                                 <tr class="">
                                                <th class="Title list-title-image-dot" ><span>申請者 : </span></TH>
                                                <td class=Value>
                                                       <input type="text" class="form-control" id="gitWasAppNm" name="gitWasAppNm" maxlength="10" style="width:33%; height: 25px;" value="${sessionScope.gitWasAppNm}"/>
                                                </td>
                                                <th class="Title list-title-image-dot" ><span>コンテナ : </span></TH>
                                               <td class="Value">
                                                   <input type="text" class="form-control" id="gitWasConNm" name="gitWasConNm" maxlength="10" style="width: 50%; height: 25px;" value="${sessionScope.gitWasConNm}"/>
                                                </td>
                                                <td class=Button colspan="2">
                                                    <span class=MBtn>
                                                        <span class=Wrap>                                                        
                                                        </span>
                                                    </span>
                                                </td>
                                             <tr class="">
                                                <th class="Title list-title-image-dot" ><span>サーバー : </span></th>
                                               <td class="Value">
                                                    <select class="form-control" id="gitWasServer"  name="gitWasServer" style="width: 33%; height: 25px;">
                                                   <option value="">全体</option>
                                                   <option value="knrec" <c:if test="${sessionScope.gitWasServer eq 'knrec'}">selected</c:if>>knrec</option>
                                                   <option value="min"<c:if test="${sessionScope.gitWasServer eq 'min'}">selected</c:if>>min</option>    
                                                   <option value="tusr"<c:if test="${sessionScope.gitWasServer eq 'tusr'}">selected</c:if>>tusr</option>                                                                             
                                                 </select>              
                                                </td>      
                                                <th class="Title list-title-image-dot" ><span>進行状態 : </span></th>
                                                <td class="Value">
                                                     <select class="form-control"  id="gitWasMovnStat"  name="gitWasMovnStat"   style="width: 50%; height: 25px;">
                                                   <option value=""<c:if test="${sessionScope.gitWasMovnStat eq ''}">selected</c:if>>全体</option>
                                                   <option value="20" <c:if test="${sessionScope.gitWasMovnStat eq '20'}">selected</c:if>>申請中</option>
                                                   <option value="21"<c:if test="${sessionScope.gitWasMovnStat eq '21'}">selected</c:if>>差し戻し</option>
                                                   <option value="22"<c:if test="${sessionScope.gitWasMovnStat eq '22'}">selected</c:if>>補完要請</option>
                                                   <option value="23"<c:if test="${sessionScope.gitWasMovnStat eq '23'}">selected</c:if>>完了</option>                                           
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
											<col style="width: 10%" />
											<col style="width: 35%" />
											<col style="width: 10%" />
											<col style="width: 15%" />
											<col style="width: 10%" />
											<col style="width: 10%" />
											<col style="width: 10%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">申請番号</th>
												<th scope="col">業務名</th>
												<th scope="col">申請サーバー</th>
												<th scope="col">コンテナ</th>
												<th scope="col">申請者</th>
												<th scope="col">申請日</th>
												<th scope="col">進行状態</th>											
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${LISTSELECT}" var="list" varStatus="status">
											<tr>
												<td style="text-align: center;">${list.GIT_WAS_APP_NO}</td>
												<td style="text-align: center;"><a href="javascript:void(0);" onclick="location.href='/VCMS/ADMIN/wasApoAdminView.do?gitWasAppNo=${list.GIT_WAS_APP_NO}'" >${list.GIT_WAS_WORK_NM}</a></td>
												<td style="text-align: center">${list.GIT_WAS_SERVER}</td>
												<td style="text-align: center">${list.GIT_WAS_CON_NM}</td>
												<td style="text-align: center">${list.GIT_WAS_APP_NM}</td>
												<td style="text-align: center">${list.GIT_WAS_APP_DD}</td>
												<td style="text-align: center">
													<c:choose>
                                                   <c:when test="${list.GIT_WAS_MOVN_STAT eq '21'}">&nbsp;差し戻し </c:when>	
                                                   <c:otherwise>${list.GIT_WAS_MOVN_STAT}</c:otherwise>											
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
										<li class="page-item"><a class="page-link" href="/VCMS/ADMIN/wasApoAdminList.do?row=${startPage-10}&&gitWasDateFrom=${gitDbDateFrom}&&gitWasDateTo=${gitWasDateTo}&&gitWasWorkNm=${gitWasWorkNm}&&gitWasAppNm=${gitWasAppNm}&&gitWasConNm=${gitWasConNm}&&gitWasServer=${gitWasServer}&&gitWasMovnStat=${gitWasMovnStat}">以前</a></li>
										<c:forEach begin="${startPage}" end="${endPage}" var="g">	
											<li class="page-item"><a class="page-link"   href="/VCMS/ADMIN/wasApoAdminList.do?row=${g}&&gitWasDateFrom=${gitDbDateFrom}&&gitWasDateTo=${gitWasDateTo}&&gitWasWorkNm=${gitWasWorkNm}&&gitWasAppNm=${gitWasAppNm}&&gitWasConNm=${gitWasConNm}&&gitWasServer=${gitWasServer}&&gitWasMovnStat=${gitWasMovnStat}">${g}</a></li>			
										</c:forEach>
										<li class="page-item"><a class="page-link" href="/VCMS/ADMIN/wasApoAdminList.do?row=${startPage+10}&&gitWasDateFrom=${gitDbDateFrom}&&gitWasDateTo=${gitWasDateTo}&&gitWasWorkNm=${gitWasWorkNm}&&gitWasAppNm=${gitWasAppNm}&&gitWasConNm=${gitWasConNm}&&gitWasServer=${gitWasServer}&&gitWasMovnStat=${gitWasMovnStat}">次</a></li>
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