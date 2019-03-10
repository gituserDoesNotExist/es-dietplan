package de.es.dietplan.common.pesistence.storedprocedure;

import javax.persistence.ParameterMode;

public class TestObject {

	public static final String SOME_CONSTANT = "irrelevant";
	
	private int intField;
	@StoredProcedureParameterMode
	private String stringField;
	@StoredProcedureParameterMode(value = ParameterMode.OUT)
	private String outputParameter;
	
	public TestObject(int intField, String stringField, String outputParameter) {
		this.intField = intField;
		this.stringField = stringField;
		this.outputParameter = outputParameter;
	}

	
	
	public String getOutputParameter() {
		return outputParameter;
	}



	public void setOutputParameter(String outputParameter) {
		this.outputParameter = outputParameter;
	}



	public int getIntField() {
		return intField;
	}

	public void setIntField(int intField) {
		this.intField = intField;
	}

	public String getStringField() {
		return stringField;
	}

	public void setStringField(String stringField) {
		this.stringField = stringField;
	}
	
	
	
}
