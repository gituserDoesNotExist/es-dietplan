package de.es.dietplan.food.web;

import de.es.dietplan.common.web.BaseDTO;

public class FoodDTO extends BaseDTO<FoodDTO> {

	private final int id;
	private final String name;

	public FoodDTO(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}
	
	
	
}
