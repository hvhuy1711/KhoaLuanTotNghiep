package bean;

public class NhanHangBean {
	private int MaNhanHang;
	private String TenNguoiNhan;
	private String DiaChiNhan;
	private String SoDienThoai;
	private String Email;
	private String GhiChu;
	private int TrangThai;
	private int MaHoaDon;
	
	
	public NhanHangBean() {
		super();
	}
	public NhanHangBean(int maNhanHang, String tenNguoiNhan, String diaChiNhan, String soDienThoai, String email,
			String ghiChu, int trangThai, int maHoaDon) {
		super();
		MaNhanHang = maNhanHang;
		TenNguoiNhan = tenNguoiNhan;
		DiaChiNhan = diaChiNhan;
		SoDienThoai = soDienThoai;
		Email = email;
		GhiChu = ghiChu;
		TrangThai = trangThai;
		MaHoaDon = maHoaDon;
	}
	public int getMaNhanHang() {
		return MaNhanHang;
	}
	public void setMaNhanHang(int maNhanHang) {
		MaNhanHang = maNhanHang;
	}
	public String getTenNguoiNhan() {
		return TenNguoiNhan;
	}
	public void setTenNguoiNhan(String tenNguoiNhan) {
		TenNguoiNhan = tenNguoiNhan;
	}
	public String getDiaChiNhan() {
		return DiaChiNhan;
	}
	public void setDiaChiNhan(String diaChiNhan) {
		DiaChiNhan = diaChiNhan;
	}
	public String getSoDienThoai() {
		return SoDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		SoDienThoai = soDienThoai;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getGhiChu() {
		return GhiChu;
	}
	public void setGhiChu(String ghiChu) {
		GhiChu = ghiChu;
	}
	public int getTrangThai() {
		return TrangThai;
	}
	public void setTrangThai(int trangThai) {
		TrangThai = trangThai;
	}
	public int getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(int maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	
	
}
