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

<script>

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
 
 function checkAccess(chk){
	    console.log("check");
		var obj = document.getElementsByName("radiAccess"); 
		var checkAccess1 =document.getElementById("checkAccess1");
		var checkAccess2 =document.getElementById("checkAccess2");
		var checkAccess3 =document.getElementById("checkAccess3");
		var checkAccess4 =document.getElementById("checkAccess4");
		var checkAccess5 =document.getElementById("checkAccess5");
		var checkAccessEtc =document.getElementById("checkAccessEtc");
		var checkAccessEtcContent =document.getElementById("checkAccessEtcContent");
		
		for(var i=0;i<obj.length;i++){				
			if(obj[i] !=chk){
				console.log("0000");
				obj[i].checked = false;						
			}			
		}			
		if(checkAccess1.checked == true || checkAccess2.checked == true || checkAccess3.checked == true || checkAccess4.checked == true || checkAccess5.checked == true ){
			console.log("3333");
			checkAccessEtcContent.disabled = true;
			checkAccessEtcContent.value = null;
		}		
		if(checkAccessEtc.checked == true){
			console.log("2222");
			checkAccessEtcContent.disabled = false;	
		}
	}	
 
 function modifyCheck() {
		//alert("1");
		var accProjectNm = document.getElementById("accProjectNm").value;
		var accEmpNm = document.getElementById("accEmpNm").value;
		var accDpt = document.getElementById("accDpt").value;
		var accPhone = document.getElementById("accPhone").value;
		var accSortation = document.getElementById("accSortation").value;
		var accWorkNm = document.getElementById("accWorkNm").value;
		var accAppSave = document.getElementById("accAppSave").value;
		var accAppGitNm = document.getElementById("accAppGitNm").value;
		var accAffiliation = document.getElementById("accAffiliation").value;
		var accRemark = document.getElementById("accRemark").value;
		var accAppDd = document.getElementById("accAppDd").value;
		var accProjectStart = document.getElementById("accProjectStart").value;
		var accProjectEnd = document.getElementById("accProjectEnd").value;
		
		document.getElementById("checkLocationEtc").value = document.getElementById("checkLocationEtcContent").value;
		document.getElementById("checkAccessEtc").value = document.getElementById("checkAccessEtcContent").value;
		
	
		
		// alert("1");
		if (accProjectNm.length > 49 || accProjectNm.length == 0) {
			alert("事業名の文字範囲は1~49です。");
			document.getElementById("accProjectNm").focus();
			return false;
   								
		} else if (accEmpNm.length > 10 || accEmpNm.length == 0) {
			alert("担当者の文字の範囲は1~10です。");
			document.getElementById("accEmpNm").focus();
			return false;

		} else if (accPhone.length > 14 || accPhone.length == 0) {
			alert("申込者の連絡先の範囲は1~14です。");
			document.getElementById("accPhone").focus();
			return false;
			
		} else if (accAppDd.length == 0) {
			alert("申請日を選択してください。");
			document.getElementById("accAppDd").focus();
			return false;
			
		} else if (accSortation.length > 100 || accSortation.length == 0) {
			alert("区分の範囲は1~100です。");
			document.getElementById("accSortation").focus();
			return false;

		} else if (accWorkNm.length > 25 || accWorkNm.length == 0) {
			alert("業務名の範囲は1~25です。");
			document.getElementById("accWorkNm").focus();
			return false;

		} else if (accAppSave.length > 49 || accAppSave.length == 0) {
			alert("リポジトリの範囲は1~49です。");
			document.getElementById("accAppSave").focus();
			return false;

		} else if (accDpt.length == 2) {
			alert("担当部署を選択してください。");
			document.getElementById("accDpt").focus();
			return false;

		} else if (accProjectStart.length == 0) {
			alert("事業期間を選択してください。");
			document.getElementById("accProjectStart").focus();
			return false;

		} else if (accProjectEnd.length == 0) {
			alert("事業期間を選択してください。");
			document.getElementById("accProjectEnd").focus();
			return false;

		} else if (accAppGitNm.length > 10 || accAppGitNm.length == 0) {
			alert("アクセス申請者の IDの範囲は1~10です。");
			document.getElementById("accAppGitNm").focus();
			return false;

		} else if (accAffiliation.length > 15 || accAffiliation.length == 0) {
			alert("所属範囲は1~15です。");
			document.getElementById("accAffiliation").focus();
			return false;

		} else if (accRemark.length > 200 || accRemark.length == 0) {
			alert("備考の範囲は1~150です。");
			document.getElementById("accRemark").focus();
			return false;	
			
		}

		var form = document.accessModifyRun;
		alert("申し込みました。");
		form.submit();
	}
 
 function deleteCheck(){   
	    
 	 var form = document.accessDelete;
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
            <span> リポジトリアクセス権限の修正</span>
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
                                            <c:forEach items="${accessView}" var="view" varStatus="status">
                                             <tr>
                                                    <th><label class="content-middle">申請番号</label></th>
                                                     <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.ACC_APP_NO}">
                                                     </td>
                                                    <th><label class="content-middle">進行状態</label></th>
                                                     <td>                                                        
                                                     <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value=
                                                      <c:choose>
                                                      <c:when test="${view.ACC_MOVN_STAT eq '21'}">&nbsp;差し戻し </c:when>	
                                                     <c:otherwise>${view.ACC_MOVN_STAT}</c:otherwise>											
 												   </c:choose>>                                                          
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">検討処理内訳</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.ACC_STU_CONT}">
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
                           <form id="accessModifyRun" name="accessModifyRun" action="/VCMS/ACCESS_600/accessModifyRun.do"  method="POST">                  
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
                                            <c:forEach items="${accessView}" var="view" varStatus="status">
                                                <tr>
                                                    <th><label class="content-middle">事業名</label></th>
                                                    <td>                                                        
                                                        <input type="text"  id="accProjectNm"  name="accProjectNm" class="form-control" maxlength="50" value="${view.ACC_PROJECT_NM}">
                                                    </td>
                                                    <th><label class="content-middle">担当部署</label></th>
                                                    <td>                                                        
                                                      <select class="form-control"  id="accDpt" name="accDpt"  style="height: 34px;">
                                                       <option>${view.ACC_DPT}</option>
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
                                                        <input type="date" class="form-control" id="accProjectStart" name="accProjectStart" maxlength="10" style="width: 108px;" value="${view.ACC_PROJECT_START}">
                                                        <label>~</label>
                                                        <input type="date" class="form-control" id="accProjectEnd" name="accProjectEnd" maxlength="10" style="width: 108px;" value="${view.ACC_PROJECT_END}">
                                                    </div>
                                                    </td>
                                                     <th><label class="content-middle">担当者</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id="accEmpNm"  name="accEmpNm" class="form-control" maxlength="100" value="${view.ACC_EMP_NM}">
                                                    </td>
                                                </tr>                                                                                     
                                                <tr>
                                                    <th><label class="content-middle">申請者</label></th>
                                                    <td>                                                        
                                                        <input type="text"  id="accAppNm"  name="accAppNm" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly"  value="${view.ACC_APP_NM}">
                                                    </td>
                                                    <th><label class="content-middle">申込者連絡先</label></th>
                                                    <td>                                                        
                                                        <input type="text"  id="accPhone"  name="accPhone" class="form-control" maxlength="100" value="${view.ACC_PHONE}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">区分</label></th>
                                                    <td>
                                                        <input type="text"  id="accSortation"  name="accSortation" class="form-control" maxlength="100" value="${view.ACC_SORTATION}">
                                                    </td>
                                                    <th><label class="content-middle">申請日</label></th>
                                                    <td>
                                                        <input type="date"  id="accAppDd"  name="accAppDd" class="form-control" maxlength="100" value="${view.ACC_APP_DD}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">業務名</label></th>
                                                    <td colspan="3">                                                        
                                                    <input type="text"  id="accWorkNm"  name="accWorkNm" class="form-control" maxlength="100" value="${view.ACC_WORK_NM}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">権限申請組織</label></th>
                                                     <td colspan="3">
                                                       <div class="form-inline">									     									  
													   <input type="radio" id="checkAccess1"   class="control-label"   name="radiAccess"   onclick="checkAccess(this)"value="knrec"   style="margin-left: 10px;  margin-top: -1px;"<c:if test="${view.ACC_APP_ORGAN eq 'knrec'}">checked</c:if> />knrec
													   <input type="radio" id="checkAccess2"   class="control-label"   name="radiAccess"   onclick="checkAccess(this)"value="TORCL"   style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.ACC_APP_ORGAN eq 'TORCL'}">checked</c:if>/>TORCL
													   <input type="radio" id="checkAccess3"   class="control-label"   name="radiAccess"   onclick="checkAccess(this)"value="min"   style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.ACC_APP_ORGAN eq 'min'}">checked</c:if>/>min	
													   <input type="radio" id="checkAccess4"   class="control-label"   name="radiAccess"   onclick="checkAccess(this)"value="ORCL"   style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.ACC_APP_ORGAN eq 'ORCL'}">checked</c:if>/>ORCL	
													   <input type="radio" id="checkAccess5"   class="control-label"   name="radiAccess"   onclick="checkAccess(this)"value="tusr"   style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.ACC_APP_ORGAN eq 'tusr'}">checked</c:if>/>tusr																			
													   <input type="radio" id="checkAccessEtc"     class="control-label"  name="radiAccess" onclick="checkAccess(this)" style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.ACC_APP_ORGAN ne 'knrec' && view.ACC_APP_ORGAN ne 'TORCL' && view.ACC_APP_ORGAN ne 'min' && view.ACC_APP_ORGAN ne 'ORCL' && view.ACC_APP_ORGAN ne 'tusr'}">checked</c:if>/>その他
													   <input type="text" id="checkAccessEtcContent"  class="form-control"  name="radiAccess"  class="form-control"  style="width: 100px; height:30px; margin-top: 0px; margin-left: 5px;" <c:if test="${view.ACC_APP_ORGAN ne 'knrec' && view.ACC_APP_ORGAN ne 'TORCL' && view.ACC_APP_ORGAN ne 'min' && view.ACC_APP_ORGAN ne 'ORCL' && view.ACC_APP_ORGAN ne 'tusr'}">value="${view.ACC_APP_ORGAN}"</c:if>/>															
													 </div>	
                                                    </td> 
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">組織位置</label></th>
                                                    <td colspan="3" >		
                                                      <div class="form-inline">									     									  
													   <input type="radio" id="checkLocation1"   class="control-label"   name="radiLocation"   onclick="checkLocation(this)"value="IN"   style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.ACC_ORGAN_LOCA eq 'IN'}">checked</c:if>/>IN
													   <input type="radio" id="checkLocation2"   class="control-label"   name="radiLocation"   onclick="checkLocation(this)"value="OUT"   style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.ACC_ORGAN_LOCA eq 'OUT'}">checked</c:if>/>OUT																		
													   <input type="radio" id="checkLocationEtc"     class="control-label"  name="radiLocation" onclick="checkLocation(this)" style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.ACC_ORGAN_LOCA ne 'IN' && view.ACC_ORGAN_LOCA ne 'OUT'}">checked</c:if>/>その他
													   <input type="text" id="checkLocationEtcContent"  class="form-control"  name="radiLocation"  class="form-control"  style="width: 100px; height:30px; margin-top: 0px; margin-left: 5px;" <c:if test="${view.ACC_ORGAN_LOCA ne 'IN' && view.ACC_ORGAN_LOCA ne 'OUT'}">value="${view.ACC_ORGAN_LOCA}"</c:if>/>															
													 </div>						
													</td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">リポジトリ</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id="accAppSave"  name="accAppSave" class="form-control" maxlength="100" value="${view.ACC_APP_SAVE}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">アクセス申込者 ID</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id="accAppGitNm"  name="accAppGitNm" class="form-control" maxlength="100"  value="${view.ACC_APP_GIT_NM}">
                                                    </td>
                                                 </tr>
                                                 <tr>
                                                    <th><label class="content-middle">アクセス申請者の氏名</label></th>
                                                    <td colspan="3">
                                                      <input type="text"  id="accAccAppNm"  name="accAccAppNm" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly"  value="${view.ACC_ACC_APP_NM}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle">所属</label></th>
                                                    <td colspan="3">
                                                      <input type="text"  id="accAffiliation"  name="accAffiliation" class="form-control" maxlength="100" value="${view.ACC_AFFILIATION}">
                                                    </td>
                                                    </tr>
                                                     <tr>
                                                     <th><label class="content-middle">備考</label></th>
                                                    <td colspan="3">
                                                        <textarea rows="8" cols="8" id="accRemark"  name="accRemark" class="form-control" style="padding-top:10px;"  maxlength="500">${view.ACC_REMARK}</textarea> 
                                                    </td>                                                                                     
                                                </tr>  
                                                <input type="hidden"  id="accAppNo"  name="accAppNo" class="form-control" value="${view.ACC_APP_NO}" > 
                                                </c:forEach>                                                 
                                            </tbody>
                                        </table>
                                        <div class="alert alert-success" role="alert" style="margin-top: 5px">※ 申請書の内容は保管されます。</div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </section>
                    <c:forEach items="${accessView}"  var="view"  varStatus="status">
                         <form id="accessDelete" name="accessDelete"  action="/VCMS/ACCESS_600/accessDelete.do"   method="POST">        
                        <input type="hidden"  id="accAppNo"  name="accAppNo" class="form-control" value="${view.ACC_APP_NO}" >           
                       </form> 
                     </c:forEach> 
                    <div class="form-group">
                        <div style="text-align:right">                                      
                            <button type="button" class="btn btn-danger btn-sm" onclick="deleteCheck()">削除する</button>
                           <button type="button" class="btn btn-primary btn-sm" onclick="modifyCheck()">完了する</button>
                            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/VCMS/ACCESS_600/accessList.do'">目録移動</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../shared/footer.jsp" %>