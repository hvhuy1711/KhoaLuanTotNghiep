package bo;

import dao.LichSuDao;

public class LichSuBo {
	LichSuDao lsdao = new LichSuDao();
	public int ThemLichSu( long MaKhachHang, int MaHoaDon , String TongTien, int TrangThaiLS,String GhiChuLS) throws Exception{
		return lsdao.ThemLichSu(MaKhachHang, MaHoaDon, TongTien, TrangThaiLS, GhiChuLS);
	}
	
	public int DeleteLichSu(int MaLichSu) throws Exception{
		return lsdao.DeleteLichSu(MaLichSu);
	}
}
