<%@page import="bean.choxacnhanbean"%>
<%@page import="java.util.ArrayList"%>

<%@page import="bean.thanhtoanspbean"%>

<%@page import="bean.loaispbean"%>
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
    <style type="text/css">
    /* tablet */
@media (min-width : 739px) and (max-width:1023px){
	.item{
		margin-top: 55px;
	}
	
	.header-nav-re{
		display: block;
		float: right;
	}
	
	.header-img-rps,
	.header-p-rps{
		display: none;
	}
	
	.header-input-rps{
		display:none;
	}
	
}

/* Mobile */
@media (max-width : 740px){
	.item{
		margin-top: 55px;
	}	
	
	.header-nav-re{
		display: block;
		float: right;
   		color: #fff;
   		margin-right: 10px;
	}
	
	.header-img-rps,
	.header-p-rps{
		display: none;
	}
	
	.header-input-rps{
		display: none;
	}
	
}
    </style>
    
</head>
<body>
<div id="main">
  
    <div id="header">
          	<div style="position: relative; display: flex;justify-content: space-between;">
    			<img class = "header-img-rps" alt="" src="baithijava/logotc4.jpg" style=" width: 50px;height: 50px;margin-top: 15px; margin-left: 30px;">
	    		<p class = "header-p-rps" style="color: #fff;margin-top:30px;font-size: 17px;">Chào mừng bạn đến với Hv Huy Shop</p>
	          	<form action="sanphamcontroller" method="post" style="">
					<input  style="width: 400px; margin-top: 30px; margin-right: 30px;" type="text" name = "txttim" class = "form-control header-input-rps"
						placeholder="Tìm kiếm...">
					
				</form>
    		</div>
        <ul id = "nav">
           <!--  <li>
                <a href="sanphamcontroller"><img alt="" src="baithijava/logotc4.jpg" style=" width: 50px;height: 50px;"></a></li> -->
           <li><a href="sanphamcontroller">Trang Chủ</a></li>
           <li><a href="sanphamcontroller">Sản phẩm <i class="fa-solid fa-caret-down nav-arrow-down"></i></a>
           	<ul class = "subnav">
           	<%
				ArrayList<loaispbean> dsloaiheader = (ArrayList<loaispbean>)request.getAttribute("dsloai");
    			if (dsloaiheader != null){
				for(loaispbean l : dsloaiheader){
				%> 
						<li>
							<a style="cursor: pointer;text-decoration: none;font-weight: bold;" 
							href="sanphamcontroller?ml=<%=l.getMaLoai() %>">
								<%=l.getTenLoai() %>
							</a></li>
				<%} 
				}%>
				</ul>	
           </li>
           <li><a href="giospcontroller">Giỏ Hàng</a></li>
           <li><a href="thanhtoanspcontroller">Thanh Toán</a></li>
           <li  class="active"><a href="choxacnhancontroller">Chờ xác nhận</a></li>
           <li><a href="lichsuspcontroller">Lịch Sử Mua</a></li>
          <!--  <li><a class="footer-Evaluate footer-group js-buy-btn-Evaluate ">Đánh Giá</a></li>   -->
        </ul>
         <ul class="nav navbar-nav navbar-right ">
		        <li >
			        <%
			      		if (session.getAttribute("dn") == null){%>
			      			<a href="" data-toggle="modal" data-target="#myModaldk" style="color: #fff;margin-right: 15px; " class="header-nav-re"><span class="glyphicon glyphicon-user" style="color: #fff;margin-right: 15px;"></span> Đăng kí</a>    	      	
			      	<%}%>
		      	</li>
		        <li>
		       		 <%
						//session.removeAttribute("dn")
						if (session.getAttribute("dn") != null){ 
							String tenkh = (String)session.getAttribute("dn");
						%>
						<a href = "" style="color:white"><span style=" display: inline-block;width: 20px; background-color: pink; color: white; border-radius: 50%; text-align: center; margin-right: 5px; font-weight: 600;" ><%=tenkh.toUpperCase().charAt(0)%></span><%=tenkh %> </a> 
						<%}else{%>
						 <a href="" data-toggle="modal" data-target="#myModal" style="color: #fff;margin-right: 15px;" class="header-nav-re"><span class="glyphicon glyphicon-log-in" ></span> Đăng nhập</a>
					<%} %>
				</li>
				<li>
		         	<%	if (session.getAttribute("dn") != null){%>
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
          
           <li><a href="sanphamcontroller" class="nav-mobile-css">Giới Thiệu</a></li>
           <li><a href="giospcontroller" class="nav-mobile-css">Giỏ Hàng</a></li>
           <li><a href="thanhtoanspcontroller" class="nav-mobile-css">Thanh Toán</a></li>
           <li  class="active"><a href="choxacnhancontroller" class="nav-mobile-css">Chờ xác nhận</a></li>
           <li><a href="lichsuspcontroller" class="nav-mobile-css">Lịch Sử Mua</a></li>
           <li>
               <a  class="footer-Evaluate footer-group js-buy-btn-Evaluate nav-mobile-css ">Đánh Giá</a></li>

        </ul>

        <div class="search-btn">
            <i class="search-icon ti-search"></i>
        </div>

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

 <div class="container text-center" >  
  <div class="row content">
    <div class="col-sm-12 text-left"> 
    <h2 style="margin-top: 120px;">Các sản phẩm chờ xác nhận</h2>
    	<%
        			//hiển thị chờ xác nhận
        				ArrayList<choxacnhanbean> dschoxacnhan = (ArrayList<choxacnhanbean>)request.getAttribute("dssanpham");
        				if(dschoxacnhan != null){
        					long tongtien = 0;
        					for(choxacnhanbean h: dschoxacnhan){
        				%>
       						<div class="row" style="display: block;">
       							<div class="col-sm-1">
     								<img style="width: 100%" alt="" src="<%=h.getAnh() %>">
     							</div>
        						<div class="col-sm-11">
        							<h3><%=h.getTenSanPham() %></h3>
        							<p style="display: inline-block;"> Giá: <%=h.getGiamoi() %></p>
        								x 
        								<form style="display: inline-block;" id="capnhat-<%=h.getTenSanPham()%>" action="giospcontroller" method="post">
	        								<input form="capnhat-<%=h.getTenSanPham()%>" style="width: 60px; margin-bottom: 20px; display: inline-block;" name="soluong" type="text" value="<%=h.getSoLuong() %>">
        								</form>
        						</div>
        					</div>
        					
        					<%
        						tongtien += h.getThanhToan(); 
        					}
        					%>
        				<p style="font-size: 20px; font-weight: 600; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; padding-top: 20px; padding-bottom: 20px; padding-right: 80px;">Tổng tiền: <%=request.getAttribute("tongtien") %> VNĐ</p>
        				<a href="sanphamcontroller" style="font-size: 20px;padding: 10px; background-color: #4cacd8; color: #000; border-radius:5px; text-decoration: none; margin: 10px">Quay lại trang chủ</a>
        				<%} %>	
    </div> 
  </div>
</div> 
</body>
</html>