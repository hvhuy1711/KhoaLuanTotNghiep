package bo;

import java.util.ArrayList;
import java.util.Iterator;

import bean.loaispbean;
import dao.loaispdao;

public class loaispbo {
	loaispdao ldao = new loaispdao();
	ArrayList<loaispbean> ds;
	public ArrayList<loaispbean> getloaisp() throws Exception{
		ds = ldao.getloaisp();
		return ds;
	}
	
	public String Tim(String Maloai) throws Exception{
		for (loaispbean l : ds)
			if (l.getMaLoai().equals(Maloai))
				return l.getTenLoai();
			return null;
	}
	
	public loaispbean getloaispTheoMa(int maloai) throws Exception{
		return ldao.getloaispTheoMa(maloai);
	}
	
	
	public int ThemspLoai( String Tenloai) throws Exception{
			return ldao.ThemspLoai( Tenloai);
	}
	
	public int SuaspLoai(int Maloai, String Tenloai) throws Exception{
		return ldao.SuaspLoai(Maloai, Tenloai);
	}
	
	public int XoaspLoai(int Maloai) throws Exception{
		return ldao.XoaspLoai(Maloai);
	}
	
}
