package bean;

import java.util.Date;

public class LichSuBean {
	private int MaLichSu;
	private long MaKhachHang;
	private int MaHoaDon;
	private Date NgayMua;
	private String TongTien;
	private int TrangThai;
	private String GhiChuLS;
	public String getGhiChuLS() {
		return GhiChuLS;
	}
	public void setGhiChuLS(String ghiChuLS) {
		GhiChuLS = ghiChuLS;
	}
	public int getMaLichSu() {
		return MaLichSu;
	}
	public void setMaLichSu(int maLichSu) {
		MaLichSu = maLichSu;
	}
	public long getMaKhachHang() {
		return MaKhachHang;
	}
	public void setMaKhachHang(long maKhachHang) {
		MaKhachHang = maKhachHang;
	}
	public int getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(int maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	public String getTongTien() {
		return TongTien;
	}
	public void setTongTien(String tongTien) {
		TongTien = tongTien;
	}
	public int getTrangThai() {
		return TrangThai;
	}
	public void setTrangThai(int trangThai) {
		TrangThai = trangThai;
	}
	
	public LichSuBean(int maLichSu, long maKhachHang, int maHoaDon, Date ngayMua, String tongTien, int trangThai,
			String ghiChuLS) {
		super();
		MaLichSu = maLichSu;
		MaKhachHang = maKhachHang;
		MaHoaDon = maHoaDon;
		NgayMua = ngayMua;
		TongTien = tongTien;
		TrangThai = trangThai;
		GhiChuLS = ghiChuLS;
	}
	public LichSuBean() {
		super();
	}
	
	
}
