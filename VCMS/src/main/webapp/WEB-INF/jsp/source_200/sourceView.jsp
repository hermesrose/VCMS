<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../shared/header.jsp" %>   

 <script>
$(document).ready(function(){
	 //alert("zzz");
	  $("#first5").removeClass();	   
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
            <span> ソースコード反映申請書照会</span>
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
                                            <c:forEach items="${sourceView}" var="view" varStatus="status">
                                             <tr>
                                                    <th><label class="content-middle">申請番号</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.SCM_APP_NO}">
                                                    </td>
                                                    <th><label class="content-middle">進行状態</label></th>
                                                    <td>                                                        
                                                     <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value=
                                                    <c:choose>
                                                      <c:when test="${view.SCM_MOVN_STAT eq '21'}">&nbsp;差し戻し </c:when>	
                                                     <c:otherwise>${view.SCM_MOVN_STAT}</c:otherwise>											
 												   </c:choose>>                                                                                                         
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">検討処理内訳</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.SCM_STU_CONT}">
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
                                            <c:forEach items="${sourceView}" var="view" varStatus="status">
                                                <tr>
                                                    <th><label class="content-middle">事業名</label></th>
                                                    <td>                                                        
                                                      <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.SCM_PROJECT_NM}">
                                                    </td>
                                                    <th><label class="content-middle">担当部署</label></th>
                                                    <td>                                                        
                                                      <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.SCM_DPT}">
                                                    </td>
                                                <tr>
                                                <tr>
                                                    <th><label class="content-middle">事業期間</label></th>
                                                    <td>                                                        
                                                     <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.SCM_PROJECT_START}~ ${view.SCM_PROJECT_END}">                                          
                                                    </td>
                                                     <th><label class="content-middle">担当者</label></th>
                                                    <td>                                                        
                                                        <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.SCM_EMP_NM}">
                                                    </td>
                                                </tr>                                                                                     
                                                <tr>
                                                    <th><label class="content-middle">申請者</label></th>
                                                    <td>                                                        
                                                        <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly"  value="${view.SCM_APP_NM}">
                                                    </td>
                                                    <th><label class="content-middle">申込者連絡先</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly" value="${view.SCM_APP_PHONE}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">業務名</label></th>
                                                    <td>
                                                        <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.SCM_WORK_NM}">
                                                    </td>
                                                    <th><label class="content-middle">申請日</label></th>
                                                    <td>
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.SCM_APP_DD}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">反映対象</label></th>                                              
                                                      <td colspan="3">
                                                      <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.SCM_TARGET}">
                                                    </td> 
                                                    </tr>       
                                                 <tr>
                                                    <th><label class="content-middle">変更内容</label></th>
                                                    <td colspan="3">                                                        
                                                        <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly" value="${view.SCM_CH_CONTENT}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                 <th colspan="4"><label class="content-middle">プログラム反映情報</label></th>
                                                </tr>
                                                 <tr>
                                                    <th><label class="content-middle">WAS区分</label></th>                                              
                                                      <td colspan="3">
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.SCM_WAS_SORTATION}">
                                                    </td> 
                                                    </tr>       
                                                   <tr>
                                                    <th><label class="content-middle">リポジトリパス</label></th>
                                                    <td colspan="3">
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly" value="${view.SCM_GIT_STO_ADDR}">
                                                    </td>
                                                  </tr>
                                                   <tr>
                                                    <th><label class="content-middle">反映 ID</label></th>
                                                    <td colspan="3">
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly" value="${view.SCM_GIT_REF_ID}">
                                                    </td>
                                                  </tr>
                                                   <tr>
                                                    <th><label class="content-middle">反映サーバー名(IP)</label></th>
                                                    <td colspan="3">
                                                      <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly" value="${view.SCM_REF_SERVER}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">コンテナ名</label></th>
                                                    <td colspan="3">
                                                      <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly" value="${view.SCM_CON_NM}">
                                                    </td>
                                                      </tr>
                                                   <tr>
                                                    <th><label class="content-middle">反映時点</label></th>
                                                    <td>
                                                     <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.SCM_REF_DD}">
                                                    </td>                                            
                                                    <th><label class="content-middle">再起動の可否</label></th>                                              
                                                      <td colspan="3">
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.SCM_RESTART}">
                                                    </td> 
                                                    </tr>
                                                  <tr>
                                                 <th colspan="4"><label class="content-middle">DB反映情報</label></th>
                                                </tr>
                                                   <tr>
                                                    <th><label class="content-middle">DB反映区分</label></th>                                              
                                                      <td colspan="3">
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly"  value="${view.SCM_DB_REF_SORTATION}">
                                                    </td> 
                                                    </tr>       
                                                <tr>
                                                    <th><label class="content-middle">リポジトリパス</label></th>
                                                    <td colspan="3">
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly"  value="${view.SCM_GIT_STO_ADDR}">
                                                    </td>
                                                </tr>
                                                  <tr>
                                                    <th><label class="content-middle">反映ID</label></th>
                                                    <td colspan="3">
                                                      <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly"  value="${view.SCM_GIT_REF_ID}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">DB IP(SID)</label></th>
                                                    <td>
                                                     <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly"  value="${view.SCM_DB_IP_SID}">
                                                    </td>
                                                    <th><label class="content-middle">DBアカウント</label></th>
                                                    <td>
                                                        <input type="text"  id=""  name="" class="form-control" maxlength="100" value="${view.SCM_DB_NM}">
                                                    </td>
                                                </tr>
                                                 <tr>
                                                     <th><label class="content-middle">備考</label></th>
                                                    <td colspan="3">
                                                        <textarea rows="8" cols="8" id=""  name="" class="form-control" style="padding-top:10px;"  maxlength="500">${view.SCM_REMARK}</textarea> 
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
                        <c:forEach items="${sourceView}" var="view" varStatus="status">                
                            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='/VCMS/SOURCE_200/sourceModify.do?scmAppNo=${view.SCM_APP_NO}'">修正する</button>
                        </c:forEach>
                            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/VCMS/SOURCE_200/sourceList.do'">目録移動</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../shared/footer.jsp" %>