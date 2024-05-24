<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../shared/header.jsp" %>   

 <script>
$(document).ready(function(){
	 //alert("zzz");
	  $("#third5").removeClass();	   
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
            <span>ソースコード反映申請管理リスト</span>
        </div>
    </header>
    <section class="card" >
        <div class="card-block" style="padding-top: 0px">
            <div class="row m-t-lg">
                <div class="col-md-12">
                    <div class="form-group">
                            <form action="/VCMS/ADMIN/sourceAdminList.do"  id="searchForm" name="searchForm"  method="POST">
                                <div class=SearchBox>
                                    <table class=Layout>
                                        <tbody>
                                            <tr class="First">                                      
                                                <th class="Title list-title-image-dot" ><span>申請日 : </span></th>
                                                <td class="Value">
                                                    <div class="form-inline">
                                                        <input type="date" class="form-control" id="scmDateFrom" name="scmDateFrom" maxlength="10" style="width: 108px; height: 25px;" value="<c:if test="${empty sessionScope.scmDateFrom}">2024-01-01</c:if>${sessionScope.scmDateFrom}"/>
                                                        <label>~</label>
                                                        <input type="date" class="form-control" id="scmDateTo" name="scmDateTo" maxlength="10" style="width: 108px; height: 25px;" value="<c:if test="${empty sessionScope.scmDateTo}">2025-01-01</c:if>${sessionScope.scmDateTo}"/>
                                                    </div>
                                                </td>
                                                <th class="Title list-title-image-dot"  ><span>変更内容 : </span></th>
                                                <td class="Value">
                                                    <input type="text" class="form-control" id="scmChContent" name="scmChContent" maxlength="10" style="width: 63.8%; height: 25px;"  value="${sessionScope.scmChContent}"/> 
                                                </td>
                                                <th class="Title list-title-image-dot"  ><span>申請者 : </span></th>
                                                <td class="Value">
                                                    <input type="text" class="form-control" id="scmAppNm" name="scmAppNm" maxlength="10" style="width: 63.8%; height: 25px;"  value="${sessionScope.scmAppNm}"/> 
                                                </td>
                                             </tr>
                                                 <tr class="">
                                                <th class="Title list-title-image-dot"><span>反映時点 : </span></TH>
                                                <td class=Value>
                                                    <div class="form-inline">
                                                        <input type="date" class="form-control" id="scmRefFrom" name="scmRefFrom" maxlength="10" style="width: 108px; height: 25px;" value="<c:if test="${empty sessionScope.scmRefFrom}">2024-01-01</c:if>${sessionScope.scmRefFrom}"/>
                                                        <label>~</label>
                                                        <input type="date" class="form-control" id="scmRefTo" name="scmRefTo" maxlength="10" style="width: 108px; height: 25px;" value="<c:if test="${empty sessionScope.scmRefTo}">2025-01-01</c:if>${sessionScope.scmRefTo}"/>
                                                    </div>
                                                </td>
                                                <th class="Title list-title-image-dot" ><span>コンテナ名 : </span></th>
                                                <td class="Value">
                                                    <input type="text" class="form-control" id="scmConNm" name="scmConNm" maxlength="10" style="width: 63.8%; height: 25px;"  value="${sessionScope.scmConNm}"/> 
                                                </td> 
                                                <td class=Button colspan="2">
                                                    <span class=MBtn>
                                                        <span class=Wrap>                                                        
                                                        </span>
                                                    </span>
                                                </td>                                           
                                             </tr>
                                             <tr class="">
                                                <th class="Title list-title-image-dot"><span>業務名 : </span></th>
                                                <td class=Value>
                                                    <input type="text" class="form-control" id="scmWorkNm" name="scmWorkNm" maxlength="10" style="width: 43.7%; height: 25px;" value="${sessionScope.scmWorkNm}"/> 
                                                </td>
                                                 <th class="Title list-title-image-dot" ><span>進行状態 : </span></th>
                                                 <td class="Value">
                                                 <select class="form-control"  id="scmMovnStat"  name="scmMovnStat"  style="width: 63.8%; height: 33px; height: 25px;">
                                                   <option value=""<c:if test="${sessionScope.scmMovnStat eq ''}">selected</c:if>>全体</option>
                                                   <option value="20" <c:if test="${sessionScope.scmMovnStat eq '20'}">selected</c:if>>申請中</option>
                                                   <option value="21"<c:if test="${sessionScope.scmMovnStat eq '21'}">selected</c:if>>差し戻し</option>
                                                   <option value="22"<c:if test="${sessionScope.scmMovnStat eq '22'}">selected</c:if>>補完要請</option>
                                                   <option value="23"<c:if test="${sessionScope.scmMovnStat eq '23'}">selected</c:if>>完了</option>                                           
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
											<col style="width: 6%" />
											<col style="width: 15%" />
											<col style="width: 8%" />
											<col style="width: 7%" />
											<col style="width: 30%" />
											<col style="width: 5%" />
											<col style="width: 6%" />
											<col style="width: 6%" />
											<col style="width: 7%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">申請番号</th>
												<th scope="col">業務名</th>
												<th scope="col">コンテナ名</th>
												<th scope="col">反映 ID</th>
												<th scope="col">変更内容</th>
												<th scope="col">申請者</th>
												<th scope="col">申請日</th>
												<th scope="col">反映時点</th>
												<th scope="col">進行状態</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${LISTSELECT}" var="list" varStatus="status">
											<tr>
												<td style="text-align: center;">${list.SCM_APP_NO}</td>
												<td style="text-align: center;"><a href="javascript:void(0);" onclick="location.href='/VCMS/ADMIN/sourceAdminView.do?scmAppNo=${list.SCM_APP_NO}'" > ${list.SCM_WORK_NM} </a></td>
												<td style="text-align: center">${list.SCM_CON_NM}</td>
												<td style="text-align: center">${list.SCM_GIT_REF_ID}</td>
												<td style="text-align: center">${list.SCM_CH_CONTENT}</td>
												<td style="text-align: center">${list.SCM_APP_NM}</td>
												<td style="text-align: center">${list.SCM_APP_DD}</td>
												<td style="text-align: center">${list.SCM_REF_DD}</td>
												<td style="text-align: center">${list.SCM_MOVN_STAT}</td>
											</tr>	
											</c:forEach>											
										</tbody>
									</table>
								</div>
							</div>
							<div align="center">
								<nav aria-label="Customzing the active number">
									<ul class="pagination justify-content-right" id="main-form-hide-pageing">
										<li class="page-item"><a class="page-link" href="/VCMS/ADMIN/sourceAdminList.do?row=${startPage-10}&&scmDateFrom=${scmDateFrom}&&scmDateTo=${scmDateTo}&&scmChContent=${scmChContent}&&scmAppNm=${scmAppNm}&&scmRefFrom=${scmRefFrom}&&scmRefTo=${scmRefTo}&&scmConNm=${scmConNm}&&scmWorkNm=${scmWorkNm}&&scmMovnStat=${scmMovnStat}">以前</a></li>
										<c:forEach begin="${startPage}" end="${endPage}" var="g">	
											<li class="page-item"><a class="page-link"   href="/VCMS/ADMIN/sourceAdminList.do?row=${g}&&scmDateFrom=${scmDateFrom}&&scmDateTo=${scmDateTo}&&scmChContent=${scmChContent}&&scmAppNm=${scmAppNm}&&scmRefFrom=${scmRefFrom}&&scmRefTo=${scmRefTo}&&scmConNm=${scmConNm}&&scmWorkNm=${scmWorkNm}&&scmMovnStat=${scmMovnStat}">${g}</a></li>			
										</c:forEach>
										<li class="page-item"><a class="page-link" href="/VCMS/ADMIN/sourceAdminList.do?row=${startPage+10}&&scmDateFrom=${scmDateFrom}&&scmDateTo=${scmDateTo}&&scmChContent=${scmChContent}&&scmAppNm=${scmAppNm}&&scmRefFrom=${scmRefFrom}&&scmRefTo=${scmRefTo}&&scmConNm=${scmConNm}&&scmWorkNm=${scmWorkNm}&&scmMovnStat=${scmMovnStat}">次</a></li>
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