package de.es.dietplan.common.pesistence.storedprocedure;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertNull;

import javax.persistence.ParameterMode;

import org.junit.Test;

import de.es.dietplan.common.pesistence.storedprocedure.StoredProcedureParameterMode;

public class StoredProcedureParameterModeTest {

	private TestObject testObject = new TestObject(1, "value", "outputParameter");
	
	
	@Test
	public void annotationDefaultIsParameterModeIn() throws Exception {
		Class<?> clazz = testObject.getClass();
		
		StoredProcedureParameterMode annotationIntField = clazz.getDeclaredField("intField").getDeclaredAnnotation(StoredProcedureParameterMode.class);
		StoredProcedureParameterMode annotationStringField = clazz.getDeclaredField("stringField").getDeclaredAnnotation(StoredProcedureParameterMode.class);
		StoredProcedureParameterMode annotationOutputField = clazz.getDeclaredField("outputParameter").getDeclaredAnnotation(StoredProcedureParameterMode.class);
		
		assertNull(annotationIntField);
		assertThat(annotationStringField.value()).isEqualTo(ParameterMode.IN);
		assertThat(annotationOutputField.value()).isEqualTo(ParameterMode.OUT);
	}
	
}
