package bo;

import java.util.ArrayList;

import bean.DanhGiaBean;
import dao.DanhGiaDao;

public class DanhGiaBo {
	DanhGiaDao dg = new DanhGiaDao();
	public int DanhGiaSP(long MaKhachHang, int MaSanPham, int SoSao, String NoiDung, boolean IsDanhGia) throws Exception{
		return dg.DanhGiaSP(MaKhachHang, MaSanPham, SoSao, NoiDung, IsDanhGia);
	}
	public ArrayList<DanhGiaBean> GetDsDanhGia(int MaSanPham) throws Exception{
		return dg.GetDsDanhGia(MaSanPham);
	}
}
