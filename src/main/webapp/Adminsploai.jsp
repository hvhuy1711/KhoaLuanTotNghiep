<%@page import="bean.loaispbean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Admin</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="Thongbao.css">

<style type="text/css">
.form-row {
	padding: 10px 50px;
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.labelspan {
	width: 100px; /* Đặt kích thước của label */
	margin: 0 0 0 30px; /* Tạo khoảng cách giữa label và input */
}

.input {
	padding: 10px; flex : 1;
	/* Để input mở rộng để điền vào phần còn lại của hàng */
	height: 30px; /* Đặt chiều cao cho input */
	width: 100%;
	flex: 1; /* Đảm bảo input mở rộng để điền vào khoảng trống */
}
    .card {
        border: 1px solid #ccc;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        transition: all 0.3s;
    }
    .card:hover {
        transform: translateY(-5px);
    }
    .card-header {
        font-weight: bold;
    }
    .card-body {
        padding: 20px;
    }
    .btn {
        margin: 5px;
    }
    .modal-header {
        background-color: #446879;
        color: #fff;
    }
    .modal-title {
        margin: 0;
    }
    .modal-body {
        padding: 20px;
    }
    .modal-footer {
        padding: 10px;
    }
    .form {
        padding: 20px;
    }
    .form-row {
        margin-bottom: 15px;
    }
.pagination {
    display: flex;
    justify-content: center;
    margin: 20px 0;
}

.pagination a {
    margin: 0 5px;
    padding: 8px 16px;
    text-decoration: none;
    border: 1px solid #ddd;
    color: #333;
}

.pagination a.active {
    background-color: #4CAF50;
    color: white;
    border: 1px solid #4CAF50;
}
</style>

</head>
<body>
<%-- <div id="main">
  
    <div id="header" style="height: 120px;background-color: #446879; ">
    		<div style="position: relative; display: flex;justify-content: space-between;">
    			<img class = "header-img-rps" alt="" src="baithijava/logotc4.jpg" style=" width: 50px;height: 50px;margin-top: 15px; margin-left: 30px;">
	    		<p class = "header-p-rps" style="color: #fff;margin-top:30px;font-size: 17px;">Đây là trang Admin của Hv Huy Shop</p>
	          	<form action="sanphamcontroller" method="post" style="">
					
				</form>
    		</div>
        <ul id = "nav">
           <!--  <li class="active">
                <a href="sanphamcontroller"><img alt="" src="baithijava/logotc4.jpg" style=" width: 50px;height: 50px;"></a></li> -->
           <li><a href="adminloaispcontroller">Quản lí danh mục</a></li>
           <li><a href="adminsanphamcontroller">Quản lí sản phẩm</a></li>
           <li><a href="adminxacnhancontroller">Xác nhận đặt hàng</a></li>
           <li><a href="adminxoatkcontroller">Quản lí tài khoản</a></li>
           <li><a href="adminThongKeController">Thống kê</a></li>
          <!--  <li>
               <a  class="footer-Evaluate footer-group js-buy-btn-Evaluate ">Đánh Giá</a></li>   -->
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
						 <a href="dangxuatcontroller" class=" header-nav-re"
					style="text-decoration: none; color: white;"><span
						class="glyphicon glyphicon-log-in"></span> Đăng xuất</a>
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
          
           <li><a href="adminloaispcontroller" class="nav-mobile-css">Quản lí danh mục</a></li>
           <li><a href="adminsanphamcontroller" class="nav-mobile-css">Quản lí sản phẩm</a></li>
           <li><a href="adminxacnhancontroller" class="nav-mobile-css">Xác nhận đặt mua</a></li>
            <li><a href="adminxoatkcontroller" class="nav-mobile-css">Quản lí tài khoản</a></li>
            <li><a href="adminThongKeController" class="nav-mobile-css">Thống kê</a></li>
          
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
        
</div> --%>

<div class="notifications"></div>
	<!-- Check cập nhật danh mục -->
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkUpLoai") != null) {
		boolean checkUpLoai = (boolean) request.getAttribute("checkUpLoai");
		if (checkUpLoai == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Cập nhật danh mục thành công!!');
	</script>
	<%
	}
	}
	%>
	
	
	<!-- Check update loai -->
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkThemLoai") != null) {
		boolean checkThemLoai = (boolean) request.getAttribute("checkThemLoai");
		if (checkThemLoai == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Thêm danh mục thành công!!');
	</script>
	<%
	}else{%>
	<script type="text/javascript">
		createToast('warning', 'fa-solid fa-circle-exclamation', 'Cảnh báo',
				'Tên danh mục này đã tồn tại!! Không thể thêm.');
	</script>
	<%
	}
	}
	%>
	
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkMLSP") != null) {
		boolean checkMLSP = (boolean) request.getAttribute("checkMLSP");
		if (checkMLSP == true) {
	%>
	<script type="text/javascript">
		createToast('warning', 'fa-solid fa-circle-exclamation', 'Cảnh báo',
				'Bạn không thể xóa danh mục này vì còn có các sản phẩm liên quan!!');
	</script>
	<%
	}
	}
	%>
	
	<!-- Check xóa loai -->
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkXoaLoai") != null) {
		boolean checkXoaLoai = (boolean) request.getAttribute("checkXoaLoai");
		if (checkXoaLoai == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Xóa danh mục thành công!!');
	</script>
	
	<%}
	}
	%>

<div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3" style="background-color: #ccc">
                <div style="padding: 20px"></div>
                <div style="display: flex;justify-content: center;align-items: center;">
                	<img alt="" src="baithijava/admin1.jpg" style="width: 100px; height: 100px;">
                	<h1 class="text-center" style="padding: 20px">ADMIN</h1>
                </div>
                <div style="display: flex; flex-direction: column; justify-content: space-around; margin: 30px;">
                    <a href="adminThongKeController" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px; padding: 10px;  color: black; font-weight: bold; margin-bottom: 10px;">Thống kê theo sản phẩm</a>
                    <a href="adminThongKeKHController" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px; padding: 10px; color: black; font-weight: bold; margin-bottom: 10px;">Thống kê theo khách hàng</a>
                    <a href="adminThongKeDHController" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px; padding: 10px; color: black; font-weight: bold;margin-bottom: 10px;">Thống kê theo đơn hàng</a>
                    <a href="adminxacnhancontroller" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px; padding: 10px; color: black; font-weight: bold;margin-bottom: 10px;">Xác nhận đơn hàng</a>
                    <a href="adminDonHangDaXacNhanShipperController" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px; padding: 10px; color: black; font-weight: bold;margin-bottom: 10px;">Trang của người vận chuyển</a>
                    <a href="adminsanphamcontroller" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px; padding: 10px; color: black; font-weight: bold;margin-bottom: 10px;">Quản lí sản phẩm</a>
                    <a href="adminloaispcontroller" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px; padding: 10px; color: black; font-weight: bold;margin-bottom: 10px;">Quản lí danh mục</a>
                </div>
            </div>
            
            <div class="col-md-9">
            <form action="adminloaispcontroller" method="get" class="text-center">
	<h1 style="color: black;">Trang ADMIN Quản lí danh mục</h1>
	<div style="border: 2px solid #446789;padding: 30px;margin: 30px;border-radius: 20px">
	<div class="form-row">
			<span class="labelspan">Tên danh mục:</span>
			 <input class="input" name= "txttenloai" type="text" required="required" value="" placeholder="Nhập Tên danh mục"> <br>
	</div>
	<div style="padding: 10px"></div>
	<input name="butadd" type="submit" value="Thêm danh mục" style="width: 150px; height: 45px; background-color: #446879; color: #fff; font-weight: bold;outline: none;border: 2px solid #ccc; border-radius: 10px; margin-right: 15px">
	<!-- <input name="butupdate" type="submit" value="Sửa danh mục" style="width: 150px; height: 45px; background-color: #446879; color: #fff; font-weight: bold;outline: none;border: 2px solid #ccc; border-radius: 10px"> -->
	</div> 
</form>



<p style="text-align: center; margin-top: 20px; font-size: 30px">Danh sách các danh sách sản phẩm</p> 

<div class="container">
    <h1 class="text-center">Tìm kiếm danh mục</h1>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="adminloaispcontroller" method="post">
                <div class="form-group">
                    <input class="form-control" name="key" type="text" placeholder="Nhập từ khóa tìm kiếm" required="required">
                </div>
                <div class="form-group text-center">
                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div style="border: 2px solid #446789; padding: 30px; margin: 30px; border-radius: 20px">
    <div class="row">
        <%
        ArrayList<loaispbean> ds = (ArrayList<loaispbean>) request.getAttribute("dsloai");
        if (ds != null) {
            for (loaispbean loai : ds) {
        %>
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-header" style="background-color: #446879; color: #fff">
                    <h5 class="card-title">Mã danh mục: <%=loai.getMaLoai() %></h5>
                </div>
                <div class="card-body">
                    <p class="card-text"><strong>Tên danh mục:</strong> <%=loai.getTenLoai() %></p>
                    <div class="d-flex justify-content-between">
                        <a data-toggle="modal" data-target="#myModal<%=loai.getMaLoai()%>"
                           class="btn btn-warning btn-sm">
                            <i class="fa-solid fa-pen-to-square"></i> Cập nhật
                        </a>
                        <a data-toggle="modal" data-target="#myModalXoa<%=loai.getMaLoai()%>"
                           class="btn btn-danger btn-sm">
                            <i class="fa-solid fa-trash-can"></i> Xoá
                        </a>
                    </div>
                </div>
            </div>
        </div>
      

        <!-- Modal xóa -->
        <div class="modal fade" id="myModalXoa<%=loai.getMaLoai()%>" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                        <h4 class="modal-title">Thông báo xóa</h4>
                    </div>
                    <div class="modal-body text-center">
                        <h2 style="margin-bottom: 40px">Bạn có chắc chắn muốn xóa danh mục này?</h2>
                        <div style="margin-bottom: 20px">
                            <a href="adminloaispcontroller?mlxoa=<%=loai.getMaLoai() %>&tab=xoa"
                               class="btn btn-danger" style="border-radius:20px; font-size:18px; font-weight:bold; padding: 10px 40px; margin-right: 20px">
                                Có
                            </a>
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="font-weight: bold; border-radius: 20px; font-size: 18px">Không</button>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal cập nhật danh mục -->
        <div class="modal fade" id="myModal<%=loai.getMaLoai() %>" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                       <!--  <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                        <h4 class="modal-title">Thông tin cập nhật danh mục</h4>
                    </div>
                    <div class="form">
                        <form style="text-align: center;" action="adminCNLoaiController" method="get">
                            <div style="padding: 10px"></div>
                            <div class="form-row" style="display: none">
                                <span class="labelspan">Mã danh mục:</span>
                                <input class="input" name="maloai" type="text"
                                       value="<%=loai.getMaLoai() %>"
                                       placeholder="Nhập mã sản phẩm" required="required">
                                <br>
                            </div>
                            <div class="form-row">
                                <span class="labelspan">Tên danh mục:</span>
                                <input class="input" name="tenloai" type="text"
                                       value="<%=loai.getTenLoai() %>"
                                       placeholder="Nhập số lượng" required="required">
                                <br>
                            </div>
                            <div class="form-row" style="margin-top: 10px; padding: 0 40px 10px">
                                <input name="btnLoai" type="submit" value="Cập nhật danh mục sản phẩm"
                                       class="btn btn-primary" style="background-color: #446879; color: #fff; font-weight: bold; border-radius: 10px; padding: 10px 20px;">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        }
        %>
    </div>
      <div class="pagination">
        <%
            int currentPage = (int) request.getAttribute("currentPage");
            int totalPages = (int) request.getAttribute("totalPages");
            String keyword = request.getParameter("key");

            String queryParams = "";
            if (keyword != null) queryParams += "&key=" + keyword;

            if (currentPage > 1) {
        %>
        <a href="adminloaispcontroller?page=<%= currentPage - 1 %><%= queryParams %>">&laquo; Quay lại</a>
        <% 
            }
            for (int i = 1; i <= totalPages; i++) {
        %>
        <a href="adminloaispcontroller?page=<%= i %><%= queryParams %>" class="<%= (i == currentPage) ? "active" : "" %>"><%= i %></a>
        <% 
            }
            if (currentPage < totalPages) {
        %>
        <a href="adminloaispcontroller?page=<%= currentPage + 1 %><%= queryParams %>">Tiếp theo &raquo;</a>
        <% } %>
    </div>	
</div>
            </div>
           </div>
          </div>



</body>
</html>