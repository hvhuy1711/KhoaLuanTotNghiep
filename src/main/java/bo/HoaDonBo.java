package bo;

import java.util.ArrayList;
import java.util.Date;

import bean.HoaDonBean;
import dao.HoaDonDao;

public class HoaDonBo {
	HoaDonDao hddao = new HoaDonDao();
	public int ThemHD(long MaKhacHang, int TrangThaiDon ) throws Exception{
		return hddao.ThemHD(MaKhacHang, TrangThaiDon);
	}
	
	public HoaDonBean GetHoaDon(long MaKhachHang) throws Exception{
		return hddao.GetHoaDon(MaKhachHang);
	}
	
	public ArrayList<HoaDonBean> GetDSHoaDon(long MaKhachHang) throws Exception{
		return hddao.GetDSHoaDon(MaKhachHang); 
	}
	
	public ArrayList<HoaDonBean> GetALLDSHoaDon() throws Exception{
		return hddao.GetALLDSHoaDon();
	}
	
	public int DeleteHoaDon(int MaHoaDon) throws Exception{
		return hddao.DeleteHoaDon(MaHoaDon);
	}
	
}
