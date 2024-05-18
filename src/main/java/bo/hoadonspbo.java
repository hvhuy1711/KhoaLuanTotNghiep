package bo;

import dao.hoadonspdao;

public class hoadonspbo {
	hoadonspdao hddao = new hoadonspdao();
	public int Themsp(long MaKhachHang) throws Exception{
		return hddao.Themsp(MaKhachHang);
	}
	
	public long getMaxhdsp() throws Exception{
		return hddao.getMaxhdsp();
	}
}