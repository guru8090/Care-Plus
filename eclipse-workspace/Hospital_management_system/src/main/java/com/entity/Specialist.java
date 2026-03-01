package com.entity;

public class Specialist {
	
	private int id;
	private String specialistName;
	
	public Specialist(int id,String specialistName) {
		this.id=id;
		this.specialistName=specialistName;
	}

	public Specialist() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSpecialistName() {
		return specialistName;
	}

	public void setSpecialistName(String specialistName) {
		this.specialistName = specialistName;
	}
	
}
