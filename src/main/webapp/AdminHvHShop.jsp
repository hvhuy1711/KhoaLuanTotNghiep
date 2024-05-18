<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="assets/fontawesome-free-6.3.0-web/css/all.min.css">
    <link rel="stylesheet" href="index.css">
  
</head>
<body>
<div id="main">
  
    <div id="header" style="height: 120px;background-color: #446879; ">
    		<div style="position: relative; display: flex;justify-content: space-between;">
    			<img class = "header-img-rps" alt="" src="baithijava/logotc4.jpg" style=" width: 50px;height: 50px;margin-top: 15px; margin-left: 30px;">
	    		<p class = "header-p-rps" style="color: #fff;margin-top:30px;font-size: 17px;">Đây là trang Admin của Hv Huy Shop</p>
	    		<form action="sanphamcontroller" method="post" style="">
					<input  style="width: 400px; margin-top: 30px; margin-right: 30px;" type="text" name = "txttim" class = "form-control header-input-rps"
						placeholder="Tìm kiếm...">
					
				</form>
    		</div>
        <ul id = "nav">
           <!--  <li class="active">
                <a href="sanphamcontroller"><img alt="" src="baithijava/logotc4.jpg" style=" width: 50px;height: 50px;"></a></li> -->
           <li><a href="adminloaispcontroller">Quản lí loại</a></li>
           <li><a href="adminsanphamcontroller">Quản lí sản phẩm</a></li>
           <li><a href="adminxacnhancontroller">Xác nhận đặt hàng</a></li>
          
           <li>
               <a  class="footer-Evaluate footer-group js-buy-btn-Evaluate ">Đánh Giá</a></li>  
        </ul>
         <ul class="nav navbar-nav navbar-right ">
		      
		        <li>
		       		 <%
						//session.removeAttribute("dn")
						if (session.getAttribute("dnadmin") != null){ 
							String tenkh = (String)session.getAttribute("dnadmin");
						%>
						<a href = "" style="color:white"><span style=" display: inline-block;width: 20px; background-color: pink; color: white; border-radius: 50%; text-align: center; margin-right: 5px; font-weight: 600;" ><%=tenkh.toUpperCase().charAt(0)%></span><%=tenkh %> </a> 
						<%}else{%>
						 <a href="" data-toggle="modal" data-target="#myModal" style="color: #fff;margin-right: 15px;" class="header-nav-re"><span class="glyphicon glyphicon-log-in" ></span> Đăng nhập</a>
					<%} %>
				</li>
				<li>
		         	<%	if (session.getAttribute("dnadmin") != null){%>
		      		<a href="dangxuatcontroller" class= " header-nav-re"><span class="glyphicon glyphicon-log-in"></span> Đăng xuất</a>	    
		      		<%}%>
		      	</li>
			 </ul>

        <label for="nav-mobile-input" class="nav-bars-btn">
            <i class="fa-solid fa-bars"></i>
        </label>

        <!-- <label for="nav-mobile-input">Check 1</label> -->

        <input type="checkbox" hidden name="" class = "nav-input" id="nav-mobile-input">

        <!-- <label for="nav-mobile-input">Check 2</label> -->

        <label for="nav-mobile-input" class="nav-overlay">
            <li><a href="#"><i class="ti-home nav-home-icon "></i></a></li>
        </label>

        <ul id = "nav-mobile">

            <label for="nav-mobile-input" class="nav-mobile-close">
                <i class="fa-regular fa-circle-xmark "></i>
            </label>

            <li class="active">
                <a href="sanphamcontroller"><img alt="" src="baithijava/logotc4.jpg" style=" width: 50px;height: 50px;"></a></li>
          
           <li><a href="adminloaispcontroller" class="nav-mobile-css">Quản lí loại</a></li>
           <li><a href="adminsanphamcontroller" class="nav-mobile-css">Quản lí sản phẩm</a></li>
           <li><a href="thanhtoanspcontroller" class="nav-mobile-css">Xác nhận đặt mua</a></li>
          
        </ul>

       <!--  <div class="search-btn">
            <i class="search-icon ti-search"></i>
        </div> -->

        <!-- Hiển thị nút bars -->

        
    </div>

        <!-- Hiển thị modal đăng nhập -->
       <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Đăng Nhập</h4>
        </div>
       	<div class= "Form">
       		<form style="text-align: center;" action="khachhangcontroller" method="post">
       		<div style="display: block;">
       			<span class = "FormSV-span">Tài Khoản:</span>
				<input class = "FormSV-input" type="text" name="txtun" placeholder = "Nhập tài khoản" required>  <br>
			</div>
			<div style="display: block;">
				<span class = "FormSV-span">Mật khẩu:</span>
				<input class = "FormSV-input" type="Password" name="txtpass" placeholder = "Nhập Mật Khẩu" required>  <br>
			</div>
			<div style="margin-top: 10px">
				<span style="margin-top: 10px">Bạn chưa có tài khoản?<a href="" data-toggle="modal" data-target="#myModaldk" data-dismiss="modal">Đăng kí</a></span><br>
				<button class = "FormSV-Buttom">Đăng Nhập</button>
			</div>
			</form>
		</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
		  <!-- Hết modal đăng nhập -->
		  
		   <!-- Hiển thị modal đăng kí -->
 <div class="modal fade" id="myModaldk" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Đăng kí</h4>
        </div>
       	<div class= "Form">
       		<form style="text-align: center;" action="khachhangcontroller" method="post">
       			<div style = "display: inline-block;">
					<span class = "FormSV-span">Họ tên:</span>
					<input class = "FormSV-input" type="text" name="txtht" placeholder = "Nhập họ tên" required> 
				</div>
				<div style = "display: inline-block;">
					<span class = "FormSV-span">Đại chỉ:</span>
					<input class = "FormSV-input" type="text" name="txtdc" placeholder = "Nhập địa chỉ" required>  
				</div>
				<div style = "display: inline-block;">
					<span class = "FormSV-span">Số điện thoại:</span>
					<input class = "FormSV-input" type="text" name="txtsdt" placeholder = "Nhập số điện thoại" required> 
				</div>
				<div style = "display: inline-block;">
					<span class = "FormSV-span">Email:</span>
					<input class = "FormSV-input" type="email" name="txtemail" placeholder = "Nhập email" required>  
				</div>
				<div style = "display: inline-block;">
					<span class = "FormSV-span">Tài Khoản:</span>
					<input class = "FormSV-input" type="text" name="txtun" placeholder = "Nhập tài khoản" required> 
				</div>
				<div style = "display: inline-block;">
					<span class = "FormSV-span">Mật khẩu:</span>
					<input class = "FormSV-input" type="Password" name="txtpass1" placeholder = "Nhập mật khẩu" required>  
				</div>
				<div style = "display: inline-block;">
					<span class = "FormSV-span">Nhập lại mật khẩu:</span>
					<input class = "FormSV-input" type="Password" name="txtpass2" placeholder = "Nhập lại mật khẩu" required>  
				</div>
				<div>
					<button class = "FormSV-Buttom">Đăng Kí</button>
					<span style="margin-top: 10px">Bạn chưa đã có tài khoản?<a href="" data-toggle="modal" data-target="#myModal" data-dismiss="modal">Đăng nhập</a></span><br>
				</div>
			</form>
		</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
		  <!-- Hết modal đăng kí -->
        
</div>

<%
	if (request.getParameter("kt") != null ){%>
	  	<script type="text/javascript">
	  		alert('Vui lòng đăng nhập lại!');
	  	</script>
<% }%>

</body>
</html>