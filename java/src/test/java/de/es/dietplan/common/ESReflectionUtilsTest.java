package de.es.dietplan.common;

import static org.assertj.core.api.Assertions.assertThat;

import java.lang.reflect.Field;

import org.junit.Before;
import org.junit.Test;

public class ESReflectionUtilsTest {

	private ReflectionTestObject testObject;

	private Field privateField;
	private Field publicConstantField;

	@Before
	public void setUp() throws NoSuchFieldException, SecurityException {
		testObject = new ReflectionTestObject();
		Class<?> clazz = testObject.getClass();
		privateField = clazz.getDeclaredField("nonConstantField");
		publicConstantField = clazz.getDeclaredField("CONSTANTFIELD");
		
	}

	@Test
	public void isConstant() {
		assertThat(ESReflectionUtils.isConstant(privateField)).isFalse();
		assertThat(ESReflectionUtils.isConstant(publicConstantField)).isTrue();
	}

	@Test
	public void getFieldValue() {
		assertThat(ESReflectionUtils.getFieldValue(privateField, testObject)).isEqualTo("non constant field");
	}

}
