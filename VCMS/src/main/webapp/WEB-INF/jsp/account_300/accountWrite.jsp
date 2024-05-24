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

 function writeCheck(){   
	   
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
              
    	 var form = document.accountWriteRun;
		  alert("申し込みました。")
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
			<span> アカウント作成申込書作成</span>
		</div>
	</header>
	<section class="card">
        <div class="card-block" style="padding-top:0px">
            <div class="row m-t-lg">
                <div class="col-md-12">				
					<section class="card card-blue mb-3">
                        <header class="card-header">
                           申請書情報
                        </header>
                        <div class="card-block">
                            <form id="accountWriteRun" name="accountWriteRun" action="/VCMS/ACCOUNT_300/accountWriteRun.do"  method="POST">                      
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
                                                <tr>
                                                    <th><label class="content-middle account-write-top" >申込者</label></th>
                                                    <td colspan="3">                                                        
                                                       <input type="text"  id="gitNm"  name="gitNm" class="form-control tableDetail-view"  style="background-color:#ffffff; "  readonly="readonly"  value="${sessionScope.userNm}">
                                                    </td>
                                                  </tr>
                                                  <tr>
                                                    <th><label class="content-middle account-write-top" >申込者の連絡先</label></th>
                                                      <td colspan="3">                                                        
                                                       <input type="text"  id="gitPhone"  name="gitPhone" class="form-control" style="padding-top:10px;"  maxlength="15" > 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle account-write-top">申込者所属</label></th>
                                                   <td colspan="3">                                                        
                                                     <select class="form-control" style="padding-top:10px;" id="gitCompany"  name="gitCompany">
                                                      <option>選択</option>
                                                       <c:forEach items="${LISTCOMPANY}"  var="var"  varStatus="status">
                                                         <option>${var.COM_CODE_TERM}</option>
                                                       </c:forEach>                                                        
                                                       </select>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                     <th><label class="content-middle account-write-top">申請日</label></th>
                                                    <td colspan="3">                                                        
                                                        <input type="date"  id="gitDate"  name="gitDate" class="form-control"  style="padding-top:10px;" maxlength="100"  value="2024-01-01">
                                                    </td>
                                                </tr>                                                                                     
                                                <tr>
                                                    <th><label class="content-middle account-write-top">申込者ID</label></th>
                                                    <td colspan="3">                                                        
                                                        <input type="text"  id="gitId"  name="gitId" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly"  value="${sessionScope.userInfo}">
                                                    </td>
                                                 </tr>
                                                 <tr>
                                                    <th><label class="content-middle account-write-top">申込者メール</label></th>
                                                    <td colspan="3">                                                        
                                                       <input type="text"  id="gitEmail"  name="gitEmail" class="form-control" style="padding-top:10px;"  maxlength="30">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="content-middle account-write-top">備考</label></th>
                                                    <td colspan="3">
                                                      <textarea rows="8" cols="8" id="gitRemark"  name="gitRemark" class="form-control" style="padding-top:10px;"  maxlength="50"></textarea>                                                  
                                                    </td>                                                                                    
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
									<div class="alert alert-success" role="alert" style="margin-top: 5px">※ 申請書の内容は保管されます。</div>
								</div>
                            </form>
                        </div>
                    </section>
                    <div class="form-group">
                        <div style="text-align:right">               
                            <button type="button" class="btn btn-primary btn-sm" onclick="writeCheck()">申請する</button>
                            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/VCMS/ACCOUNT_300/accountList.do'">目録移動</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../shared/footer.jsp" %>