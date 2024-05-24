<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../shared/header.jsp" %>   

 <script>
$(document).ready(function(){
	 //alert("zzz");
	  $("#first2").removeClass();	   
	});	
</script> 

<script>
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
	
function modifyCheck(){   
	   
	var gitDbProjectNm = document.getElementById("gitDbProjectNm").value;
    var gitDbEmpNm = document.getElementById("gitDbEmpNm").value;
    var gitDbAppPhone = document.getElementById("gitDbAppPhone").value;
    var gitDbSortation = document.getElementById("gitDbSortation").value;
    var gitDbWorkNm = document.getElementById("gitDbWorkNm").value;
    var gitDbDbNm = document.getElementById("gitDbDbNm").value;
    var gitDbRemark = document.getElementById("gitDbRemark").value;
    var gitDbDpt = document.getElementById("gitDbDpt").value;
    var gitDbProjectStart = document.getElementById("gitDbProjectStart").value;
    var gitDbProjectEnd = document.getElementById("gitDbProjectEnd").value;
    var gitDbAppDd = document.getElementById("gitDbAppDd").value;
    
    document.getElementById("checkDbEtc").value = document.getElementById("checkDbEtcContent").value;
    
    
    

    if(gitDbProjectNm.length >49 || gitDbProjectNm.length ==0){
		  alert("事業名の文字範囲は1~49です");
		  document.getElementById("gitDbProjectNm").focus();
		  return false;
		 
	   }else if(gitDbEmpNm.length >5 || gitDbEmpNm.length ==0){
		  alert("担当者の文字の範囲は1~5です");
		  document.getElementById("gitDbEmpNm").focus();
		  return false;  	
		
	   }else if(gitDbAppPhone.length >14 ||gitDbAppPhone.length ==0){
         alert("申請者の連絡先の範囲は1~14です");
 	     document.getElementById("gitDbAppPhone").focus();
 	return false;
 	
	  }else if(gitDbSortation.length >100 ||gitDbSortation.length ==0){
	     alert("区分の範囲は1~100です");
	     document.getElementById("gitDbSortation").focus();
	     return false;
	     
	  }else if(gitDbWorkNm.length >25 ||gitDbWorkNm.length ==0){
		  alert("業務名の範囲は1~25です");
		  document.getElementById("gitDbWorkNm").focus();
		  return false;
		     
	  }else if(gitDbDbNm.length >10 ||gitDbDbNm.length ==0){
		 alert("DBアカウントIDの範囲は1~10です");
		 document.getElementById("gitDbDbNm").focus();
		 return false;
			     
	  }else if(gitDbRemark.length >50 ||gitDbRemark.length ==0){
		 alert("備考の範囲は1~50です");
		 document.getElementById("gitDbRemark").focus();
		 return false;
		 
	  }else if(gitDbDpt.length ==2){
	      alert("担当部署を選択してください");
		  document.getElementById("gitDbDpt").focus();
		  return false;
			 
	  }else if(gitDbProjectStart.length ==0){
		  alert("事業期間を選択してください");
		  document.getElementById("gitDbProjectStart").focus();
		  return false;
			 
	  }else if(gitDbProjectEnd.length ==0){
		  alert("事業期間を選択してください");
		  document.getElementById("gitDbProjectEnd").focus();
		  return false;
				 
	  }else if(gitDbAppDd.length ==0){
		 alert("申請日を選択してください");
		 document.getElementById("gitDbAppDd").focus();
		 return false;
					 
	  }
    
     
    
 	 var form = document.dbApoModifyRun;
		  alert("修正しました")
			form.submit();	
}	  
	
function deleteCheck(){   
    
 	 var form = document.dbApoDelete;
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
            <span> リポジトリ生成申請書[DB]修正</span>
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
                                            <c:forEach items="${dbApoView}" var="view" varStatus="status">
                                             <tr>
                                                    <th><label class="content-middle">申請番号</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_DB_APP_NO}">
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
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_DB_STU_CONT}">
                                                    </td>                              
                                                    <th><label class="content-middle">リポジトリアドレス</label></th>
                                                    <td>                                                        
                                                       <input type="text"  id=""  name="" class="form-control tableDetail-view"  style="background-color:#ffffff;" readonly="readonly" value="${view.GIT_DB_STO_ADDR}">
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
                            <form id="dbApoModifyRun" name="dbApoModifyRun" action="/VCMS/DBAPO_400/dbApoModifyRun.do"  method="POST">                        
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
											<c:forEach items="${dbApoView}" var="view" varStatus="status">
												<tr>
													<th><label class="content-middle">事業名</label></th>
													<td>
													   <input type="text"  id="gitDbProjectNm"  name="gitDbProjectNm" class="form-control" maxlength="49"  value="${view.GIT_DB_PROJECT_NM}">
												   </td>
													<th><label class="content-middle">担当部署</label></th>
													<td>                                                        
                                                      <select class="form-control"  id="gitDbDpt"  name="gitDbDpt"  style="height: 34px;">
                                                       <option>${view.GIT_DB_DPT}</option>
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
                                                        <input type="date" class="form-control" id="gitDbProjectStart" name="gitDbProjectStart" maxlength="10" style="width: 108px;"value="${view.GIT_DB_PROJECT_START}" />
                                                        <label>~</label>
                                                        <input type="date" class="form-control" id="gitDbProjectEnd" name="gitDbProjectEnd" maxlength="10" style="width: 108px;" value="${view.GIT_DB_PROJECT_END}" />
                                                    </div>
													</td>
													<th><label class="content-middle">担当者</label></th>
													<td>
													   <input type="text"  id="gitDbEmpNm"  name="gitDbEmpNm" class="form-control" maxlength="5" value="${view.GIT_DB_EMP_NM}">
												   </td>
												</tr>
												<tr>
													<th><label class="content-middle">申請者</label></th>
													<td>
													     <input type="text"  id="gitDbAppNm"  name="gitDbAppNm" class="form-control tableDetail-view"  style="background-color:#ffffff;"  readonly="readonly"  value="${view.GIT_DB_APP_NM}">
												   </td>
													<th><label class="content-middle">申請者の連絡先</label></th>
													<td>
													  <input type="text"  id="gitDbAppPhone"  name="gitDbAppPhone" class="form-control" maxlength="14" value="${view.GIT_DB_APP_PHONE}">
												   </td>
												</tr>
												<tr>
													<th><label class="content-middle">区分</label></th>
													<td>
													  <input type="text"  id="gitDbSortation"  name="gitDbSortation" class="form-control" maxlength="100" value="${view.GIT_DB_SORTATION}">
												   </td>
													<th><label class="content-middle">申請日</label></th>
													<td>
													    <input type="date"  id="gitDbAppDd"  name="gitDbAppDd" class="form-control" value="${view.GIT_DB_APP_DD}">
												   </td>
												</tr>
												<tr>
													<th><label class="content-middle">業務名</label></th>
													<td colspan="3">
													 <input type="text"  id="gitDbWorkNm"  name="gitDbWorkNm" class="form-control" maxlength="25" value="${view.GIT_DB_WORK_NM}">
													</td>
												</tr>
												<tr>
                                                    <th><label class="content-middle">申請DBサーバー</label></th>                                              
                                                      <td colspan="3">
                                                       <div class="form-inline">									     									  
													   <input type="radio" id="checkDb1"   class="control-label"   name="radiDb"   onclick="checkDb(this)"value="TORCL"   style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.GIT_DB_APP_DB_NM eq 'TORCL'}">checked</c:if> />TORCL
													   <input type="radio" id="checkDb2"   class="control-label"   name="radiDb"   onclick="checkDb(this)"value="ORCL"   style="margin-left: 10px;  margin-top: -1px;" <c:if test="${view.GIT_DB_APP_DB_NM eq 'ORCL'}">checked</c:if> />ORCL																			
													   <input type="radio" id="checkDbEtc"     class="control-label"  name="radiDb" onclick="checkDb(this)" style="margin-left: 10px;  margin-top: -1px;"<c:if test="${view.GIT_DB_APP_DB_NM ne 'ORCL' && view.GIT_DB_APP_DB_NM ne 'TORCL' }">checked</c:if> />その他							   
													   <input type="text" id="checkDbEtcContent"  class="form-control"  name="radiDb"  class="form-control"  style="width: 100px; height:30px; margin-top: 0px; margin-left: 5px;"  <c:if test="${view.GIT_DB_APP_DB_NM ne 'ORCL' && view.GIT_DB_APP_DB_NM ne 'TORCL' }">value="${view.GIT_DB_APP_DB_NM}"</c:if>/>															
													 </div>	
                                                    </td> 
                                                    </tr>    									
												<tr>
                                                <th colspan="4"><label class="content-middle">DBアカウント</label></th>
                                                </tr>
                                                 <tr>
                                                    <th><label class="content-middle">ID</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id="gitDbDbNm"  name="gitDbDbNm" class="form-control "  style="background-color:#ffffff;"value="${view.GIT_DB_DB_NM}">
                                                    </td>                                                                                                                                   
                                                </tr>
                                                <tr>
                                                 <th><label class="content-middle">備考</label></th>
                                                    <td colspan="3">                                    
                                                     <textarea rows="8" cols="8" id="gitDbRemark"  name="gitDbRemark" class="form-control" style="padding-top:10px;"  maxlength="500">${view.GIT_DB_REMARK}</textarea>                                                                        
                                                    </td> 
                                                </tr>
                                                <input type="hidden"  id="gitDbAppNo"  name="gitDbAppNo" class="form-control" value="${view.GIT_DB_APP_NO}" > 
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="alert alert-success" role="alert" style="margin-top: 5px">※ 申請書の内容は保管されます。</div>
                                    </div>
								</div>							
                            </form>
                        </div>
                    </section>   
                    <c:forEach items="${dbApoView}"  var="view"  varStatus="status">
                         <form id="dbApoDelete" name="dbApoDelete"  action="/VCMS/DBAPO_400/dbApoDelete.do"   method="POST">        
                        <input type="hidden"  id="gitDbAppNo"  name="gitDbAppNo" class="form-control" value="${view.GIT_DB_APP_NO}" >           
                       </form> 
                     </c:forEach>                    
                    <div class="form-group">
                        <div style="text-align:right">                                   
                            <button type="button" class="btn btn-danger btn-sm" onclick="deleteCheck()">削除する</button>
                            <button type="button" class="btn btn-primary btn-sm" onclick="modifyCheck()">完了する</button>
                            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/VCMS/DBAPO_400/dbApoList.do'">目録移動</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../shared/footer.jsp" %>