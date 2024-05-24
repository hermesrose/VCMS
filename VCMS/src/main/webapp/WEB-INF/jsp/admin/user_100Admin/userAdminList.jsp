<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../shared/header.jsp" %>   

 <script>
$(document).ready(function(){
	 //alert("zzz");
	  $("#third6").removeClass();	   
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
            <span>会員管理リスト</span>
        </div>
    </header>
    <section class="card" >
        <div class="card-block" style="padding-top: 0px">
            <div class="row m-t-lg">
                <div class="col-md-12">
                    <div class="form-group">
                           <form action="/VCMS/ADMIN/userAdminList.do" id="searchForm" name="searchForm"  method="POST">
                                <div class=SearchBox>
                                    <table class=Layout>
                                        <tbody>
                                            <tr class="First">
                                                <th class="Title list-title-image-dot" ><span>加入日 : </span></TH>
                                                <td class=Value>
                                                    <div class="form-inline">
                                                        <input type="date" class="form-control" id="userDateFrom" name="userDateFrom" maxlength="10" style="width: 108px; height: 25px;" value="<c:if test="${empty sessionScope.userDateFrom}">2024-01-01</c:if>${sessionScope.userDateFrom}"/>
                                                        <label>~</label>
                                                        <input type="date" class="form-control" id="userDateTo" name="userDateTo" maxlength="10" style="width: 108px; height: 25px;" value="<c:if test="${empty sessionScope.userDateTo}">2025-01-01</c:if>${sessionScope.userDateTo}"/>
                                                    </div>
                                                </td>
                                                <th class="Title list-title-image-dot" ><span>ID : </span></th>
                                                <td class="Value">
                                                    <input type="text" class="form-control" id="userIdNm" name="userIdNm" maxlength="10" style="width: 50%; height: 25px;" value="${sessionScope.userIdNm}"/> 
                                                </td>                                                                                  
                                             </tr>
                                                 <tr class="">
                                                <th class="Title list-title-image-dot" ><span>使用者 : </span></th>
                                                <td class=Value>
                                                       <input type="text" class="form-control" id="userNm" name="userNm" maxlength="10" style="width:33%; height: 25px;" value="${sessionScope.userNm}"/> 
                                                </td>
                                                <th class="Title list-title-image-dot" ><span>連絡先 : </span></th>
                                                <td class="Value">
                                                    <input type="text" class="form-control" id="userPhone" name="userPhone" maxlength="10" style="width: 50%; height: 25px;" value="${sessionScope.userPhone}"/> 
                                                </td>
                                                 <td class=Button colspan="2">
                                                    <span class=MBtn>
                                                        <span class=Wrap>                                                        
                                                        </span>
                                                    </span>
                                                </td>                                                                                          
                                             </tr>
                                             <tr class="">
                                                <th class="Title list-title-image-dot" ><span>所属 : </span></th>
                                                <td class=Value>
                                                    <input type="text" class="form-control" id="userCompany" name="userCompany" maxlength="10" style="width:33%; height: 25px;" value="${sessionScope.userCompany}"/> 
                                                </td>                                       
                                                <td class=Button colspan="2">
                                                    <span class=MBtn>
                                                        <span class=Wrap>                                                        
                                                        </span>
                                                    </span>
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
											<col style="width: 12%" />
											<col style="width: 27%" />
											<col style="width: 17%" />
											<col style="width: 17%" />
											<col style="width: 12%" />
											<col style="width: 15%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">順番</th>
												<th scope="col">所属</th>
												<th scope="col">使用者</th>
												<th scope="col">ID</th>
												<th scope="col">加入日</th>
												<th scope="col">連絡先</th>											
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${LISTSELECT}" var="list" varStatus="status">
											<tr>
												<td style="text-align: center;">${list.USER_NO}</td>
												<td style="text-align: center;">${list.USER_COMPANY}</td>
												<td style="text-align: center"><a href="javascript:void(0);" onclick="location.href='/VCMS/ADMIN/userAdminView.do?userNo=${list.USER_NO}'" > ${list.USER_NM} </a></td>
												<td style="text-align: center">${list.USER_ID}</td>
												<td style="text-align: center">${list.USER_DATE}</td>
												<td style="text-align: center">${list.USER_PHONE}</td>							
											</tr>
											</c:forEach>													
										</tbody>
									</table>
								</div>
							</div>					
							<div align="center">
								<nav aria-label="Customzing the active number">
									<ul class="pagination justify-content-right" id="main-form-hide-pageing">
										<li class="page-item"><a class="page-link" href="/VCMS/ADMIN/userAdminList.do?row=${startPage-10}&&userDateFrom=${userDateFrom}&&userDateTo=${userDateTo}&&userIdNm=${userIdNm}&&userNm=${userNm}&&userPhone=${userPhone}&&userCompany=${userCompany}">以前</a></li>
										<c:forEach begin="${startPage}" end="${endPage}" var="g">	
											<li class="page-item"><a class="page-link"   href="/VCMS/ADMIN/userAdminList.do?row=${g}&&userDateFrom=${userDateFrom}&&userDateTo=${userDateTo}&&userIdNm=${userIdNm}&&userNm=${userNm}&&userPhone=${userPhone}&&userCompany=${userCompany}">${g}</a></li>			
										</c:forEach>
										<li class="page-item"><a class="page-link" href="/VCMS/ADMIN/userAdminList.do?row=${startPage+10}&&userDateFrom=${userDateFrom}&&userDateTo=${userDateTo}&&userIdNm=${userIdNm}&&userNm=${userNm}&&userPhone=${userPhone}&&userCompany=${userCompany}">次</a></li>
									</ul>
								</nav>
							</div>
						</div>
							<div class="alert alert-success" role="alert" style="margin-top:5px">
                            ※ 全会員の情報が確認できます。
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../../shared/footer.jsp" %>