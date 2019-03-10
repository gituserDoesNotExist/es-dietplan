package de.es.dietplan.food.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import de.es.dietplan.food.business.FoodService;
import de.es.dietplan.food.persistence.entity.Food;

@RestController
public class FoodController {

	@Autowired
	private FoodService foodService;
	
	private FoodMapper foodMapper = new FoodMapper();
	
	@RequestMapping("/")
	public String index() {
		Food food = foodMapper.asEntity(new FoodDTO(50, "icecream"));
		foodService.createFood(food);
		return "Created a new food!";
	}

}