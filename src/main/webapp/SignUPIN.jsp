<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
 <link rel="stylesheet" href="SignUp.css">

<title>Shop</title>
</head>
<body>
	<%
		HttpSession ses=request.getSession();
		String eror=(String) ses.getAttribute("eror");
	%>
	
  <div class="function">    
    <button id="in">Login</button>
    <button id="up">Sign up</button>
  </div>
   <%if(eror!=null) out.print(eror);%> 
  <a href="<%=request.getContextPath() %>/Trangchu">← Trở về trang chủ</a> 
    <div class="container close" id="container">
        <div class="form-container sign-up-container">
            <h1 class="header--iconclose js--close--pay" id = "iconClose" style="padding: 16px;position: absolute;top: 0;right: 0;cursor: pointer;"><i class="fa fa-times" style="font-size: 18px;" ></i></h1>
            <form method="post">
                <h1>Đăng kí cho shop</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <input type="text" style="display: none" name="account" value="shop"/>
                <span>or use your email for registration</span>
                <input type="text" placeholder="User" name="user"required/>
                <input type="password" placeholder="Password" name="password"required/>
                <input type="text" placeholder="Name Shop" name="nameShop"required/>
                <input type="text" placeholder="URL AVATAR" name="urlAvatar"required/>
                <button>Đăng kí</button>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form method="post" >
                <h1>Đăng nhập</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <span>or use your account</span>
                <input type="text" style="display: none" name="account" value="client"/>
                <input type="text" placeholder="User" name="user"required/>
                <input type="password" placeholder="Password" name="password"required/>
               <input type="text" placeholder="Fullname" name="fullName"required/>
                <input type="text" placeholder="Address" name="address"required/>
                <input type="text" placeholder="Phone" name="phone" required/>
                <div >Sinh nhật </div>
                <input type="date" placeholder="Birthday" name="birthday" style="margin-bottom: 20px"required/>
                 
                <button>Đăng nhập</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Chào mừng trở lại!</h1>
                    <p>Enter your personal details and start journey with us</p>
                    <button class="ghost" id="signIn">Sign Up User</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Xin chào, Bạn!</h1>
                    <p>Enter your personal details and start journey with us</p>
                    <button class="ghost" id="signUp">Sign Up Shop</button>
                </div>
            </div>
        </div>
    </div>
 <div class="container" id="containerIn" style="width: 500px; min-height: 440px;">
        
      <div class="form-container sign-in-container" style="width: 100%;">
          <form method="post" >
              <h1>Đăng kí</h1>
              <div class="social-container">
                  <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                  <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                  <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
              </div>
              <span>or use your account</span>
              <input type="text" style="display: none" name="account" value="login"/>
              <input type="text" placeholder="User" name="user" required/>
              <input type="password" placeholder="Password" name="password" required/>
              <button>Đăng kí</button>
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
        const iconClose = document.getElementById('iconClose');
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
        
        iconClose.addEventListener('click',()=>{
          containerIn.classList.remove('close');
          container.classList.add('right-panel-active');
          container.classList.add('close');
        })
    </script>
</body>
</html>