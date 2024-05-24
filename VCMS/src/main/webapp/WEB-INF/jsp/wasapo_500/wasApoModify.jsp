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

<script>
 function checkServer(chk){
		
	var obj = document.getElementsByName("radiServer"); 
	var checkServer1 =document.getElementById("checkServer1");
	var checkServer2 =document.getElementById("checkServer2");
	var checkServer3 =document.getElementById("checkServer3");
	var checkServerEtc =document.getElementById("checkServerEtc");
	var checkServerEtcContent =document.getElementById("checkServerEtcContent");
	
	for(var i=0;i<obj.length;i++){				
		if(obj[i] !=chk){
			console.log("0000");
			obj[i].checked = false;						
		}			
	}	
	if(checkServer1.checked == true || checkServer2.checked == true || checkServer3.checked == true){
		console.log("3333");
		checkServerEtcContent.disabled = true;
		checkServerEtcContent.value = null;
	}
	if(checkServerEtc.checked == true){
		console.log("2222");
		checkServerEtcContent.disabled = false;	
	}
}
 
 function checkLocation(chk){
	 console.log("check");
	 
		var obj = document.getElementsByName("radiLocation"); 
		var checkLocation1 =document.getElementById("checkLocation1");
		var checkLocation2 =document.getElementById("checkLocation2");
		var checkLocationEtc =document.getElementById("checkLocationEtc");
		var checkLocationEtcContent =document.getElementById("checkLocationEtcContent");
		
		for(var i=0;i<obj.length;i++){				
			if(obj[i] !=chk){
				console.log("0000");
				obj[i].checked = false;						
			}			
		}			
		if(checkLocation1.checked == true || checkLocation2.checked == true ){
			console.log("3333");
			checkLocationEtcContent.disabled = true;
			checkLocationEtcContent.value = null;
		}		
		if(checkLocationEtc.checked == true){
			console.log("2222");
			checkLocationEtcContent.disabled = false;	
		}
	}			
 function checkWas(chk){
	 console.log("check");
		var obj = document.getElementsByName("radiWas"); 
		var checkWas1 =document.getElementById("checkWas1");
		var checkWas2 =document.getElementById("checkWas2");
		var checkWasEtc =document.getElementById("checkWasEtc");
		var checkWasEtcContent =document.getElementById("checkWasEtcContent");
		
		for(var i=0;i<obj.length;i++){				
			if(obj[i] !=chk){
				console.log("0000");
				obj[i].checked = false;						
			}			
		}			
		if(checkWas1.checked == true || checkWas2.checked == true ){
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
		var checkDbEtc =document.getElementById("checkDbEtc");
		var checkDbEtcContent =document.getElementById("checkDbEtcContent");
		
		for(var i=0;i<obj.length;i++){				
			if(obj[i] !=chk){
				console.log("0000");
				obj[i].checked = false;						
			}			
		}			
		if(checkDb1.checked == true || checkDb2.checked == true ){
			console.log("3333");
			checkDbEtcContent.disabled = true;
			checkDbEtcContent.value = null;
		}		
		if(checkDbEtc.checked == true){
			console.log("2222");
			checkDbEtcContent.disabled = false;	
		}
	}	
 
	function modifyCheck() {
		//alert("1");
		var gitWasProjectNm = document.getElementById("gitWasProjectNm").value;
		var gitWasDpt = document.getElementById("gitWasDpt").value;
		var gitWasProjectStart = document.getElementById("gitWasProjectStart").value;
		var gitWasProjectEnd = document.getElementById("gitWasProjectEnd").value;
		var gitWasEmpNm = document.getElementById("gitWasEmpNm").value;
		var gitWasAppPhone = document.getElementById("gitWasAppPhone").value;
		var gitWasSortation = document.getElementById("gitWasSortation").value;
		var gitWasWorkNm = document.getElementById("gitWasWorkNm").value;
		var gitWasAppDd = document.getElementById("gitWasAppDd").value;
		var gitWasConNm = document.getElementById("gitWasConNm").value;
		var gitWasTestInUrl = document.getElementById("gitWasTestInUrl").value;
		var gitWasTestOutUrl = document.getElementById("gitWasTestOutUrl").value;
		var gitWasTestOutMrUrl = document.getElementById("gitWasTestOutMrUrl").value;
		var gitWasEtcUrl = document.getElementById("gitWasEtcUrl").value;
		var gitWasDbNm = document.getElementById("gitWasDbNm").value;
		var gitWasRemark = document.getElementById("gitWasRemark").value;

		document.getElementById("checkServerEtc").value = document.getElementById("checkServerEtcContent").value;
		document.getElementById("checkLocationEtc").value = document.getElementById("checkLocationEtcContent").value;
		document.getElementById("checkWasEtc").value = document.getElementById("checkWasEtcContent").value;
		document.getElementById("checkDbEtc").value = document.getElementById("checkDbEtcContent").value;
		
		// alert("1");
		if (gitWasProjectNm.length > 49 || gitWasProjectNm.length == 0) {
			alert("事業名の文字範囲は1~49です。");
			document.getElementById("gitWasProjectNm").focus();
			return false;

		} else if (gitWasEmpNm.length > 5 || gitWasEmpNm.length == 0) {
			alert("担当者の文字の範囲は1~5です。");
			document.getElementById("gitWasEmpNm").focus();
			return false;

		} else if (gitWasAppPhone.length > 14 || gitWasAppPhone.length == 0) {
			alert("申込者の連絡先の範囲は1~14です。");
			document.getElementById("gitWasAppPhone").focus();
			return false;

		} else if (gitWasSortation.length > 100 || gitWasSortation.length == 0) {
			alert("区分の範囲は1~100です。");
			document.getElementById("gitWasSortation").focus();
			return false;

		} else if (gitWasWorkNm.length > 100 || gitWasWorkNm.length == 0) {
			alert("業務名の範囲は1~25です。");
			document.getElementById("gitWasWorkNm").focus();
			return false;//

		} else if (gitWasConNm.length > 49 || gitWasConNm.length == 0) {
			alert(" コンテナ名の範囲は1~49です。");
			document.getElementById("gitWasConNm").focus();
			return false;

		} else if (gitWasDpt.length == 2) {
			alert("担当部署を選択してください。");
			document.getElementById("gitWasDpt").focus();
			return false;

		} else if (gitWasProjectStart.length == 0) {
			alert("事業期間を選択してください。");
			document.getElementById("gitWasProjectStart").focus();
			return false;

		} else if (gitWasProjectEnd.length == 0) {
			alert("事業期間を選択してください。");
			document.getElementById("gitWasProjectEnd").focus();
			return false;

		} else if (gitWasAppDd.length == 0) {
			alert("申請日を選択してください。");
			document.getElementById("gitWasAppDd").focus();
			return false;

		} else if (gitWasTestInUrl.length > 200 || gitWasTestInUrl.length == 0) {
			alert("テスト内部の範囲は1~200です。");
			document.getElementById("gitWasTestInUrl").focus();
			return false;

		} else if (gitWasTestOutUrl.length > 200 || gitWasTestOutUrl.length == 0) {
			alert("テスト外部の範囲は1~200です。");
			document.getElementById("gitWasTestOutUrl").focus();
			return false;

		} else if (gitWasTestOutMrUrl.length > 200 || gitWasTestOutMrUrl.length == 0) {
			alert("テスト外部管理者の範囲は1~200です。");
			document.getElementById("gitWasTestOutMrUrl").focus();
			return false;

		} else if (gitWasEtcUrl.length > 200 || gitWasEtcUrl.length == 0) {
			alert("その他URLの範囲は1~200です。");
			document.getElementById("gitWasEtcUrl").focus();
			return false;

		} else if (gitWasDbNm.length > 15 || gitWasDbNm.length == 0) {
			alert("DBアカウントIDの範囲は1~200です。");
			document.getElementById("gitWasDbNm").focus();
			return false;

		} else if (gitWasRemark.length > 50 || gitWasRemark.length == 0) {
			alert("備考の範囲は1~50です。");
			document.getElementById("gitWasRemark").focus();
			return false;

		}

	 	 var form = document.wasApoModifyRun;
		  alert("修正しました");
			form.submit();	
}	 
	
	function deleteCheck(){   
	    
	 	 var form = document.wasApoDelete;
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
            <span> リポジトリ生成申請書[WAS]修正</span>
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
                                            <c:forEach items="${wasApoView}" var="view" varStatus="status">
                                             <tr>
                                                    <th><label class="content-middle">申請番号</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_APP_NO}">
                                                    </td>
                                                    <th><label class="content-middle">進行状態</label></th>
                                                    <td>                                                        
                                                     <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_WAS_MOVN_STAT}">
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
                            <form id="wasApoModifyRun" name="wasApoModifyRun" action="/VCMS/WASAPO_500/wasApoModifyRun.do"  method="POST">                      
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
                                                       <input type="text"  id="gitWasProjectNm"  name="gitWasProjectNm" class="form-control" maxlength="49"  value="${view.GIT_WAS_PROJECT_NM}">
                                                    </td>
                                                    <th><label class="content-middle">担当部署</label></th>
                                                      <td>                                                        
                                                      <select class="form-control"  id="gitWasDpt"  name="gitWasDpt"  style="height: 34px;">
                                                       <option>${view.GIT_WAS_DPT}</option>
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
                                                        <input type="date" class="form-control" id="gitWasProjectStart" name="gitWasProjectStart" maxlength="10" style="width: 108px;" value="${view.GIT_WAS_PROJECT_START}"/>
                                                        <label>~</label>
                                                        <input type="date" class="form-control" id="gitWasProjectEnd" name="gitWasProjectEnd" maxlength="10" style="width: 108px;" value="${view.GIT_WAS_PROJECT_END}"/>
                                                    </div>
                                                    </td>
                                                     <th><label class="content-middle">担当者</label></th>
                                                    <td>                                                        
                                                        <input type="text"  id="gitWasEmpNm"  name="gitWasEmpNm" class="form-control" maxlength="5"  value="${view.GIT_WAS_EMP_NM}">
                                                    </td>
                                                </tr>                                                                                     
                                                <tr>
                                                    <th><label class="content-middle">申請者</label></th>
                                                    <td>                                                        
                                                        <input type="text"  id="gitWasAppNm"  name="gitWasAppNm" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly"  value="${view.GIT_WAS_APP_NM}">
                                                    </td>
                                                    <th><label class="content-middle">申込者の連絡先</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id="gitWasAppPhone"  name="gitWasAppPhone" class="form-control" maxlength="14"  value="${view.GIT_WAS_PHONE}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">区分</label></th>
                                                    <td>
                                                        <input type="text"  id="gitWasSortation"  name="gitWasSortation" class="form-control" maxlength="100" value="${view.GIT_WAS_SORTATION}">
                                                    </td>
                                                     <th><label class="content-middle">申請日</label></th>
                                                    <td>
                                                        <input type="date"  id="gitWasAppDd"  name="gitWasAppDd" class="form-control" maxlength="100" value="${view.GIT_WAS_APP_DD}">
                                                    </td>                                                                                     
                                                </tr>
                                                 <tr>
                                                    <th><label class="content-middle">業務名</label></th>
                                                    <td>
                                                        <input type="text"  id="gitWasWorkNm"  name="gitWasWorkNm" class="form-control" maxlength="100" value="${view.GIT_WAS_WORK_NM}">
                                                    </td>
                                                     <th><label class="content-middle">コンテナ名</label></th>
                                                    <td>
                                                        <input type="text"  id="gitWasConNm"  name="gitWasConNm" class="form-control" maxlength="100" value="${view.GIT_WAS_CON_NM}">
                                                    </td>                                                                                     
                                                </tr>                                                                                    
                                                    <tr>
                                                    <th><label class="content-middle">申請サーバ</label></th>
                                                    <td colspan="3" >		
                                                     <div class="form-inline">
															<input type="radio" id="checkServer1" class="control-label" name="radiServer" onclick="checkServer(this)" value="knrec" style="margin-left: 10px; margin-top: -1px;"   <c:if test="${view.GIT_WAS_SERVER eq 'knrec'}">checked</c:if>/>knrec 
															<input type="radio" id="checkServer2" class="control-label" name="radiServer" onclick="checkServer(this)" value="min" style="margin-left: 10px; margin-top: -1px;"<c:if test="${view.GIT_WAS_SERVER eq 'min'}">checked</c:if> />min 
															<input type="radio" id="checkServer3" class="control-label" name="radiServer" onclick="checkServer(this)" value="tusr" style="margin-left: 10px; margin-top: -1px;"   <c:if test="${view.GIT_WAS_SERVER eq 'tusr'}">checked</c:if> />tusr 
															<input type="radio" id="checkServerEtc" class="control-label" name="radiServer" onclick="checkServer(this)" style="margin-left: 10px; margin-top: -1px;" <c:if test="${view.GIT_WAS_SERVER ne 'knrec' && view.GIT_WAS_SERVER ne 'min' && view.GIT_WAS_SERVER ne 'tusr'}">checked</c:if>/>その他
															 <input type="text" id="checkServerEtcContent" class="form-control" name="radiServer" class="form-control" style="width: 100px; height: 30px; margin-top: 0px; margin-left: 5px;" <c:if test="${view.GIT_WAS_SERVER ne 'knrec' && view.GIT_WAS_SERVER ne 'min' && view.GIT_WAS_SERVER ne 'tusr'}">value="${view.GIT_WAS_SERVER}"</c:if>/>				
														</div>					
													</td>                                    
                                                    </tr>
                                                    <tr>
                                                     <th><label class="content-middle">サーバー位置</label></th>
                                                    <td colspan="3" >		
                                                     <div class="form-inline">
															<input type="radio" id="checkLocation1" class="control-label" name="radiLocation" onclick="checkLocation(this)" value="OUT" style="margin-left: 10px; margin-top: -1px;" <c:if test="${view.GIT_WAS_APP_LOCATION eq 'OUT'}">checked</c:if>/>OUT 
															<input type="radio" id="checkLocation2" class="control-label" name="radiLocation" onclick="checkLocation(this)" value="IN" style="margin-left: 10px; margin-top: -1px;" <c:if test="${view.GIT_WAS_APP_LOCATION eq 'IN'}">checked</c:if>/>IN
															<input type="radio" id="checkLocationEtc" class="control-label" name="radiLocation" onclick="checkLocation(this)" style="margin-left: 10px; margin-top: -1px;" <c:if test="${view.GIT_WAS_APP_LOCATION ne 'OUT' && view.GIT_WAS_APP_LOCATION ne 'IN'}">checked</c:if>/>その他 
															<input type="text" id="checkLocationEtcContent" class="form-control" name="radiLocation" class="form-control" style="width: 100px; height: 30px; margin-top: 0px; margin-left: 5px;" <c:if test="${view.GIT_WAS_APP_LOCATION ne 'OUT' && view.GIT_WAS_APP_LOCATION ne 'IN'}">value="${view.GIT_WAS_APP_LOCATION}"</c:if>/>
														</div>		
													</td>                                                                                       
                                                </tr>    
                                                <tr>
                                                    <th><label class="content-middle">使用予定 WAS</label></th>                                              
                                                      <td colspan="3">
                                                       <div class="form-inline">
															<input type="radio" id="checkWas1" class="control-label" name="radiWas" onclick="checkWas(this)" value="WebLogic" style="margin-left: 10px; margin-top: -1px;" <c:if test="${view.GIT_WAS_BE_USE_WAS eq 'WebLogic'}">checked</c:if>/>WebLogic 
															<input type="radio" id="checkWas2" class="control-label" name="radiWas" onclick="checkWas(this)" value="Tomcat" style="margin-left: 10px; margin-top: -1px;" <c:if test="${view.GIT_WAS_BE_USE_WAS eq 'Tomcat'}">checked</c:if>/>Tomcat 
															<input type="radio" id="checkWasEtc" class="control-label" name="radiWas" onclick="checkWas(this)" style="margin-left: 10px; margin-top: -1px;" <c:if test="${view.GIT_WAS_BE_USE_WAS ne 'WebLogic' && view.GIT_WAS_BE_USE_WAS ne 'Tomcat'}">checked</c:if>/>その他
															 <input type="text" id="checkWasEtcContent" class="form-control" name="radiWas" class="form-control" style="width: 100px; height: 30px; margin-top: 0px; margin-left: 5px;" <c:if test="${view.GIT_WAS_BE_USE_WAS ne 'WebLogic' && view.GIT_WAS_BE_USE_WAS ne 'Tomcat'}">value="${view.GIT_WAS_BE_USE_WAS}"</c:if>/>
														</div>
                                                    </td> 
                                                    </tr>                                                                         
                                                    <tr>                                            
                                                     <th><label class="content-middle">テスト内部URL</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id="gitWasTestInUrl"  name="gitWasTestInUrl" class="form-control" maxlength="200"  value="${view.GIT_WAS_TEST_IN_URL}">
                                                    </td>                                                                                     
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">テスト外部URL</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id="gitWasTestOutUrl"  name="gitWasTestOutUrl" class="form-control" maxlength="200"  value="${view.GIT_WAS_TEST_OUT_URL}">
                                                    </td>
                                                 </tr>
                                                 <tr>
                                                     <th><label class="content-middle">テスト外部管理者URL</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id="gitWasTestOutMrUrl"  name="gitWasTestOutMrUrl" class="form-control" maxlength="200"  value="${view.GIT_WAS_TEST_OUT_MR_URL}">
                                                    </td>                                                                                     
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">その他URL</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id="gitWasEtcUrl"  name="gitWasEtcUrl" class="form-control" maxlength="200"  value="${view.GIT_WAS_ETC_URL}">
                                                    </td>
                                                 </tr>
                                                 <tr>
                                                    <th><label class="content-middle">使用希望DB</label></th>                                              
                                                      <td colspan="3">
                                                       <div class="form-inline">
															<input type="radio" id="checkDb1" class="control-label" name="radiDb" onclick="checkDb(this)" value="TORCL" style="margin-left: 10px; margin-top: -1px;" <c:if test="${view.GIT_WAS_DESIRE_DB eq 'TORCL'}">checked</c:if>/>TORCL 
															<input type="radio" id="checkDb2" class="control-label" name="radiDb" onclick="checkDb(this)" value="ORCL" style="margin-left: 10px; margin-top: -1px;"   <c:if test="${view.GIT_WAS_DESIRE_DB eq 'ORCL'}">checked</c:if>/>ORCL
															<input type="radio" id="checkDbEtc" class="control-label" name="radiDb" onclick="checkDb(this)" style="margin-left: 10px; margin-top: -1px;" <c:if test="${view.GIT_WAS_DESIRE_DB ne 'TORCL' && view.GIT_WAS_DESIRE_DB ne 'ORCL'}">checked</c:if>/>その他 
															<input type="text" id="checkDbEtcContent" class="form-control" name="radiDb" class="form-control" style="width: 100px; height: 30px; margin-top: 0px; margin-left: 5px;" <c:if test="${view.GIT_WAS_DESIRE_DB ne 'TORCL' && view.GIT_WAS_DESIRE_DB ne 'ORCL'}">value="${view.GIT_WAS_DESIRE_DB}"</c:if> />
														</div>
                                                    </td> 
                                                    </tr>                                               
                                                <tr>
                                                    <th><label class="content-middle">DBアカウントID</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id="gitWasDbNm"  name="gitWasDbNm" class="form-control" maxlength="15"  value="${view.GIT_WAS_DB_NM}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                     <th><label class="content-middle">備考</label></th>
                                                    <td colspan="3">
                                                        <textarea rows="8" cols="8" id="gitWasRemark"  name="gitWasRemark" class="form-control" style="padding-top:10px;"  maxlength="500">${view.GIT_WAS_REMARK}</textarea> 
                                                    </td>                                                                                     
                                                </tr>
                                                <input type="hidden"  id="gitWasAppNo"  name="gitWasAppNo" class="form-control" value="${view.GIT_WAS_APP_NO}" > 
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="alert alert-success" role="alert" style="margin-top: 5px">※ 申請書の内容は保管されます。</div>
                                    </div>
								</div>
                            </form>
                        </div>
                    </section>
                     <c:forEach items="${wasApoView}"  var="view"  varStatus="status">
                         <form id="wasApoDelete" name="wasApoDelete"  action="/VCMS/DBAPO_500/wasApoDelete.do"   method="POST">        
                        <input type="hidden"  id="gitWasAppNo"  name="gitWasAppNo" class="form-control" value="${view.GIT_WAS_APP_NO}" >           
                       </form> 
                     </c:forEach>   
                    <div class="form-group">
                        <div style="text-align:right">                                      
                            <button type="button" class="btn btn-danger btn-sm" onclick="deleteCheck()">削除する</button>
                            <button type="button" class="btn btn-primary btn-sm" onclick="modifyCheck()">完了する</button>
                            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/VCMS/WASAPO_500/wasApoList.do'">目録移動</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../shared/footer.jsp" %>