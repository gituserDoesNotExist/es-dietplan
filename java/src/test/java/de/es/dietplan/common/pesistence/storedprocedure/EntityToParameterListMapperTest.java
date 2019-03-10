package de.es.dietplan.common.pesistence.storedprocedure;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.ParameterMode;

import org.junit.Test;

public class EntityToParameterListMapperTest {

	private static final String NAME_INT_FIELD = "intField";
	private static final String NAME_STRING_FIELD = "stringField";
	private static final String NAME_OUTPUT_PARAMETER_FIELD = "outputParameter";

	private static final int EXPECTED_VALUE_INT_FIELD = 1;
	private static final String EXPECTED_VALUE_STRING_FIELD = "value";
	private static final String VALUE_OUTPUT_PARAMETER = "outputParameterValue";

	private EntityToParameterListMapper<TestObject> testCandiate = new EntityToParameterListMapper<>();

	@Test
	public void mapJavaObjectToParameterMap_Success() throws Exception {
		TestObject testObject = new TestObject(EXPECTED_VALUE_INT_FIELD, EXPECTED_VALUE_STRING_FIELD, VALUE_OUTPUT_PARAMETER);

		List<StoredProcedureParameter> result = testCandiate.entityToParameters(testObject);

		assertThat(result.stream().map(StoredProcedureParameter::getParameterNameInProcedure).collect(Collectors.toList()))
				.containsExactlyInAnyOrder(NAME_INT_FIELD, NAME_STRING_FIELD, NAME_OUTPUT_PARAMETER_FIELD);
		assertThat(result.stream().map(StoredProcedureParameter::getParameterValue).collect(Collectors.toList()))
				.containsExactlyInAnyOrder(EXPECTED_VALUE_INT_FIELD, EXPECTED_VALUE_STRING_FIELD, VALUE_OUTPUT_PARAMETER);
		assertThat(result.stream().map(StoredProcedureParameter::getParameterMode).collect(Collectors.toList())).containsExactlyInAnyOrder(ParameterMode.IN,
				ParameterMode.IN, ParameterMode.OUT);
	}

}
