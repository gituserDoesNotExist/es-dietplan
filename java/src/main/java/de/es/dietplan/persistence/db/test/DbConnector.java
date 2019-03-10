package de.es.dietplan.persistence.db.test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import de.es.dietplan.common.pesistence.storedprocedure.EntityToParameterListMapper;
import de.es.dietplan.food.persistence.entity.Food;

@Component
@Transactional
public class DbConnector {

	@PersistenceUnit
	private EntityManagerFactory entityManagerFactory;

	private EntityToParameterListMapper procedureMapper = new EntityToParameterListMapper();

	public void run() {
		Food food = new Food(3, "banana");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();

		entityManager.persist(food);

		entityManager.getTransaction().commit();


//		StoredProcedureQuery query = entityManager.createStoredProcedureQuery("count_food").registerStoredProcedureParameter(1, Long.class, ParameterMode.OUT);
//		query.execute();
//
//		Long result = (Long) query.getOutputParameterValue(1);
//
//		System.out.println("result is " + result);
//
//		StoredProcedureQuery query2 = entityManager.createNamedStoredProcedureQuery("count_food");
//		query2.execute();
//		Long result2 = (Long) query2.getOutputParameterValue("food_count");
//
//		System.out.println("result2 is " + result2);
//
//		TypedQuery<Food> typedQuery = entityManager.createNamedQuery("getFood", Food.class);
//		typedQuery.setParameter(0, 2);
//		List<Food> resultList = typedQuery.getResultList();
//
//		for (Food food2 : resultList) {
//			System.out.println(food2.getName());
//		}
//
//		StoredProcedureQuery query4 = entityManager.createNamedStoredProcedureQuery("create_food");
//		query4.setParameter("id", 12);
//		query4.setParameter("name", "onion");
//		query4.execute();

	}
}
