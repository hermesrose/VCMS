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

<script>
function checkWas(chk){
	 console.log("check");
		var obj = document.getElementsByName("radiWas"); 
		var checkWas1 =document.getElementById("checkWas1");
		var checkWas2 =document.getElementById("checkWas2");
		var checkWas3 =document.getElementById("checkWas3");
		var checkWasEtc =document.getElementById("checkWasEtc");
		var checkWasEtcContent =document.getElementById("checkWasEtcContent");
		
		for(var i=0;i<obj.length;i++){				
			if(obj[i] !=chk){
				console.log("0000");
				obj[i].checked = false;						
			}			
		}			
		if(checkWas1.checked == true || checkWas2.checked == true || checkWas3.checked == true ){
			console.log("3333");
			checkWasEtcContent.disabled = true;
			checkWasEtcContent.value = null;
		}		
		if(checkWasEtc.checked == true){
			console.log("2222");
			checkWasEtcContent.disabled = false;	
		}
	}		
	
function checkDb(chk){
	 console.log("check");
		var obj = document.getElementsByName("radiDb"); 
		var checkDb1 =document.getElementById("checkDb1");
		var checkDb2 =document.getElementById("checkDb2");
		var checkDb3 =document.getElementById("checkDb3");
		var checkDbEtc =document.getElementById("checkDbEtc");
		var checkDbEtcContent =document.getElementById("checkDbEtcContent");
		
		for(var i=0;i<obj.length;i++){				
			if(obj[i] !=chk){
				console.log("0000");
				obj[i].checked = false;						
			}			
		}			
		if(checkDb1.checked == true || checkDb2.checked == true || checkDb3.checked == true ){
			console.log("3333");
			checkDbEtcContent.disabled = true;
			checkDbEtcContent.value = null;
		}		
		if(checkDbEtc.checked == true){
			console.log("2222");
			checkDbEtcContent.disabled = false;	
		}
	}	
	
function checkProgram(chk){
	 console.log("check");
	    var obj = document.getElementsByName("radiProgram"); 
		
		for(var i=0;i<obj.length;i++){				
			if(obj[i] !=chk){
				console.log("0000");
				obj[i].checked = false;						
			}			
		}					
	}		

function checkRestart(chk){
	 console.log("check");
	    var obj = document.getElementsByName("radiRestart"); 
		
		for(var i=0;i<obj.length;i++){				
			if(obj[i] !=chk){
				console.log("0000");
				obj[i].checked = false;						
			}			
		}					
	}	
	
function modifyCheck() {
	//alert("1");
	var scmProjectNm = document.getElementById("scmProjectNm").value;
	var scmDpt = document.getElementById("scmDpt").value;
	var scmProjectStart = document.getElementById("scmProjectStart").value;
	var scmProjectEnd = document.getElementById("scmProjectEnd").value;
	var scmEmpNm = document.getElementById("scmEmpNm").value;
	var scmAppNm = document.getElementById("scmAppNm").value;
	var scmAppPhone = document.getElementById("scmAppPhone").value;
	var scmWorkNm = document.getElementById("scmWorkNm").value;
	var scmAppDd = document.getElementById("scmAppDd").value;
	var scmChContent = document.getElementById("scmChContent").value;
	var scmGitStoAddr = document.getElementById("scmGitStoAddr").value;
	var scmGitRefId = document.getElementById("scmGitRefId").value;
	var scmRefServer = document.getElementById("scmRefServer").value;
	var scmConNm = document.getElementById("scmConNm").value;
	var scmRefDd = document.getElementById("scmRefDd").value;
	var scmRemark = document.getElementById("scmRemark").value;

		
	document.getElementById("checkWasEtc").value = document.getElementById("checkWasEtcContent").value;
	document.getElementById("checkDbEtc").value = document.getElementById("checkDbEtcContent").value;

	// alert("1");
	if (scmProjectNm.length > 49 || scmProjectNm.length == 0) {
		alert("事業名の文字範囲は1~49です。");
		document.getElementById("scmProjectNm").focus();
		return false;//
  	
	} else if (scmDpt.length == 2) {
		alert("担当部署を選択してください。");
		document.getElementById("scmDpt").focus();
		return false;	
		
	} else if (scmProjectStart.length == 0) {
		alert("事業期間を選択してください。");
		document.getElementById("scmProjectStart").focus();
		return false;

	} else if (scmProjectEnd.length == 0) {
		alert("事業期間を選択してください。");
		document.getElementById("scmProjectEnd").focus();
		return false;	
		
	} else if (scmEmpNm.length > 10 || scmEmpNm.length == 0) {
		alert("担当者の文字の範囲は1~10です。");
		document.getElementById("scmEmpNm").focus();
		return false;

	} else if (scmAppPhone.length > 14 || scmAppPhone.length == 0) {
		alert("申込者の連絡先の範囲は1~14です。");
		document.getElementById("scmAppPhone").focus();
		return false;
		
	} else if (scmWorkNm.length > 25 || scmWorkNm.length == 0) {
		alert("業務名の範囲は1~25です。");
		document.getElementById("scmWorkNm").focus();
		return false;	
		
	} else if (scmAppDd.length == 0) {
		alert("申請日を選択してください。");
		document.getElementById("scmAppDd").focus();
		return false;
		
	} else if (scmChContent.length > 100 || scmChContent.length == 0) {
		alert("変更内容の範囲は1~100です。");
		document.getElementById("scmChContent").focus();
		return false;

	} else if (scmGitStoAddr.length > 150 || scmGitStoAddr.length == 0) {
		alert(" リポジトリ パスの範囲は 1 ~ 150 です。");
		document.getElementById("scmGitStoAddr").focus();
		return false;

	} else if (scmGitRefId.length > 15 || scmGitRefId.length == 0) {
		alert(" 反映 IDの範囲は1~15です。");
		document.getElementById("scmGitRefId").focus();
		return false;

	} else if (scmRefServer.length > 25 || scmRefServer.length == 0) {
		alert("反映サーバー名(IP)の範囲は1~25です。");
		document.getElementById("scmRefServer").focus();
		return false;
    
	} else if (scmConNm.length > 10 || scmConNm.length == 0) {
		alert("コンテナ名の範囲は1~10です。");
		document.getElementById("scmConNm").focus();
		return false;
	
	} else if (scmRemark.length > 150 || scmRemark.length == 0) {
		alert("備考の範囲は1~150です。");
		document.getElementById("scmRemark").focus();
		return false;	
		
	}

	var form = document.sourceModifyRun;
	alert("修正しました")
	form.submit();
}

function deleteCheck(){   
    
	 var form = document.sourceDelete;
		  alert("削除しました")
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
            <span>ソースコード反映申請書修正</span>
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
                                                      <c:when test="${view.GIT_DB_MOVN_STAT eq '21'}">&nbsp;差し戻し </c:when>	
                                                     <c:otherwise>${view.GIT_DB_MOVN_STAT}</c:otherwise>											
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
                             <form id="sourceModifyRun" name="sourceModifyRun" action="/VCMS/SOURCE_200/sourceModifyRun.do"  method="POST">                    
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
                                                       <input type="text"  id="scmProjectNm"  name="scmProjectNm" class="form-control" maxlength="100" value="${view.SCM_PROJECT_NM}">
                                                    </td>
                                                    <th><label class="content-middle">担当部署</label></th>
                                                    <td>                                                        
                                                      <select class="form-control"  id="scmDpt" name="scmDpt" style="height: 34px;" >
                                                       <option>${view.SCM_DPT}</option>
                                                       <c:forEach items="${DEPLIST}"  var="var"  varStatus="status">
                                                         <option>${var.COM_CODE_TERM}</option>
                                                       </c:forEach>                                                        
                                                       </select>
                                                    </td>
                                                <tr>
                                                <tr>
                                                    <th><label class="content-middle">事業期間</label></th>
                                                    <td>                                                        
                                                     <div class="form-inline">
                                                        <input type="date" class="form-control" id="scmProjectStart" name="scmProjectStart" maxlength="10" style="width: 108px;" value="${view.SCM_PROJECT_START}"/>
                                                        <label>~</label>
                                                        <input type="date" class="form-control" id="scmProjectEnd" name="scmProjectEnd" maxlength="10" style="width: 108px;" value="${view.SCM_PROJECT_END}"/>
                                                    </div>
                                                    </td>
                                                     <th><label class="content-middle">担当者</label></th>
                                                    <td>                                                        
                                                        <input type="text"  id="scmEmpNm"  name="scmEmpNm" class="form-control" maxlength="100" value="${view.SCM_EMP_NM}">
                                                    </td>
                                                </tr>                                                                                     
                                                <tr>
                                                    <th><label class="content-middle">申請者</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id="scmAppNm"  name="scmAppNm" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly"  value="${view.SCM_APP_NM}">
                                                    </td>
                                                    <th><label class="content-middle">申込者連絡先</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id="scmAppPhone"  name="scmAppPhone" class="form-control" maxlength="100" value="${view.SCM_APP_PHONE}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">業務名</label></th>
                                                    <td>
                                                        <input type="text"  id="scmWorkNm"  name="scmWorkNm" class="form-control" maxlength="100" value="${view.SCM_WORK_NM}">
                                                    </td>
                                                    <th><label class="content-middle">申請日</label></th>
                                                    <td>
                                                       <input type="date"  id="scmAppDd"  name="scmAppDd" class="form-control" maxlength="100" value="${view.SCM_APP_DD}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">反映対象</label></th>                                              
                                                      <td colspan="3">
                                                       <div class="form-inline">									     									  
													   <input type="radio" id="checkProgram1"   class="control-label"   name="radiProgram"   onclick="checkProgram(this)"value="ProgramSorce"   style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.SCM_TARGET eq 'ProgramSorce'}">checked</c:if>/>ProgramSorce
													   <input type="radio" id="checkProgram2"   class="control-label"   name="radiProgram"   onclick="checkProgram(this)"value="DbSorce"   style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.SCM_TARGET eq 'DbSorce'}">checked</c:if>>DbSorce																								
													 </div>	
                                                    </td> 
                                                    </tr>       
                                                 <tr>
                                                    <th><label class="content-middle">変更内容</label></th>
                                                    <td colspan="3">                                                        
                                                        <input type="text"  id="scmChContent"  name="scmChContent" class="form-control" maxlength="100" value="${view.SCM_CH_CONTENT}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                 <th colspan="4"><label class="content-middle">プログラム反映情報</label></th>
                                                </tr>
                                                 <tr>
                                                    <th><label class="content-middle">WAS区分</label></th>                                              
                                                      <td colspan="3">
                                                       <div class="form-inline">									     									  
													   <input type="radio" id="checkWas1"   class="control-label"   name="radiWas"   onclick="checkWas(this)"value="WebLogic"   style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.SCM_WAS_SORTATION eq 'WebLogic'}">checked</c:if>/>WebLogic
													   <input type="radio" id="checkWas2"   class="control-label"   name="radiWas"   onclick="checkWas(this)"value="Tomcat"   style="margin-left: 10px;  margin-top: -1px;"<c:if test="${view.SCM_WAS_SORTATION eq 'Tomcat'}">checked</c:if>/>Tomcat			
													   <input type="radio" id="checkWas3"   class="control-label"   name="radiWas"   onclick="checkWas(this)"value="IIS"   style="margin-left: 10px;  margin-top: -1px;"<c:if test="${view.SCM_WAS_SORTATION eq 'IIS'}">checked</c:if>/>IIS																																				
													   <input type="radio" id="checkWasEtc"     class="control-label"  name="radiWas" onclick="checkWas(this)" style="margin-left: 10px;  margin-top: -1px;"<c:if test="${view.SCM_WAS_SORTATION ne 'WebLogic' && view.SCM_WAS_SORTATION ne 'Tomcat' && view.SCM_WAS_SORTATION ne 'IIS'}">checked</c:if>/>その他
													   <input type="text" id="checkWasEtcContent"  class="form-control"  name="radiWas"  class="form-control"  style="width: 100px; height:30px; margin-top: 0px; margin-left: 5px;"<c:if test="${view.SCM_WAS_SORTATION ne 'WebLogic' && view.SCM_WAS_SORTATION ne 'Tomcat' && view.SCM_WAS_SORTATION ne 'IIS'}">value="${view.SCM_WAS_SORTATION}"</c:if>/>															
													 </div>	
                                                    </td> 
                                                    </tr>       
                                                   <tr>
                                                    <th><label class="content-middle">リポジトリパス</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id="scmGitStoAddr"  name="scmGitStoAddr" class="form-control" maxlength="100" value="${view.SCM_GIT_STO_ADDR}"/>
                                                    </td>
                                                  </tr>
                                                   <tr>
                                                    <th><label class="content-middle">反映 ID</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id="scmGitRefId"  name="scmGitRefId" class="form-control" maxlength="100" value="${view.SCM_GIT_REF_ID}"/>
                                                    </td>
                                                  </tr>
                                                   <tr>
                                                    <th><label class="content-middle">反映サーバー名(IP)</label></th>
                                                    <td colspan="3">
                                                      <input type="text"  id="scmRefServer"  name="scmRefServer" class="form-control" maxlength="100" value="${view.SCM_REF_SERVER}"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">コンテナ名</label></th>
                                                    <td colspan="3">
                                                      <input type="text"  id="scmConNm"  name="scmConNm" class="form-control" maxlength="100" value="${view.SCM_CON_NM}"/>
                                                    </td>
                                                      </tr>
                                                   <tr>
                                                    <th><label class="content-middle">反映時点</label></th>
                                                    <td>                                                 
                                                        <input type="date"  id="scmRefDd"  name="scmRefDd" class="form-control" maxlength="100"   style="width: 49%; float: left;" value="${view.SCM_REF_DD}"/>                                                                                                                                                                  
                                                    </td>                                            
                                                    <th><label class="content-middle">再起動の可否</label></th>                                              
                                                      <td colspan="3">
                                                       <div class="form-inline">									     									  
													   <input type="radio" id="checkRestart1"   class="control-label"   name="radiRestart"   onclick="checkRestart(this)"value="Y"   style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.SCM_RESTART eq 'Y'}">checked</c:if>/>Y
													   <input type="radio" id="checkRestart2"   class="control-label"   name="radiRestart"   onclick="checkRestart(this)"value="N"   style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.SCM_RESTART eq 'N'}">checked</c:if>/>N																							
													 </div>	
                                                    </td> 
                                                    </tr>
                                                  <tr>
                                                 <th colspan="4"><label class="content-middle">DB反映情報</label></th>
                                                </tr>
                                                   <tr>
                                                    <th><label class="content-middle">DB反映区分</label></th>                                              
                                                      <td colspan="3">
                                                       <div class="form-inline">									     									  
													   <input type="radio" id="checkDb1"   class="control-label"   name="radiDb"   onclick="checkDb(this)"value="Table/View"   style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.SCM_DB_REF_SORTATION eq 'Table/View'}">checked</c:if>/>Table/View
													   <input type="radio" id="checkDb2"   class="control-label"   name="radiDb"   onclick="checkDb(this)"value="Procedure/Package"   style="margin-left: 10px;  margin-top: -1px;"<c:if test="${view.SCM_DB_REF_SORTATION eq 'Procedure/Package'}">checked</c:if>/>Procedure/Package
													   <input type="radio" id="checkDb3"   class="control-label"   name="radiDb"   onclick="checkDb(this)"value="Data	"   style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.SCM_DB_REF_SORTATION eq 'Data'}">checked</c:if>/>Data																																					
													   <input type="radio" id="checkDbEtc"     class="control-label"  name="radiDb" onclick="checkDb(this)" style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.SCM_DB_REF_SORTATION ne 'Table/View' && view.SCM_DB_REF_SORTATION ne 'Procedure/Package' && view.SCM_DB_REF_SORTATION ne 'Data'}">checked</c:if>/>その他 
													   <input type="text" id="checkDbEtcContent"  class="form-control"  name="radiDb"  class="form-control"  style="width: 350px; height:30px; margin-top: 0px; margin-left: 5px;" <c:if test="${view.SCM_DB_REF_SORTATION ne 'Table/View' && view.SCM_DB_REF_SORTATION ne 'Procedure/Package' && view.SCM_DB_REF_SORTATION ne 'Data'}">value="${view.SCM_DB_REF_SORTATION}"</c:if> />															
													 </div>	
                                                    </td> 
                                                    </tr>       
                                                <tr>
                                                    <th><label class="content-middle">リポジトリパス</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id="scmGitStoAddr"  name="scmGitStoAddr" class="form-control" maxlength="100" value="${view.SCM_GIT_STO_ADDR}">
                                                    </td>
                                                </tr>
                                                  <tr>
                                                    <th><label class="content-middle">反映ID</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id="scmGitRefId"  name="scmGitRefId" class="form-control" maxlength="100" value="${view.SCM_GIT_REF_ID}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">DB IP(SID)</label></th>
                                                    <td>
                                                       <input type="text"  id="scmDbIpSid"  name="scmDbIpSid" class="form-control" maxlength="100" value="${view.SCM_DB_IP_SID}">
                                                    </td>
                                                    <th><label class="content-middle">DBアカウント</label></th>
                                                    <td>
                                                        <input type="text"  id="scmDbNm"  name="scmDbNm" class="form-control" maxlength="100" value="${view.SCM_DB_NM}">
                                                    </td>
                                                </tr>
                                                 <tr>
                                                     <th><label class="content-middle">備考</label></th>
                                                    <td colspan="3">
                                                        <textarea rows="8" cols="8" id="scmRemark"  name="scmRemark" class="form-control" style="padding-top:10px;"  maxlength="500">${view.SCM_REMARK}</textarea> 
                                                    </td>                                                                                     
                                                </tr>
                                                <input type="hidden"  id="scmAppNo"  name="scmAppNo" class="form-control" value="${view.SCM_APP_NO}" > 
                                                </c:forEach>   
                                            </tbody>
                                        </table>
                                        <div class="alert alert-success" role="alert" style="margin-top: 5px">※ 申請書の内容は保管されます。</div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </section>
                    <c:forEach items="${sourceView}"  var="view"  varStatus="status">
                         <form id="sourceDelete" name="sourceDelete"  action="/VCMS/SOURCE_200/sourceDelete.do"   method="POST">        
                        <input type="hidden"  id="scmAppNo"  name="scmAppNo" class="form-control" value="${view.SCM_APP_NO}" >           
                       </form> 
                     </c:forEach> 
                    <div class="form-group">
                        <div style="text-align:right">                                      
                            <button type="button" class="btn btn-danger btn-sm" onclick="deleteCheck()">削除する</button>
                            <button type="button" class="btn btn-primary btn-sm" onclick="modifyCheck()">完了する</button>
                            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/VCMS/SOURCE_200/sourceList.do'">目録移動</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../shared/footer.jsp" %>