package bo;

import java.util.ArrayList;

import bean.EmailCheckBean;
import dao.EmailCheckDao;

public class EmailCheckBo {
	EmailCheckDao edao = new EmailCheckDao();
	public ArrayList<EmailCheckBean> getMaMail() throws Exception{
		return edao.getMaMail();
	}
	public int ThemMa(String Key) throws Exception{
		return edao.ThemMa(Key);
	}
	
	public int DeleteKey() throws Exception{
		return edao.DeleteKey();
	}
}


