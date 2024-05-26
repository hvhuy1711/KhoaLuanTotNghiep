package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import dao.ketnoidao;
import bean.loaispbean;
import bean.sanphambean;
import bean.sanphamfullbean;
public class sanphamdao {
	public ArrayList<sanphamfullbean> getsanpham() throws Exception{
		ArrayList<sanphamfullbean> ds = new ArrayList<sanphamfullbean>();
		// tao thủ công 4 loai
		//b1 ket noi csdl
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//b2 cau lenh sql
		String sql = "select * from SanPham";
		//b3 tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//b4 Thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		//b5 Dueyt rs de luu vao ds
		while (rs.next()) {
			int masp = rs.getInt("MaSanPham");
			String tensp = rs.getString("TenSanPham");
			long soluong = rs.getLong("GiaNhap");
			long gia = rs.getLong("Gia");
			long chieckhau = rs.getLong("ChiecKhau");
			String anh = rs.getString("Anh");
			int maloai = rs.getInt("Maloai");
			String hang =rs.getString("Hang");
			Date ngaynhap = rs.getDate("NgayNhap");
			String mota = rs.getString("MoTaSanPham");
			ds.add(new sanphamfullbean(masp, tensp, soluong, gia, chieckhau, anh, maloai, hang, ngaynhap, mota));
		}
		return ds;
	
}
	
	public ArrayList<sanphamfullbean> getSanPhamTM(int MaLoai) throws Exception{
		ArrayList<sanphamfullbean> ds = new ArrayList<sanphamfullbean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from SanPham where MaLoai = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, MaLoai);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int masp = rs.getInt("MaSanPham");
			String tensp = rs.getString("TenSanPham");
			long soluong = rs.getLong("GiaNhap");
			long gia = rs.getLong("Gia");
			long chieckhau = rs.getLong("ChiecKhau");
			String anh = rs.getString("Anh");
			int maloai = rs.getInt("Maloai");
			String hang =rs.getString("Hang");
			Date ngaynhap = rs.getDate("NgayNhap");
			String mota = rs.getString("MoTaSanPham");
			ds.add(new sanphamfullbean(masp, tensp, soluong, gia, chieckhau, anh, maloai, hang, ngaynhap, mota));
		}
		return ds;
	
}
	
	public ArrayList<String> getHang() throws Exception {
	    ArrayList<String> hangList = new ArrayList<>(); 

	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();
	    String sql = "SELECT DISTINCT Hang\r\n"
	    		+ "FROM SanPham";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);

	    ResultSet rs = cmd.executeQuery();

	    while (rs.next()) {
	        String hang = rs.getString("Hang");
	        hangList.add(hang); 
	    }

	    rs.close();
	    kn.cn.close();
	    return hangList; 
	}

	
	public ArrayList<sanphamfullbean> getSpTheoHang(String Hang) throws Exception{
		ArrayList<sanphamfullbean> ds = new ArrayList<sanphamfullbean>();
		
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from SanPham where Hang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		  cmd.setString(1, Hang); 
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int masp = rs.getInt("MaSanPham");
			String tensp = rs.getString("TenSanPham");
			long soluong = rs.getLong("GiaNhap");
			long gia = rs.getLong("Gia");
			long chieckhau = rs.getLong("ChiecKhau");
			String anh = rs.getString("Anh");
			int maloai = rs.getInt("Maloai");
			String hang =rs.getString("Hang");
			Date ngaynhap = rs.getDate("NgayNhap");
			String mota = rs.getString("MoTaSanPham");
			ds.add(new sanphamfullbean(masp, tensp, soluong, gia, chieckhau, anh, maloai, hang, ngaynhap, mota));
		}
		return ds;
	}
	
	public sanphamfullbean get1sanphamMaLoai(String MaLoai) throws Exception {
	    sanphamfullbean sp = null; 

	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();

	    String sql = "select * from SanPham where MaLoai = ?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, MaLoai); 
	    ResultSet rs = cmd.executeQuery();
	    if (rs.next()) {
	    	int masp = rs.getInt("MaSanPham");
			String tensp = rs.getString("TenSanPham");
			long soluong = rs.getLong("GiaNhap");
			long gia = rs.getLong("Gia");
			long chieckhau = rs.getLong("ChiecKhau");
			String anh = rs.getString("Anh");
			int maloai = rs.getInt("Maloai");
			String hang =rs.getString("Hang");
			Date ngaynhap = rs.getDate("NgayNhap");
			String mota = rs.getString("MoTaSanPham");
			sp = new sanphamfullbean(masp, tensp, soluong, gia, chieckhau, anh, maloai, hang, ngaynhap, mota);
	    }

	    rs.close();
	    cmd.close();
	    kn.cn.close();

	    return sp;
	}
	
	public sanphamfullbean get1sanpham(String MaSanPham) throws Exception {
	    sanphamfullbean sp = null;

	    ketnoidao kn = new ketnoidao();
	    kn.ketnoi();

	    String sql = "select * from SanPham where MaSanPham = ?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, MaSanPham); 

	    ResultSet rs = cmd.executeQuery();

	    if (rs.next()) {
	    	int masp = rs.getInt("MaSanPham");
			String tensp = rs.getString("TenSanPham");
			long soluong = rs.getLong("GiaNhap");
			long gia = rs.getLong("Gia");
			long chieckhau = rs.getLong("ChiecKhau");
			String anh = rs.getString("Anh");
			int maloai = rs.getInt("Maloai");
			String hang =rs.getString("Hang");
			Date ngaynhap = rs.getDate("NgayNhap");
			String mota = rs.getString("MoTaSanPham");
			sp = new sanphamfullbean(masp, tensp, soluong, gia, chieckhau, anh, maloai, hang, ngaynhap, mota);
	    }
	    rs.close();
	    cmd.close();
	    kn.cn.close();

	    return sp;
	}

	
	public int Themsp(String TenSanPham,long GiaNhap,long Gia, long Chieckhau,
			String Anh,String Hang,String MaLoai, String MoTaSanPham) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "insert into SanPham values (?,?,?,?,?,?,?,?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, TenSanPham);
		cmd.setLong(2, GiaNhap);
		cmd.setLong(3,Gia);
		cmd.setLong(4,Chieckhau);
		cmd.setString(5, Anh);
		cmd.setString(6, Hang);
		cmd.setString(7, MaLoai);
		Date n1 = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		String tam=dd.format(n1);
		Date n2 = dd.parse(tam);
		cmd.setDate(8, new java.sql.Date(n2.getTime()));
		cmd.setString(9, MoTaSanPham);
		int kq = cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
	}
	
	public int Suasp(String MaSanPham,String TenSanPham,long GiaNhap,long Gia, long ChiecKhau,
			String Anh,String Hang,String MaLoai,String Mota) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "update SanPham set TenSanPham = ?, GiaNhap=?, Gia=?, ChiecKhau =?"
				+ ", Anh=?, Hang=?, MaLoai=?,NgayNhap = ?, MoTaSanPham = ?  where MaSanPham = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, TenSanPham);
		cmd.setLong(2, GiaNhap);
		cmd.setLong(3, Gia);
		cmd.setLong(4, ChiecKhau);
		cmd.setString(5,Anh);
		cmd.setString(6, Hang);
		cmd.setString(7, MaLoai);
		Date n1 = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		String tam=dd.format(n1); 
		Date n2 = dd.parse(tam);
		cmd.setDate(8, new java.sql.Date(n2.getTime()));
		cmd.setString(9, Mota);
		cmd.setString(10, MaSanPham);
		int kq = cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
	}
	
	public int Xoasp(String MaSanPham) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "delete from SanPham where MaSanPham = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, MaSanPham);
		int kq = cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
	}

	public ArrayList<String> getTenSanPham() throws Exception{
		 ArrayList<String> listTenSP = new ArrayList<>(); // Changed to ArrayList<String>

		    ketnoidao kn = new ketnoidao();
		    kn.ketnoi();
		    String sql = "SELECT DISTINCT TenSanPham\r\n"
		    		+ "FROM SanPham";
		    PreparedStatement cmd = kn.cn.prepareStatement(sql);

		    ResultSet rs = cmd.executeQuery();

		    while (rs.next()) {
		        String tensp = rs.getString("TenSanPham");
		        listTenSP.add(tensp); // Add Hang value to the list
		    }

		    rs.close();
		    kn.cn.close();
		    return listTenSP; 
	}
}
