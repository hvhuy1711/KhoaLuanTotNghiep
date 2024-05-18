package bean;

public class sanphambean {
	private int MaSanPham;
	private String TenSanPham;
	private long SoLuong;
	private long Gia;
	private long ChiecKhau;
	private String Anh;
	private int MaLoai;
	
	
	public sanphambean(int maSanPham, String tenSanPham, long soLuong, long gia, long chiecKhau, String anh,
			int maLoai) {
		super();
		MaSanPham = maSanPham;
		TenSanPham = tenSanPham;
		SoLuong = soLuong;
		Gia = gia;
		ChiecKhau = chiecKhau;
		Anh = anh;
		MaLoai = maLoai;
	}
	public sanphambean() {
		super();
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
	public long getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(long soLuong) {
		SoLuong = soLuong;
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
	public int getMaLoai() {
		return MaLoai;
	}
	public void setMaLoai(int maLoai) {
		MaLoai = maLoai;
	}
	
	
}
