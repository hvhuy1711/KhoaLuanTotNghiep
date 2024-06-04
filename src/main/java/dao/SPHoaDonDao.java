package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.SPHoaDonBean;

public class SPHoaDonDao {
	public ArrayList<SPHoaDonBean> getHoaDon(long MaKhachHang) throws Exception{
		ArrayList<SPHoaDonBean> ds = new ArrayList<SPHoaDonBean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "SELECT TOP 1000 [MaChiTiet]\r\n"
				+ "      ,[GhiChuChiTiet]\r\n"
				+ "      ,[MaHoaDon]\r\n"
				+ "      ,[MaSanPham]\r\n"
				+ "      ,[TenSanPham]\r\n"
				+ "      ,[MaKhachHang]\r\n"
				+ "      ,[NgayMua]\r\n"
				+ "      ,[TrangThaiDon]\r\n"
				+ "      ,[Anh]\r\n"
				+ "  FROM [QLHvhShop].[dbo].[ViewSPHoaDon] where MaKhachHang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, MaKhachHang); 
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int MaChiTiet = rs.getInt("MaChiTiet");
			String GhiChuCT = rs.getString("GhiChuChiTiet");
			int MaHoaDon = rs.getInt("MaHoaDon");
			int MaSanPham = rs.getInt("MaSanPham");
			String TenSanPham = rs.getString("TenSanPham");
			long makh = rs.getLong("MaKhachHang");
			Date NgayMua = rs.getDate("NgayMua");
			int TrangThaiDon = rs.getInt("TrangThaiDon");
			String Anh = rs.getString("Anh");
			ds.add(new SPHoaDonBean(MaChiTiet, GhiChuCT, MaHoaDon, MaSanPham, TenSanPham, makh, NgayMua, TrangThaiDon, Anh));
		}
		rs.close();
		cmd.close();
		kn.cn.close();
		return ds;
	}
}
