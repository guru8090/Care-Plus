package com.entity;

public class Doctor {
	private int id;
	private String fullName;
	private String dob;
	private String qualification;
	private String spec;
	private String email;
	private String mobno;
	private String password;
	
	public Doctor(String fullName, String dob, String qualification, String spec, String email, String mobno,
			String password) {
		this.fullName=fullName;
		this.dob=dob;
		this.qualification=qualification;
		this.spec=spec;
		this.email=email;
		this.mobno=mobno;
		this.password=password;
	}
	public Doctor(int id,String fullName, String dob, String qualification, String spec, String email, String mobno
			) {
		this.id=id;
		this.fullName=fullName;
		this.dob=dob;
		this.qualification=qualification;
		this.spec=spec;
		this.email=email;
		this.mobno=mobno;
	}
	public Doctor() {
		// TODO Auto-generated constructor stub
	}

	public Doctor(int id2, String fullName2, String dob2, String qualification2, String spec2, String email2,
			String mobno2, String password2) {	    
		this.id=id2;
		this.fullName=fullName2;
		this.dob=dob2;
		this.qualification=qualification2;
		this.spec=spec2;
		this.email=email2;
		this.mobno=mobno2;
		this.password=password2;
	}

	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobno() {
		return mobno;
	}
	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public void setId(int id) {
		this.id=id;
	}
	public int getId() {
		return id;
	}
}
