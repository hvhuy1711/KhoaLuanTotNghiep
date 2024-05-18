package bo;

import java.util.ArrayList;

import bean.choxacnhanbean;
import dao.choxacnhandao;

public class choxacnhanbo {
	choxacnhandao cxndao = new choxacnhandao();
	public ArrayList<choxacnhanbean> choxacnhan(long MaKhachHang) throws Exception{
		return cxndao.choxacnhan(MaKhachHang);
	}
	
	public int dathang(String MaKhachHang) throws Exception{
		return cxndao.dathang(MaKhachHang);
	}
}
//không sử dụng