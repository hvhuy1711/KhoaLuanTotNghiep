package dao;

import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ChiTietHoaDonDao {
	public int ThemCTHD(int MaHoaDon,int MaGioHang, long DaMua, String GhichuCT , long DongiaSP, int SoLuongMua) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "INSERT INTO [dbo].[ChiTietHD]\r\n"
				+ "           ([MaHoaDon]\r\n"
				+ "           ,[MaSanPham]\r\n"
				+ "           ,[TrangThaiCT]\r\n"
				+ "           ,[GhiChuChiTiet]\r\n"
				+ "           ,[DonGiaSP]\r\n"
				+ "           ,[SoLuongMua])\r\n"
				+ "     VALUES\r\n"
				+ "           (?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, MaHoaDon);
		cmd.setInt(2, MaGioHang);
		cmd.setLong(3, DaMua);
		cmd.setString(4, GhichuCT);
		cmd.setLong(5, DongiaSP);
		cmd.setInt(6, SoLuongMua);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();kn.cn.close();
		return kq;
	}
}
