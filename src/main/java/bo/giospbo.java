package bo;

import java.util.ArrayList;

import bean.giospbean;
import dao.giospdao;

public class giospbo {
//	public ArrayList<giospbean> ds= new ArrayList<giospbean>();
//	public void add(String tenSanPham, long soLuong, long giaMoi, String anh, String maSanPham){
//		int n=ds.size();
//			for(int i=0;i<n;i++){
//				if(ds.get(i).getMaSanPham().toLowerCase().trim().equals(maSanPham.toLowerCase().trim())){
//					ds.get(i).setSoLuong(soLuong + ds.get(i).getSoLuong());
//					return;
//			}
//		}
//	giospbean hang= new giospbean(maSanPham, tenSanPham, giaMoi, soLuong, anh);
//	ds.add(hang);
//}
//	
//	// Xoá hàng ra khỏi ds
//	public void XoaHang(String tenSanPham) {
//		int n=ds.size();
//		for (int i=0;i<n;i++) 
//			if (ds.get(i).getTenSanPham().toLowerCase().trim()
//					.equals(tenSanPham.toLowerCase().trim())) {
//				ds.remove(i); 
//				return;
//			}
//	}
//	
//	//Sửa lại số lượng
//	public void Sua(String tenSanPham,long soluongmoi) {
//		int n=ds.size();
//		for (int i=0;i<n;i++) {
//			giospbean h = ds.get(i);
//			if (h.getTenSanPham().equals(tenSanPham)) {
//				h.setSoLuong(soluongmoi);
//				ds.set(i,h);
//			}
//		}
//	}
//	
//public long Tongtien(){
//		int n=ds.size();
//		long s=0;
//		for(int i=0;i<n;i++){
//			s=s+ds.get(i).getThanhtien();
//		}
//		return s;
//  }
	giospdao ghdao = new giospdao();
	public ArrayList<giospbean> getdsgio(long MaKhachHang) throws Exception{
		return ghdao.getdsgio(MaKhachHang);
	}
	
	public ArrayList<giospbean> getAlldsgio()throws Exception{
		return ghdao.getAlldsgio();
	}
	
	public ArrayList<giospbean> getdsgio1SP(long MaKhachHang, int MaSanPham, String GhiChu) throws Exception{
		return ghdao.getdsgio1SP(MaKhachHang, MaSanPham, GhiChu);
	}
	public giospbean get1spgio(long MaKhachHang,int MaSanPham) throws Exception{
		return ghdao.get1spgio(MaKhachHang, MaSanPham);
	}
	
	public int UpdateGioKT(int MaSanPham, String GhiChu) throws Exception{
		return ghdao.UpdateGioKT(MaSanPham, GhiChu);
	}
	
	public int UpdateSLGio( long SoLuongMua, long MaGioHang) throws Exception{
		return ghdao.UpdateSLGio( SoLuongMua,  MaGioHang);
	}
	
	public int ThemSpGio(int MaKhachHang, int MaSanPham, long SoLuongMua, long DonGia,String GhiChu) throws Exception{
		return ghdao.ThemSpGio(MaKhachHang, MaSanPham, SoLuongMua, DonGia, GhiChu);
	}
	
	public int UpdateGio(int MaSanPham, long SoLuongMua, String GhiChu) throws Exception{
		return ghdao.UpdateGio(MaSanPham, SoLuongMua, GhiChu);
	}
	
	public int DeleteGio(int MaSanPham,String Ghichu) throws Exception{
		return ghdao.DeleteGio(MaSanPham,Ghichu);
	}
	
	public int DeleteGioChon(int MaSanPham) throws Exception{
		return ghdao.DeleteGioChon(MaSanPham);
	}
	
	public int DeleteGioKH(int MaKhachHang) throws Exception{
		return ghdao.DeleteGioKH(MaKhachHang);
	}
	
	public int DeleteGioChon1(int MaSanPham, String ghichu) throws Exception{
		return ghdao.DeleteGioChon1(MaSanPham, ghichu);
	}
	
	public int DeleteGio1SP(int MaSanPham, String GhiChu, long MaKhachHang) throws Exception{
		return ghdao.DeleteGio1SP(MaSanPham, GhiChu, MaKhachHang);
	}
	
}
