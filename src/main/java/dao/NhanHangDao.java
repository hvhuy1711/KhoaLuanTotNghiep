package dao;

import java.sql.PreparedStatement;

public class NhanHangDao {

	public int ThemNhanHang( int MaNhanHang,String TenNguoiNhan, String DiaChiNhan,String SoDienThoai,String Email,String GhiChu,int TrangThai,int MaHoaDon) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "INSERT INTO [dbo].[NhanHang]\r\n"
				+ "           ([TenNguoiNhan]\r\n"
				+ "           ,[DiaChiNhan]\r\n"
				+ "           ,[SoDienThoai]\r\n"
				+ "           ,[Email]\r\n"
				+ "           ,[GhiChu]\r\n"
				+ "           ,[TrangThai]\r\n"
				+ "           ,[MaHoaDon])\r\n"
				+ "     VALUES\r\n"
				+ "           ?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, MaNhanHang);
		cmd.setString(2, TenNguoiNhan);
		cmd.setString(3, DiaChiNhan);
		cmd.setString(4, SoDienThoai);
		cmd.setString(5, Email);
		cmd.setString(6, GhiChu);
		cmd.setInt(7, TrangThai);
		cmd.setInt(8, MaHoaDon);
		int rs = cmd.executeUpdate();
		return rs;
	}
	
//	public int UpdateNhanHang(int MaNhanHang,String TenNguoiNhan, String DiaChiNhan,String SoDienThoai,String Email,String GhiChu,int TrangThai,int MaHoaDon) throws Exception{
//		ketnoidao kn = new ketnoidao();
//		kn.ketnoi();
//		String sql = "UPDATE [dbo].[NhanHang]\r\n"
//				+ "   SET [TenNguoiNhan] = ?\r\n"
//				+ "      ,[DiaChiNhan] = ?\r\n"
//				+ "      ,[SoDienThoai] = ?\r\n"
//				+ "      ,[Email] = ?\r\n"
//				+ "      ,[GhiChu] = ?\r\n"
//				+ "      ,[TrangThai] = ?\r\n"
//				+ "      ,[MaHoaDon] = ?\r\n"
//				+ " WHERE <Search Conditions,,>";
//		PreparedStatement cmd = kn.cn.prepareStatement(sql);
//		cmd.setString(1, Hoten);
//		cmd.setString(2, Diachi);
//		cmd.setString(3, SoDT);
//		cmd.setLong(4, MaKhachHang);
//		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
//		//b6 : Dong rs va ket noi
//		cmd.close();kn.cn.close();
//		return kq;
//	}
}
