package de.es.dietplan.food.persistence.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureParameter;

import org.hibernate.annotations.NamedNativeQuery;

import de.es.dietplan.common.pesistence.BaseEntity;
import de.es.dietplan.common.pesistence.storedprocedure.StoredProcedureParameterMode;

@Entity
@NamedStoredProcedureQueries({
		@NamedStoredProcedureQuery(name = "count_food", procedureName = "count_food",
				parameters = @StoredProcedureParameter(mode = ParameterMode.OUT, type = Long.class, name = "food_count")),
		@NamedStoredProcedureQuery(name = "create_food", procedureName = "create_food", parameters = { //
				@StoredProcedureParameter(mode = ParameterMode.IN, type = Integer.class, name = "id"),
				@StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "name") })
})
@NamedNativeQuery(name = "getFood", callable = true, query = "{? = call GET_FOOD(?)}", resultClass = Food.class)
@NamedNativeQuery(name = "createFood", callable = true, query = "{? = call CREATE_FOOD(?,?)}", resultClass = Food.class)
public class Food extends BaseEntity<Food> {

	public static final String CREATE_FOOD_PROCEDURENAME = "CREATE_FOOD";
	
	@Id
	@StoredProcedureParameterMode()
	private int id;
	private String name;

	public Food() {
		this(0, null);
	}

	public Food(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
