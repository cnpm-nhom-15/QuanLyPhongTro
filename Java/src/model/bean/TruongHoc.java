package model.bean;

public class TruongHoc {
	private int id;
	private String tenTruong;
	private String diaChi;

	public TruongHoc() {
		super();
	}

	public TruongHoc(int id, String tenTruong, String diaChi) {
		super();
		this.id = id;
		this.tenTruong = tenTruong;
		this.diaChi = diaChi;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTenTruong() {
		return tenTruong;
	}

	public void setTenTruong(String tenTruong) {
		this.tenTruong = tenTruong;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	@Override
	public String toString() {
		return "TruongHoc [id=" + id + ", tenTruong=" + tenTruong + ", diaChi=" + diaChi + "]";
	}

}
