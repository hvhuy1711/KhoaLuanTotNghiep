package bean;

public class ChiTietHoaDonBean {
	private int MaChiTiet;
	private int MaHoaDon;
	private int MaSanPham;
	private long TrangThaiCT;
	private String GhiChuChiTiet;
	private long DonGiaSP;
	private int SoLuongMuaCt;
	public int getMaChiTiet() {
		return MaChiTiet;
	}
	public void setMaChiTiet(int maChiTiet) {
		MaChiTiet = maChiTiet;
	}
	public int getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(int maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public int getMaSanPham() {
		return MaSanPham;
	}
	public void setMaSanPham(int maSanPham) {
		MaSanPham = maSanPham;
	}
	public long getTrangThaiCT() {
		return TrangThaiCT;
	}
	public void setTrangThaiCT(long trangThaiCT) {
		TrangThaiCT = trangThaiCT;
	}
	public String getGhiChuChiTiet() {
		return GhiChuChiTiet;
	}
	public void setGhiChuChiTiet(String ghiChuChiTiet) {
		GhiChuChiTiet = ghiChuChiTiet;
	}
	public long getDonGiaSP() {
		return DonGiaSP;
	}
	public void setDonGiaSP(long donGiaSP) {
		DonGiaSP = donGiaSP;
	}
	public int getSoLuongMuaCt() {
		return SoLuongMuaCt;
	}
	public void setSoLuongMuaCt(int soLuongMuaCt) {
		SoLuongMuaCt = soLuongMuaCt;
	}
	public ChiTietHoaDonBean(int maChiTiet, int maHoaDon, int maSanPham, long trangThaiCT, String ghiChuChiTiet,
			long donGiaSP, int soLuongMuaCt) {
		super();
		MaChiTiet = maChiTiet;
		MaHoaDon = maHoaDon;
		MaSanPham = maSanPham;
		TrangThaiCT = trangThaiCT;
		GhiChuChiTiet = ghiChuChiTiet;
		DonGiaSP = donGiaSP;
		SoLuongMuaCt = soLuongMuaCt;
	}
	public ChiTietHoaDonBean() {
		super();
	}
	
	
	
}
