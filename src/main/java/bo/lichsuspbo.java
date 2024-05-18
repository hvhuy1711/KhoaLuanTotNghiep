package bo;

import java.util.ArrayList;

import bean.choxacnhanbean;
import dao.lichsuspdao;

public class lichsuspbo {
	lichsuspdao lsdao = new lichsuspdao();
	public ArrayList<choxacnhanbean> lichsu(long MaKhachHang) throws Exception{
		return lsdao.lichsu(MaKhachHang);
	}
	
	
}
