package de.es.dietplan.common;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

import org.springframework.util.ReflectionUtils;

public class ESReflectionUtils {

	public static boolean isConstant(Field field) {
		int modifiers = field.getModifiers();
		return Modifier.isPublic(modifiers) && Modifier.isStatic(modifiers) && Modifier.isFinal(modifiers);
	}

	public static boolean isNotConstant(Field field) {
		return !isConstant(field);
	}

	public static Object getFieldValue(Field field, Object obj) {
		field.setAccessible(true);
		return ReflectionUtils.getField(field, obj);
	}

}
