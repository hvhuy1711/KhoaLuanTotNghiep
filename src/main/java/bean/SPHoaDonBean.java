package bean;

import java.util.Date;

public class SPHoaDonBean {
	private int MaChitiet;
	private String GhiChuChiTiet;
	private int MaHoaDon;
	private int MaSanPham;
	private String TenSanPham;
	private long MaKhachHang;
	private Date NgayMua;
	private int TrangThaiDon;
	private String Anh;
	public int getMaChitiet() {
		return MaChitiet;
	}
	public void setMaChitiet(int maChitiet) {
		MaChitiet = maChitiet;
	}
	public String getGhiChuChiTiet() {
		return GhiChuChiTiet;
	}
	public void setGhiChuChiTiet(String ghiChuChiTiet) {
		GhiChuChiTiet = ghiChuChiTiet;
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
	public String getTenSanPham() {
		return TenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		TenSanPham = tenSanPham;
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
	public String getAnh() {
		return Anh;
	}
	public void setAnh(String anh) {
		Anh = anh;
	}
	public SPHoaDonBean(int maChitiet, String ghiChuChiTiet, int maHoaDon, int maSanPham, String tenSanPham,
			long maKhachHang, Date ngayMua, int trangThaiDon, String anh) {
		super();
		MaChitiet = maChitiet;
		GhiChuChiTiet = ghiChuChiTiet;
		MaHoaDon = maHoaDon;
		MaSanPham = maSanPham;
		TenSanPham = tenSanPham;
		MaKhachHang = maKhachHang;
		NgayMua = ngayMua;
		TrangThaiDon = trangThaiDon;
		Anh = anh;
	}
	
}
