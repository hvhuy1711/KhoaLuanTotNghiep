package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;

import bean.giospbean;
import bean.sanphamfullbean;
public class giospdao {
	
	public ArrayList<giospbean> getAlldsgio()throws Exception{
		ArrayList<giospbean> ds = new ArrayList<giospbean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "SELECT dbo.SanPham.MaSanPham, dbo.SanPham.TenSanPham, dbo.SanPham.GiaNhap, dbo.SanPham.Gia, "
				+ "dbo.SanPham.ChiecKhau, dbo.SanPham.Anh, dbo.SanPham.Hang, dbo.SanPham.MaLoai, dbo.SanPham.NgayNhap, "
				+ "dbo.SanPham.MoTaSanPham, dbo.GioHang.MaGioHang, \r\n"
				+ "             dbo.GioHang.MaKhachHang, dbo.GioHang.SoLuongMua, dbo.GioHang.DonGia, dbo.GioHang.GhiChu\r\n"
				+ "FROM   dbo.GioHang INNER JOIN\r\n"
				+ "             dbo.SanPham ON dbo.GioHang.MaSanPham = dbo.SanPham.MaSanPham";
		 PreparedStatement cmd = kn.cn.prepareStatement(sql);
		    ResultSet rs = cmd.executeQuery();
		    while (rs.next()) {
		    	int masp = rs.getInt("MaSanPham");
		    	String tenSp = rs.getString("TenSanPham");
		    	long soLuong = rs.getLong("GiaNhap");
		    	long Gia = rs.getLong("Gia");
		    	long ChiecKhau = rs.getLong("ChiecKhau");
				String anh = rs.getString("Anh");
				String Hang = rs.getString("Hang");
				int MaLoai = rs.getInt("MaLoai");
				Date NgayNhap = rs.getDate("NgayNhap");
				String Mota = rs.getString("MoTaSanPham");
				int magh = rs.getInt("MaGioHang");
				long makh = rs.getLong("MaKhachHang");
				long slmua = rs.getLong("SoLuongMua");
				long donGia = rs.getLong("DonGia");
				String GhiChu = rs.getString("GhiChu");
				ds.add(new giospbean(masp, tenSp, soLuong, Gia, ChiecKhau, anh, MaLoai, Hang, NgayNhap, Mota, magh, makh, slmua, donGia, GhiChu, Gia*slmua));	
		    }
		    rs.close();
		    cmd.close();
		    kn.cn.close();
		    return ds;
	}
	public ArrayList<giospbean> getdsgio(long MaKhachHang) throws Exception{
		ArrayList<giospbean> ds = new ArrayList<giospbean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "SELECT dbo.SanPham.MaSanPham, dbo.SanPham.TenSanPham, dbo.SanPham.GiaNhap, dbo.SanPham.Gia, "
				+ "dbo.SanPham.ChiecKhau, dbo.SanPham.Anh, dbo.SanPham.Hang, dbo.SanPham.MaLoai, dbo.SanPham.NgayNhap, "
				+ "dbo.SanPham.MoTaSanPham, dbo.GioHang.MaGioHang, \r\n"
				+ "             dbo.GioHang.MaKhachHang, dbo.GioHang.SoLuongMua, dbo.GioHang.DonGia, dbo.GioHang.GhiChu\r\n"
				+ "FROM   dbo.GioHang INNER JOIN\r\n"
				+ "             dbo.SanPham ON dbo.GioHang.MaSanPham = dbo.SanPham.MaSanPham"
				+ "				where dbo.GioHang.MaKhachHang = ?";
		 PreparedStatement cmd = kn.cn.prepareStatement(sql);
		    cmd.setLong(1, MaKhachHang); 
		    ResultSet rs = cmd.executeQuery();
		    while (rs.next()) {
		    	int masp = rs.getInt("MaSanPham");
		    	String tenSp = rs.getString("TenSanPham");
		    	long soLuong = rs.getLong("GiaNhap");
		    	long Gia = rs.getLong("Gia");
		    	long ChiecKhau = rs.getLong("ChiecKhau");
				String anh = rs.getString("Anh");
				String Hang = rs.getString("Hang");
				int MaLoai = rs.getInt("MaLoai");
				Date NgayNhap = rs.getDate("NgayNhap");
				String Mota = rs.getString("MoTaSanPham");
				int magh = rs.getInt("MaGioHang");
				long makh = rs.getLong("MaKhachHang");
				long slmua = rs.getLong("SoLuongMua");
				long donGia = rs.getLong("DonGia");
				String GhiChu = rs.getString("GhiChu");
				ds.add(new giospbean(masp, tenSp, soLuong, Gia, ChiecKhau, anh, MaLoai, Hang, NgayNhap, Mota, magh, makh, slmua, donGia, GhiChu, Gia*slmua));	
		    }
		    rs.close();
		    cmd.close();
		    kn.cn.close();
		    return ds;
	}
	
	public ArrayList<giospbean> getdsgio1SP(long MaKhachHang, int MaSanPham, String GhiChu) throws Exception{
		ArrayList<giospbean> ds = new ArrayList<giospbean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "SELECT dbo.SanPham.MaSanPham, dbo.SanPham.TenSanPham, dbo.SanPham.GiaNhap, dbo.SanPham.Gia, "
				+ "dbo.SanPham.ChiecKhau, dbo.SanPham.Anh, dbo.SanPham.Hang, dbo.SanPham.MaLoai, dbo.SanPham.NgayNhap, "
				+ "dbo.SanPham.MoTaSanPham, dbo.GioHang.MaGioHang, \r\n"
				+ "             dbo.GioHang.MaKhachHang, dbo.GioHang.SoLuongMua, dbo.GioHang.DonGia, dbo.GioHang.GhiChu\r\n"
				+ "FROM   dbo.GioHang INNER JOIN\r\n"
				+ "             dbo.SanPham ON dbo.GioHang.MaSanPham = dbo.SanPham.MaSanPham"
				+ "				where dbo.GioHang.MaKhachHang = ? and dbo.SanPham.MaSanPham =? and dbo.GioHang.GhiChu =? ";
		 PreparedStatement cmd = kn.cn.prepareStatement(sql);
		    cmd.setLong(1, MaKhachHang); 
		    cmd.setInt(2, MaSanPham);
		    cmd.setString(3, GhiChu);
		    ResultSet rs = cmd.executeQuery();
		    while (rs.next()) {
		    	int masp = rs.getInt("MaSanPham");
		    	String tenSp = rs.getString("TenSanPham");
		    	long soLuong = rs.getLong("GiaNhap");
		    	long Gia = rs.getLong("Gia");
		    	long ChiecKhau = rs.getLong("ChiecKhau");
				String anh = rs.getString("Anh");
				String Hang = rs.getString("Hang");
				int MaLoai = rs.getInt("MaLoai");
				Date NgayNhap = rs.getDate("NgayNhap");
				String Mota = rs.getString("MoTaSanPham");
				int magh = rs.getInt("MaGioHang");
				long makh = rs.getLong("MaKhachHang");
				long slmua = rs.getLong("SoLuongMua");
				long donGia = rs.getLong("DonGia");
				String GhiChu1 = rs.getString("GhiChu");
				ds.add(new giospbean(masp, tenSp, soLuong, Gia, ChiecKhau, anh, MaLoai, Hang, NgayNhap, Mota, magh, makh, slmua, donGia, GhiChu1, Gia*slmua));	
		    }
		    rs.close();
		    cmd.close();
		    kn.cn.close();
		    return ds;
	}
	
	public giospbean get1spgio(long MaKhachHang,int MaSanPham) throws Exception{
		giospbean gio = null;
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "SELECT dbo.SanPham.MaSanPham, dbo.SanPham.TenSanPham, dbo.SanPham.GiaNhap, dbo.SanPham.Gia, "
				+ "dbo.SanPham.ChiecKhau, dbo.SanPham.Anh, dbo.SanPham.Hang, dbo.SanPham.MaLoai, dbo.SanPham.NgayNhap, "
				+ "dbo.SanPham.MoTaSanPham, dbo.GioHang.MaGioHang, \r\n"
				+ "             dbo.GioHang.MaKhachHang, dbo.GioHang.SoLuongMua, dbo.GioHang.DonGia, dbo.GioHang.GhiChu\r\n"
				+ "FROM   dbo.GioHang INNER JOIN\r\n"
				+ "             dbo.SanPham ON dbo.GioHang.MaSanPham = dbo.SanPham.MaSanPham"
				+ "				where dbo.GioHang.MaKhachHang = ? and dbo.SanPham.MaSanPham = ?";
		 PreparedStatement cmd = kn.cn.prepareStatement(sql);
		    cmd.setLong(1, MaKhachHang); 
		    cmd.setLong(2, MaSanPham);
		    ResultSet rs = cmd.executeQuery();
		    if (rs.next()) {
		    	int masp = rs.getInt("MaSanPham");
		    	String tenSp = rs.getString("TenSanPham");
		    	long soLuong = rs.getLong("GiaNhap");
		    	long Gia = rs.getLong("Gia");
		    	long ChiecKhau = rs.getLong("ChiecKhau");
				String anh = rs.getString("Anh");
				String Hang = rs.getString("Hang");
				int MaLoai = rs.getInt("MaLoai");
				Date NgayNhap = rs.getDate("NgayNhap");
				String Mota = rs.getString("MoTaSanPham");
				int magh = rs.getInt("MaGioHang");
				long makh = rs.getLong("MaKhachHang");
				long slmua = rs.getLong("SoLuongMua");
				long donGia = rs.getLong("DonGia");
				String GhiChu = rs.getString("GhiChu");
				gio = new giospbean(masp, tenSp, soLuong, Gia, ChiecKhau, anh, MaLoai, Hang, NgayNhap, Mota, magh, makh, slmua, donGia, GhiChu, donGia);
				}
		    rs.close();
		    cmd.close();
		    kn.cn.close();
		    return gio;
	}
	
	
	public int ThemSpGio(int MaKhachHang, int MaSanPham, long SoLuongMua, long DonGia,String GhiChu) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "INSERT INTO [dbo].[GioHang]\r\n"
				+ "           ([MaKhachHang]\r\n"
				+ "           ,[MaSanPham]\r\n"
				+ "           ,[SoLuongMua]\r\n"
				+ "           ,[DonGia]\r\n"
				+ "           ,[GhiChu])\r\n"
				+ "     VALUES\r\n"
				+ "           (?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, MaKhachHang);
		cmd.setInt(2, MaSanPham);
		cmd.setLong(3, SoLuongMua);
		cmd.setLong(4, DonGia);
		cmd.setString(5, GhiChu);
		
		int kq = cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
	}
	
	public int UpdateGio(int MaSanPham, long SoLuongMua, String GhiChu) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "UPDATE [dbo].[GioHang]\r\n"
				+ "   SET [SoLuongMua] = ?\r\n"
				+ " WHERE MaSanPham = ? and GhiChu = ?";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, SoLuongMua);
		cmd.setLong(2, MaSanPham);
		cmd.setString(3, GhiChu);
		int kq = cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
	}
	public int UpdateGioKT(int MaSanPham, String GhiChu) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "UPDATE [dbo].[GioHang]\r\n"
				+ "   SET [GhiChu] = ?\r\n"
				+ " WHERE MaSanPham = ?";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, GhiChu);
		cmd.setInt(2, MaSanPham);
		int kq = cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
	}
	
	public int UpdateSLGio(long SoLuongMua, long MaGioHang) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "UPDATE [dbo].[GioHang]\r\n"
				+ "   SET [SoLuongMua] = ?\r\n"
				+ " WHERE MaGioHang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, SoLuongMua);
		cmd.setLong(2, MaGioHang);
		int kq = cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
	}
	
	public int DeleteGio(int MaSanPham,String Ghichu) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "DELETE FROM [dbo].[GioHang]\r\n"
				+ "      WHERE MaSanPham = ? and GhiChu = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, MaSanPham);
		cmd.setString(2, Ghichu);
		int kq = cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
		
	}
	public int DeleteGioChon(int MaSanPham) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "DELETE FROM [dbo].[GioHang]\r\n"
				+ "      WHERE MaSanPham = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, MaSanPham);
		int kq = cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
		
	}
	
	public int DeleteGioChon1(int MaSanPham, String ghichu) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "DELETE FROM [dbo].[GioHang]\r\n"
				+ "      WHERE MaSanPham = ? and GhiChu = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, MaSanPham);
		cmd.setString(2, ghichu);
		int kq = cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
		
	}
	
	public int DeleteGioKH(int MaKhachHang) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "DELETE FROM [dbo].[GioHang]\r\n"
				+ "      WHERE MaKhachHang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, MaKhachHang);
		int kq = cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
	}
	
	public int DeleteGio1SP(int MaSanPham, String GhiChu, long MaKhachHang) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "DELETE FROM [dbo].[GioHang]\r\n"
				+ "      WHERE MaSanPham = ? and GhiChu = ? and MaKhachHang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, MaSanPham);
		cmd.setString(2, GhiChu);
		cmd.setLong(3, MaKhachHang);
		int kq = cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
	}

}
