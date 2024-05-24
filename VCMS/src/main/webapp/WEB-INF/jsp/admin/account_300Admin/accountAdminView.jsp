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

<style>
	.backgroundState {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	/*hide*/
	z-index: -1;
	opacity: 0;
}

.showState {
	opacity: 1;
	z-index: 1000;
	transition: all .5s;
}

.popupState {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%);
	background-color: #ffffff;
	box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
	
	/* 사이즈*/
	width: 1200px;
	height: 270px;
	
	/* 초기 아래 배치*/
	transform: translate(-50%,-40%);	
		
}
</style>

<script>
  
   function showState(){
	   document.querySelector(".backgroundState").className = "backgroundState showState"; 
   }
   function showStateClose(){
	   document.querySelector(".backgroundState").className = "backgroundState"; 
   }
   
function comentCheck(){   
	   
	   var gitStuCont = document.getElementById("gitStuCont").value;
     
       
       if(gitStuCont.length >50 || gitStuCont.length ==0){
  		  alert("検討処理内訳の文字範囲は1~50です。");
  		 document.getElementById("gitStuCont").focus();
  		 return false;
  		 
      }
       
    	 var form = document.accountComent;
		  alert("検討処理しました。")
			form.submit();	
 }	  
   
   
   
</script>


<div style="margin: 0px; margin-left: 400px; margin-right: 200px;">
 <div class="page-content">
            <div style="padding-bottom:10px; pading-left:100px">
               <img src="${path}/resources/images/VCMS/headTop.jpg" style="width:100%;" />
        </div>
    </div>  
   <header class="section-header">
        <div class="PageTitle2">
            <span>アカウント作成申請管理照会</span>
        </div>
    </header>
    <section class="card">
        <div class="card-block" style="padding-top:0px">
            <div class="row m-t-lg">
                <div class="col-md-12">
                    <section class="card card-blue mb-3">
                        <header class="card-header">
                          申請処理情報
                        </header>
                        <div class="card-block">
                            <form id="regForm" name="regForm" method="POST">                   
                                <div class="form-group">
                                    <div class="tableSideOpen">
                                        <table cellspacing="0" cellpadding="0" rules="all" border="0" summary="기본정보">
                                            <colgroup>
                                                <col width="10%">
                                                <col width="40%"/>
                                                <col width="10%"/>
                                                <col width="40%"/>                                                
                                            </colgroup>
                                            <tbody>
                                            <c:forEach items="${accountGitView}" var="view" varStatus="status">
                                             <tr>
                                                    <th><label class="content-middle">申請番号</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_APP_NO}">
                                                    </td>
                                                    <th><label class="content-middle">進行状態</label></th>
                                                    <td>                                                        
                                                     <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value=
                                                    <c:choose>
                                                      <c:when test="${view.GIT_MOVN_STAT eq '21'}">&nbsp;差し戻し </c:when>	
                                                     <c:otherwise>${view.GIT_MOVN_STAT}</c:otherwise>											
 												   </c:choose>>                                            
                                                    </td>          
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">検討処理内訳</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_STU_CONT}">          
                                                    </td>                                                   
                                                </tr>     
                                                </c:forEach>	                                                                                                                               
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </section>
                    
                        <section class="card card-blue mb-3">
                        <header class="card-header">
                           申請書情報
                        </header>
                        <div class="card-block">
                            <form id="regForm" name="regForm" method="POST">                      
                                <div class="form-group">
                                    <div class="tableSideOpen">
                                        <table cellspacing="0" cellpadding="0" rules="all" border="0" summary="기본정보">
                                            <colgroup>
                                                <col width="10%">
                                                <col width="40%"/>   
                                                <col width="10%"/>
                                                <col width="40%"/>                                                                            
                                            </colgroup>
                                            <tbody>
                                             <c:forEach items="${accountGitView}" var="view" varStatus="status">
                                                <tr>
                                                    <th><label class="content-middle account-write-top" >申請人</label></th>
                                                    <td colspan="3">                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff; "  readonly="readonly"  value="${view.GIT_NM}">
                                                    </td>
                                                  </tr>
                                                  <tr>
                                                    <th><label class="content-middle account-write-top" >申請人連絡先</label></th>
                                                      <td colspan="3">                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_PHONE}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle account-write-top">申請人所属</label></th>
                                                   <td colspan="3">                                                        
                                                      <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_COMPANY}">
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                     <th><label class="content-middle account-write-top">申請日</label></th>
                                                    <td colspan="3">                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_DATE}">
                                                    </td>
                                                </tr>                                                                                     
                                                <tr>
                                                    <th><label class="content-middle account-write-top">申請人ID</label></th>
                                                    <td colspan="3">                                                        
                                                        <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly"  value="${view.GIT_ID}">
                                                    </td>
                                                 </tr>
                                                 <tr>
                                                    <th><label class="content-middle account-write-top">申請者メール</label></th>
                                                    <td colspan="3">                                                        
                                                           <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly" value="${view.GIT_EMAIL}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle account-write-top">備考</label></th>                              
                                                    <td colspan="3">
                                                      <textarea rows="8" cols="8" id=""  name="" class="form-control tableDetail-view"  style="padding-top:10px; background-color:#ffffff;" readonly="readonly"  maxlength="500"  >${view.GIT_REMARK}</textarea>                                                  
                                                    </td>                                                                                                                     
                                                </tr>
                                                 </c:forEach>	       
                                            </tbody>
                                        </table>
                                    </div>
									<div class="alert alert-success" role="alert" style="margin-top: 5px">※ 状態変更で状態変更してください。</div>
								</div>
                            </form>
                        </div>
                    </section>                                 
                    <div class="form-group">
                        <div style="text-align:right">
                       	<!-- 상태변경 -->
							<button type="button" class="btn btn-primary btn-sm" id="sourceModal" onclick="showState()">状態変更</button>
							<div class="backgroundState">
								<div class="windowState">
									<div class="popupState">
										<div class="card-block" style="padding-top: 0px">
											<div class="row m-t-lg">
												<div class="col-md-12">
													<section class="card card-blue mb-3">
														<header class="card-header"> 状態変更書 </header>
														<div class="card-block">
															<form id="accountComent" name="accountComent"  action="/VCMS/ADMIN/accountComentRun.do"   method="POST">          
																<div class="form-group">
																	<div class="tableSideOpen">																
																		<table cellspacing="0" cellpadding="0" rules="all" border="0" summary="기본정보">
																			<colgroup>
																				<col width="10%">
																				<col width="40%" />
																				<col width="10%" />
																				<col width="40%" />
																			</colgroup>
																			<tbody>
																			<c:forEach items="${accountGitView}" var="view" varStatus="status">
																				<tr>
																					<th><label class="content-middle">申請番号</label></th>
																					<td><input type="text" id="gitAppNo" name="gitAppNo" class="form-control tableDetail-view" style="background-color: #ffffff;" readonly="readonly" value="${view.GIT_APP_NO}"></td>
																					<th><label class="content-middle">進行状態</label></th>
																					<td><select class="form-control"   id="gitMovnStat"  name="gitMovnStat" style="height: 34px;">
																							<option value="20" <c:if test="${view.GIT_MOVN_STAT eq '申請中'}">selected</c:if>>申請中</option>																					
																							<option value="21" <c:if test="${view.GIT_MOVN_STAT eq '差し戻し'}">selected</c:if>>差し戻し</option>
																							<option value="22" <c:if test="${view.GIT_MOVN_STAT eq '補完要請'}">selected</c:if>>補完要請</option>
																							<option value="23" <c:if test="${view.GIT_MOVN_STAT eq '完了'}">selected</c:if>>完了</option>
																					</select></td>
																				</tr>
																				<tr>
																					<th><label class="content-middle">検討処理内訳</label></th>
																					<td><input type="text" id="gitStuCont" name="gitStuCont" class="form-control" maxlength="100" value="${view.GIT_STU_CONT}"></td>
																				</tr>
																				</c:forEach>
																			</tbody>
																		</table>
																	</div>
																</div>
															</form>
														</div>
													</section>
													<div class="form-group">
														<div style="text-align: right">
															<button type="button" class="btn btn-primary btn-sm" onclick="comentCheck()">反映する</button>
															<button type="button" class="btn btn-secondary btn-sm" onclick="showStateClose()">閉じる</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 상태변경  끝-->           
                            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/VCMS/ADMIN/accountAdminList.do'">目録移動</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../../shared/footer.jsp" %>