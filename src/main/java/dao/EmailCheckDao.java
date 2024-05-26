package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.EmailCheckBean;
import bean.HoaDonBean;

public class EmailCheckDao {
	public int DeleteKey() throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "DELETE FROM [dbo].[MaEmail]";
		PreparedStatement cmdup = kn.cn.prepareStatement(sql);
		int kq = cmdup.executeUpdate();
		cmdup.close();
		kn.cn.close();
		return kq;
	}
	
	public int ThemMa(String Key) throws Exception{
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "INSERT INTO [dbo].[MaEmail]\r\n"
				+ "           ([code])\r\n"
				+ "     VALUES\r\n"
				+ "           (?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, Key);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public ArrayList<EmailCheckBean> getMaMail() throws Exception{
		ArrayList<EmailCheckBean> e = new ArrayList<EmailCheckBean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from MaEmail";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int MaKhoa = rs.getInt("MaKhoa");
			String code = rs.getString("code");
			e.add(new EmailCheckBean(MaKhoa, code));
		}
		rs.close();
		cmd.close();
		kn.cn.close();
		return e;
	}
}
