package de.es.dietplan.common.pesistence.storedprocedure;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.StoredProcedureQuery;

import org.springframework.stereotype.Component;

@Component
public class ProcedureInvoker {

	@PersistenceUnit
	private EntityManagerFactory entityManagerFactory;
	
	
	public void callProcedure(String procedureName, Class<?> entityType, List<StoredProcedureParameter> parameters) {
		EntityManager entityManager = createEntityManager();
		StoredProcedureQuery query = entityManager.createStoredProcedureQuery(procedureName, entityType);
		parameters.forEach(parameter -> addParameterToQuery(query, parameter));
		query.execute();
	}


	private void addParameterToQuery(StoredProcedureQuery query, StoredProcedureParameter parameter) {
		String parameterNameInProcedure = parameter.getParameterNameInProcedure();
		query.registerStoredProcedureParameter(parameterNameInProcedure, parameter.getParameterType(), parameter.getParameterMode());
		query.setParameter(parameterNameInProcedure, parameter.getParameterValue());
	}
	

	protected EntityManager createEntityManager() {
			return entityManagerFactory.createEntityManager();
	}
	
}
