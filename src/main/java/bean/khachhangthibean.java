package bean;

public class khachhangthibean {
	private String HoTen;
	private String DiaChi;
	private String SoDT;
	private String Email;
	private String TenDN;
	private String MatKhau;
	private long MaKhachHang;
	private boolean Quyen;
	private String google_id;
	
	public String getGoogle_id() {
		return google_id;
	}
	public void setGoogle_id(String google_id) {
		this.google_id = google_id;
	}
	public boolean isQuyen() {
		return Quyen;
	}
	public void setQuyen(boolean quyen) {
		Quyen = quyen;
	}
	public khachhangthibean() {
		super();
	}
	

	public khachhangthibean(String hoTen, String diaChi, String soDT, String email, String tenDN, String matKhau,
			long maKhachHang, boolean quyen, String google_id) {
		super();
		HoTen = hoTen;
		DiaChi = diaChi;
		SoDT = soDT;
		Email = email;
		TenDN = tenDN;
		MatKhau = matKhau;
		MaKhachHang = maKhachHang;
		Quyen = quyen;
		this.google_id = google_id;
	}
	public String getHoTen() {
		return HoTen;
	}
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	public String getSoDT() {
		return SoDT;
	}
	public void setSoDT(String soDT) {
		SoDT = soDT;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getTenDN() {
		return TenDN;
	}
	public void setTenDN(String tenDN) {
		TenDN = tenDN;
	}
	public String getMatKhau() {
		return MatKhau;
	}
	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}
	public long getMaKhachHang() {
		return MaKhachHang;
	}
	public void setMaKhachHang(long maKhachHang) {
		MaKhachHang = maKhachHang;
	}
	
	
}
