package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.choxacnhanbean;

public class lichsuspdao {
	public ArrayList<choxacnhanbean> lichsu(long MaKhachHang) throws Exception{
		ArrayList<choxacnhanbean> dslichsu = new ArrayList<choxacnhanbean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//cau lệnh select
		String sql = "select MaKhachHang,HoTen, Giamoi, TenSanPham,SoLuongMua,ThanhToan,MaSanPham,DiaChi, SoDT, Email, TenDN, MatKhau,Anh from VXacNhanDatMua where MaKhachHang = ? and DaMua = 1 ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, MaKhachHang);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long MaKhachhang = rs.getLong("MaKhachHang");
			String hoTen = rs.getString("HoTen");
			long giamoi = rs.getLong("Giamoi");
			String tenSanPham = rs.getString("TenSanPham");
			long soLuong = rs.getLong("SoLuongMua");
			long thanhToan = rs.getLong("ThanhToan");
			String maSanPham = rs.getString("MaSanPham");
			String diaChi = rs.getString("DiaChi");
			String soDT = rs.getString("SoDT");
			String email = rs.getString("Email");
			String tenDN = rs.getString("TenDN");
			String matKhau = rs.getString("MatKhau");
			String anh = rs.getString("Anh");
			dslichsu.add(new choxacnhanbean(MaKhachhang, hoTen, giamoi, tenSanPham, soLuong, thanhToan, maSanPham, diaChi, soDT, email, tenDN, matKhau, anh));
		}
		rs.close();
		kn.cn.close();
		return dslichsu;
	}
	
}
