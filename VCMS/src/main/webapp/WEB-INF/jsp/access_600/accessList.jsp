<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../shared/header.jsp" %>   

 <script>
$(document).ready(function(){
	 //alert("zzz");
	  $("#first4").removeClass();	   
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
            <span>リポジトリアクセス権限リスト</span>
        </div>
    </header>
    <section class="card" >
        <div class="card-block" style="padding-top: 0px">
            <div class="row m-t-lg">
                <div class="col-md-12">
                    <div class="form-group">
                             <form action="/VCMS/ACCESS_600/accessList.do"  id="searchForm" name="searchForm"  method="POST">
                                <div class=SearchBox>
                                    <table class=Layout>
                                        <tbody>
                                            <tr class="First">                                      
                                                <th class="Title list-title-image-dot" ><span>申請日 : </span></th>
                                                <td class="Value">
                                                    <div class="form-inline">
                                                        <input type="date" class="form-control" id="accDateFrom" name="accDateFrom" maxlength="10" style="width: 108px; height: 25px;" value="<c:if test="${empty sessionScope.accDateFrom}">2024-01-01</c:if>${sessionScope.accDateFrom}"/>
                                                        <label>~</label>
                                                        <input type="date" class="form-control" id="accDateTo" name="accDateTo" maxlength="10" style="width: 108px; height: 25px;" value="<c:if test="${empty sessionScope.accDateFrom}">2025-01-01</c:if>${sessionScope.accDateTo}"/>
                                                    </div>
                                                </td>
                                                <th class="Title list-title-image-dot"  ><span>申請組織 : </span></th>
                                                <td class="Value">
                                                   <input type="text" class="form-control" id="accAppOrgan" name="accAppOrgan" maxlength="10" style="width: 63.7%; height: 25px;" value="${sessionScope.accAppOrgan}"/>                                
                                        
                                                </td>
                                                <th class="Title list-title-image-dot"  ><span>リポジトリ : </span></th>
                                                <td class="Value">
                                                    <input type="text" class="form-control" id="accAppSave" name="accAppSave" maxlength="10" style="width: 63.7%; height: 25px;" value="${sessionScope.accAppSave}"/>
                                                </td>
                                             </tr>
                                                 <tr class="">
                                                <th class="Title list-title-image-dot"><span>申請者 : </span></TH>
                                                <td class=Value>
                                                     <input type="text" class="form-control" id="accAppNm" name="accAppNm" maxlength="10" style="width: 43.7%; height: 25px;" value="${sessionScope.accAppNm}"/>
                                                </td>
                                                <th class="Title list-title-image-dot" ><span>組織位置 : </span></th>
                                                <td class="Value">
                                                  <select class="form-control"  id="accOrganLoca"  name="accOrganLoca"  style="width: 63.8%; height: 25px;">
                                                  <option value="">全体</option>
                                                   <option value="IN" <c:if test="${sessionScope.accOrganLoca eq 'IN'}">selected</c:if>>IN</option>
                                                   <option value="OUT"<c:if test="${sessionScope.accOrganLoca eq 'OUT'}">selected</c:if>>OUT</option>                                                                                
                                                 </select>             
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
                                                    <input type="text" class="form-control" id="accWorkNm" name="accWorkNm" maxlength="10" style="width: 43.7%; height: 25px;" value="${sessionScope.accWorkNm}"/>
                                                </td>
                                                 <th class="Title list-title-image-dot" ><span>進行状態 : </span></th>
                                                 <td class="Value">
                                                 <select class="form-control"  id="accMovnStat"  name="accMovnStat"  style="width: 63.8%; height: 25px;">
                                                   <option value=""<c:if test="${sessionScope.accMovnStat eq ''}">selected</c:if>>全体</option>
                                                   <option value="20" <c:if test="${sessionScope.accMovnStat eq '20'}">selected</c:if>>申請中</option>
                                                   <option value="21"<c:if test="${sessionScope.accMovnStat eq '21'}">selected</c:if>>差し戻し</option>
                                                   <option value="22"<c:if test="${sessionScope.accMovnStat eq '22'}">selected</c:if>>補完要請</option>
                                                   <option value="23"<c:if test="${sessionScope.accMovnStat eq '23'}">selected</c:if>>完了</option>                                           
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
                          <button  class="btn btn-primary" id="btnNavbarSearch" onclick="location.href='/VCMS/ACCESS_600/accessWrite.do'" >申請する</button>
                          </div>
                        <div style="padding: 5px"></div>
						<div id="targetContainer">                         
							<div style="overflow-x: auto; white-space: nowrap">
								<div class="contentTableList">
									<table cellspacing="0" cellpadding="0" rules="all" border="0"
										summary="내용">
										<colgroup>
											<col style="width: 10%" />
											<col style="width: 15%" />
											<col style="width: 8%" />
											<col style="width: 7%" />
											<col style="width: 26%" />
											<col style="width: 5%" />
											<col style="width: 6%" />
											<col style="width: 6%" />										
										</colgroup>
										<thead>
											<tr>
												<th scope="col">申請番号</th>
												<th scope="col">業務名</th>
												<th scope="col">権限申請組織</th>
												<th scope="col">組織の位置</th>
												<th scope="col">リポジトリ</th>
												<th scope="col">申請者</th>
												<th scope="col">申請日</th>
												<th scope="col">進行状態</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${LISTSELECT}" var="list" varStatus="status">
											<tr>
												<td style="text-align: center;">${list.ACC_APP_NO}</td>
												<td style="text-align: center;"><a href="javascript:void(0);" onclick="location.href='/VCMS/ACCESS_600/accessView.do?accAppNo=${list.ACC_APP_NO}'" >${list.ACC_WORK_NM} </a></td>
												<td style="text-align: center">${list.ACC_APP_ORGAN}</td>
												<td style="text-align: center">${list.ACC_ORGAN_LOCA}</td>
												<td style="text-align: center">${list.ACC_APP_SAVE}</td>
												<td style="text-align: center">${list.ACC_APP_NM}</td>
												<td style="text-align: center">${list.ACC_APP_DD}</td>
												<td style="text-align: center">
													<c:choose>
                                                   <c:when test="${list.ACC_MOVN_STAT eq '21'}">&nbsp;差し戻し </c:when>	
                                                   <c:otherwise>${list.ACC_MOVN_STAT}</c:otherwise>											
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
										<li class="page-item"><a class="page-link" href="/VCMS/ACCESS_600/accessList.do?row=${startPage-10}&&accDateFrom=${accDateFrom}&&accDateTo=${accDateTo}&&accAppNm=${accAppNm}&&accWorkNm=${accWorkNm}&&accAppOrgan=${accAppOrgan}&&accOrganLoca=${accOrganLoca}&&accMovnStat=${accMovnStat}&&accAppSave=${accAppSave}">以前</a></li>
										<c:forEach begin="${startPage}" end="${endPage}" var="g">	
											<li class="page-item"><a class="page-link"   href="/VCMS/ACCESS_600/accessList.do?row=${g}&&accDateFrom=${accDateFrom}&&accDateTo=${accDateTo}&&accAppNm=${accAppNm}&&accWorkNm=${accWorkNm}&&accAppOrgan=${accAppOrgan}&&accOrganLoca=${accOrganLoca}&&accMovnStat=${accMovnStat}&&accAppSave=${accAppSave}">${g}</a></li>			
										</c:forEach>
										<li class="page-item"><a class="page-link" href="/VCMS/ACCESS_600/accessList.do?row=${startPage+10}&&accDateFrom=${accDateFrom}&&accDateTo=${accDateTo}&&accAppNm=${accAppNm}&&accWorkNm=${accWorkNm}&&accAppOrgan=${accAppOrgan}&&accOrganLoca=${accOrganLoca}&&accMovnStat=${accMovnStat}&&accAppSave=${accAppSave}">次</a></li>
									</ul>
								</nav>
							</div>
						</div>
						<div class="alert alert-success" role="alert" style="margin-top:5px">
                            ※ 申請者本人の申請件のみ表示されます。
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../shared/footer.jsp" %>