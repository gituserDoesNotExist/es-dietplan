package de.es.dietplan.common.pesistence.storedprocedure;

import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.persistence.ParameterMode;

@Target({ElementType.FIELD})
@Retention(RUNTIME)
public @interface StoredProcedureParameterMode {

	ParameterMode value() default ParameterMode.IN;
	
}
