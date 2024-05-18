package bo;

import java.util.ArrayList;

import bean.xacnhanspbean;
import dao.chitietspdao;

public class chitietspbo {
	chitietspdao cthd = new chitietspdao();
	public int Themspcthd(long MaHoaDon, String MaSanPham, long SoLuongMua) throws Exception{
		return cthd.Themspcthd(MaHoaDon, MaSanPham, SoLuongMua);
	}
	
	public int CapNhatsp(long MaChiTiet) throws Exception{
		return cthd.CapNhatsp(MaChiTiet);
	}
	
	public ArrayList<xacnhanspbean> gethoadonspchuaxacnhan() throws Exception{
		return cthd.gethoadonspchuaxacnhan();
	}
}
