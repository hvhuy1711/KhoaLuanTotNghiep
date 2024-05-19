package bo;

import java.util.ArrayList;

import bean.DonHangDaDatBean;
import dao.DonHangDaDatDao;

public class DonHangDaDatBo {
	DonHangDaDatDao dhdao = new DonHangDaDatDao();

	public ArrayList<DonHangDaDatBean> getDHDD(long MaKhachHang) throws Exception {
		return dhdao.getDHDD(MaKhachHang);
	}
	
	public ArrayList<DonHangDaDatBean> getAllDHDD() throws Exception {
		return dhdao.getAllDHDD();
	}
	
	public DonHangDaDatBean getDHDDDanhGia(int MaChiTiet) throws Exception {
		return dhdao.getDHDDDanhGia(MaChiTiet);
	}

	public ArrayList<DonHangDaDatBean> getDHDDAdmin(int TrangThaiDon) throws Exception {
		return dhdao.getDHDDAdmin(TrangThaiDon);
	}
	
	public int UpdateTrangThaiDon(int MaChiTiet) throws Exception{
		return dhdao.UpdateTrangThaiDon(MaChiTiet);
	}
	
	public int UpdateTrangThaiDonHT(int MaChiTiet) throws Exception{
		return dhdao.UpdateTrangThaiDonHT(MaChiTiet);
	}
	
	public int UpdateTrangThaiDonShipper(int MaChiTiet) throws Exception{
		return dhdao.UpdateTrangThaiDonShipper(MaChiTiet);
	}
	
	public int UpdateTrangThaiHuyDon(int MaChiTiet) throws Exception{
		return dhdao.UpdateTrangThaiHuyDon(MaChiTiet);
	}
	
	public int UpdateTrangThaiTra(int MaChiTiet, String GhiChuLS) throws Exception{
		return dhdao.UpdateTrangThaiTra(MaChiTiet, GhiChuLS);
	}
	public int UpdateTrangThaiTraAdmin(int MaChiTiet) throws Exception{
		return dhdao.UpdateTrangThaiTraAdmin(MaChiTiet);
	}
	public int UpdateTrangThaiCT() throws Exception{
		return dhdao.UpdateTrangThaiCT();
	}
}
