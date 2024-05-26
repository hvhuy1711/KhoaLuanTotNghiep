package bo;

import dao.ChiTietHoaDonDao;

public class ChiTietHoaDonBo {
	ChiTietHoaDonDao ct = new ChiTietHoaDonDao();
	public int ThemCTHD(int MaHoaDon,int MaGioHang, long DaMua, String GhichuCT , long DongiaSP, int SoLuongMua) throws Exception{
		return ct.ThemCTHD(MaHoaDon, MaGioHang, DaMua, GhichuCT, DongiaSP, SoLuongMua);
	}
	
	public int DeleteChiTiet(int MaChiTiet) throws Exception{
		return ct.DeleteChiTiet(MaChiTiet);
	}
}
