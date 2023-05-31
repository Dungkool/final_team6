package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.RecipeBasic;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
@Mapper
public interface RecipeMapper extends KBMapper<Integer, RecipeBasic> {

    Page<RecipeBasic> getpage() throws Exception;

    Page<RecipeBasic> getsearch(String recipetitle) throws Exception;


    @Transactional(readOnly = true)
    public List<RecipeBasic> getAllIngredient(Integer integer) throws Exception;

}
