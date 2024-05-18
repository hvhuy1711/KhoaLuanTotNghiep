package bean;

import java.util.Date;

public class ThongKeBean {
	private int MaLoai;
	private String TenLoai;
	private int MaSanpham;
	private String TenSanPham;
	private long GiaNhap;
	private long Gia;
	private long ChiecKhau;
	private String Anh;
	private String Hang;
	private Date NgayNhap;
	private String MoTaSanPham;
	private int MaKichThuoc;
	private String TenKichThuoc;
	private int SoLuongSize;
	private String TenAnh1;
	private int MaAnh;
	public int getMaLoai() {
		return MaLoai;
	}
	public void setMaLoai(int maLoai) {
		MaLoai = maLoai;
	}
	public String getTenLoai() {
		return TenLoai;
	}
	public void setTenLoai(String tenLoai) {
		TenLoai = tenLoai;
	}
	public int getMaSanpham() {
		return MaSanpham;
	}
	public void setMaSanpham(int maSanpham) {
		MaSanpham = maSanpham;
	}
	public String getTenSanPham() {
		return TenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		TenSanPham = tenSanPham;
	}
	public long getGiaNhap() {
		return GiaNhap;
	}
	public void setGiaNhap(long giaNhap) {
		GiaNhap = giaNhap;
	}
	public long getGia() {
		return Gia;
	}
	public void setGia(long gia) {
		Gia = gia;
	}
	public long getChiecKhau() {
		return ChiecKhau;
	}
	public void setChiecKhau(long chiecKhau) {
		ChiecKhau = chiecKhau;
	}
	public String getAnh() {
		return Anh;
	}
	public void setAnh(String anh) {
		Anh = anh;
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
	public int getMaKichThuoc() {
		return MaKichThuoc;
	}
	public void setMaKichThuoc(int maKichThuoc) {
		MaKichThuoc = maKichThuoc;
	}
	public String getTenKichThuoc() {
		return TenKichThuoc;
	}
	public void setTenKichThuoc(String tenKichThuoc) {
		TenKichThuoc = tenKichThuoc;
	}
	public int getSoLuongSize() {
		return SoLuongSize;
	}
	public void setSoLuongSize(int soLuongSize) {
		SoLuongSize = soLuongSize;
	}
	public String getTenAnh1() {
		return TenAnh1;
	}
	public void setTenAnh1(String tenAnh1) {
		TenAnh1 = tenAnh1;
	}
	public int getMaAnh() {
		return MaAnh;
	}
	public void setMaAnh(int maAnh) {
		MaAnh = maAnh;
	}
	public ThongKeBean(int maLoai, String tenLoai, int maSanpham, String tenSanPham, long giaNhap, long gia,
			long chiecKhau, String anh, String hang, Date ngayNhap, String moTaSanPham, int maKichThuoc,
			String tenKichThuoc, int soLuongSize, String tenAnh1, int maAnh) {
		super();
		MaLoai = maLoai;
		TenLoai = tenLoai;
		MaSanpham = maSanpham;
		TenSanPham = tenSanPham;
		GiaNhap = giaNhap;
		Gia = gia;
		ChiecKhau = chiecKhau;
		Anh = anh;
		Hang = hang;
		NgayNhap = ngayNhap;
		MoTaSanPham = moTaSanPham;
		MaKichThuoc = maKichThuoc;
		TenKichThuoc = tenKichThuoc;
		SoLuongSize = soLuongSize;
		TenAnh1 = tenAnh1;
		MaAnh = maAnh;
	}
	public ThongKeBean() {
		super();
	}
	
	
}
