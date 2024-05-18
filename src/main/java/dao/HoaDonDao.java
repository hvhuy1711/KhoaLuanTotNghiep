package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.HoaDonBean;
import bean.khachhangthibean;
import bean.sanphamfullbean;

public class HoaDonDao {
	public int ThemHD(long MaKhacHang, int TrangThaiDon) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "INSERT INTO [dbo].[HoaDon]\r\n"
				+ "           ([MaKhachHang]\r\n"
				+ "           ,[NgayMua]\r\n"
				+ "           ,[TrangThaiDon])\r\n"
				+ "     VALUES\r\n"
				+ "            (?\r\n"
				+ "           ,?\r\n"
				+ "           ,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, MaKhacHang);
		Date n1 = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		//Doi ngay util theo dung dinh dang
		String tam=dd.format(n1); //"2023-07-27"
		Date n2 = dd.parse(tam);//Doi chuoi ra ngay util
		//Doi ngay util sang ngay sql va dua vào tham so
		cmd.setDate(2, new java.sql.Date(n2.getTime()));
		cmd.setInt(3, TrangThaiDon);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();
		kn.cn.close();
		return kq;
	}
	

public ArrayList<HoaDonBean> GetDSHoaDon(long MaKhachHang) throws Exception{
	ArrayList<HoaDonBean> hd = new ArrayList<HoaDonBean>();
	ketnoidao kn = new ketnoidao();
	kn.ketnoi();
	String sql = "select * from HoaDon where MaKhachHang = ?";
	PreparedStatement cmd = kn.cn.prepareStatement(sql);
	cmd.setLong(1, MaKhachHang); // Gán giá trị tham số
	ResultSet rs = cmd.executeQuery();
	while (rs.next()) {
		int MaHoaDon = rs.getInt("MaHoaDon");
		long makh = rs.getLong("MaKhachHang");
		Date NgayMua =rs.getDate("NgayMua");
		int TrangThai = rs.getInt("TrangThaiDon");
		hd.add(new HoaDonBean(MaHoaDon, makh, NgayMua, TrangThai));
	}
	rs.close();
	cmd.close();
	kn.cn.close();
	return hd;
}

	public HoaDonBean GetHoaDon(long MaKhachHang) throws Exception{
		HoaDonBean hd = null;
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from HoaDon where MaKhachHang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setLong(1, MaKhachHang); // Gán giá trị tham số
	    ResultSet rs = cmd.executeQuery();
	    if (rs.next()) {
			int MaHoaDon = rs.getInt("MaHoaDon");
			long makh = rs.getLong("MaKhachHang");
			Date NgayMua =rs.getDate("NgayMua");
			int TrangThai = rs.getInt("TrangThaiDon");
			hd = new HoaDonBean(MaHoaDon, makh, NgayMua, TrangThai);
		}
	    rs.close();
	    cmd.close();
	    kn.cn.close();
		return hd;
	}
}
