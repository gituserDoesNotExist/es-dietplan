package de.es.dietplan.common;

public class ESException extends RuntimeException {

	private static final long serialVersionUID = -1425941906329802102L;
	
	
	public ESException(String msg, Throwable cause) {
		super(msg,cause);
	}
	

}
