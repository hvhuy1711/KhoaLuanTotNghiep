package bo;

import java.util.ArrayList;

import bean.SPHoaDonBean;
import dao.SPHoaDonDao;

public class SPHoaDonBo {
	SPHoaDonDao spdao = new SPHoaDonDao();
	public ArrayList<SPHoaDonBean> getHoaDon(long MaKhachHang) throws Exception{
		return spdao.getHoaDon(MaKhachHang);
	}
}
