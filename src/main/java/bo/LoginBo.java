package bo;

import java.util.ArrayList;

import GoogleLogin.UserGoogleBto;
import dao.LoginDao;

public class LoginBo {
	LoginDao lgdao = new LoginDao();
	
	public int ThemUser(UserGoogleBto googleBto) throws Exception{
		return lgdao.ThemUser(googleBto);
		
	}
}
