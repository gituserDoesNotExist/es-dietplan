package de.es.dietplan.common.web;

import de.es.dietplan.common.pesistence.BaseEntity;

public abstract class AbstractMapper<ENTITY extends BaseEntity<ENTITY>,DTO extends BaseDTO<DTO>> {

	public abstract DTO asDto(ENTITY entity);

	public abstract ENTITY asEntity(DTO dto);
	
}
