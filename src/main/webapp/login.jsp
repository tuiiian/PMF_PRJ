<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>ログイン画面</title>

<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.all.min.js"></script>
</head>
<body>
    <div class="main">
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure>
                            <img src="images/signin-image.jpg" alt="sign up image">
                        </figure>
                        <a href="registration.jsp" class="signup-image-link">アカウント登録</a>
                    </div>
                    <div class="signin-form">
                        <h2 class="form-title">ログイン</h2>
                        <form method="post" action="login" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="username" id="username" placeholder="メールアドレス" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}" title="Please enter a valid email address" />
                            </div>
                            <div class="form-group">
                                <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="password" placeholder="パスワード" required pattern=".{6,}" title="Password must be at least 6 characters long" />
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>ログイン情報を記憶する</label>
                            </div>
                            <div class="form-group form-button">
                                <button type="button" id="signin" class="form-submit">ログイン</button>
                            </div>
                        </form>
                        <div class="social-login">
                            <span class="social-label">また、ログインと</span>
                            <ul class="socials">
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
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
            var form = document.getElementById("login-form");
            var signInButton = document.getElementById("signin");

            signInButton.addEventListener("click", function () {
                var username = form.username.value;
                var password = form.password.value;

                if (!validateEmail(username)) {
                    showError("有効なメールアドレスを入力してください");
                    return;
                }

                if (password.length < 6) {
                    showError("パスワードは6文字以上である必要があります");
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

    	if (status === "failed") {
        	Swal.fire({
	            icon: 'error',
	            title: 'Error!',
	            text: 'パスワードが正しくありません。入力し直してください。',
	            position: 'center',
	            showConfirmButton: false,
	            timer: 3000 // Thời gian hiển thị thông báo (3 giây)
       		});
    	}
	</script>
	<script>
    	const rememberMeCheckbox = document.getElementById("remember-me");
   	 	const usernameInput = document.getElementById("username"); // Thay thế "username" bằng ID thật của ô nhập tên đăng nhập
    	const passwordInput = document.getElementById("password"); // Thay thế "password" bằng ID thật của ô nhập mật khẩu

    // Kiểm tra xem đã có dữ liệu lưu trữ hay chưa
    	if (localStorage.getItem("rememberedUsername")) {
	        usernameInput.value = localStorage.getItem("rememberedUsername");
	        rememberMeCheckbox.checked = true;
    	}

    	rememberMeCheckbox.addEventListener("change", function() {
    	if (rememberMeCheckbox.checked) {
            localStorage.setItem("rememberedUsername", usernameInput.value);
            // Lưu mật khẩu vào local storage cũng tương tự
        } else {
            localStorage.removeItem("rememberedUsername");
            // Xóa mật khẩu khỏi local storage cũng tương tự
        }
    	});
	</script>
</body>
</html>
