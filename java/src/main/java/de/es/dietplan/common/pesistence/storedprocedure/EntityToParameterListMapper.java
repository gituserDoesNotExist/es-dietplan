package de.es.dietplan.common.pesistence.storedprocedure;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.persistence.ParameterMode;

import de.es.dietplan.common.ESReflectionUtils;

public class EntityToParameterListMapper<ENTITY> {

	public List<StoredProcedureParameter> entityToParameters(ENTITY obj) {
		return getDeclaredFieldsOfObject(obj).stream()//
				.filter(ESReflectionUtils::isNotConstant)//
				.map(fld -> createStoredProcedureParameterFromField(fld, obj)).collect(Collectors.toList());
	}

	private List<Field> getDeclaredFieldsOfObject(ENTITY obj) {
		Class<?> clazz = obj.getClass();
		return Arrays.asList(clazz.getDeclaredFields());
	}

	private <T> StoredProcedureParameter createStoredProcedureParameterFromField(Field field, T obj) {
		field.setAccessible(true);
		Object parameterValue = ESReflectionUtils.getFieldValue(field, obj);
		ParameterMode parameterMode = extractParameterMode(field);
		return new StoredProcedureParameter(field.getName(), parameterValue, field.getType(), parameterMode);
	}

	/**
	 * ermittelt den {@link ParameterMode}. Falls keiner angegeben ist, wird
	 * {@link ParameterMode#IN} verwendet.
	 */
	private ParameterMode extractParameterMode(Field field) {
		StoredProcedureParameterMode parameterMode = field.getDeclaredAnnotation(StoredProcedureParameterMode.class);
		return Optional.ofNullable(parameterMode).map(StoredProcedureParameterMode::value).orElse(ParameterMode.IN);
	}

}
