<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../shared/header.jsp" %>  

 <script>
$(document).ready(function(){
	 //alert("zzz");
	  $("#second1").removeClass();	   
	});
</script>   

<script>
function modifyCheck(){   
	   
	   var CheckPhone = document.getElementById("userPhone").value;
	   var CheckPw = document.getElementById("userPw").value;
       var CheckPw2 = document.getElementById("userPw2").value;
 	   var expPw = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,10}$/;
       
 	   
 	 if(CheckPw.length >10|| CheckPw.length<8 ||CheckPw.length ==0){
   		  alert("パスワードの文字範囲は8~10です。");
   		document.getElementById("userPw").focus();
   		return false;
   		
 	   }else if(CheckPhone.length >14|| CheckPhone.length<10 ||CheckPhone.length ==0){
  		  alert("連絡先の文字範囲は10~14です。");
  		document.getElementById("userPhone").focus();
  		return false;
 	   }
 	   
     if(!expPw.test(CheckPw)){
  	   alert("パスワードに数字と英文と特殊文字を組み合わせて8~10桁の数字が可能です。"); 
  	   return false;
     }
     
      if(CheckPw != CheckPw2){
    	 alert("パスワードの確認が一致しません。") 	   
         return false;
     }	
    					  
        var form = document.userModify;
    	alert("情報修正に成功しました。")
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
            <span> 会員情報修正</span>
        </div>
    </header>
    <section class="card">
        <div class="card-block" style="padding-top:0px">
            <div class="row m-t-lg">
                <div class="col-md-12">
                    <section class="card card-blue mb-3">
                        <header class="card-header">会員情報 </header>
                        <div class="card-block">
                            <form id="userModify" name="userModify" method="POST"  action="/VCMS/USER_100/userModifyRun.do"  method="post">              
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
                                            <c:forEach items="${userInfo}" var="view" varStatus="status">
                                                <tr>
                                                    <th><label class="content-middle">所属</label></th>
                                                    <td>                                                        
                                                      <select class="form-control sign-up-main"   id="userCompany"  name="userCompany"   style="height: 33px;" >
                                                       <option>${view.USER_COMPANY}</option>
                                                       <c:forEach items="${LISTCOMPANY}"  var="var"  varStatus="status">
                                                         <option>${var.COM_CODE_TERM}</option>
                                                       </c:forEach>                                                            
                                                       </select>
                                                    </td>
                                                    <th><label class="content-middle">使用者</label></th>
                                                    <td>                                                        
                                                     <input type="text"  id=""  name="" class="form-control sign-up-main tableDetail-view" maxlength="100" value="${view.USER_NM}"  style="background-color:#ffffff;"  readonly="readonly" >
                                                    </td>
                                                <tr>
                                                <tr>
                                                    <th><label class="content-middle">ID</label></th>
                                                    <td>                                                        
                                                     <input type="text"  id="userId"  name="userId" class="form-control sign-up-main tableDetail-view" maxlength="100"  value="${view.USER_ID}"  style="background-color:#ffffff;" readonly="readonly">                                                      
                                                    </td>
                                                     <th><label class="content-middle">パスワード</label></th>
                                                    <td>                                                        
                                                      <input type="password"  id="userPw"  name="userPw" class="form-control sign-up-main" maxlength="100">                                                     
                                                    </td>
                                                </tr>                                                                                     
                                                <tr>
                                                    <th><label class="content-middle">連絡先</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id="userPhone"  name="userPhone" class="form-control sign-up-main" maxlength="100" value="${view.USER_PHONE}" >
                                                    </td>
                                                    <th><label class="content-middle">パスワード再確認</label></th>
                                                    <td>                                                        
                                                       <input type="password"  id="userPw2" name="userPw2" class="form-control sign-up-main" maxlength="100">
                                                    </td>
                                                </tr> 
                                                </c:forEach>                                                   
                                            </tbody>
                                        </table>                                      
                                    </div>
                                    <div class="alert alert-success" role="alert" style="margin-top: 5px">※ 会員情報の修正が可能です。</div>
                                </div>
                            </form>
                        </div>
                    </section>
                    <div class="form-group">
                        <div style="text-align:right"> 
                            <button type="button" class="btn btn-primary btn-sm" onclick="modifyCheck()">完了する</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../shared/footer.jsp" %>