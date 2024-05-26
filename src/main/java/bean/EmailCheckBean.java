package bean;

public class EmailCheckBean {
	private int MaKhoa;
	private String Key;
	public int getMaKhoa() {
		return MaKhoa;
	}
	public void setMaKhoa(int maKhoa) {
		MaKhoa = maKhoa;
	}
	public String getKey() {
		return Key;
	}
	public void setKey(String key) {
		Key = key;
	}
	public EmailCheckBean(int maKhoa, String key) {
		super();
		MaKhoa = maKhoa;
		Key = key;
	}
	public EmailCheckBean() {
		super();
	}
	
}
