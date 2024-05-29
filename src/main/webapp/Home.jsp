<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.sanphamfullbean"%>
<%@page import="dao.khachhangdao"%>
<%@page import="bean.giospbean"%>
<%@page import="bean.khachhangthibean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaispbean"%>
<%@page import="bean.sanphambean"%>

<%@page import="bo.giospbo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hv Huy Shop</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="assets/fontawesome-free-6.3.0-web/css/all.min.css">
<link rel="stylesheet" href="index.css">
<link rel="stylesheet" href="animation.css">
<link rel="stylesheet" href="Thongbao.css">


<style type="text/css">
.giohang {
	display: block;
	position: absolute;
	color: #fff;
	background-color: red;
	top: 5px;
	right: 0;
	border-radius: 50%;
	width: 20px;
	height: 20px;
	text-align: center;
}


/* tablet */
@media ( min-width : 739px) and (max-width:1023px) {
form {
        width: 70%;
        margin: 0 auto;
    }
	.item {
		margin-top: 55px;
	}
	.header-nav-re {
		display: in;
		float: right;
	}
	.header-img-rps, .header-p-rps {
		display: none;
	}
	.header-input-rps {
		display: none;
	}
}

/* Mobile */
@media ( max-width : 740px) {
 form {
        width: 90%;
        margin: 0 auto;
    }
    input[type="number"] {
        width: calc(80% - 10px); /* Chia đôi chiều rộng cho các trường input */
        margin-bottom: 10px;
    }
    input[type="submit"] {
        width: 100%; /* Đưa nút submit ra dòng mới và căn giữa */
        margin-top: 10px;
    }
	.item {
		margin-top: 55px;
	}
	.header-nav-re {
		display: block;
		float: right;
		color: #fff;
		margin-right: 10px;
	}
	.header-img-rps, .header-p-rps {
		display: none;
	}
	.header-input-rps {
		display: none;
	}
}

.item {
	margin-top: 120px;
}

  #nav {
            list-style: none;
            padding: 0;
            margin: 0;
            background-color: #446879;
        }

#nav li {
    display: inline-block;
    position: relative;
}

#nav li a {
    color: #fff;
    text-decoration: none;
    line-height: 55px;
    padding: 0 24px;
    display: inline-block;
}

#nav li:hover .subnav {
    display: block;
}

#nav-mobile {
    list-style: none;
    padding: 0;
    max-height: 600px; /* Điều chỉnh chiều cao tối đa của menu */
    overflow-y: auto; /* Hiển thị thanh cuộn dọc khi cần thiết */
}

#nav .subnav {
    display: none;
     max-height: 300px; /* Điều chỉnh chiều cao tối đa của menu */
    overflow-y: auto; /* Hiển thị thanh cuộn dọc khi cần thiết */
    position: absolute;
    top: 100%;
    left: 0;
    list-style: none;
    padding: 0;
    margin: 0;
    background: #fff;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

#nav>li:hover>a, #nav .subnav li:hover a {
    color: white;
    background-color: #446789;
}

#nav .subnav a {
    color: #120f0f;
    width: 150px;
    padding: 0 16px;
    line-height: 38px;
    display: block; /* Ensure links fill the container */
}

#nav .nav-arrow-down {
    font-size: 12px;
}

/* Định dạng biểu mẫu và các thành phần bên trong */
form#locgia {
  margin-top: 20px;
  font-size: 16px;
}

/* Định dạng các input */
form#locgia input[type="number"] {
  width: 100%;
  margin-right: 10px;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

/* Định dạng nút submit */
form#locgia input[type="submit"] {
  padding: 5px 10px;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

/* Khi rê chuột vào nút submit */
form#locgia input[type="submit"]:hover {
  background-color: #45a049;
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
	<div id="main">

		<div id="header" style="height: 120px; background-color: #446879;">
			<div
				style="position: relative; display: flex; justify-content: space-between;">
				<img class="header-img-rps" alt="" src="baithijava/logotc4.jpg"
					style="width: 50px; height: 50px; margin-top: 15px; margin-left: 30px;">
				<p class="header-p-rps"
					style="color: #fff; margin-top: 30px; font-size: 17px;font-weight: bold;">Chào
					mừng bạn đến với Hv Huy Shop</p>
				<form action="sanphamcontroller" method="post" style="">
					<input style="width: 400px; margin-top: 30px; margin-right: 30px;"
						type="text" name="txttim" class="form-control header-input-rps"
						placeholder="Tìm kiếm...">

				</form>
			</div>
			<ul id="nav">
			<li class="active"><a href="sanphamcontroller">Trang Chủ</a></li>
				<li>
                <a href="sanphamcontroller">Sản phẩm <i class="fa-solid fa-caret-down nav-arrow-down"></i></a>
                <ul class="subnav">
                    <% 
                    ArrayList<loaispbean> dsloaiheader = (ArrayList<loaispbean>) request.getAttribute("dsloai");
                    if (dsloaiheader != null) {
                        for (loaispbean l : dsloaiheader) {
                    %>
                    <li>
                        <a style="cursor: pointer; text-decoration: none; font-weight: bold;" href="sanphamcontroller?ml=<%=l.getMaLoai()%>"> 
                            <%=l.getTenLoai()%>
                        </a>
                    </li>
                    <% 
                        } 
                    } 
                    %>
                </ul>
            </li>
				<%
				if (session.getAttribute("dn") == null) {
				%>

				<li class="active"><a href="" data-toggle="modal"
					data-target="#myModal"> <i class="fa-solid fa-cart-shopping"></i>
						Giỏ Hàng
				</a></li>

				<%
				} else {
				%>
				<li class="active"><a href="giospcontroller"><i
						class="fa-solid fa-cart-shopping"></i> Giỏ Hàng</a> <%
				 ArrayList<giospbean> dsgio = (ArrayList<giospbean>)request.getAttribute("dsgio");
				 if (dsgio != null){
					  if (dsgio.size() != 0) {
				 	int n = dsgio.size();
				 	if (n > 0) {
				 %> <span class="giohang"><%=n%></span> <%
				 }
				 }
				 }
				 %></li>

				<%
				}
				%>

				<li><a href="">Thương hiệu <i
						class="fa-solid fa-caret-down nav-arrow-down"></i></a>
					<ul class="subnav">
						<%
						ArrayList<String> dshang = (ArrayList<String>) request.getAttribute("dsHang");
						int nhang = dshang.size();
						if (dshang != null) {
							for (int i = 0;i<nhang ;i++) {
						%>
						<li><a
							style="cursor: pointer; text-decoration: none; font-weight: bold;"
							href="sanphamcontroller?tenhang=<%=dshang.get(i)%>"> <%=dshang.get(i)%>
						</a></li>
						<%
						}
						}
						%>
					</ul></li>
				<%
				if (session.getAttribute("dn") == null) {
				%>
				<li class="active"><a href="" data-toggle="modal"
					data-target="#myModal"> Lịch Sử Mua </a></li>

				<%
				} else {
					%>
				<li class="active"><a href="LichSuMuaController">Lịch Sử
						Mua</a></li>
				<%
				} 
				%>
			</ul>
			<ul class="nav navbar-nav navbar-right ">
				<li>
					<%
					if (session.getAttribute("dn") != null) {
						khachhangthibean kh1 = (khachhangthibean) session.getAttribute("dn");
						if(kh1.getHoTen() != null){
					%> <a href="ThongtinKhachHangController" style="color: white"><span
						style="display: inline-block; width: 20px; background-color: pink; color: white; border-radius: 50%; text-align: center; margin-right: 5px; font-weight: 600;"><%=kh1.getHoTen().toUpperCase().charAt(0)%></span><%=kh1.getHoTen()%>
				</a> <%
				}
				 } else {
				 %> <a  href="" data-toggle="modal" data-target="#myModal"
									style="color: #fff; margin-right: 40px;" class="header-nav-re"><i class="fas fa-user" style="font-size: 24px; margin-right: 10px;"></i></a> <%
				 }
				 %>
				</li>
				<li>
					<%
					if (session.getAttribute("dn") != null) {
					%> <a href="dangxuatcontroller" class=" header-nav-re"
					style="text-decoration: none; color: white;"><span
						class="glyphicon glyphicon-log-in"></span> Đăng xuất</a> <%
 }
 %>
				</li>
			</ul>

			<label for="nav-mobile-input" class="nav-bars-btn"> <i
				class="fa-solid fa-bars"></i>
			</label>

			<input type="checkbox" hidden name="" class="nav-input"
				id="nav-mobile-input">

			<label for="nav-mobile-input" class="nav-overlay">
				<li><a href="#"><i class="ti-home nav-home-icon "></i></a></li>
			</label>

<ul id="nav-mobile">
    <label for="nav-mobile-input" class="nav-mobile-close"> <i
        class="fa-regular fa-circle-xmark "></i>
    </label>
    <li class="active">
        <a href="sanphamcontroller"><img alt=""
                src="baithijava/logotc4.jpg" style="width: 50px; height: 50px;"></a>
    </li>
    <li>
        <a href="sanphamcontroller" class="nav-mobile-css">Trang Chủ</a>
    </li>
    <li>
        <a href="sanphamcontroller" class="nav-mobile-css">Sản phẩm</a>
          <ul class="subnav">
                    <% 
                    if (dsloaiheader != null) {
                        for (loaispbean l : dsloaiheader) {
                    %>
                    <li>
                        <a style="cursor: pointer; text-decoration: none;" href="sanphamcontroller?ml=<%=l.getMaLoai()%>"> 
                            <%=l.getTenLoai()%>
                        </a>
                    </li>
                    <% 
                        } 
                    } 
                    %>
                </ul>
    </li>
    <li>
        <a href="giospcontroller" class="nav-mobile-css">Giỏ hàng</a>
    </li>
    <li id="thuongHieuLi">
        <a href="#" class="nav-mobile-css" id="thuongHieuLink">Thương hiệu</a>
        <ul class="subnav" id="thuongHieuSubnav">
            <% 
        
            if (dshang != null) {
                for (String hang : dshang) { 
            %>
            <li>
                <a href="sanphamcontroller?tenhang=<%= hang %>" 
                   style="cursor: pointer; text-decoration: none;">
                    <%= hang %>
                </a>
            </li>
            <% 
                }
            } 
            %>
        </ul>
    </li>
    <li>
        <a href="LichSuMuaController" class="nav-mobile-css">Lịch Sử Mua</a>
    </li>
</ul>


			<!-- Hiển thị nút bars -->
		</div>

		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Đăng Nhập</h4>
					</div>
					<div class="Form">
						<form style="text-align: center;" action="khachhangcontroller"
							method="post">

							<div style="display: block;; padding: 0 40px 8px">
								<input class="FormSV-input"
									style="margin: 16px 0 8px 0; width: 100%" type="text"
									name="txtun" placeholder="Nhập tài khoản" required> <br>
							</div>
							<div style="display: block; padding: 0 40px 8px">
								<input class="FormSV-input"
									style="margin: 16px 0 8px 0; width: 100%" type="Password"
									name="txtpass" placeholder="Nhập Mật Khẩu" required> <br>
							</div>

							<div style="margin-top: 10px; padding: 0 40px 10px">
								<span style="margin-top: 10px">Bạn chưa có tài khoản?<a
									href="" data-toggle="modal" data-target="#myModaldk"
									data-dismiss="modal">Đăng kí</a></span><br>
								<button name="btndn" class="FormSV-Buttom" style="width: 100%">Đăng
									Nhập</button>
								<div
									style="padding-bottom: 14px; display: flex; align-items: center;">
									<div
										style="background-color: #dbdbdb; flex: 1; height: 1px; width: 100%; display: block;"></div>
									<span
										style="color: #ccc; font-size: 15px; padding: 0 16px; text-transform: uppercase;">Hoặc</span>
									<div
										style="background-color: #dbdbdb; flex: 1; height: 1px; width: 100%; display: block;"></div>
								</div>

								<div>
									<p style="color: red">Đăng nhập bằng google để có trải nghiệm tốt nhất</p>
									<a style="border: 1px solid black;border-radius:2px; padding: 10px 40px;margin:10px 0; color: black;text-decoration: none;cursor: pointer;font-size: 18px"
										href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/BaiThiJava/LoginGoogleHander&response_type=code
		  									 &client_id=24913803022-pd2qhuqnj4br9qlj7t0qljnk90fks46i.apps.googleusercontent.com&approval_prompt=force">
										<i style="padding: 5px;background: linear-gradient(45deg, #4285F4, #EA4335, #FBBC05, #34A853); -webkit-background-clip: text;-webkit-text-fill-color: transparent; " 
    									class="fa-brands fa-google"></i> Google
									</a>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<div class="notifications"></div>
		<script src="assets/ThongBao.js"></script>
		<%
		if (request.getAttribute("checkdangnhap") != null) {
			boolean check = (boolean) request.getAttribute("checkdangnhap");
			if (check == true) {
		%>
		<script type="text/javascript">
			createToast('success', 'fa-solid fa-circle-check', 'Thành Công',
					'Đăng nhập thành công!!');
		</script>
		<%
		} else {
		%>
		<div class="notifications"></div>
		<script type="text/javascript">
			createToast('error', 'fa-solid fa-circle-exclamation', 'Thất bại',
					'Đăng nhập thất bại');
		</script>
		<%
		}
		}
		%>

	<script src="assets/ThongBao.js"></script>
		<%
	if (request.getAttribute("checkSoDt") != null) {
		boolean checkSoDt = (boolean) request.getAttribute("checkSoDt");
		if (checkSoDt == true) {
	%>
		<script type="text/javascript">
			createToast('warning', 'fa-solid fa-circle-exclamation',
					'Cảnh báo',
					'Số điện thoại bạn nhập không hợp lệ');
		</script>
		<%
	}
	}
	%>
	
		<script src="assets/ThongBao.js"></script>
		<%
	if (request.getAttribute("checkEmail") != null) {
		boolean checkEmail = (boolean) request.getAttribute("checkEmail");
		if (checkEmail == true) {
	%>
		<script type="text/javascript">
			createToast('success', 'fa-solid fa-circle-exclamation',
					'Thành công',
					'Bạn đã đăng kí thành công tài khoản. Bây giờ hãy đăng nhập!!');
		</script>
		<%
	}else{%>
	<script type="text/javascript">
			createToast('warning', 'fa-solid fa-circle-exclamation',
					'Cảnh báo',
					'Email bạn nhập không hợp lệ. Vui lòng nhập email hợp lệ!!');
		</script>
	
	<%}	
	}
	%>
 
	<script src="assets/ThongBao.js"></script>
		<%
	if (request.getAttribute("checkPass") != null) {
		boolean checkPass = (boolean) request.getAttribute("checkPass");
		if (checkPass == true) {
	%>
		<script type="text/javascript">
			createToast('warning', 'fa-solid fa-circle-exclamation',
					'Cảnh báo',
					'Bạn đã nhập mật khẩu chưa đúng quy định mật khẩu phải có ít nhất 8 ký tự, bao gồm ít nhất một chữ cái viết hoa, một chữ cái viết thường và một số
					');
		</script>
	<%
		}
	}
	%>
	
		<script src="assets/ThongBao.js"></script>
		<%
	if (request.getAttribute("checkPass1") != null) {
		boolean checkPass1 = (boolean) request.getAttribute("checkPass1");
		if (checkPass1 == true) {
	%>
		<script type="text/javascript">
			createToast('warning', 'fa-solid fa-circle-exclamation',
					'Cảnh báo',
					'Bạn đã nhập mật khẩu chưa đúng quy định mật khẩu phải có ít nhất 8 ký tự, bao gồm ít nhất một chữ cái viết hoa, một chữ cái viết thường và một số
					');
		</script>
		<%
	}
	}
	%>
	
	
		<script src="assets/ThongBao.js"></script>
		<%
	if (request.getAttribute("checkDKMK") != null) {
		boolean checkDKMK = (boolean) request.getAttribute("checkDKMK");
		if (checkDKMK == false) {
	%>
		<script type="text/javascript">
			createToast('error', 'fa-solid fa-circle-exclamation', 'Thất bại',
					'Bạn đã nhập không đúng mật khẩu nhập lại. Vui lòng thử lại!!');
		</script>
		<%
	}
	}
	%>

		<script src="assets/ThongBao.js"></script>
		<%
	if (request.getAttribute("checkTenDN") != null) {
		boolean checkTenDN = (boolean) request.getAttribute("checkTenDN");
		if (checkTenDN == false) {
	%>
		<script type="text/javascript">
			createToast('error', 'fa-solid fa-circle-exclamation', 'Thất bại',
					'Tên đăng nhập này đã tồn tại. Vui lòng nhập tên đăng nhập khác!!!');
		</script>
		<%
	}
	}
	%>
	
	<!-- check lọc sản phẩm -->
	
			<script src="assets/ThongBao.js"></script>
		<%
	if (request.getAttribute("checkMLSP") != null) {
		boolean checkMLSP = (boolean) request.getAttribute("checkMLSP");
		if (checkMLSP == true) {
	%>
		<script type="text/javascript">
			createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
					'Danh sách sản phẩm theo mã loại');
		</script>
		<%
	}
	}
	%>
	
			<script src="assets/ThongBao.js"></script>
		<%
	if (request.getAttribute("checkKeySP") != null) {
		boolean checkKeySP = (boolean) request.getAttribute("checkKeySP");
		if (checkKeySP == true) {
	%>
		<script type="text/javascript">
			createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
					'Danh sách sản phẩm đã hiển thị');
		</script>
		<%
	}
	}
	%>
	
			<script src="assets/ThongBao.js"></script>
		<%
	if (request.getAttribute("checkHang") != null) {
		boolean checkHang = (boolean) request.getAttribute("checkHang");
		if (checkHang == true) {
	%>
		<script type="text/javascript">
			createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
					'Danh sách sản phẩm của thương hiệu');
		</script>
		<%
	}
	}
	%>
	
			<script src="assets/ThongBao.js"></script>
		<%
	if (request.getAttribute("checkGia") != null) {
		boolean checkGia = (boolean) request.getAttribute("checkGia");
		if (checkGia == true) {
	%>
		<script type="text/javascript">
			createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
					'Danh sách sản phẩm theo giá');
		</script>
		<%
	}else if (checkGia == false) {
		%>
		<script type="text/javascript">
			createToast('warning', 'fa-solid fa-circle-exclamation', 'Cảnh báo',
					'Không có sản phẩm nào được hiển thị');
		</script>
		<%
	}
	}
	%>
		<!-- Hết modal đăng nhập -->

		<!-- Hiển thị modal đăng kí -->
		<div style="width: 90%">
<div class="modal fade" id="myModaldk" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Đăng kí</h4>
            </div>
            <div class="Form">
                <form id="registrationForm" style="text-align: center;" action="khachhangcontroller" method="post">
                    <!-- Các trường input -->
                    <div style="display: inline-block;">
                        <input class="FormSV-input" type="text" name="txtht"  placeholder="Nhập họ tên" required>
                    </div>
                    <div style="display: inline-block;">
                        <input class="FormSV-input" type="text" name="txtdc" placeholder="Nhập địa chỉ" required>
                    </div>
                    <div style="display: inline-block;">
                        <input id="phoneNumberInput" class="FormSV-input" type="text" name="txtsdt"  placeholder="Nhập số điện thoại" required>
                    </div>
                    <div style="display: inline-block;">
                        <input id="emailInput" class="FormSV-input" type="email" name="txtemail"  placeholder="Nhập email" required>
                    </div>
					<!-- <script src="assets/checkDangKi.js"></script> -->
                    <div style="display: inline-block;">
                        <input class="FormSV-input" type="text" name="txtun" placeholder="Nhập tài khoản" required>
                    </div>
                    <div style="display: inline-block;">
                        <input class="FormSV-input" type="Password" name="txtpass1"  placeholder="Nhập mật khẩu" required>
                    </div>
                    <div style="display: inline-block;">
                        <input class="FormSV-input" type="Password" name="txtpass2"  placeholder="Nhập lại mật khẩu" required>
                    </div>
                    <div>
                        <button name= "btndk" class="FormSV-Buttom" onclick="validateForm()">Đăng Kí</button>
                        <br>
                        <span style="margin-top: 10px">Bạn đã có tài khoản?<a href="" data-toggle="modal" data-target="#myModal" data-dismiss="modal"> Đăng nhập</a></span><br>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</div>
<!-- Hết modal đăng kí -->
	</div>
	<!-- Body -->

	<div id="myCarousel" class="carousel slide text-center" data-ride="carousel" style="margin: 0 60px;width: 90%;height: 90%">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">

			<div class="item active">
				<img style="width: 70%" src="baithijava/anhbia1.jpg" alt="Image">
				<div class="carousel-caption"></div>
			</div>

			<div class="item">
				<img style="width: 70%" src="baithijava/anhbia2.jpg" alt="Image">
				<div class="carousel-caption"></div>
			</div>

			<div class="item">
				<img style="width: 70%" src="baithijava/anhbia3.jpg" alt="Image">
				<div class="carousel-caption"></div>
			</div>

			<div class="item">
				<img style="width: 70%" src="baithijava/anhbia4.jpg" alt="Image">
				<div class="carousel-caption"></div>
			</div>

			<div class="item">
				<img style="width: 70%" src="baithijava/anhbia5.jpg" alt="Image">
				<div class="carousel-caption"></div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!--  Phần body -->
	

	<div class="container">
		<div class="row">
			<div style="margin-top: 15px" class="col-sm-2">
			<div style="padding: 10px"></div>	
				
				<% 
				khachhangthibean kh = (khachhangthibean)session.getAttribute("dn");
					 if(kh !=null){
				 		if(kh.isQuyen() == true){%>
							<a href="adminsanphamcontroller" style="margin-top:40px;cursor:pointer; border: 2px solid #green;text-decoration:none; padding:10px 20px;background: green;font-size: 18px;font-weight: bold;color: white;border-radius: 20px">Admin</a>
				 <%		}
				 	}
				 %>
				<div style="padding: 10px"></div>			
				<hr>
				<h2 style="font-size: 1.5em;font-weight: bold;color:#45a049 ">Lọc sản phẩm theo giá</h2>
				<hr>
				<form action="sanphamcontroller" id="locgia" method="post">
					Nhập giá từ:<input form="locgia" name="minGia" type="number"><br>
					Đến giá:<input form="locgia" name="maxGiasp" type="number"><br>
					<input form="locgia" name="btnLoc" type="submit" style="margin-top: 10px;padding: 5px 36px ">
				</form>
			</div>
			
			<div class="col-sm-9" style="margin-top: 15px">
				<div class="row">
					<%
					response.setCharacterEncoding("utf-8");
					request.setCharacterEncoding("utf-8");
					String key = request.getParameter("txttim");
					//lấy dssach tu sachcontroller gui ve
					ArrayList<sanphambean> ds = (ArrayList<sanphambean>) request.getAttribute("dssanpham");
					if (ds != null) {
						int n = ds.size();
						for (int i = 0; i < n; i++) {//duyet qua tung sach
							sanphambean s = ds.get(i); //lay ra quyen sach thu i
					%>
					<a href="chitietsanphamcontroller?ctsp=<%=s.getMaSanPham()%>&maloai=<%=s.getMaLoai()%>">

						<div class="col-sm-4 col-xs-6 col-md-3 text-center"
							style="border: 2px solid #446789;border-radius:10px;">
							<img style="width: 100%;margin-top:5px; border-image: linear-gradient(to bottom, #446789, pink) 1;border: 1px solid; height: 250px;" src="<%=s.getAnh()%>">
							<div>
								<br>
								<% 		
									  long giaLong = s.getGia();
								    long chiecKhauLong = s.getChiecKhau();
								    float gia = (float) giaLong;
								    float chiecKhau = (float) chiecKhauLong;
								    float giaSauChiecKhau = gia -( gia * (chiecKhau / 100));
					
								    // Định dạng giá tiền thành dạng mong muốn
								    DecimalFormat decimalFormat = new DecimalFormat("#,###");
								    String giaFormatted = decimalFormat.format(giaSauChiecKhau);
								   %>
								<p
									style="font-size: 15px; font-weight: bold; height: 20px;color: #45a049; overflow: hidden; display: block; text-overflow: ellipsis; white-space: nowrap;"><%=s.getTenSanPham()%></p>
								<div style="display: inline-block;">
									<p style="text-decoration: line-through; opacity: 0.5;display: inline-block;">
										<%=s.getGia()%>₫</p>
									<p style="display: inline-block;"> <span style="display: block;position: absolute;color: #fff;background-color: red;font-weight:bold; top: 5px;right: 5px;border-radius: 50%;width: 40px;height: 40px;line-height:40px; text-align: center;">-<%=s.getChiecKhau() %>%</span> </p>
								</div>
								<p style="color: red; font-size: 17px;">
									Giá bán:
									<%=giaFormatted%>₫
								</p>
								<br>
								<hr>
							</div>
						</div>
					</a>

					<%
					}
					}
					%>
				</div>
			</div>
		</div>
	</div>
	<div class="pagination">
        <%
            int currentPage = (int) request.getAttribute("currentPage");
            int totalPages = (int) request.getAttribute("totalPages");

            String ml = request.getParameter("ml");
            String key1 = request.getParameter("txttim");
            String hang = request.getParameter("tenhang");
            String minGia = request.getParameter("minGia");
            String maxGiasp = request.getParameter("maxGiasp");

            String queryParams = "";
            if (ml != null) queryParams += "&ml=" + ml;
            if (key1 != null) queryParams += "&txttim=" + key1;
            if (hang != null) queryParams += "&tenhang=" + hang;
            if (minGia != null) queryParams += "&minGia=" + minGia;
            if (maxGiasp != null) queryParams += "&maxGiasp=" + maxGiasp;

            if (currentPage > 1) {
        %>
        <a href="sanphamcontroller?page=<%= currentPage - 1 %><%= queryParams %>">&laquo; Quay lại</a>
        <% 
            }
            for (int i = 1; i <= totalPages; i++) {
        %>
        <a href="sanphamcontroller?page=<%= i %><%= queryParams %>" class="<%= (i == currentPage) ? "active" : "" %>"><%= i %></a>
        <% 
            }
            if (currentPage < totalPages) {
        %>
        <a href="sanphamcontroller?page=<%= currentPage + 1 %><%= queryParams %>">Tiếp theo &raquo;</a>
        <% } %>
    </div>	
	<!-- Phần footer -->
	<div style="padding: 10px"></div>
	<ul class="animation">
      <li class="animation-li" style="--delay: 1.4s; --color: #ffff00"></li>
      <li class="animation-li" style="--delay: 1.2s; --color: #76ff03"></li>
      <li class="animation-li" style="--delay: 1s; --color: #f06292"></li>
      <li class="animation-li" style="--delay: 0.8s; --color: #4fc3f7"></li>
      <li class="animation-li" style="--delay: 0.6s; --color: #ba68c8"></li>
      <li class="animation-li" style="--delay: 0.4s; --color: #f57c00"></li>
      <li class="animation-li" style="--delay: 0.2s; --color: #673ab7"></li>
    </ul>
	<div style="padding: 10px"></div>
	<div id="footer" class="footer-contact"
		style="background-color: #446879; color: white;">
		<h2 class="section-heading" style="text-align: center;">
			LIÊN HỆ <i class="fa-solid fa-phone"></i>
		</h2>
		<div class="logo-item">
			<a class="logo logo-fb " href="https://www.facebook.com/"> <i
				class="fa-brands fa-facebook"></i>
			</a> <a class="logo logo-yt" href="https://www.youtube.com/"> <i
				class="fa-brands fa-youtube"></i>
			</a> <a class="logo logo-twitter" href=""> <i
				class="fa-brands fa-twitter"></i>
			</a> <a class="logo logo-inta"
				href="https://www.instagram.com/hvhuy_1711/"> <i
				class="fa-brands fa-instagram"></i>
			</a> <a class="logo logo-phone" href=""> <i
				class="fa-solid fa-phone-volume"></i>
			</a>
		</div>

		<div class="gird">
			<div style="border-bottom: 1px solid #ccc; color: white;" class="row">
				<div class="col-md-3 col-sm-6 col-xs-12  footer-item">
					<h1 class="footer-product footer-group" style="color: white;">Sản
						Phẩm</h1>
					<a href="#" class="footer-ao footer-group" style="color: white;">Áo</a>
					<a href="" class="footer-giay footer-group"
						style="color: white;">Thương hiệu</a> <a href="#PhuKien"
						class="footer-phukien footer-group" style="color: white;">Phụ
						Kiện</a> <a href="#tour" class="footer-ve footer-group"
						style="color: white;">Khác</a>

				</div>

				<div class="col-md-3 col-sm-6 col-xs-12  footer-item">
					<h1 class="footer-info footer-group " style="color: white;">Thông
						Tin</h1>
					<a href="#content" class="footer-fb footer-group"
						style="color: white;">Giới Thiệu</a>
					<p class="footer-fb footer-group" style="color: white;">Thông
						tin sản phẩm</p>
					<p class="footer-tw footer-group" style="color: white;">Thông
						tin khách hàng</p>
					<p class="footer-phukien footer-group" style="color: white;">Thông
						tin Liên Hệ</p>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12  footer-item">
					<h1 class="footer-tt" style="color: white;">Thanh Toán</h1>
					<a class="footer-pay"> <img src=""
						alt="" class="footer-momo-img">
						<p class="footer-text" style="color: white;">Momo</p>
					</a> <a href="" class="footer-pay"> <img
						src="" alt="" class="footer-momo-img">
						<p class="footer-text" style="color: white;">Visa</p>
					</a> <a href="" class="footer-pay"> <img
						src="" alt=""
						class="footer-momo-img">
						<p class="footer-text" style="color: white;">Vietinbank</p>
					</a> <a href="" class="footer-pay"> <img
						src="" alt=""
						class="footer-momo-img">
						<p class="footer-text" style="color: white;">Vietcombank</p>
					</a> 

				</div>

				<div class="col-md-3 col-sm-6 col-xs-12  footer-item">
					<h1 class="footer footer-group" style="color: white;">Hỗ Trợ</h1>
					<a class="footer-Evaluate footer-group js-buy-btn-Evaluate "
						style="color: white;">Đánh Giá</a>
					<div class="modal-Evaluate js-modal-Evaluate">
						<div class="modal-container-Evaluate js-modal-container-Evaluate">
							<div class="modal-close-Evaluate js-modal-close-Evaluate">
								<i class="ti-close"></i>
							</div>

							<header class="modal-header-Evaluate">
								<i class="modal-headig-icon-Evaluate ti-pencil-alt"></i> Đánh
								Giá
							</header>

							<div class="modal-body-Evaluate">
								<label for="ticket-quanlity-Evaluate"
									class="modal-label-Evaluate"> <i class="ti-comment-alt"></i>
									Chọn phần đánh giá?
								</label> <input id="ticket-quanlity-Evaluate" type="text"
									class="modal-input-Evaluate" placeholder="Nhập ở đây...">

								<label for="text-email" class="modal-label"> <i
									class="ti-pencil"></i> Nội dung đánh giá?
								</label> <input id="text-email-Evaluate" type="email"
									class="modal-input-Evaluate" placeholder="Nhập nội dung...">

								<label for="ticket-quanlity-Evaluate"
									class="modal-label-Evaluate"> <i class="ti-email"></i>
									Email liên hệ?
								</label> <input id="ticket-quanlity-Evaluate" type="text"
									class="modal-input-Evaluate" placeholder="Nhập email...">

								<button id="buy-ticket-Evaluate">
									Đánh giá <i class="ti-pencil-alt"></i>
								</button>
							</div>
							<footer class="modal-footer-Evaluate">
								<input name="mail" type="checkbox" value="mail" /> Chúng tôi sẽ
								gữi phản hồi vào email của bạn!!!<br />
								<!-- <p class="modal-help-Evaluate"> Cần <a href="">Trợ giúp?</a></p> -->
							</footer>
						</div>
					</div>

					<a href="" class="footer-DK footer-group" style="color: white;">Điều
						Khoản</a> <a href="" class="footer-PK footer-group"
						style="color: white;">Câu Hỏi Thường Gặp</a> <a href=""
						class="footer-Help footer-group" style="color: white;">Trợ
						Giúp</a>

				</div>
			</div>
			<div style="padding-top: 15px; text-align: center;">
				<div style="text-align: center;">
					<img style="width: 50px" alt="" src="baithijava/logotc4.jpg">
					<p style="font-size: 18px">Hv Huy Shop</p>
				</div>
				<span style="font-size: 20px">Cung cấp các mặt hàng chất
					lượng</span>
					<br>
				<span style="font-size: 20px">Uy tín tạo nên thương hiệu</span>
			</div>
		</div>
	</div>

</body>
</html>