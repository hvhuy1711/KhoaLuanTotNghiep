package bean;

import java.util.Date;

public class DonHangDaDatBean {
	private int MaChiTiet;
	private int TrangThaiCt;
	private String GhiChuCT;
	private int DonGiaSP;
	private int SoLuongMua;
	private int MaHoaDon;
	private long MaKhachHang;
	private String HoTen;
	private String DiaChi;
	private String SoDT;
	private String Email;
	private String TenDN;
	private boolean Quyen;
	private String google_id;
	private String TongTien;
	private int TrangThai;
	private int MaSanPham;
	private String TenSanPham;
	private String Anh;
	private String Hang;
	private int MaLoai;
	private String MoTaSanPham;
	private int TrangThaiDon;
	private String GhiChuLS;
	private Date NgayMua;
//	private Date NgayDatDon;
	private int ChiecKhau;
	private int MaLichSu;
	
	

	public DonHangDaDatBean(int maChiTiet, int trangThaiCt, String ghiChuCT, int donGiaSP, int soLuongMua, int maHoaDon,
			long maKhachHang, String hoTen, String diaChi, String soDT, String email, String tenDN, boolean quyen,
			String google_id, String tongTien, int trangThai, int maSanPham, String tenSanPham, String anh, String hang,
			int maLoai, String moTaSanPham, int trangThaiDon, String ghiChuLS, Date ngayMua, int chiecKhau,
			int maLichSu) {
		super();
		MaChiTiet = maChiTiet;
		TrangThaiCt = trangThaiCt;
		GhiChuCT = ghiChuCT;
		DonGiaSP = donGiaSP;
		SoLuongMua = soLuongMua;
		MaHoaDon = maHoaDon;
		MaKhachHang = maKhachHang;
		HoTen = hoTen;
		DiaChi = diaChi;
		SoDT = soDT;
		Email = email;
		TenDN = tenDN;
		Quyen = quyen;
		this.google_id = google_id;
		TongTien = tongTien;
		TrangThai = trangThai;
		MaSanPham = maSanPham;
		TenSanPham = tenSanPham;
		Anh = anh;
		Hang = hang;
		MaLoai = maLoai;
		MoTaSanPham = moTaSanPham;
		TrangThaiDon = trangThaiDon;
		GhiChuLS = ghiChuLS;
		NgayMua = ngayMua;
		ChiecKhau = chiecKhau;
		MaLichSu = maLichSu;
	}


	public int getMaLichSu() {
		return MaLichSu;
	}


	public void setMaLichSu(int maLichSu) {
		MaLichSu = maLichSu;
	}



	public int getChiecKhau() {
		return ChiecKhau;
	}


	public void setChiecKhau(int chiecKhau) {
		ChiecKhau = chiecKhau;
	}
	
//	public DonHangDaDatBean(int maChiTiet, int trangThaiCt, String ghiChuCT, int donGiaSP, int soLuongMua, int maHoaDon,
//			long maKhachHang, String hoTen, String diaChi, String soDT, String email, String tenDN, boolean quyen,
//			String google_id, Date ngayMua, String tongTien, int trangThai, int maSanPham, String tenSanPham,
//			String anh, String hang, int maLoai, String moTaSanPham, Date ngayDatDon, String ghiChuLS,
//			int trangThaiDon) {
//		super();
//		MaChiTiet = maChiTiet;
//		TrangThaiCt = trangThaiCt;
//		GhiChuCT = ghiChuCT;
//		DonGiaSP = donGiaSP;
//		SoLuongMua = soLuongMua;
//		MaHoaDon = maHoaDon;
//		MaKhachHang = maKhachHang;
//		HoTen = hoTen;
//		DiaChi = diaChi;
//		SoDT = soDT;
//		Email = email;
//		TenDN = tenDN;
//		Quyen = quyen;
//		this.google_id = google_id;
//		NgayMua = ngayMua;
//		TongTien = tongTien;
//		TrangThai = trangThai;
//		MaSanPham = maSanPham;
//		TenSanPham = tenSanPham;
//		Anh = anh;
//		Hang = hang;
//		MaLoai = maLoai;
//		MoTaSanPham = moTaSanPham;
//		NgayDatDon = ngayDatDon;
//		GhiChuLS = ghiChuLS;
//		TrangThaiDon = trangThaiDon;
//	}
//
//
//	public DonHangDaDatBean(int maChiTiet, int trangThaiCt, String ghiChuCT, int donGiaSP, int soLuongMua, int maHoaDon,
//			long maKhachHang, String hoTen, String diaChi, String soDT, String email, String tenDN, boolean quyen,
//			String google_id, String tongTien, int trangThai, int maSanPham, String tenSanPham, String anh, String hang,
//			int maLoai, String moTaSanPham, int trangThaiDon, Date ngayDatDon) {
//		super();
//		MaChiTiet = maChiTiet;
//		TrangThaiCt = trangThaiCt;
//		GhiChuCT = ghiChuCT;
//		DonGiaSP = donGiaSP;
//		SoLuongMua = soLuongMua;
//		MaHoaDon = maHoaDon;
//		MaKhachHang = maKhachHang;
//		HoTen = hoTen;
//		DiaChi = diaChi;
//		SoDT = soDT;
//		Email = email;
//		TenDN = tenDN;
//		Quyen = quyen;
//		this.google_id = google_id;
//		TongTien = tongTien;
//		TrangThai = trangThai;
//		MaSanPham = maSanPham;
//		TenSanPham = tenSanPham;
//		Anh = anh;
//		Hang = hang;
//		MaLoai = maLoai;
//		MoTaSanPham = moTaSanPham;
//		NgayDatDon = ngayDatDon;
//		TrangThaiDon = trangThaiDon;
//	}
//
//
//	public DonHangDaDatBean(int maChiTiet, int trangThaiCt, String ghiChuCT, int donGiaSP, int soLuongMua, int maHoaDon,
//			long maKhachHang, String hoTen, String diaChi, String soDT, String email, String tenDN, boolean quyen,
//			String google_id, Date ngayMua, String tongTien, int trangThai, int maSanPham, String tenSanPham,
//			String anh, String hang, int maLoai, String moTaSanPham, Date ngayDatDon, int trangThaiDon) {
//		super();
//		MaChiTiet = maChiTiet;
//		TrangThaiCt = trangThaiCt;
//		GhiChuCT = ghiChuCT;
//		DonGiaSP = donGiaSP;
//		SoLuongMua = soLuongMua;
//		MaHoaDon = maHoaDon;
//		MaKhachHang = maKhachHang;
//		HoTen = hoTen;
//		DiaChi = diaChi;
//		SoDT = soDT;
//		Email = email;
//		TenDN = tenDN;
//		Quyen = quyen;
//		this.google_id = google_id;
//		NgayMua = ngayMua;
//		TongTien = tongTien;
//		TrangThai = trangThai;
//		MaSanPham = maSanPham;
//		TenSanPham = tenSanPham;
//		Anh = anh;
//		Hang = hang;
//		MaLoai = maLoai;
//		MoTaSanPham = moTaSanPham;
//		NgayDatDon = ngayDatDon;
//		TrangThaiDon = trangThaiDon;
//	}
//

	public String getGhiChuLS() {
		return GhiChuLS;
	}
	public void setGhiChuLS(String ghiChuLS) {
		GhiChuLS = ghiChuLS;
	}
	public int getMaChiTiet() {
		return MaChiTiet;
	}
	public void setMaChiTiet(int maChiTiet) {
		MaChiTiet = maChiTiet;
	}
	
	public int getMaSanPham() {
		return MaSanPham;
	}
	public void setMaSanPham(int maSanPham) {
		MaSanPham = maSanPham;
	}
	public int getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(int soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	
	public int getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(int maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public int getTrangThaiDon() {
		return TrangThaiDon;
	}
	public void setTrangThaiDon(int trangThaiDon) {
		TrangThaiDon = trangThaiDon;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	public String getHoTen() {
		return HoTen;
	}
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
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
	public long getMaKhachHang() {
		return MaKhachHang;
	}
	public void setMaKhachHang(long maKhachHang) {
		MaKhachHang = maKhachHang;
	}
	public boolean isQuyen() {
		return Quyen;
	}
	public void setQuyen(boolean quyen) {
		Quyen = quyen;
	}
	public String getGoogle() {
		return google_id;
	}
	public void setGoogle(String google) {
		this.google_id = google;
	}
	
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	
	public int getTrangThaiCt() {
		return TrangThaiCt;
	}
	public void setTrangThaiCt(int trangThaiCt) {
		TrangThaiCt = trangThaiCt;
	}
	public String getGhiChuCT() {
		return GhiChuCT;
	}
	public void setGhiChuCT(String ghiChuCT) {
		GhiChuCT = ghiChuCT;
	}
	public int getDonGiaSP() {
		return DonGiaSP;
	}
	public void setDonGiaSP(int donGiaSP) {
		DonGiaSP = donGiaSP;
	}
	public String getGoogle_id() {
		return google_id;
	}
	public void setGoogle_id(String google_id) {
		this.google_id = google_id;
	}
	public String getTongTien() {
		return TongTien;
	}
	public void setTongTien(String tongTien) {
		TongTien = tongTien;
	}
	public int getTrangThai() {
		return TrangThai;
	}
	public void setTrangThai(int trangThai) {
		TrangThai = trangThai;
	}
	public String getTenSanPham() {
		return TenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		TenSanPham = tenSanPham;
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
	public int getMaLoai() {
		return MaLoai;
	}
	public void setMaLoai(int maLoai) {
		MaLoai = maLoai;
	}
	public String getMoTaSanPham() {
		return MoTaSanPham;
	}
	public void setMoTaSanPham(String moTaSanPham) {
		MoTaSanPham = moTaSanPham;
	}
//	public Date getNgayDatDon() {
//		return NgayDatDon;
//	}
//	public void setNgayDatDon(Date ngayDatDon) {
//		NgayDatDon = ngayDatDon;
//	}
	public DonHangDaDatBean() {
		super();
	}
	
	
}
