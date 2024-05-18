package bean;

public class KichThuocBean {
	private int MaKichThuoc;
	private String TenKichThuoc;
	private int MaSanPham;
	private int SoLuongSize;
	
	public int getSoLuongSize() {
		return SoLuongSize;
	}
	public void setSoLuongSize(int soLuongSize) {
		SoLuongSize = soLuongSize;
	}
	public KichThuocBean(int maKichThuoc, String tenKichThuoc, int maSanPham, int soLuongSize) {
		super();
		MaKichThuoc = maKichThuoc;
		TenKichThuoc = tenKichThuoc;
		MaSanPham = maSanPham;
		SoLuongSize = soLuongSize;
	}
	public KichThuocBean() {
		super();
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
	public int getMaSanPham() {
		return MaSanPham;
	}
	public void setMaSanPham(int maSanPham) {
		MaSanPham = maSanPham;
	}
	
}
