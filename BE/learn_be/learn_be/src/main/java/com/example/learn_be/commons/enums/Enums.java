package com.example.learn_be.commons.enums;

public class Enums {
	public enum Status{
		SUCCESS, ERROR, WARNING
	}
	
	public enum Gender{
		MALE(0),
		FEMALE(1),
		OTHER(2);
		
		private final int value;
		
		private Gender(int value)
		{
			this.value = value;
		}
		
		public int getValue() {
			return value;
		}
	}
}
