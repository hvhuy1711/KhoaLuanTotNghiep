<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/StyleSignUp.css" />

<title>Shop</title>
</head>
<body>
	<%
		HttpSession ses=request.getSession();
		String eror=(String) ses.getAttribute("eror");
	%>
	
  <div class="function">    
	<button id="in">Login</button> 
    <button id="up">Đăng Nhập</button> 
  </div>
  <%if(eror!=null) out.print(eror);%>
    <a href="<%=request.getContextPath() %>/sanphamcontroller">← Trở về trang chủ</a>
    <div class="container close" id="container">
        <div class="form-container sign-up-container">
            <h1 class="header--iconclose js--close--pay" style="padding: 16px;position: absolute;top: 0;right: 0;cursor: pointer;">
            <i class="fa fa-times close-form" style="font-size: 18px;"  ></i></h1>
            <form method="post">
                <h1>Đăng kí Dành Cho Cửa Hàng</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <input type="text" style="display: none" name="account" value="shop"/>
                <span>hoặc sử dụng email của bạn để đăng ký</span>
                <input type="text" placeholder="Tên đăng nhập" name="user"required/>
                <input type="password" placeholder="Mật khẩu" name="password"required/>
                <input type="text" placeholder="Name Shop" name="nameShop"required/>
                <input type="text" placeholder="URL AVATAR" name="urlAvatar"required/>
                <button>Đăng kí</button>
            </form>
        </div>
        <!-- <div class="form-container sign-in-container">
            <form method="post" >
                <h1>Đăng kí Dành Cho Khách Hàng</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <span>hoặc sử dụng tài khoản của bạn</span>
                <input type="text" style="display: none" name="account" value="client"/>
                <input type="text" placeholder="Tên đăng nhập" name="user"required/>
                <input type="password" placeholder="Mật khẩu" name="password"required/>
                <input type="text" placeholder="Họ và tên" name="fullName"required/>
                <input type="text" placeholder="Địa chỉ" name="address"required/>
                <input type="text" placeholder="Số điện thoại" name="phone" required/>
                <div >Sinh nhật </div>
                <input type="date" placeholder="Sinh nhật" name="birthday" style="margin-bottom: 20px"required/>
                
                <button>Đăng kí</button>
            </form>
        </div> -->
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Chào mừng trở lại!</h1>
                    <p>Nhập thông tin cá nhân của bạn và bắt đầu hành trình với chúng tôi</p>
                    <button class="ghost" id="signIn">Đăng kí Khách Hàng</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Xin Chào, Bạn!</h1>
                    <p>Nhập thông tin cá nhân của bạn và bắt đầu hành trình với chúng tôi</p>
                    <button class="ghost" id="signUp">Đăng kí Shop</button>
                </div>
            </div>
        </div>
    </div>
    <div class="container" id="containerIn" style="width: 500px; min-height: 440px;">
        
      <div class="form-container sign-in-container" style="width: 100%;">
          <form method="post" >
              <h1>Đăng Nhập</h1>
              <div class="social-container">
                  <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                  <!-- <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a> -->
                  <a href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8080/BaiThiJava/LoginGoogleHander&response_type=code
		   &client_id=24913803022-pd2qhuqnj4br9qlj7t0qljnk90fks46i.apps.googleusercontent.com&approval_prompt=force"><i class="fab fa-google-plus-g"></i></a>
                  
                  <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
              </div>
              <span>hoặc sử dụng tài khoản của bạn</span>
              <input type="text" style="display: none" name="account" value="login"/>
              <input type="text" placeholder="Tên đăng nhập" name="user" required/>
              <input type="password" placeholder="Mật khẩu" name="password" required/>
              <button>Đăng nhập</button>
          </form>
      </div>
  </div>
    <script>
        const signUpButton = document.getElementById('signUp');
        const signInButton = document.getElementById('signIn');
        const container = document.getElementById('container');
        const containerIn = document.getElementById('containerIn');
        const signIn = document.getElementById('in');
        const signUp = document.getElementById('up');
        signUpButton.addEventListener('click', () => {
            container.classList.add('right-panel-active');
        });

        signInButton.addEventListener('click', () => {
            container.classList.remove('right-panel-active');
        });
        signIn.addEventListener('click',()=>{
          containerIn.classList.remove('close');
          container.classList.add('close');
        })
        signUp.addEventListener('click',()=>{
          container.classList.remove('close');
          containerIn.classList.add('close');
        })
        const closeFormButton = document.querySelector(".close-form");
		closeFormButton.addEventListener("click", () => {
			container.classList.add('close');
			container.classList.remove('right-panel-active');
			containerIn.classList.remove('close');
		});

       

    </script>
</body>
</html>