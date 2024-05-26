package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dao.ketnoidao;
import bean.choxacnhanbean;

public class choxacnhandao {
	public ArrayList<choxacnhanbean> choxacnhan(long MaKhachHang) throws Exception{
		ArrayList<choxacnhanbean> dschoxacnhan = new ArrayList<choxacnhanbean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select MaKhachHang,HoTen, Giamoi, TenSanPham,SoLuongMua,\r\n"
				+ "			ThanhToan,MaSanPham,DiaChi, SoDT, Email, TenDN, MatKhau,\r\n"
				+ "			Anh from VXacNhanDatMua where MaKhachHang = ? and DaMua = 0 ";
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
			dschoxacnhan.add(new choxacnhanbean(MaKhachhang, hoTen, giamoi, tenSanPham, soLuong, thanhToan, maSanPham, diaChi, soDT, email, tenDN, matKhau, anh));
		}
		rs.close();
		kn.cn.close();
		return dschoxacnhan;
	}
	
	public int dathang(String MaSanPham) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
				String sql1 = "update VXacNhanDatMua set DaMua = 1 where MaSanPham = ?";
				PreparedStatement cmdup = kn.cn.prepareStatement(sql1);
				cmdup.setString(1, MaSanPham);
				int kq = cmdup.executeUpdate();
				cmdup.close();
				kn.cn.close();
				return kq;
		
	}
}
