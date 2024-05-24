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
			checkDbEtc.disabled == false;
			checkDbEtcContent.value = null;
		}		
		if(checkDbEtc.checked == true){
			console.log("2222");
			//checkDbEtc = checkDbEtcContent;
			checkDbEtcContent.disabled = false;	
		}
}
	
function writeCheck(){   
	   
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
		  alert("事業名の文字範囲は1~49です。");
		  document.getElementById("gitDbProjectNm").focus();
		  return false;
		 
	   }else if(gitDbEmpNm.length >5 || gitDbEmpNm.length ==0){
		  alert("担当者の文字の範囲は1~5です");
		  document.getElementById("gitDbEmpNm").focus();
		  return false;  	
		
	   }else if(gitDbAppPhone.length >14 ||gitDbAppPhone.length ==0){
         alert("申込者の連絡先の範囲は1~14です");
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
    
     
    
 	 var form = document.dbApoWriteRun;
		  alert("申し込みました")
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
            <span> リポジトリ生成申請書[DB]作成</span>
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
                            <form id="dbApoWriteRun" name="dbApoWriteRun" action="/VCMS/DBAPO_400/dbApoWriteRun.do"  method="POST">                      
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
													<th><label class="content-middle">事業名</label></th>
													<td><input type="text" id="gitDbProjectNm" name="gitDbProjectNm" class="form-control" maxlength="49" ></td>
													<th><label class="content-middle">担当部署</label></th>
													<td>
													<select class="form-control"  id="gitDbDpt"  name="gitDbDpt"  style="height: 34px;">
															<option>選択</option>
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
															<input type="date" class="form-control" id="gitDbProjectStart" name="gitDbProjectStart" maxlength="10" style="width: 108px;" value="2024-01-01"/>
															 <label>~</label> 
															 <input type="date" class="form-control" id="gitDbProjectEnd" name="gitDbProjectEnd" maxlength="10" style="width: 108px;" value="2025-01-01"/>
														</div>
													</td>
													<th><label class="content-middle">担当者</label></th>
													<td><input type="text" id="gitDbEmpNm" name="gitDbEmpNm" class="form-control" maxlength="5"></td>
												</tr>
												<tr>
													<th><label class="content-middle">申請者</label></th>
													<td><input type="text" id="gitDbAppNm" name="gitDbAppNm" class="form-control tableDetail-view" style="background-color: #ffffff;" readonly="readonly" value="${sessionScope.userNm}"></td>
													<th><label class="content-middle">申請者の連絡先</label></th>
													<td><input type="text" id="gitDbAppPhone" name="gitDbAppPhone" class="form-control" maxlength="14"></td>
												</tr>
												<tr>
													<th><label class="content-middle">区分</label></th>
													<td><input type="text" id="gitDbSortation" name="gitDbSortation" class="form-control" maxlength="100"></td>
													<th><label class="content-middle">申請日</label></th>
													<td><input type="date" id="gitDbAppDd" name="gitDbAppDd" class="form-control" value="2024-01-01"></td>
												</tr>
												<tr>
													<th><label class="content-middle">業務名</label></th>
													<td colspan="3"><input type="text" id="gitDbWorkNm" name="gitDbWorkNm" class="form-control" maxlength="25"></td>
												</tr>
												<tr>
                                                    <th><label class="content-middle">申請DBサーバー</label></th>                                              
                                                      <td colspan="3">
                                                       <div class="form-inline">									     									  
													   <input type="radio" id="checkDb1"   class="control-label"   name="radiDb"   onclick="checkDb(this)"value="TORCL"   style="margin-left: 10px;  margin-top: -1px;" checked/>TORCL
													   <input type="radio" id="checkDb2"   class="control-label"   name="radiDb"   onclick="checkDb(this)"value="ORCL"   style="margin-left: 10px;  margin-top: -1px;"/>ORCL																			
													   <input type="radio" id="checkDbEtc"     class="control-label"  name="radiDb"  onclick="checkDb(this)"value=""  style="margin-left: 10px;  margin-top: -1px;"/>その他
													   <input type="text" id="checkDbEtcContent"  class="form-control"  name="radiDb"  class="form-control"  style="width: 100px; height:30px; margin-top: 0px; margin-left: 5px;" disabled="disabled"  value=""/>															
													 </div>	
                                                    </td> 
                                                    </tr>        								
												<tr>
                                                <th colspan="4"><label class="content-middle">DBアカウント</label></th>
                                                </tr>
                                                 <tr>
                                                    <th><label class="content-middle">ID</label></th>
                                                    <td colspan="3">
                                                        <input type="text"  id="gitDbDbNm"  name="gitDbDbNm" class="form-control" maxlength="10">
                                                    </td>                                                                                                                              
                                                </tr>
                                                <tr>
                                                 <th><label class="content-middle">備考</label></th>
                                                    <td colspan="3">                                    
                                                      <textarea rows="8" cols="8" id="gitDbRemark"  name="gitDbRemark" class="form-control" style="padding-top:10px;"  maxlength="500"></textarea>                                                                              
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
                            <button type="button" class="btn btn-primary btn-sm" onclick="writeCheck()">申請する</button>
                            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/VCMS/DBAPO_400/dbApoList.do'">目録移動</button>
                        </div>                   
                    </div>
                    	 <div class="alert alert-success" role="alert" style="margin-top:5px">
                            ※ 申請DBサーバーがその他の場合は、その他をチェックしてから作成してください。
                        </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="../shared/footer.jsp" %>