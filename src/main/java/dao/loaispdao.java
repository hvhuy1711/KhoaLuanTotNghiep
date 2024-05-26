package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dao.ketnoidao;
import bean.loaispbean;

public class loaispdao{
	public ArrayList<loaispbean> getloaisp() throws Exception{
		ArrayList<loaispbean> ds = new ArrayList<loaispbean>();
		// tao thủ công 4 loai
		//b1:ket noi csdl
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//b2: tao cau lenh sql
		String sql = "select * from LoaiSanPham";
		//b3: tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//b4 Thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		//b5 Dueyt rs de luu vao ds
		while (rs.next()){
			String maloai= rs.getString("MaLoai");
			String tenloai = rs.getString("TenLoai");
			ds.add(new loaispbean(maloai, tenloai));
		}
		//B6 : Dong rs va ket noi
		rs.close();
		kn.cn.close();
		return ds;
	
}
	
	public loaispbean getloaispTheoMa(int maloai) throws Exception{
		loaispbean ds = null;
		// tao thủ công 4 loai
		//b1:ket noi csdl
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		//b2: tao cau lenh sql
		String sql = "select * from LoaiSanPham where MaLoai = ?";
		//b3: tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, maloai);
		//b4 Thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		//b5 Dueyt rs de luu vao ds
		if (rs.next()){
			String ml= rs.getString("MaLoai");
			String tenloai = rs.getString("TenLoai");
			ds = new loaispbean(ml, tenloai);
		}
		//B6 : Dong rs va ket noi
		rs.close();
		kn.cn.close();
		return ds;
	
}
	public int ThemspLoai(String Tenloai) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "insert into LoaiSanPham values (?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//Truyen 2 tham so vao cau lenh sql
		cmd.setString(1, Tenloai);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();kn.cn.close();
		return kq;
	}
	
	public int SuaspLoai(int Maloai, String Tenloai) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "update LoaiSanPham set Tenloai = ? where Maloai = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, Tenloai);
		cmd.setInt(2, Maloai);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();kn.cn.close();
		return kq;
	}
	
	public int XoaspLoai(int Maloai) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "delete from LoaiSanPham where Maloai = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, Maloai);
		int kq = cmd.executeUpdate();// thuc hien cau lenh sql
		//b6 : Dong rs va ket noi
		cmd.close();kn.cn.close();
		return kq;
	}
	
	public ArrayList<String> getTenDanhMuc() throws Exception{
		 ArrayList<String> listTenDM = new ArrayList<>(); // Changed to ArrayList<String>

		    ketnoidao kn = new ketnoidao();
		    kn.ketnoi();
		    String sql = "SELECT DISTINCT TenLoai\r\n"
		    		+ "FROM LoaiSanPham";
		    PreparedStatement cmd = kn.cn.prepareStatement(sql);

		    ResultSet rs = cmd.executeQuery();

		    while (rs.next()) {
		        String tenloai = rs.getString("TenLoai");
		        listTenDM.add(tenloai); // Add Hang value to the list
		    }

		    rs.close();
		    kn.cn.close();
		    return listTenDM; 
	}
}