package bo;

import java.util.ArrayList;

import bean.AnhBean;
import dao.AnhDao;

public class AnhBo {
	AnhDao anh = new AnhDao();
	public ArrayList<AnhBean> getdsAnh(int MaSanPham) throws Exception{
		return anh.getdsAnh(MaSanPham);
	}
	
	public ArrayList<AnhBean> getAnh() throws Exception{
		return anh.getAnh();
	}
	
	public int ThemAnh(int MaSanPham ,String Anh) throws Exception{
		return anh.ThemAnh(MaSanPham, Anh);
	}
	
	public int XoaAnhChon(int MaAnh) throws Exception{
		return anh.XoaAnhChon(MaAnh);
	}
}
