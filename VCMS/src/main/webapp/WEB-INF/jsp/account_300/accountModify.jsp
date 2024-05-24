<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../shared/header.jsp" %>   

<script>
$(document).ready(function(){
	 //alert("zzz");
	  $("#first1").removeClass();	   
	});	
</script>

<script>

 function modifyCheck(){   
	   
	   var gitPhone = document.getElementById("gitPhone").value;
       var gitEmail = document.getElementById("gitEmail").value;
       var gitRemark = document.getElementById("gitRemark").value;
       var gitCompany = document.getElementById("gitCompany").value;
       var gitDate = document.getElementById("gitDate").value;
       
       if(gitPhone.length >15 || gitPhone.length ==0){
  		  alert("申込者の連絡先の文字範囲は1~15です。");
  		 document.getElementById("gitPhone").focus();
  		 return false;
  		 
  	   }else if(gitEmail.length >30 || gitEmail.length ==0){
   		  alert("申請者のメールの文字範囲は1~30です。");
   		document.getElementById("gitEmail").focus();
   		return false;  	
   		
  	   }else if(gitRemark.length >50 ||gitRemark.length ==0){
          alert("備考の文字範囲は1~50です。");
    	document.getElementById("gitRemark").focus();
    	return false;
    	
  	   }else if(gitCompany.length == 0 || gitCompany.length == 2){
          alert("申請者の所属を選択してください。");
      	document.getElementById("gitCompany").focus();
      	return false;
      	
      }else if(gitDate.length ==0){
        alert("申請日を選択してください。");
       document.getElementById("gitDate").focus();
       return false;
      }
       
       
    	 var form = document.accountModifyRun;
		  alert("修正しました。")
			form.submit();	
 }	  
 
 function deleteCheck(){   
	    
  	 var form = document.accountDelete;
		  alert("削除しました。")
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
            <span> アカウント作成申込書修整</span>
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
                            <form id="accountModifyRun" name="accountModifyRun"  action="/VCMS/ACCOUNT_300/accountModifyRun.do"   method="POST">                      
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
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff; "  readonly="readonly" value="${view.GIT_NM}">
                                                    </td>
                                                  </tr>
                                                  <tr>
                                                    <th><label class="content-middle account-write-top" >申請人連絡先</label></th>
                                                      <td colspan="3">                                                        
                                                      <input type="text"  id="gitPhone"  name="gitPhone" class="form-control" value="${view.GIT_PHONE}" maxlength="15" >
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle account-write-top">申請人所属</label></th>
                                                  <td colspan="3">                                                        
                                                     <select class="form-control" style="height: 34px;" id="gitCompany"  name="gitCompany">
                                                       <c:forEach items="${LISTCOMPANY}"  var="var"  varStatus="status">
                                                         <option  <c:if test="${var.COM_CODE_TERM eq view.GIT_COMPANY}" >selected</c:if>>${var.COM_CODE_TERM}</option>
                                                       </c:forEach>                                                        
                                                       </select>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                     <th><label class="content-middle account-write-top">申請日</label></th>
                                                    <td colspan="3">                                                        
                                                       <input type="date"  id="gitDate"  name="gitDate" class="form-control" value="${view.GIT_DATE}">
                                                    </td>
                                                </tr>                                                                                     
                                                <tr>
                                                    <th><label class="content-middle account-write-top">申請人ID</label></th>
                                                    <td colspan="3">                                                        
                                                        <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly"  value="${view.GIT_ID}">
                                                    </td>
                                                 </tr>
                                                 <tr>
                                                    <th><label class="content-middle account-write-top">申請人メール</label></th>
                                                    <td>                                                        
                                                           <input type="text"  id="gitEmail"  name="gitEmail" class="form-control" value="${view.GIT_EMAIL}"  maxlength="30">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle account-write-top">備考</label></th>
                                                    <td colspan="3">
                                                      <textarea rows="8" cols="8" id="gitRemark"  name="gitRemark" class="form-control" style="padding-top:10px;"  maxlength="50" >${view.GIT_REMARK}</textarea>                                                  
                                                    </td>                                                                                       
                                                </tr>
                                                 <input type="hidden"  id="gitAppNo"  name="gitAppNo" class="form-control" value="${view.GIT_APP_NO}" >                              
                                                </c:forEach>	     
                                            </tbody>
                                        </table>
                                        <div class="alert alert-success" role="alert" style="margin-top: 5px">※ 申請書の内容は保管されます。</div>
                                    </div>					
								</div>
                            </form>
                        </div>
                    </section>
                      <c:forEach items="${accountGitView}"  var="view"  varStatus="status">
                         <form id="accountDelete" name="accountDelete"  action="/VCMS/ACCOUNT_300/accountDelete.do"   method="POST">        
                        <input type="hidden"  id="gitAppNo"  name="gitAppNo" class="form-control" value="${view.GIT_APP_NO}" >           
                       </form> 
                     </c:forEach>             
                    <div class="form-group">
                        <div style="text-align:right">                                      
                            <button type="button" class="btn btn-danger btn-sm" onclick="deleteCheck()">削除する</button>
                            <button type="button" class="btn btn-primary btn-sm" onclick="modifyCheck()">完了する</button>
                            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/VCMS/ACCOUNT_300/accountList.do'">目録移動</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../shared/footer.jsp" %>