package dao;

import dao.ketnoidao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import GoogleLogin.LoginGoogleHander;
import GoogleLogin.UserGoogleBto;
import bean.khachhangthibean;
public class LoginDao {
	public int ThemUser(UserGoogleBto googleBto) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		khachhangthibean kh = new khachhangthibean();
		String sql = "insert into KhachHang(HoTen,DiaChi,SoDT,Email,TenDN,MatKhau,Quyen) values (?,?,?,?,?,?,?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//Truyen 4 tham so vao cau lenh sql
		cmd.setString(1, googleBto.getFamily_name());
		cmd.setString(2, null);
		cmd.setString(3, null);
		cmd.setString(4,googleBto.getEmail());
		cmd.setString(5, null);
		cmd.setString(6, null);
		cmd.setLong(7, kh.getMaKhachHang());
		cmd.setBoolean(8, false);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();kn.cn.close();
		return kq;
	}
}
