package bo;

import java.util.ArrayList;

import bean.khachhangthibean;
import dao.khachhangdao;

public class khachhangbo {
	khachhangdao khdao = new khachhangdao();
	ArrayList<khachhangthibean> dskhachhang;
	
	public khachhangthibean dntk(String tendn, String pass) throws Exception{
		return khdao.dntk(tendn, pass);
	}
	
	public int DoiPass(long MaKhachHang, String MatKhau) throws Exception{
		return khdao.DoiPass(MaKhachHang, MatKhau);
	}
	
	public int UpdateTTKHEmail(long MaKhachHang, String Hoten, String SoDT, String Diachi ,String email) throws Exception{
		return khdao.UpdateTTKHEmail(MaKhachHang, Hoten, SoDT, Diachi, email);
	}
	
	public int UpdateTTKH(long MaKhachHang, String Hoten, String SoDT, String Diachi) throws Exception{
		return khdao.UpdateTTKH(MaKhachHang, Hoten, SoDT, Diachi);
	}
	
	public khachhangthibean get1KhachHang(long MaKhachHang) throws Exception{
		return khdao.get1KhachHang(MaKhachHang);
	}
	
	public int dktk(String hoten, String diachi, String sodt, String email,
			String tendn, String pass, boolean quyen,String google_id) throws Exception{
		return khdao.dktk(hoten, diachi, sodt, email, tendn, pass, quyen, google_id);
	}
	
	public int xoatk(int MaKhachHang) throws Exception{
		return khdao.xoatk(MaKhachHang);
	}
	
	public ArrayList<String> getTenDN() throws Exception{
		return khdao.getTenDN();
	}
	
	public ArrayList<khachhangthibean> htkhachhang() throws Exception{
		dskhachhang = khdao.htkhachhang();
		return dskhachhang;
	}
	
	public ArrayList<khachhangthibean> getAllkhachhang() throws Exception{
		return khdao.getAllkhachhang();
	}
	
	public ArrayList<khachhangthibean> dsthongtin(long MaKhachHang) throws Exception{
		dskhachhang = khdao.dsthongtin(MaKhachHang);
		return dskhachhang;
	}
	
	public int DNGG(String name, String email, String googleId) throws Exception{
		return khdao.DNGG(name, email, googleId);
	}
	
	public boolean ktggID(String googleID) throws Exception{
		return khdao.ktggID(googleID);
	}
	
	public khachhangthibean dntkGG(String email, String googleID,int Quyen) throws Exception{
		return khdao.dntkGG(email, googleID, Quyen);
	}
}
