package bean;

import java.util.Date;

public class giospbean extends sanphamfullbean {
	private long MaGioHang;
	private long MaKhachHang;
	private long SoLuongMua;
	private long DonGia;
	private String GhiChu;
	private long thanhtien;
	
	
	public giospbean(int maSanPham, String tenSanPham, long soLuong, long gia, long chiecKhau, String anh, int maLoai,
			String hang, Date ngayNhap, String moTaSanPham, long maGioHang, long maKhachHang, long soLuongMua,
			long donGia, String ghiChu, long thanhtien) {
		super(maSanPham, tenSanPham, soLuong, gia, chiecKhau, anh, maLoai, hang, ngayNhap, moTaSanPham);
		MaGioHang = maGioHang;
		MaKhachHang = maKhachHang;
		SoLuongMua = soLuongMua;
		DonGia = donGia;
		GhiChu = ghiChu;
		this.thanhtien = thanhtien;
	}
	public giospbean() {
		super();
	}
	public long getMaGioHang() {
		return MaGioHang;
	}
	public void setMaGioHang(long maGioHang) {
		MaGioHang = maGioHang;
	}
	public long getMaKhachHang() {
		return MaKhachHang;
	}
	public void setMaKhachHang(long maKhachHang) {
		MaKhachHang = maKhachHang;
	}

	public long getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(long soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public long getDonGia() {
		return DonGia;
	}
	public void setDonGia(long donGia) {
		DonGia = donGia;
	}
	public String getGhiChu() {
		return GhiChu;
	}
	public void setGhiChu(String ghiChu) {
		GhiChu = ghiChu;
	}
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	
	
	
}
