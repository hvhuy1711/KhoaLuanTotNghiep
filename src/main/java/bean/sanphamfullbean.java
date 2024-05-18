package bean;

import java.util.Date;

public class sanphamfullbean extends sanphambean {
	private String Hang;
	private Date NgayNhap;
	private String MoTaSanPham;
	public sanphamfullbean() {
		super();
	}
	

	public sanphamfullbean(int maSanPham, String tenSanPham, long soLuong, long gia, long chiecKhau, String anh,
			int maLoai, String hang, Date ngayNhap, String moTaSanPham) {
		super(maSanPham, tenSanPham, soLuong, gia, chiecKhau, anh, maLoai);
		Hang = hang;
		NgayNhap = ngayNhap;
		MoTaSanPham = moTaSanPham;
	}


	public String getHang() {
		return Hang;
	}
	public void setHang(String hang) {
		Hang = hang;
	}
	public Date getNgayNhap() {
		return NgayNhap;
	}
	public void setNgayNhap(Date ngayNhap) {
		NgayNhap = ngayNhap;
	}

	public String getMoTaSanPham() {
		return MoTaSanPham;
	}

	public void setMoTaSanPham(String moTaSanPham) {
		MoTaSanPham = moTaSanPham;
	}
	
	
}
