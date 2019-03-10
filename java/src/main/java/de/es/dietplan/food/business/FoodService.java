package de.es.dietplan.food.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import de.es.dietplan.food.persistence.FoodDAO;
import de.es.dietplan.food.persistence.entity.Food;

@Service
public class FoodService {
	
	private FoodDAO foodDao;

	@Autowired
	public FoodService(FoodDAO foodD) {
		this.foodDao = foodD;
	}
	
	public void createFood(Food food) {
		foodDao.createFood(food);
	}
	
	
}
