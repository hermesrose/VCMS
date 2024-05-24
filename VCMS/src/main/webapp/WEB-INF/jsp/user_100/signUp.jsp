<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path"  value="${pageContext.request.contextPath}"/><!-- 참조 -->
<link href="${path}/resources/css/contentWrap.css" rel="stylesheet">
<link href="${path}/resources/css/bootstrap.css" rel="stylesheet">
<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/resources/css/custom.css" rel="stylesheet">
<link href="${path}/resources/css/main.css" rel="stylesheet">
<link href="${path}/resources/css/PagedList.css" rel="stylesheet">
<link href="${path}/resources/css/vcms.css?var2.6" rel="stylesheet">
<link rel="shortcut icon" href="#">
<title>バージョン管理システム</title>
<script type="text/javascript"  src="<c:url value='/resources/common/js/jquery-3.6.0.min.js'/>"></script>

<script>
  
   function pwCheck(){   
	   
	   var CheckName = document.getElementById("userName").value;
	   var CheckPhone = document.getElementById("userPhone").value;
	   var CheckPw = document.getElementById("userPw").value;
       var CheckPw2 = document.getElementById("userPw2").value;
       var dataId = document.getElementById("userId").value;
 	   var expId = /^[a-zA-Z0-9]*$/;
 	   var expPw = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,10}$/;
       
 	   if(CheckName.length >8||CheckName.length ==0){
 		  alert("ユーザーの文字範囲は1~8です。");
 		 document.getElementById("userName").focus();
 		 return false;
 	   }else if(dataId.length >8|| dataId.length<4 ||dataId.length ==0){
  		  alert("IDの文字範囲は4~8です。");
  		document.getElementById("userId").focus();
  		return false;
 	   }else if(CheckPw.length >10|| CheckPw.length<8 ||CheckPw.length ==0){
   		  alert("パスワードの文字範囲は8~10です。");
   		document.getElementById("userPw").focus();
   		return false;
 	   }else if(CheckPhone.length >14|| CheckPhone.length<10 ||CheckPhone.length ==0){
  		  alert("連絡先の文字範囲は10~14です。");
  		document.getElementById("userPhone").focus();
  		return false;
 	   }
 	   
 	   
 	   
 	   
 	   
 	  if(dataId ==""){
  		  alert("IDを入力してください。");
  		  
  		  return false;
  	 }
 	  		  
       if(!expId.test(dataId)){
    	   alert("IDは大文字と小文字のみ可能です。");
    	   
    	   return false;
       }
                         
    
    
     if(!expPw.test(CheckPw)){
  	   alert("パスワードに数字と英文と特殊文字を組み合わせて8~10桁の数字が可能です。");
  	 //  console.log(CheckPw);
  	  // console.log(expPw);
  	   
  	   return false;
     }
    
        
       if(CheckPw != CheckPw2){
    	   alert("パスワードの確認が一致しません。")
   	   
    	   return false;
       }else{
    	   
    	   $.ajax({
    			  data : {
    				  userId : dataId
    			  },
    			  url : "/VCMS/USER_100/IdCheck.do",
    			  type : "POST",
    			  datatype : "JSON",
    			  success : function(result){
    				  //alert(result);			
    				 // console.log(result);
    				
    				  if(result !="[]" ){
    					  alert("既に使用されているIDです。");
   
    				  }else{			
    					  
    					  var form = document.insertUser;
    					  alert("会員登録に成功しました。")
    						form.submit();					  
    				  }		
    			  },
    			  error : function(error){
    				  alert("エラーが発生しました。");
    				  console.log("エラ");
    			  }  			  
    		  })    		
	 }            
   }

   function checkId(){
	   
	  var dataId = document.getElementById("userId").value;
	  var expId = /^[a-zA-Z0-9]*$/;
	  
	   
 	  if(dataId ==""){
  		  alert("IDを入力してください。");
  		  
  		  return false;
  	 }
 	   
       if(!expId.test(dataId)){
    	   alert("IDは大文字と小文字のみ可能です。");
    	   
    	   return false;
       }
             	 	 
	  $.ajax({
		  data : {
			  userId : dataId
		  },
		  url : "/VCMS/USER_100/IdCheck.do",
		  type : "POST",
		  datatype : "JSON",
		  success : function(result){
			  //alert(result);			
			 // console.log(result);
			
			  if(result !="[]" ){
				  alert("既に使用されているIDです");
			  }else{
				  alert("使用可能なIDです");

			  }		
		  },
		  error : function(error){
			  alert("エラーが発生しました。");
			  console.log("エラー発生。");
		  }		  
	  })	  
   }
</script>

<div style="margin: 0px; margin-left: 400px; margin-right: 200px;">
 <div class="page-content">
            <div style="padding-bottom:10px; pading-left:100px">
                <img src="${path}/resources/images/VCMS/headTop.jpg" style="width:100%;" />
        </div>
    </div>
    <section class="card">
        <div class="card-block" style="padding-top:0px">
            <div class="row m-t-lg">
                <div class="col-md-12">
                    <section class="card card-blue mb-3">
                        <header class="card-header">
                           会員登録申請
                        </header>
                        <div class="card-block">
                            <form id="insertUser" name="insertUser" method="POST"  action="/VCMS/USER_100/signUpRun.do"  method="post">                  
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
                                                    <th><label class="content-middle">所属</label></th>
                                                    <td>                                                        
                                                      <select class="form-control sign-up-main"  id="userCompany"  name="userCompany"  style="height: 33px;" >
                                                      <option>選択</option>
                                                       <c:forEach items="${LISTCOMPANY}"  var="var"  varStatus="status">
                                                         <option>${var.COM_CODE_TERM}</option>
                                                       </c:forEach>                                                        
                                                       </select>
                                                    </td>
                                                    <th><label class="content-middle">ユーザ</label></th>
                                                    <td>                                                        
                                                     <input type="text"  id="userName"  name="userName" class="form-control sign-up-main" maxlength="8">
                                                    </td>
                                                <tr>
                                                <tr>
                                                    <th><label class="content-middle">ID</label></th>
                                                    <td>                                                        
                                                     <input type="text"  id="userId"  name="userId" class="form-control sign-up-main"  style="float: left;" maxlength="8">
                                                     <button type="button" class="btn btn-primary btn-sm" onclick="checkId()" style="float: left; margin-left:1%; margin-top:4px;" >重複確認</button>                                                    
                                                    </td>
                                                     <th><label class="content-middle">パスワード</label></th>
                                                    <td>                                                        
                                                      <input type="password"  id="userPw"  name="userPw" class="form-control sign-up-main" maxlength="10" >                                                     
                                                    </td>
                                                </tr>                                                                                     
                                                <tr>
                                                    <th><label class="content-middle">連絡先</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id="userPhone"  name="userPhone" class="form-control sign-up-main" maxlength="14">
                                                    </td>
                                                    <th><label class="content-middle">パスワード再確認</label></th>
                                                    <td>                                                        
                                                       <input type="password"  id="userPw2"  name="userPw2" class="form-control sign-up-main"    maxlength="10">
                                                    </td>
                                                </tr>                                              
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </section>
                    <div class="form-group">
                        <div style="text-align:right">               
                            <button type="button" class="btn btn-primary btn-sm"  id="userCheckAfter" onclick="pwCheck()" >申請する</button>
                            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/VCMS/USER_100/login.do'">目録移動</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../shared/footer.jsp" %>