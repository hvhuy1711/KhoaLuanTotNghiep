package bean;

public class AnhBean {
	private int MaAnh;
	private String TenAnh;
	private int MaSanPham;
	public int getMaAnh() {
		return MaAnh;
	}
	public void setMaAnh(int maAnh) {
		MaAnh = maAnh;
	}
	public String getTenAnh() {
		return TenAnh;
	}
	public void setTenAnh(String tenAnh) {
		TenAnh = tenAnh;
	}
	public int getMaSanPham() {
		return MaSanPham;
	}
	public void setMaSanPham(int maSanPham) {
		MaSanPham = maSanPham;
	}
	public AnhBean(int maAnh, String tenAnh, int maSanPham) {
		super();
		MaAnh = maAnh;
		TenAnh = tenAnh;
		MaSanPham = maSanPham;
	}
	public AnhBean() {
		super();
	}
	
	
}
