package com.example.learn_be.commons.enums;

import java.util.Arrays;
import java.util.Objects;

public enum Role{
	USER(1,"User"),
	ADMIN(2, "Administrator"),
	STAFF(3, "Staff");
	
	private Integer id;
	private String decription;
	
	Role(Integer id, String decription)
	{
		this.id = id;
		this.decription = decription;
	}
	
	public Integer getId() {
		return id;
	}
	
	public String getDecription() {
		return decription;
	}
	
	public void seiId(Integer id)
	{
		this.id = id;
	}
	
	public void setDecription(String decription) {
		this.decription = decription;
	}
	
	public static Role fromId(Integer id) {
		return Arrays.stream(Role.values())
				.filter(role -> Objects.equals(role.getId(), id))
				.findFirst()
				.orElseThrow(()->new IllegalArgumentException("Unknown role: " + id));
	}
	
	public static Role fromDectiption(String decription) {
		return Arrays.stream(Role.values())
				.filter(role -> Objects.equals(role.getDecription(), decription))
				.findFirst()
				.orElseThrow(()->new IllegalArgumentException("Unknown role: " + decription));
	}
}