package com.kbstar.mapper;

import com.kbstar.dto.RecipeIngredient;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface IngredientMapper extends KBMapper<Integer, RecipeIngredient> {

}
