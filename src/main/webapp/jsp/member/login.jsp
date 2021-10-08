<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h1 onclick="alert('hi'); return false;">로그인</h1>

	<script>
		var LoginForm__submit = false;
		function LoginForm__submit(form) {
			if (LoginForm__submitDone) {
				alert('처리중 입니다.');
				return;
			}
			form.loginId.value = form.loginId.value.trim();
			if (form.loginId.value.length == 0) {
				alert('로그인 아이디를 입력해주세요.');
				form.loginId.focus();
				return;
			}
			
			if (form.loginPw.value != form.loginPwConfirm.value) {
				alert('비밀번호가 일치하지 않습니다.');
				form.loginPw.focus();
				return;
			}
			
			form.sumbit();
			JoinForm__submitDone = true;
		}
	</script>


	<form action="doLogin" method="POST"
		onsubmit="LoginForm__submit(this); return false;">

		<div>
			로그인 아이디 : <input placeholder="로그인 아이디를 입력해주세요." name="loginId"
				type="text" />
		</div>
		<div>
			로그인 비밀번호 : <input placeholder="로그인 비밀번호를 입력해주세요." name="loginPw"
				type="password" />
		</div>
	
		<div>
			<button type="submit">로그인</button>
			<button type="button">
				<a href="../home/main">취소</a>
			</button>
		</div>
	</form>
</body>
</html>
