package dao;

import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class LichSuDao {
	public int ThemLichSu( long MaKhachHang, int MaHoaDon , String TongTien, int TrangThaiLS,String GhiChuLS) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "INSERT INTO [dbo].[LichSuMua]\r\n"
				+ "           ([MaKhachHang]\r\n"
				+ "           ,[MaHoaDon]\r\n"
				+ "           ,[NgayMua]\r\n"
				+ "           ,[TongTien]\r\n"
				+ "           ,[TrangThai]\r\n"
				+ "           ,[GhiChuLS])\r\n"
				+ "     VALUES\r\n"
				+ "           (?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, MaKhachHang);
		cmd.setInt(2, MaHoaDon);
		Date n1 = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		//Doi ngay util theo dung dinh dang
		String tam=dd.format(n1); //"2023-07-27"
		Date n2 = dd.parse(tam);//Doi chuoi ra ngay util
		//Doi ngay util sang ngay sql va dua vào tham so
		cmd.setDate(3, new java.sql.Date(n2.getTime()));
		cmd.setString(4, TongTien);
		cmd.setInt(5, TrangThaiLS);
		cmd.setString(6, GhiChuLS);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();kn.cn.close();
		return kq;
	}
}
