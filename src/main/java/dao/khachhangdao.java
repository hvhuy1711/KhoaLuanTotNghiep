package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import GoogleLogin.UserGoogleBto;
import bean.choxacnhanbean;
import bean.khachhangthibean;
import dao.ketnoidao;

public class khachhangdao {
	public int DNGG(String name, String email, String googleId) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "INSERT INTO [dbo].[KhachHang]\r\n"
				+ "           ([HoTen]\r\n"
				+ "           ,[DiaChi]\r\n"
				+ "           ,[SoDT]\r\n"
				+ "           ,[Email]\r\n"
				+ "           ,[TenDN]\r\n"
				+ "           ,[MatKhau]\r\n"
				+ "           ,[Quyen]\r\n"
				+ "           ,[google_id])\r\n"
				+ "     VALUES\r\n"
				+ "           (?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, name);
		cmd.setString(2, null);
		cmd.setString(3, null);
		cmd.setString(4, email);
		cmd.setString(5, null);
		cmd.setString(6, null);
		cmd.setBoolean(7, false);
		cmd.setString(8, googleId);
		int rs = cmd.executeUpdate();
		return rs;
		
	}
	public khachhangthibean dntk(String tendn, String pass) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from KhachHang where TenDN = ? and MatKhau = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tendn);
		cmd.setString(2, pass);
		ResultSet rs = cmd.executeQuery();
		khachhangthibean kh = null;
		if (rs.next()) {
			String hoten = rs.getString("HoTen");
			String diachi = rs.getString("DiaChi");
			String sodt = rs.getString("SoDT");
			String email = rs.getString("Email");
			String tendnkh = rs.getString("TenDN");
			String passkh = rs.getString("MatKhau");;
			long makh = rs.getLong("MaKhachHang");
			Boolean quyen = rs.getBoolean("Quyen");
			String ggID = rs.getString("google_id");
			kh = new khachhangthibean(hoten, diachi, sodt, email, tendnkh, passkh, makh, quyen, ggID);
		}
		
		return kh;
	}
	
	public khachhangthibean dntkGG(String email, String googleID,int Quyen) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from KhachHang where email = ? and google_id = ? and Quyen = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, email);
		cmd.setString(2, googleID);
		cmd.setInt(3, Quyen);
		ResultSet rs = cmd.executeQuery();
		khachhangthibean kh = null;
		if (rs.next()) {
			String hoten = rs.getString("HoTen");
			String diachi = rs.getString("DiaChi");
			String sodt = rs.getString("SoDT");
			String emailgg = rs.getString("Email");
			String tendnkh = rs.getString("TenDN");
			String passkh = rs.getString("MatKhau");;
			long makh = rs.getLong("MaKhachHang");
			Boolean quyen = rs.getBoolean("Quyen");
			String ggID = rs.getString("google_id");
			kh = new khachhangthibean(hoten, diachi, sodt, emailgg, tendnkh, passkh, makh, quyen, ggID);
		}
		return kh;
	}
	
	public ArrayList<String> getTenDN() throws Exception{
		 ArrayList<String> listTenDN = new ArrayList<>(); // Changed to ArrayList<String>

		    ketnoidao kn = new ketnoidao();
		    kn.ketnoi();
		    String sql = "SELECT DISTINCT TenDN\r\n"
		    		+ "FROM KhachHang";
		    PreparedStatement cmd = kn.cn.prepareStatement(sql);

		    ResultSet rs = cmd.executeQuery();

		    while (rs.next()) {
		        String tenDn = rs.getString("TenDN");
		        listTenDN.add(tenDn); // Add Hang value to the list
		    }

		    rs.close();
		    kn.cn.close();
		    return listTenDN; 
	}
	
	public int dktk(String hoten, String diachi, String sodt, String email,
			String tendn, String pass, boolean quyen,String google_id) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "\r\n"
				+ "INSERT INTO [dbo].[KhachHang]\r\n"
				+ "           ([HoTen]\r\n"
				+ "           ,[DiaChi]\r\n"
				+ "           ,[SoDT]\r\n"
				+ "           ,[Email]\r\n"
				+ "           ,[TenDN]\r\n"
				+ "           ,[MatKhau]\r\n"
				+ "           ,[Quyen]\r\n"
				+ "           ,[google_id])\r\n"
				+ "     VALUES\r\n"
				+ "           (?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, hoten);
		cmd.setString(2, diachi);
		cmd.setString(3, sodt);
		cmd.setString(4, email);
		cmd.setString(5, tendn);
		cmd.setString(6, pass);
		cmd.setBoolean(7, quyen);
		cmd.setString(8, google_id);
		int rs = cmd.executeUpdate();
		return rs;
	}
	
	public ArrayList<khachhangthibean> htkhachhang() throws Exception{
		ArrayList<khachhangthibean> dskhachhang = new ArrayList<khachhangthibean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from KhachHang ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			String hoten = rs.getString("HoTen");
			String diachi = rs.getString("DiaChi");
			String sodt = rs.getString("SoDT");
			String email = rs.getString("Email");
			String tendnkh = rs.getString("TenDN");
			String passkh = rs.getString("MatKhau");;
			long makh = rs.getLong("MaKhachHang");
			Boolean quyen = rs.getBoolean("Quyen");
			String ggID = rs.getString("google_id");
			dskhachhang.add( new khachhangthibean(hoten, diachi, sodt, email, tendnkh, passkh, makh, quyen, ggID));
		}
		rs.close();
		kn.cn.close();
		return dskhachhang;
	}
	
	public ArrayList<khachhangthibean> getAllkhachhang() throws Exception{
		ArrayList<khachhangthibean> dskhachhang = new ArrayList<khachhangthibean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from KhachHang where Quyen = 0 ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			String hoten = rs.getString("HoTen");
			String diachi = rs.getString("DiaChi");
			String sodt = rs.getString("SoDT");
			String email = rs.getString("Email");
			String tendnkh = rs.getString("TenDN");
			String passkh = rs.getString("MatKhau");;
			long makh = rs.getLong("MaKhachHang");
			Boolean quyen = rs.getBoolean("Quyen");
			String ggID = rs.getString("google_id");
			dskhachhang.add( new khachhangthibean(hoten, diachi, sodt, email, tendnkh, passkh, makh, quyen, ggID));
		}
		rs.close();
		kn.cn.close();
		return dskhachhang;
	}
	
	public khachhangthibean get1KhachHang(long MaKhachHang) throws Exception{
		khachhangthibean kh = null;
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from KhachHang where MaKhachHang = ? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, MaKhachHang);
		ResultSet rs = cmd.executeQuery();
		if (rs.next()) {
			String hoten = rs.getString("HoTen");
			String diachi = rs.getString("DiaChi");
			String sodt = rs.getString("SoDT");
			String email = rs.getString("Email");
			String tendnkh = rs.getString("TenDN");
			String passkh = rs.getString("MatKhau");;
			long makh = rs.getLong("MaKhachHang");
			Boolean quyen = rs.getBoolean("Quyen");
			String ggID = rs.getString("google_id");
			kh = new khachhangthibean(hoten, diachi, sodt, email, tendnkh, passkh, makh, quyen, ggID);
		}
		rs.close();
		kn.cn.close();
		return kh;
	}
	
	
	public int xoatk(int MaKhachHang) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "delete from KhachHang where MaKhachHang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, MaKhachHang);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();kn.cn.close();
		return kq;
			
	}
	
	public ArrayList<khachhangthibean> dsthongtin(long MaKhachHang) throws Exception{
		ArrayList<khachhangthibean> dsthongtin = new ArrayList<khachhangthibean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select MaKhachHang,HoTen, DiaChi, SoDT, Email, TenDN, MatKhau,Quyen from KhachHang where MaKhachHang= ?  ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, MaKhachHang);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String hoten = rs.getString("HoTen");
			String diachi = rs.getString("DiaChi");
			String sodt = rs.getString("SoDT");
			String email = rs.getString("Email");
			String tendnkh = rs.getString("TenDN");
			String passkh = rs.getString("MatKhau");;
			long makh = rs.getLong("MaKhachHang");
			Boolean quyen = rs.getBoolean("Quyen");
			String ggID = rs.getString("google_id");
			dsthongtin.add(new khachhangthibean(hoten, diachi, sodt, email, tendnkh, passkh, makh, quyen, ggID));
		}
		rs.close();
		kn.cn.close();
		return dsthongtin;
	}
	
	public boolean ktggID(String googleID) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		 String sql = "SELECT COUNT(*) FROM KhachHang WHERE google_id = ?";
		  PreparedStatement cmd = kn.cn.prepareStatement(sql);
		  cmd.setString(1, googleID);

		  // Thực thi câu lệnh SQL và lấy kết quả
		  ResultSet rs = cmd.executeQuery();
		  rs.next();
		  int count = rs.getInt(1);

		  // Đóng kết nối cơ sở dữ liệu
		  kn.cn.close();

		  // Trả về kết quả
		  return count > 0;
	}
	
	public int UpdateTTKH(long MaKhachHang, String Hoten, String SoDT, String Diachi) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "update KhachHang set HoTen = ?, DiaChi = ?,SoDT = ? where MaKhachHang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, Hoten);
		cmd.setString(2, Diachi);
		cmd.setString(3, SoDT);
		cmd.setLong(4, MaKhachHang);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();kn.cn.close();
		return kq;
	}
	
	public int UpdateTTKHEmail(long MaKhachHang, String Hoten, String SoDT, String Diachi ,String email) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "update KhachHang set HoTen = ?, DiaChi = ?,SoDT = ?,Email=? where MaKhachHang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, Hoten);
		cmd.setString(2, Diachi);
		cmd.setString(3, SoDT);
		cmd.setString(4, email);
		cmd.setLong(5, MaKhachHang);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();kn.cn.close();
		return kq;
	}
	
	public int DoiPass(long MaKhachHang, String MatKhau) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "update KhachHang set MatKhau = ? where MaKhachHang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, MatKhau);
		cmd.setLong(2, MaKhachHang);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();kn.cn.close();
		return kq;
	}

}
