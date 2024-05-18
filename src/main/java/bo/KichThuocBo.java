package bo;

import java.util.ArrayList;

import bean.KichThuocBean;
import dao.KichThuocDao;

public class KichThuocBo {
	KichThuocDao ktdao = new KichThuocDao();
	public ArrayList<KichThuocBean> dskichThuoc(int MaSanPham) throws Exception{
		return ktdao.dskichThuoc(MaSanPham);
	}
	
	public ArrayList<KichThuocBean> getDSKT() throws Exception{
		return ktdao.getDSKT();
	}
	
	public int UpdateSLMua(int MaSanPham, int SoLuongMua, String TenKichThuoc) throws Exception{
		return ktdao.UpdateSLMua(MaSanPham, SoLuongMua, TenKichThuoc);
	}
	
	public int UpdateKTSize(int MaSanPham, int SoLuongSize, String TenKichThuoc) throws Exception{
		return ktdao.UpdateKTSize(MaSanPham, SoLuongSize, TenKichThuoc);
	}
	
	public int ThemKichThuoc(String TenKichThuoc, int MaSanPham, int SoLuongSize) throws Exception{
		return ktdao.ThemKichThuoc(TenKichThuoc, MaSanPham, SoLuongSize);
	}
	
	public int XoaKichThuoc(int MaKichThuoc) throws Exception{
		return ktdao.XoaKichThuoc(MaKichThuoc);
	}
}
