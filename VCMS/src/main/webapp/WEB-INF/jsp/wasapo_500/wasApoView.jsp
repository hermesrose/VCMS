<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../shared/header.jsp" %>   

 <script>
$(document).ready(function(){
	 //alert("zzz");
	  $("#first3").removeClass();	   
	});	
</script> 


<div style="margin: 0px; margin-left: 400px; margin-right: 200px;">
 <div class="page-content">
            <div style="padding-bottom:10px; pading-left:100px">
               <img src="${path}/resources/images/VCMS/headTop.jpg" style="width:100%;" />
        </div>
    </div>
    <header class="section-header">
        <div class="PageTitle2">
            <span> リポジトリ生成申請書[WAS]照会</span>
        </div>
    </header>  
    <section class="card">
        <div class="card-block" style="padding-top:0px">
            <div class="row m-t-lg">
                <div class="col-md-12">          
                <section class="card card-blue mb-3">
                        <header class="card-header">申請処理情報 </header>
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
                                            <c:forEach items="${wasApoView}" var="view" varStatus="status">
                                             <tr>
                                                    <th><label class="content-middle">申請番号</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_APP_NO}">
                                                    </td>
                                                    <th><label class="content-middle">進行状態</label></th>
                                                    <td>                                                        
                                                     <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value=
                                                     <c:choose>
                                                      <c:when test="${view.GIT_WAS_MOVN_STAT eq '21'}">&nbsp;差し戻し </c:when>	
                                                     <c:otherwise>${view.GIT_WAS_MOVN_STAT}</c:otherwise>											
 												   </c:choose>>    
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">検討処理内訳</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_STU_CONT}">
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
											<c:forEach items="${wasApoView}" var="view" varStatus="status">
                                                <tr>
                                                    <th><label class="content-middle">事業名</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_PROJECT_NM}">
                                                    </td>
                                                    <th><label class="content-middle">担当部署</label></th>
                                                      <td>                                                        
                                                      <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_DPT}">
                                                    </td>
                                                <tr>
                                                <tr>
                                                    <th><label class="content-middle">事業期間</label></th>
                                                   <td>                                                        
                                                      <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_PROJECT_START}~ ${view.GIT_WAS_PROJECT_END}">
                                                    </td>
                                                     <th><label class="content-middle">担当者</label></th>
                                                    <td>                                                        
                                                        <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_EMP_NM}">
                                                    </td>
                                                </tr>                                                                                     
                                                <tr>
                                                    <th><label class="content-middle">申請者</label></th>
                                                    <td>                                                        
                                                        <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly"  value="${view.GIT_WAS_APP_NM}">
                                                    </td>
                                                    <th><label class="content-middle">申請者の連絡先</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly" value="${view.GIT_WAS_PHONE}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">区分</label></th>
                                                    <td>
                                                        <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_SORTATION}">
                                                    </td>
                                                     <th><label class="content-middle">申請日</label></th>
                                                    <td>
                                                        <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_APP_DD}">
                                                    </td>                                                                                     
                                                </tr>
                                                 <tr>
                                                    <th><label class="content-middle">業務名</label></th>
                                                    <td>
                                                         <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_WORK_NM}">
                                                    </td>
                                                     <th><label class="content-middle">コンテナ名</label></th>
                                                    <td>
                                                        <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_CON_NM}">
                                                    </td>                                                                                     
                                                </tr>                                                                                    
                                                    <tr>
                                                    <th><label class="content-middle">申請サーバ</label></th>
                                                    <td colspan="3" >		
                                                     <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_SERVER}">					
													</td>                                    
                                                    </tr>
                                                    <tr>
                                                     <th><label class="content-middle">サーバー位置</label></th>
                                                    <td colspan="3" >		
                                                      <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_APP_LOCATION}">			
													</td>                                                                                       
                                                </tr>    
                                                <tr>
                                                    <th><label class="content-middle">使用予定 WAS</label></th>                                              
                                                      <td colspan="3">
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_BE_USE_WAS}">
                                                    </td> 
                                                    </tr>                                                                         
                                                    <tr>                                            
                                                     <th><label class="content-middle">テスト内部URL</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_TEST_IN_URL}">
                                                    </td>                                                                                     
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">テスト外部URL</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_TEST_OUT_URL}">
                                                    </td>
                                                 </tr>
                                                 <tr>
                                                     <th><label class="content-middle">テスト外部管理者URL</label></th>
                                                    <td colspan="3">
                                                      <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_TEST_OUT_MR_URL}">
                                                    </td>                                                                                     
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">その他URL</label></th>
                                                    <td colspan="3">
                                                     <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_ETC_URL}">
                                                    </td>
                                                 </tr>
                                                 <tr>
                                                    <th><label class="content-middle">使用希望DB</label></th>                                              
                                                      <td colspan="3">
                                                      <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_DESIRE_DB}">
                                                    </td> 
                                                    </tr>                                                   
                                                <tr>
                                                    <th><label class="content-middle">DBアカウントID</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_DB_NM}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                     <th><label class="content-middle">備考</label></th>
                                                    <td colspan="3">
                                                       <textarea rows="8" cols="8" id=""  name="" class="form-control tableDetail-view" style="padding-top:10px; background-color:#ffffff;"  maxlength="500" readonly="readonly" >${view.GIT_WAS_REMARK}</textarea>           
                                                    </td>                                                                                     
                                                </tr>
                                                </c:forEach>  
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="alert alert-success" role="alert" style="margin-top: 5px">※ 申請情報の照会が可能です。</div>
								</div>
                            </form>
                        </div>
                    </section>
                    <div class="form-group">
                        <div style="text-align:right">      
                        <c:forEach items="${wasApoView}" var="view" varStatus="status">               
                            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='/VCMS/WASAPO_500/wasApoModify.do?gitWasAppNo=${view.GIT_WAS_APP_NO}'">修正する</button>
                        </c:forEach>
                            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/VCMS/WASAPO_500/wasApoList.do'">目録移動</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../shared/footer.jsp" %>