package bean;

import java.util.Date;

public class HoaDonBean {
	private int MaHoaDon;
	private long MaKhachHang;
	private Date NgayMua;
	private int TrangThaiDon;
	
	
	public HoaDonBean(int maHoaDon, long maKhachHang, Date ngayMua, int trangThaiDon) {
		super();
		MaHoaDon = maHoaDon;
		MaKhachHang = maKhachHang;
		NgayMua = ngayMua;
		TrangThaiDon = trangThaiDon;
	}
	public HoaDonBean() {
		super();
	}
	public int getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(int maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public long getMaKhachHang() {
		return MaKhachHang;
	}
	public void setMaKhachHang(long maKhachHang) {
		MaKhachHang = maKhachHang;
	}
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	public int getTrangThaiDon() {
		return TrangThaiDon;
	}
	public void setTrangThaiDon(int trangThaiDon) {
		TrangThaiDon = trangThaiDon;
	}
	
}
