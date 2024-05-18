package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.AnhBean;
import bean.HoaDonBean;

public class AnhDao {
	
	public ArrayList<AnhBean> getAnh() throws Exception{
		ArrayList<AnhBean> dsanh = new ArrayList<AnhBean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "SELECT *\r\n"
				+ "  FROM [dbo].[Anh]";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int MaAnh = rs.getInt("MaAnh");
			String TenAnh = rs.getString("TenAnh1");
			int masp = rs.getInt("MaSanPham");
			dsanh.add(new AnhBean(MaAnh, TenAnh, masp));
		}
		rs.close();
		cmd.close();
		kn.cn.close();
		return dsanh;
	}
	public ArrayList<AnhBean> getdsAnh(int MaSanPham) throws Exception{
		ArrayList<AnhBean> dsanh = new ArrayList<AnhBean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "SELECT *\r\n"
				+ "  FROM [dbo].[Anh] where MaSanPham= ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, MaSanPham); // Gán giá trị tham số
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int MaAnh = rs.getInt("MaAnh");
			String TenAnh = rs.getString("TenAnh1");
			int masp = rs.getInt("MaSanPham");
			dsanh.add(new AnhBean(MaAnh, TenAnh, masp));
		}
		rs.close();
		cmd.close();
		kn.cn.close();
		return dsanh;
	}
	
	public int ThemAnh(int MaSanPham ,String Anh) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "INSERT INTO [dbo].[Anh]\r\n"
				+ "           ([TenAnh1]\r\n"
				+ "           ,[MaSanPham])\r\n"
				+ "     VALUES\r\n"
				+ "           (?\r\n"
				+ "           ,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, Anh);
		cmd.setInt(2, MaSanPham);
		int rs = cmd.executeUpdate();
		return rs;
	}
	
	public int XoaAnhChon(int MaAnh) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "DELETE FROM [dbo].[Anh]\r\n"
				+ "      WHERE MaAnh = ? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, MaAnh);
		int rs = cmd.executeUpdate();
		return rs;
	}
}
