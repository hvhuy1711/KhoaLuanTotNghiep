package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.DonHangDaDatBean;

public class DonHangDaDatDao {
	
	public ArrayList<DonHangDaDatBean> getAllDHDD() throws Exception {
		ArrayList<DonHangDaDatBean> ds = new ArrayList<DonHangDaDatBean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "SELECT TOP 1000 [MaChiTiet]\r\n"
				+ "      ,[TrangThaiCT]\r\n"
				+ "      ,[GhiChuChiTiet]\r\n"
				+ "      ,[DonGiaSP]\r\n"
				+ "      ,[SoLuongMua]\r\n"
				+ "      ,[MaHoaDon]\r\n"
				+ "      ,[MaKhachHang]\r\n"
				+ "      ,[HoTen]\r\n"
				+ "      ,[DiaChi]\r\n"
				+ "      ,[SoDT]\r\n"
				+ "      ,[Email]\r\n"
				+ "      ,[TenDN]\r\n"
				+ "      ,[Quyen]\r\n"
				+ "      ,[google_id]\r\n"
				+ "      ,[TongTien]\r\n"
				+ "      ,[TrangThai]\r\n"
				+ "      ,[MaSanPham]\r\n"
				+ "      ,[TenSanPham]\r\n"
				+ "      ,[Anh]\r\n"
				+ "      ,[Hang]\r\n"
				+ "      ,[MaLoai]\r\n"
				+ "      ,[MoTaSanPham]\r\n"
				+ "      ,[TrangThaiDon]\r\n"
				+ "      ,[GhiChuLS]\r\n"
				+ "      ,[NgayMua]\r\n"
				+ "      ,[ChiecKhau]\r\n"
				+ "  FROM [QLHvhShop].[dbo].[ViewLichSuMua]";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int MaChiTiet = rs.getInt("MaChiTiet");
			int TrangThaiCt = rs.getInt("TrangThaiCT");
			String GhiChuCT = rs.getString("GhiChuChiTiet");
			int DonGiaSP = rs.getInt("DonGiaSP");
			int SoLuongMua = rs.getInt("SoLuongMua");
			int MaHoaDon = rs.getInt("MaHoaDon");
			long makh = rs.getLong("MaKhachHang");
			String HoTen = rs.getString("HoTen");
			String DiaChi = rs.getString("DiaChi");
			String SoDT = rs.getString("SoDT");
			String Email = rs.getString("Email");
			String TenDN = rs.getString("TenDN");
			boolean Quyen = rs.getBoolean("Quyen");
			String google_id = rs.getString("google_id");
			String TongTien = rs.getString("TongTien");
			int TrangThai = rs.getInt("TrangThai");
			int MaSanPham = rs.getInt("MaSanPham");
			String TenSanPham = rs.getString("TenSanPham");
			String Anh = rs.getString("Anh");
			String Hang = rs.getString("Hang");
			int MaLoai = rs.getInt("MaLoai");
			String MoTaSanPham = rs.getString("MoTaSanPham");
			int TrangThaiDon = rs.getInt("TrangThaiDon");
			Date NgayMua = rs.getDate("NgayMua");
			int ChiecKhau = rs.getInt("ChiecKhau");
			ds.add(new DonHangDaDatBean(MaChiTiet, TrangThaiCt, GhiChuCT, DonGiaSP, SoLuongMua, MaHoaDon, makh, HoTen, DiaChi, SoDT, Email, TenDN, Quyen, google_id, TongTien, TrangThai, MaSanPham, TenSanPham, Anh, Hang, MaLoai, MoTaSanPham, TrangThaiDon, GhiChuCT, NgayMua, ChiecKhau));
		}
		rs.close();
		cmd.close();
		kn.cn.close();
		return ds;
	}
	public ArrayList<DonHangDaDatBean> getDHDD(long MaKhachHang) throws Exception {
		ArrayList<DonHangDaDatBean> ds = new ArrayList<DonHangDaDatBean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "SELECT TOP 1000 [MaChiTiet]\r\n"
				+ "      ,[TrangThaiCT]\r\n"
				+ "      ,[GhiChuChiTiet]\r\n"
				+ "      ,[DonGiaSP]\r\n"
				+ "      ,[SoLuongMua]\r\n"
				+ "      ,[MaHoaDon]\r\n"
				+ "      ,[MaKhachHang]\r\n"
				+ "      ,[HoTen]\r\n"
				+ "      ,[DiaChi]\r\n"
				+ "      ,[SoDT]\r\n"
				+ "      ,[Email]\r\n"
				+ "      ,[TenDN]\r\n"
				+ "      ,[Quyen]\r\n"
				+ "      ,[google_id]\r\n"
				+ "      ,[TongTien]\r\n"
				+ "      ,[TrangThai]\r\n"
				+ "      ,[MaSanPham]\r\n"
				+ "      ,[TenSanPham]\r\n"
				+ "      ,[Anh]\r\n"
				+ "      ,[Hang]\r\n"
				+ "      ,[MaLoai]\r\n"
				+ "      ,[MoTaSanPham]\r\n"
				+ "      ,[TrangThaiDon]\r\n"
				+ "      ,[GhiChuLS]\r\n"
				+ "      ,[NgayMua]\r\n"
				+ "      ,[ChiecKhau]\r\n"
				+ "  FROM [QLHvhShop].[dbo].[ViewLichSuMua] where MaKhachHang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, MaKhachHang); // Gán giá trị tham số
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int MaChiTiet = rs.getInt("MaChiTiet");
			int TrangThaiCt = rs.getInt("TrangThaiCT");
			String GhiChuCT = rs.getString("GhiChuChiTiet");
			int DonGiaSP = rs.getInt("DonGiaSP");
			int SoLuongMua = rs.getInt("SoLuongMua");
			int MaHoaDon = rs.getInt("MaHoaDon");
			long makh = rs.getLong("MaKhachHang");
			String HoTen = rs.getString("HoTen");
			String DiaChi = rs.getString("DiaChi");
			String SoDT = rs.getString("SoDT");
			String Email = rs.getString("Email");
			String TenDN = rs.getString("TenDN");
			boolean Quyen = rs.getBoolean("Quyen");
			String google_id = rs.getString("google_id");
			String TongTien = rs.getString("TongTien");
			int TrangThai = rs.getInt("TrangThai");
			int MaSanPham = rs.getInt("MaSanPham");
			String TenSanPham = rs.getString("TenSanPham");
			String Anh = rs.getString("Anh");
			String Hang = rs.getString("Hang");
			int MaLoai = rs.getInt("MaLoai");
			String MoTaSanPham = rs.getString("MoTaSanPham");
			int TrangThaiDon = rs.getInt("TrangThaiDon");
			Date NgayMua = rs.getDate("NgayMua");
			int ChiecKhau = rs.getInt("ChiecKhau");
			ds.add(new DonHangDaDatBean(MaChiTiet, TrangThaiCt, GhiChuCT, DonGiaSP, SoLuongMua, MaHoaDon, makh, HoTen, DiaChi, SoDT, Email, TenDN, Quyen, google_id, TongTien, TrangThai, MaSanPham, TenSanPham, Anh, Hang, MaLoai, MoTaSanPham, TrangThaiDon, GhiChuCT, NgayMua, ChiecKhau));
		}
		rs.close();
		cmd.close();
		kn.cn.close();
		return ds;
	}
	
	public DonHangDaDatBean getDHDDDanhGia(int MaChiTiet) throws Exception {
		DonHangDaDatBean ds = null;
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "SELECT TOP 1000 [MaChiTiet]\r\n"
				+ "      ,[TrangThaiCT]\r\n"
				+ "      ,[GhiChuChiTiet]\r\n"
				+ "      ,[DonGiaSP]\r\n"
				+ "      ,[SoLuongMua]\r\n"
				+ "      ,[MaHoaDon]\r\n"
				+ "      ,[MaKhachHang]\r\n"
				+ "      ,[HoTen]\r\n"
				+ "      ,[DiaChi]\r\n"
				+ "      ,[SoDT]\r\n"
				+ "      ,[Email]\r\n"
				+ "      ,[TenDN]\r\n"
				+ "      ,[Quyen]\r\n"
				+ "      ,[google_id]\r\n"
				+ "      ,[TongTien]\r\n"
				+ "      ,[TrangThai]\r\n"
				+ "      ,[MaSanPham]\r\n"
				+ "      ,[TenSanPham]\r\n"
				+ "      ,[Anh]\r\n"
				+ "      ,[Hang]\r\n"
				+ "      ,[MaLoai]\r\n"
				+ "      ,[MoTaSanPham]\r\n"
				+ "      ,[TrangThaiDon]\r\n"
				+ "      ,[GhiChuLS]\r\n"
				+ "      ,[NgayMua]\r\n"
				+ "      ,[ChiecKhau]\r\n"
				+ "  FROM [QLHvhShop].[dbo].[ViewLichSuMua] where MaChiTiet = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, MaChiTiet); // Gán giá trị tham số
		ResultSet rs = cmd.executeQuery();
		if (rs.next()) {
			int mact = rs.getInt("MaChiTiet");
			int TrangThaiCt = rs.getInt("TrangThaiCT");
			String GhiChuCT = rs.getString("GhiChuChiTiet");
			int DonGiaSP = rs.getInt("DonGiaSP");
			int SoLuongMua = rs.getInt("SoLuongMua");
			int MaHoaDon = rs.getInt("MaHoaDon");
			long makh = rs.getLong("MaKhachHang");
			String HoTen = rs.getString("HoTen");
			String DiaChi = rs.getString("DiaChi");
			String SoDT = rs.getString("SoDT");
			String Email = rs.getString("Email");
			String TenDN = rs.getString("TenDN");
			boolean Quyen = rs.getBoolean("Quyen");
			String google_id = rs.getString("google_id");
			String TongTien = rs.getString("TongTien");
			int TrangThai = rs.getInt("TrangThai");
			int MaSanPham = rs.getInt("MaSanPham");
			String TenSanPham = rs.getString("TenSanPham");
			String Anh = rs.getString("Anh");
			String Hang = rs.getString("Hang");
			int MaLoai = rs.getInt("MaLoai");
			String MoTaSanPham = rs.getString("MoTaSanPham");
			int TrangThaiDon = rs.getInt("TrangThaiDon");
			Date NgayMua = rs.getDate("NgayMua");
			int ChiecKhau = rs.getInt("ChiecKhau");
			ds=  new DonHangDaDatBean(mact, TrangThaiCt, GhiChuCT, DonGiaSP, SoLuongMua, MaHoaDon, makh, HoTen, DiaChi, SoDT, Email, TenDN, Quyen, google_id, TongTien, TrangThai, MaSanPham, TenSanPham, Anh, Hang, MaLoai, MoTaSanPham, TrangThaiDon, GhiChuCT, NgayMua, ChiecKhau);
		}
		rs.close();
		cmd.close();
		kn.cn.close();
		return ds;
	}

	public ArrayList<DonHangDaDatBean> getDHDDAdmin(int TrangThaiDon) throws Exception {
		ArrayList<DonHangDaDatBean> ds = new ArrayList<DonHangDaDatBean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "SELECT TOP 1000 [MaChiTiet]\r\n"
				+ "      ,[TrangThaiCT]\r\n"
				+ "      ,[GhiChuChiTiet]\r\n"
				+ "      ,[DonGiaSP]\r\n"
				+ "      ,[SoLuongMua]\r\n"
				+ "      ,[MaHoaDon]\r\n"
				+ "      ,[MaKhachHang]\r\n"
				+ "      ,[HoTen]\r\n"
				+ "      ,[DiaChi]\r\n"
				+ "      ,[SoDT]\r\n"
				+ "      ,[Email]\r\n"
				+ "      ,[TenDN]\r\n"
				+ "      ,[Quyen]\r\n"
				+ "      ,[google_id]\r\n"
				+ "      ,[TongTien]\r\n"
				+ "      ,[TrangThai]\r\n"
				+ "      ,[MaSanPham]\r\n"
				+ "      ,[TenSanPham]\r\n"
				+ "      ,[Anh]\r\n"
				+ "      ,[Hang]\r\n"
				+ "      ,[MaLoai]\r\n"
				+ "      ,[MoTaSanPham]\r\n"
				+ "      ,[TrangThaiDon]\r\n"
				+ "      ,[GhiChuLS]\r\n"
				+ "      ,[NgayMua]\r\n"
				+ "      ,[ChiecKhau]\r\n"
				+ "  FROM [QLHvhShop].[dbo].[ViewLichSuMua] where TrangThai = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, TrangThaiDon);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int MaChiTiet = rs.getInt("MaChiTiet");
			int TrangThaiCt = rs.getInt("TrangThaiCT");
			String GhiChuCT = rs.getString("GhiChuChiTiet");
			int DonGiaSP = rs.getInt("DonGiaSP");
			int SoLuongMua = rs.getInt("SoLuongMua");
			int MaHoaDon = rs.getInt("MaHoaDon");
			long makh = rs.getLong("MaKhachHang");
			String HoTen = rs.getString("HoTen");
			String DiaChi = rs.getString("DiaChi");
			String SoDT = rs.getString("SoDT");
			String Email = rs.getString("Email");
			String TenDN = rs.getString("TenDN");
			boolean Quyen = rs.getBoolean("Quyen");
			String google_id = rs.getString("google_id");
			String TongTien = rs.getString("TongTien");
			int TrangThai = rs.getInt("TrangThai");
			int MaSanPham = rs.getInt("MaSanPham");
			String TenSanPham = rs.getString("TenSanPham");
			String Anh = rs.getString("Anh");
			String Hang = rs.getString("Hang");
			int MaLoai = rs.getInt("MaLoai");
			String MoTaSanPham = rs.getString("MoTaSanPham");
//	    	Date NgayDatDon = rs.getDate("NgayDatDon");
			int ttdon = rs.getInt("TrangThaiDon");
			String GhiChuLS = rs.getString("GhiChuLS");
			Date NgayMua = rs.getDate("NgayMua");
			int ChiecKhau = rs.getInt("ChiecKhau");
			ds.add(new DonHangDaDatBean(MaChiTiet, TrangThaiCt, GhiChuCT, DonGiaSP, SoLuongMua, MaHoaDon, makh, HoTen, DiaChi, SoDT, Email, TenDN, Quyen, google_id, TongTien, TrangThai, MaSanPham, TenSanPham, Anh, Hang, MaLoai, MoTaSanPham, ttdon, GhiChuLS, NgayMua, ChiecKhau));
		}
		rs.close();
		cmd.close();
		kn.cn.close();
		return ds;
	}
	
	
	public int UpdateTrangThaiDon(int MaChiTiet) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "update ViewLichSuMua set TrangThai = 1 where MaChiTiet = ?";
		PreparedStatement cmdup = kn.cn.prepareStatement(sql);
		cmdup.setInt(1, MaChiTiet);
		int kq = cmdup.executeUpdate();
		cmdup.close();
		kn.cn.close();
		return kq;
	}
	
	public int UpdateTrangThaiDonShipper(int MaChiTiet) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "update ViewLichSuMua set TrangThai = 2 where MaChiTiet = ?";
		PreparedStatement cmdup = kn.cn.prepareStatement(sql);
		cmdup.setInt(1, MaChiTiet);
		int kq = cmdup.executeUpdate();
		cmdup.close();
		kn.cn.close();
		return kq;
	}
	public int UpdateTrangThaiHuyDon(int MaChiTiet) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "update ViewLichSuMua set TrangThai = 0 where MaChiTiet = ?";
		PreparedStatement cmdup = kn.cn.prepareStatement(sql);
		cmdup.setInt(1, MaChiTiet);
		int kq = cmdup.executeUpdate();
		cmdup.close();
		kn.cn.close();
		return kq;
	}
	
	public int UpdateTrangThaiDonHT(int MaChiTiet) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "update ViewLichSuMua set TrangThai = 3 where MaChiTiet = ?";
		PreparedStatement cmdup = kn.cn.prepareStatement(sql);
		cmdup.setInt(1, MaChiTiet);
		int kq = cmdup.executeUpdate();
		cmdup.close();
		kn.cn.close();
		return kq;
	}
	public int UpdateTrangThaiTra(int MaChiTiet, String GhiChuLS) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "update ViewLichSuMua set TrangThai = 4,GhiChuLS=? where MaChiTiet = ?";
		PreparedStatement cmdup = kn.cn.prepareStatement(sql);
		cmdup.setString(1, GhiChuLS);
		cmdup.setInt(2, MaChiTiet);
		int kq = cmdup.executeUpdate();
		cmdup.close();
		kn.cn.close();
		return kq;
	}
	public int UpdateTrangThaiTraAdmin(int MaChiTiet) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "update ViewLichSuMua set TrangThai = 4 where MaChiTiet = ?";
		PreparedStatement cmdup = kn.cn.prepareStatement(sql);
		cmdup.setInt(1, MaChiTiet);
		int kq = cmdup.executeUpdate();
		cmdup.close();
		kn.cn.close();
		return kq;
	}
	public int UpdateTrangThaiCT() throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "update ViewLichSuMua set TrangThaiCT = 1";
		PreparedStatement cmdup = kn.cn.prepareStatement(sql);
		int kq = cmdup.executeUpdate();
		cmdup.close();
		kn.cn.close();
		return kq;
	}
}
