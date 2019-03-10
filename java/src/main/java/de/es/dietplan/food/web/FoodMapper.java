package de.es.dietplan.food.web;

import de.es.dietplan.common.web.AbstractMapper;
import de.es.dietplan.food.persistence.entity.Food;

public class FoodMapper extends AbstractMapper<Food, FoodDTO>{

	@Override
	public FoodDTO asDto(Food entity) {
		return new FoodDTO(entity.getId(), entity.getName());
	}

	@Override
	public Food asEntity(FoodDTO entity) {
		Food food = new Food();
		food.setId(entity.getId());
		food.setName(entity.getName());
		return food;
	}

}
