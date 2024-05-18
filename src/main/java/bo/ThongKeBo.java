package bo;

import java.util.ArrayList;

import bean.ThongKeBean;
import dao.ThongKeDao;

public class ThongKeBo {
	ThongKeDao tkdao = new ThongKeDao();
	public ArrayList<ThongKeBean> GetThongKe() throws Exception {
		return tkdao.GetThongKe();
	}
}
