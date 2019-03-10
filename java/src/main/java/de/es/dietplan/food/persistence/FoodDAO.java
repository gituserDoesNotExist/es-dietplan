package de.es.dietplan.food.persistence;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import de.es.dietplan.common.pesistence.storedprocedure.ProcedureInvoker;
import de.es.dietplan.common.pesistence.storedprocedure.StoredProcedureParameter;
import de.es.dietplan.food.persistence.entity.Food;

@Component
public class FoodDAO {

	private ProcedureInvoker procedureInvoker;
	private FoodToParameterListMapper parameterListMapper;
	
	@Autowired
	public FoodDAO(ProcedureInvoker procedureInvoker) {
		this.procedureInvoker = procedureInvoker;
		this.parameterListMapper = new FoodToParameterListMapper();
	}


	public void createFood(Food food) {
		List<StoredProcedureParameter> parameters = parameterListMapper.entityToParameters(food);
		procedureInvoker.callProcedure(Food.CREATE_FOOD_PROCEDURENAME, Food.class, parameters);
	}

}
