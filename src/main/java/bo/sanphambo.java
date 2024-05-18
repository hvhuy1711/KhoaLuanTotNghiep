package bo;

import java.util.ArrayList;
import java.util.Date;

import bean.sanphambean;
import bean.sanphamfullbean;
import dao.sanphamdao;

public class sanphambo {
	sanphamdao sdao = new sanphamdao();
	ArrayList<sanphamfullbean> ds;
	
	public ArrayList<sanphamfullbean> getsanpham() throws Exception{
		ds= sdao.getsanpham();
		return ds;
	}
	
	public ArrayList<sanphamfullbean> getSanPhamTM(int MaLoai) throws Exception{
		return sdao.getSanPhamTM(MaLoai);
	}
	
	public ArrayList<String> getHang() throws Exception {
		return sdao.getHang();
	}
	
	public sanphamfullbean get1sanpham(String MaSanPham) throws Exception {
		return sdao.get1sanpham(MaSanPham);
	}
	
	public sanphamfullbean get1sanphamMaLoai(String MaLoai) throws Exception {
		return sdao.get1sanphamMaLoai(MaLoai);
	}
	
	public ArrayList<sanphamfullbean> getSpTheoHang(String Hang) throws Exception{
		return sdao.getSpTheoHang(Hang);
	}
	
	//tìm kiếm theo mã
	//ds.get(i).getMaLoai().toLowerCase().trim().equals(maLoai.toLowerCase().trim())
	public ArrayList<sanphamfullbean> timMa(String maLoai) throws Exception {
		ds= sdao.getsanpham();
		int n = ds.size();
		ArrayList<sanphamfullbean> dsMa = new ArrayList<sanphamfullbean>();
		for(int i=0; i < n; i++) {
			if (ds.get(i).getMaLoai() == Integer.parseInt(maLoai.toLowerCase().trim()))
				dsMa.add(ds.get(i));
		}
		return dsMa;
	}
	
	public double maxGia() throws Exception{
		ds= sdao.getsanpham();
		 if (ds != null && !ds.isEmpty()) {
	            double maxgia = 0;
	            for (sanphamfullbean sp : ds) {
	                long gia = sp.getGia();
	                long chiecKhau = sp.getChiecKhau(); // Điều chỉnh tùy thuộc vào cách bạn lấy giảm giá.
	                double giaCK = gia - (gia * (chiecKhau / 100.0)); // Chia cho 100.0 để thực hiện phép tính chia double.
	                if (giaCK > maxgia) {
	                    maxgia = giaCK;
	                }
	            }
	            return maxgia;
	        }
	        return 0; // Trả về 0 nếu danh sách rỗng hoặc null.
	    }
	public ArrayList<sanphamfullbean> timGia(String giaMin, String giaMax) throws Exception {
	    ds = sdao.getsanpham();
	    ArrayList<sanphamfullbean> dsGia = new ArrayList<sanphamfullbean>();
	    int n = ds.size();
	    for (int i = 0; i < n; i++) {
	        double gia = ds.get(i).getGia();
	        double chiecKhau = ds.get(i).getChiecKhau();
	        double giaCK = gia * (1 - chiecKhau / 100); // Giảm giá từ giá gốc
	        if (giaCK >= Double.parseDouble(giaMin) && giaCK < Double.parseDouble(giaMax))
	            dsGia.add(ds.get(i));
	    }
	    return dsGia;
	}

	//Tìm theo hãng
	public ArrayList<sanphamfullbean> timHang(String hang) throws Exception {
		ds= sdao.getSpTheoHang(hang);
		int n = ds.size();
		ArrayList<sanphamfullbean> dsMa = new ArrayList<sanphamfullbean>();
		for(int i=0; i < n; i++) {
			if (ds.get(i).getHang().equals(hang))
				dsMa.add(ds.get(i));
		}
		return dsMa;
	}
	
	//tìm kiếm theo key
	public ArrayList<sanphamfullbean> Tim(String key) throws Exception{
		ds= sdao.getsanpham();
		int n = ds.size();
		ArrayList<sanphamfullbean> tam = new ArrayList<sanphamfullbean>();
		for(int i = 0;i<n;i++) {
			if(ds.get(i).getTenSanPham().toLowerCase().contains(key.toLowerCase().trim()))
				tam.add(ds.get(i));
			
			}
		return tam;
	}
	
//	public String Timsp( int MaSanPham) throws Exception{
//		for (sanphambean l : ds)
//			if (l.getMaSanPham().equals(MaSanPham))
//				return l.getTenSanPham();
//			return null;
//	}
//	
	public int Themsp(String TenSanPham,long SoLuong,long Gia, long Chieckhau,
			String Anh,String Hang,String MaLoai, String MoTaSanPham) throws Exception{
			return sdao.Themsp(TenSanPham, SoLuong, Gia, Chieckhau, Anh, Hang, MaLoai, MoTaSanPham);	
	}
	
	public int Suasp(String MaSanPham,String TenSanPham,long SoLuong,long Gia, long ChiecKhau,
			String Anh,String Hang,String MaLoai,String Mota) throws Exception{
		return sdao.Suasp(MaSanPham, TenSanPham, SoLuong, Gia, ChiecKhau, Anh, Hang, MaLoai, Mota);
	}
	
	public int Xoasp(String MaSanPham) throws Exception{
		return sdao.Xoasp(MaSanPham);
		
	}
	
}
