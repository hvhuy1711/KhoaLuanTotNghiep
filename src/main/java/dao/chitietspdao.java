package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import bean.xacnhanspbean;

public class chitietspdao {
	public int Themspcthd(long MaHoaDon, String MaSanPham,  long SoLuongMua) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "insert into ChiTietHD values (?,?,?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//Truyen 4 tham so vao cau lenh sql
		cmd.setLong(1, MaHoaDon);
		cmd.setString(2, MaSanPham);
		cmd.setBoolean(3, false);
		cmd.setInt(4, (int)SoLuongMua);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();kn.cn.close();
		return kq;
	}
	
	public int CapNhatsp(long MaChiTiet) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "update ChiTietHD set DaMua = 1 where MaChiTiet = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, MaChiTiet);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();kn.cn.close();
		return kq;
	}
	
	public ArrayList<xacnhanspbean> gethoadonspchuaxacnhan() throws Exception{
		ArrayList<xacnhanspbean> ds = new ArrayList<xacnhanspbean>();
		// tao thủ công 4 loai
		//b1 ket noi csdl
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//b2 cau lenh sql
		String sql = "select * from VXacNhanDatMua";
		//b3 tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//b4 Thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		//b5 Dueyt rs de luu vao ds
		while (rs.next()) {
			long makh = rs.getLong("MaKhachHang");
			String hoten = rs.getString("HoTen");
			Date ngayMua = rs.getDate("NgayMua");
			boolean damua = rs.getBoolean("DaMua");
			long machitietHD = rs.getLong("MaChiTiet");
			long giamoi = rs.getLong("Giamoi");
			String tensach = rs.getString("TenSanPham");
			long SoLuongMua = rs.getLong("SoLuongMua");
			long ThanhTien = rs.getLong("ThanhTien");
			ds.add(new xacnhanspbean(makh, hoten, ngayMua, damua, machitietHD, giamoi, tensach, SoLuongMua, ThanhTien));
		}
		rs.close();kn.cn.close();
		return ds;
	}
}
