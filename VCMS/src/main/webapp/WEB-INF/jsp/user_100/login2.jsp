<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path"  value="${pageContext.request.contextPath}"/><!-- 참조 -->
<!doctype html>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>バージョン管理システム</title>
<link href="${path}/resources/css/login.css" rel="stylesheet">
<link rel="shortcut icon" href="#">
<link href="${path}/resources/css/vcms.css" rel="stylesheet">
</head>


<script>
alert("会員情報を確認して再度ログインしてください。")
</script>




<body class="login_body" style="background: url(${path}/resources/images/bg_login04.png) no-repeat center 0; width: 1860px; min-width: 1580px; position: relative; margin: 0 auto; background-size: auto 150%;">
	<div class="login_contents_inner fix">
		<div class="login_box_section" style="padding-top: 120px;">
			<!-- <form name="loginForm" method="POST" action="/VCMS/SOURCE_200/sourceList.do">-->
			<form name="loginForm" method="POST" action="/VCMS/USER_100/loginRun.do">
				<div class="login_box_wrap">
					<div class="login_box">
						<div class="tit_area">
							<h2 class="tit_h3">バージョン管理システム</h2>
						</div>
						<div class="login_lay fix">
							<div class="ipt_area">
								<p>
									<label for="">ID</label> <input type="text" name="userId" id="id" title="아이디" placeholder="id" maxlength="10" class="input_login id" />
								</p>
							</div>
							<div class="ipt_area">
								<p>
									<label for="">PW</label> <input type="password" name="userPw" id="pw" title="비밀번호" placeholder="password" class="input_login pw" />
								</p>
							</div>
							<div class="ipt_btn_area mt40">
								<p>
									<input type="submit" id="" name="" value="ログイン" class="btn_login" />
								</p>
							</div>
						</div>
						<div align="center">
							<a href="#" class="login-main" onclick="location.href='/VCMS/USER_100/signUp.do'"> 会員登録</a>
						</div>
						<p class="login_info">※ 文字と小文字を区別します。 注意して入力してください。</p>
					</div>
				</div>
			</form>
		</div>
		<div class="login_dec_section" style="padding-top: 120px;">
			<div class="login_dec_area">
				<div class="sec_area">
					<div class="tit_area fix">
						<h4 class="tit_h4">問い合わせ先</h4>
					</div>
					<div class="con_area">
						<div class="bul_ty1">
							<div>システム管理者</div>
							<div>(電話: 080-111-2222)</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>