package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.DanhGiaBean;


public class DanhGiaDao {
	public int DanhGiaSP(long MaKhachHang, int MaSanPham, int SoSao, String NoiDung, boolean IsDanhGia) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "INSERT INTO [dbo].[DanhGia]\r\n"
				+ "           ([MaKhachHang]\r\n"
				+ "           ,[MaSanPham]\r\n"
				+ "           ,[SoSao]\r\n"
				+ "           ,[NoiDungDanhGia]\r\n"
				+ "           ,[NgayDanhGia]\r\n"
				+ "           ,[IsDanhGia])\r\n"
				+ "     VALUES\r\n"
				+ "           (?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, MaKhachHang);
		cmd.setInt(2, MaSanPham);
		cmd.setInt(3, SoSao);
		cmd.setString(4, NoiDung);
		Date n1 = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		//Doi ngay util theo dung dinh dang
		String tam=dd.format(n1); //"2023-07-27"
		Date n2 = dd.parse(tam);//Doi chuoi ra ngay util
		//Doi ngay util sang ngay sql va dua vào tham so
		cmd.setDate(5, new java.sql.Date(n2.getTime()));
		cmd.setBoolean(6, IsDanhGia);
		int rs = cmd.executeUpdate();
		return rs;
	}
	
	public ArrayList<DanhGiaBean> GetDsDanhGia(int MaSanPham) throws Exception{
		ArrayList<DanhGiaBean> dsDG = new ArrayList<DanhGiaBean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from DanhGia where MaSanPham = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, MaSanPham);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int MaDanhGia = rs.getInt("MaDanhGia");
			int MaKhachHang = rs.getInt("MaKhachHang");
			int masp = rs.getInt("MaSanPham");
			int SoSao = rs.getInt("SoSao");
			String NoiDungDanhGia = rs.getString("NoiDungDanhGia");
			Date NgayDanhGia = rs.getDate("NgayDanhGia");;
			Boolean IsDanhGia = rs.getBoolean("IsDanhGia");
			dsDG.add(new DanhGiaBean(MaDanhGia, MaKhachHang, masp, SoSao, NoiDungDanhGia, NgayDanhGia, IsDanhGia) );
		}
		rs.close();
		kn.cn.close();
		return dsDG;
	}
}
