package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.DonHangDaDatBean;
import bean.ThongKeBean;

public class ThongKeDao {
	public ArrayList<ThongKeBean> GetThongKe() throws Exception {
		ArrayList<ThongKeBean> ds = new ArrayList<ThongKeBean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "SELECT TOP 1000 [MaLoai]\r\n"
				+ "      ,[TenLoai]\r\n"
				+ "      ,[MaSanPham]\r\n"
				+ "      ,[TenSanPham]\r\n"
				+ "      ,[GiaNhap]\r\n"
				+ "      ,[Gia]\r\n"
				+ "      ,[ChiecKhau]\r\n"
				+ "      ,[Anh]\r\n"
				+ "      ,[Hang]\r\n"
				+ "      ,[NgayNhap]\r\n"
				+ "      ,[MoTaSanPham]\r\n"
				+ "      ,[MaKichThuoc]\r\n"
				+ "      ,[TenKichThuoc]\r\n"
				+ "      ,[SoLuongSize]\r\n"
				+ "      ,[TenAnh1]\r\n"
				+ "      ,[MaAnh]\r\n"
				+ "  FROM [QLHvhShop].[dbo].[ViewThongKe]";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int MaLoai = rs.getInt("MaLoai");
			String TenLoai = rs.getString("TenLoai");
			int MaSanpham = rs.getInt("MaSanpham");
			String TenSanPham = rs.getString("TenSanPham");
			long GiaNhap = rs.getLong("GiaNhap");
			long Gia = rs.getLong("Gia");
			long ChiecKhau = rs.getLong("ChiecKhau");
			String Anh = rs.getString("Anh");
			String Hang = rs.getString("Hang");
			Date NgayNhap = rs.getDate("NgayNhap");
			String MoTaSanPham = rs.getString("MoTaSanPham");
			int MaKichThuoc =  rs.getInt("MaKichThuoc");
			String TenKichThuoc = rs.getString("TenKichThuoc");
			int SoLuongSize =  rs.getInt("SoLuongSize");
			String TenAnh1 = rs.getString("TenAnh1");
			int MaAnh = rs.getInt("MaAnh");
			ds.add(new ThongKeBean(MaLoai, TenLoai, MaSanpham, TenSanPham, GiaNhap, Gia, ChiecKhau, Anh, Hang, NgayNhap, MoTaSanPham, MaKichThuoc, TenKichThuoc, SoLuongSize, TenAnh1, MaAnh));
		}
		rs.close();
		cmd.close();
		kn.cn.close();
		return ds;
	}
}
