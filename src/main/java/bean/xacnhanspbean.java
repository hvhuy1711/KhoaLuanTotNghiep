package bean;

import java.util.Date;

public class xacnhanspbean {
	private long MaKhachHang;
	private String HoTen;
	private Date NgayMua;
	private boolean DaMua;
	private long MaChiTiet;
	private long Giamoi;
	private String TenSanPham;
	private long SoLuongMua;
	private long ThanhTien;
	public xacnhanspbean(long maKhachHang, String hoTen, Date ngayMua, boolean daMua, long maChiTiet, long giamoi,
			String tenSanPham, long soLuongMua, long thanhTien) {
		super();
		MaKhachHang = maKhachHang;
		HoTen = hoTen;
		NgayMua = ngayMua;
		DaMua = daMua;
		MaChiTiet = maChiTiet;
		Giamoi = giamoi;
		TenSanPham = tenSanPham;
		SoLuongMua = soLuongMua;
		ThanhTien = thanhTien;
	}
	public long getMaKhachHang() {
		return MaKhachHang;
	}
	public void setMaKhachHang(long maKhachHang) {
		MaKhachHang = maKhachHang;
	}
	public String getHoTen() {
		return HoTen;
	}
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	public boolean isDaMua() {
		return DaMua;
	}
	public void setDaMua(boolean daMua) {
		DaMua = daMua;
	}
	public long getMaChiTiet() {
		return MaChiTiet;
	}
	public void setMaChiTiet(long maChiTiet) {
		MaChiTiet = maChiTiet;
	}
	public long getGiamoi() {
		return Giamoi;
	}
	public void setGiamoi(long giamoi) {
		Giamoi = giamoi;
	}
	public String getTenSanPham() {
		return TenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		TenSanPham = tenSanPham;
	}
	public long getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(long soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public long getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(long thanhTien) {
		ThanhTien = thanhTien;
	}
	
	
}
