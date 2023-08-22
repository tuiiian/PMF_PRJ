<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="jp">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>アカウント登録画面</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">

<!-- Đường dẫn đến các tệp JavaScript và CSS của SweetAlert2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.all.min.js"></script>


</head>
<body>

<%-- <input type="hidden" id="status" value="<%= request.getAttribute("success")%>">
 --%>
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">アカウント登録</h2>
					
						<form method="post" action="register" class="register-form" id="register-form">
							<div class="form-group">
								<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
								<input type="text" name="name" id="name" placeholder="お名前" required />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> 
								<input type="email" name="email" id="email" placeholder="メールアドレス" required />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> 
								<input type="password" name="pass" id="pass" placeholder="パスワード" required />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass" placeholder="パスワード認証" required />
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-phone-setting"></i></label>
								<input type="text" name="contact" id="contact" placeholder="電話番号" required />
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required /> 
								<label for="agree-term" class="label-agree-term"><span><span></span></span>
									<a href="#" class="term-service">利用規約</a>のすべての記述に同意します。
								</label>
							</div>
							<div class="form-group form-button">
								<button type="button" id="signup" class="form-submit">アカウント登録</button>
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sign up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">ログイン</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	
	<script type="text/javascript">
	    document.addEventListener("DOMContentLoaded", function () {
	        var form = document.getElementById("register-form");
	        var signUpButton = document.getElementById("signup");

	        signUpButton.addEventListener("click", function () {
	            var name = form.name.value;
	            var email = form.email.value;
	            var password = form.pass.value;
	            var confirmPassword = form.re_pass.value;
	            var contact = form.contact.value;
	            var agreeTermCheckbox = form.querySelector("#agree-term");
	            
	            if (name.trim() === "") {
	                showError("名前を入力してください。");
	                return;
	            }

	            if (!validateEmail(email)) {
	                showError("メールアドレスを入力してください。");
	                return;
	            }

	            if (password.length <= 6) {
	                showError("パスワードは ６ 文字以上で設定してください");
	                return;
	            }

	            if (password !== confirmPassword) {
	                showError("パスワードが一致しませんでした。もう一度お試しください。");
	                return;
	            }

	            if (contact.trim() === "") {
	                showError("電話番号を入力してください。");
	                return;
	            }
	            if (!agreeTermCheckbox.checked) {
	                showError("利用規約に同意する必要があります。");
	                return;
	            }

	            // Submit the form
	            form.submit();
	        });

	        function validateEmail(email) {
	            var re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	            return re.test(email);
	        }

	        function showError(message) {
	            Swal.fire({
	                icon: 'error',
	                title: 'Error!',
	                text: message,
	                position: 'center',
	                showConfirmButton: false,
	                timer: 3000
	            });
	        }
	    });
	</script>
	<script type="text/javascript">
	    var status = '<%= request.getAttribute("status") %>';
	
	    if (status === "success") {
	        Swal.fire({
	            icon: 'success',
	            title: 'Congrats!',
	            text: 'Account Created Successfully',
	            position: 'center',
	            showConfirmButton: false,
	            timer: 3000 // Thời gian hiển thị thông báo (3 giây)
	        });
	    }
	</script>
	
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
