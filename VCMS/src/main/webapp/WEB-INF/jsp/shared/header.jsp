<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path"  value="${pageContext.request.contextPath}"/><!-- 참조 -->
<!DOCTYPE html>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, initial-scale=1, user-scalable=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<link href="${path}/resources/css/bootstrap.css" rel="stylesheet">
<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/resources/css/custom.css" rel="stylesheet">
<link href="${path}/resources/css/main.css" rel="stylesheet">
<link href="${path}/resources/css/PagedList.css" rel="stylesheet">
<link href="${path}/resources/css/vcms.css?var2.5" rel="stylesheet">

<script type="text/javascript"  src="<c:url value='/resources/common/js/jquery-3.6.0.min.js'/>"></script>
<%@ include file="../shared/sidebar.jsp"%>

<script>
function logOutCheck(){
	
	location.href="/VCMS/USER_100/logout.do";
}

</script>

<title>バージョン管理システム</title>
<header class="site-header" style="background-color: rgb(48, 75, 88)">
	<div class="container-fluid">
		<div class="site-header-content-in">
			<div class="site-header-shown">
				<c:choose>
					<c:when test="${not empty sessionScope.userInfo}">
						<label style="height: 30px; padding-top: 7px; color: white">${sessionScope.userInfo}様ようこそ。</label>
					</c:when>
				</c:choose>
			</div>
			<div class="site-header-shown">		
				<button type="button" class="burger-right">			
				</button>
			</div>
			<!--.site-header-shown-->
			<div class="site-header-shown">
				<div style="height: 30px; padding-top: 0px; color: white">
					<div class="Block">
						<div class="BlockContentBorder" style="text-align: left">
							<ul>
								<li>
									<div class="diary_today">
										<span id="date_str" class="today_s date_str"></span> 
									</div>
								</li>
								<li>
									<div class="diary_today">
									<span id="time_str" class="time_s time_str"></span>															
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="mobile-menu-right-overlay"></div>
			<label style="height: 30px; padding-top: 7px; color: white;" onclick="logOutCheck()">ログアウト</label>
			<div class="site-header-collapsed">
			
				<div class="site-header-collapsed-in"></div>
				<!--.site-header-collapsed-in-->
						
			</div>
			<!--.site-header-collapsed-->
		</div>
		<!--site-header-content-in-->
	</div>
	<!--.site-header-content-->
</header>
<!--.site-header-->
<script>
	const clock = document.querySelector("#time_str");
	const today = document.querySelector("#date_str");
	
	function getClock() {

		const date = new Date();
		const hours = String(date.getHours()).padStart(2, "0");
		const minutes = String(date.getMinutes()).padStart(2, "0");
		const seconds = String(date.getSeconds()).padStart(2, "0");
		clock.innerText = hours+":"+minutes+":"+seconds;
	}

	getClock(); //처음에 한번 시작
	setInterval(getClock, 1000); //1초 단위로 새로 시작
	
	function getToday(){
		
		const todaydate = new Date();
		
		const year = todaydate.getFullYear();
		const month = todaydate.getMonth() +1;
        const date = todaydate.getDate();    
        //today.innerText = year+"年"+month+"月"+date+''日";
        today.innerText = year+"年"+month+"月"+date+"日";
	}
	getToday();	
			
</script>


