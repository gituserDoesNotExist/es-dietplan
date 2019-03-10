package de.es.dietplan.common.pesistence.storedprocedure;

import javax.persistence.ParameterMode;

public class StoredProcedureParameter {

	private String parameterNameInProcedure;
	private Object parameterValue;
	private Class<?> parameterType;
	private ParameterMode parameterMode;

	public StoredProcedureParameter(String parameterNameInProcedure, Object parameterValue, Class<?> parameterType, ParameterMode parameterMode) {
		this.parameterNameInProcedure = parameterNameInProcedure;
		this.parameterType = parameterType;
		this.parameterValue = parameterValue;
		this.parameterMode = parameterMode;
	}

	public String getParameterNameInProcedure() {
		return parameterNameInProcedure;
	}

	public Object getParameterValue() {
		return parameterValue;
	}

	public Class<?> getParameterType() {
		return parameterType;
	}

	public ParameterMode getParameterMode() {
		return parameterMode;
	}

	
}