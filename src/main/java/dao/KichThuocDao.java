package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.KichThuocBean;
import bean.khachhangthibean;


public class KichThuocDao {
	
	public ArrayList<KichThuocBean> getDSKT() throws Exception{
		ArrayList<KichThuocBean> dskt = new ArrayList<KichThuocBean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from KichThuoc";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int MaKichThuoc = rs.getInt("MaKichThuoc");
			String tenKichThuoc = rs.getString("TenKichThuoc");
			int masp = rs.getInt("MaSanPham");
			int soluongsize = rs.getInt("SoLuongSize");
			dskt.add(new KichThuocBean(MaKichThuoc, tenKichThuoc, masp, soluongsize));
		}
		rs.close();
		kn.cn.close();
		return dskt;
	}

	public ArrayList<KichThuocBean> dskichThuoc(int MaSanPham) throws Exception{
		ArrayList<KichThuocBean> dskt = new ArrayList<KichThuocBean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from KichThuoc where MaSanPham= ? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, MaSanPham);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int MaKichThuoc = rs.getInt("MaKichThuoc");
			String tenKichThuoc = rs.getString("TenKichThuoc");
			int masp = rs.getInt("MaSanPham");
			int soluongsize = rs.getInt("SoLuongSize");
			dskt.add(new KichThuocBean(MaKichThuoc, tenKichThuoc, masp, soluongsize));
		}
		rs.close();
		kn.cn.close();
		return dskt;
	}
	public int ThemKichThuoc(String TenKichThuoc, int MaSanPham, int SoLuongSize) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "INSERT INTO [dbo].[KichThuoc]\r\n"
				+ "           ([TenKichThuoc]\r\n"
				+ "           ,[MaSanPham]\r\n"
				+ "           ,[SoLuongSize])\r\n"
				+ "     VALUES\r\n"
				+ "           (?\r\n"
				+ "           ,?\r\n"
				+ "           ,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, TenKichThuoc);
		cmd.setInt(2, MaSanPham);
		cmd.setInt(3, SoLuongSize);
		int rs = cmd.executeUpdate();
		return rs;
	}
	public int UpdateKTSize(int MaSanPham, int SoLuongSize, String TenKichThuoc) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "UPDATE [dbo].[KichThuoc]\r\n"
				+ "   SET [SoLuongSize] = ?\r\n"
				+ " WHERE [TenKichThuoc] = ?\r\n"
				+ "      and [MaSanPham] = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, SoLuongSize);
		cmd.setString(2, TenKichThuoc);
		cmd.setInt(3, MaSanPham);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();kn.cn.close();
		return kq;
	}
	public int XoaKichThuoc(int MaKichThuoc) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "DELETE FROM [dbo].[KichThuoc]\r\n"
				+ "      WHERE MaKichThuoc = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, MaKichThuoc);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();kn.cn.close();
		return kq;
	}
	
	public int UpdateSLMua(int MaSanPham, int SoLuongMua, String TenKichThuoc) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "UPDATE [dbo].[KichThuoc]\r\n"
				+ "   SET [SoLuongSize] = ?\r\n"
				+ " WHERE [TenKichThuoc] = ?\r\n"
				+ "      and [MaSanPham] = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, SoLuongMua);
		cmd.setString(2, TenKichThuoc);
		cmd.setInt(3, MaSanPham);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();kn.cn.close();
		return kq;
	}
	
	
	
}
