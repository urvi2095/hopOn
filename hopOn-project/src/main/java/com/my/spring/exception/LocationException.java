package com.my.spring.exception;

public class LocationException extends Exception {

	public LocationException(String message)
	{
		super("LocationException-"+message);
	}
	
	public LocationException(String message, Throwable cause)
	{
		super("LocationException-"+message,cause);
	}
	
}
