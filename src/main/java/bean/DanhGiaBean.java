package bean;

import java.util.Date;

public class DanhGiaBean {
	private int MaDanhGia;
	private long MaKhachHang;
	private int MaSanPham;
	private int SoSao;
	private String NoiDungDanhGia;
	private Date NgayDanhGia;
	private boolean IsDanhGia;
	public DanhGiaBean(int maDanhGia, long maKhachHang, int maSanPham, int soSao, String noiDungDanhGia,
			Date ngayDanhGia, boolean isDanhGia) {
		super();
		MaDanhGia = maDanhGia;
		MaKhachHang = maKhachHang;
		MaSanPham = maSanPham;
		SoSao = soSao;
		NoiDungDanhGia = noiDungDanhGia;
		NgayDanhGia = ngayDanhGia;
		IsDanhGia = isDanhGia;
	}
	public int getMaDanhGia() {
		return MaDanhGia;
	}
	public void setMaDanhGia(int maDanhGia) {
		MaDanhGia = maDanhGia;
	}
	public long getMaKhachHang() {
		return MaKhachHang;
	}
	public void setMaKhachHang(long maKhachHang) {
		MaKhachHang = maKhachHang;
	}
	public int getMaSanPham() {
		return MaSanPham;
	}
	public void setMaSanPham(int maSanPham) {
		MaSanPham = maSanPham;
	}
	public int getSoSao() {
		return SoSao;
	}
	public void setSoSao(int soSao) {
		SoSao = soSao;
	}
	public String getNoiDungDanhGia() {
		return NoiDungDanhGia;
	}
	public void setNoiDungDanhGia(String noiDungDanhGia) {
		NoiDungDanhGia = noiDungDanhGia;
	}
	public Date getNgayDanhGia() {
		return NgayDanhGia;
	}
	public void setNgayDanhGia(Date ngayDanhGia) {
		NgayDanhGia = ngayDanhGia;
	}
	public boolean isIsDanhGia() {
		return IsDanhGia;
	}
	public void setIsDanhGia(boolean isDanhGia) {
		IsDanhGia = isDanhGia;
	}
	public DanhGiaBean() {
		super();
	}
	
	
}
