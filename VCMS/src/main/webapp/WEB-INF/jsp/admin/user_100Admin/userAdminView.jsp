<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../shared/header.jsp" %>  

<script>
$(document).ready(function(){
	 //alert("zzz");
	  $("#third6").removeClass();	   
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
            <span> 会員管理照会</span>
        </div>
    </header>
    <section class="card">
        <div class="card-block" style="padding-top:0px">
            <div class="row m-t-lg">
                <div class="col-md-12">
                    <section class="card card-blue mb-3">
                        <header class="card-header">
                           使用者照会
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
                                            <c:forEach items="${userView}" var="view" varStatus="status">
                                                <tr>
                                                     <th><label class="content-middle">順番</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.USER_NO}">
                                                    </td>
                                                    <th><label class="content-middle">所属</label></th>
                                                    <td>                                                        
                                                      <input type="text"  id=""  name="" class="form-control sign-up-main tableDetail-view" maxlength="100"  style="background-color:#ffffff;"  readonly="readonly"  value="${view.USER_COMPANY}">
                                                    </td>
                                                 </tr>
                                                 <tr>
                                                    <th><label class="content-middle">使用者</label></th>
                                                    <td>                                                        
                                                     <input type="text"  id=""  name="" class="form-control sign-up-main tableDetail-view" maxlength="100"  style="background-color:#ffffff;"  readonly="readonly"  value="${view.USER_NM}">
                                                    </td>                                                                                           
                                                    <th><label class="content-middle">ID</label></th>
                                                    <td>                                                        
                                                     <input type="text"  id=""  name="" class="form-control sign-up-main tableDetail-view" maxlength="100"   style="background-color:#ffffff;" readonly="readonly" value="${view.USER_ID}">                                                      
                                                    </td>
                                                 </tr>
                                                 <tr>
                                                     <th><label class="content-middle">パスワード</label></th>
                                                    <td>                                                        
                                                      <input type="password"  id=""  name="" class="form-control sign-up-main tableDetail-view" maxlength="100" style="background-color:#ffffff;" readonly="readonly" value="********">                                                     
                                                    </td>                                              
                                                    <th><label class="content-middle">連絡先</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control sign-up-main tableDetail-view" maxlength="100"   style="background-color:#ffffff;" readonly="readonly"  value="${view.USER_PHONE}">
                                                    </td>                                                  
                                                </tr> 
                                                </c:forEach>                                                     
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="alert alert-success" role="alert" style="margin-top: 5px">※ 会員情報の確認が可能です。</div>
                                </div>
                            </form>
                        </div>
                    </section>
                    <div class="form-group">
                        <div style="text-align:right">
                         <c:forEach items="${userView}" var="view" varStatus="status">             
                           <button type="button" class="btn btn-primary btn-sm" onclick="location.href='/VCMS/ADMIN/userAdminModify.do?userNo=${view.USER_NO}'">修正する</button>
                         </c:forEach>
                           <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/VCMS/ADMIN/userAdminList.do'">目録移動</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../../shared/footer.jsp" %>