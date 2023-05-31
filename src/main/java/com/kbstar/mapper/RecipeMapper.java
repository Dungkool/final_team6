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

//    public List<RecipeBasic> search(ItemSearch csearch);
//
//    public List<RecipeBasic> searchcategory(ItemSearch csearch);

    Page<RecipeBasic> getpage() throws Exception;

//    Page<RecipeBasic> getpagesearch(String name) throws Exception;
//
//    Page<RecipeBasic> getpagecate(String name) throws Exception;

    @Transactional(readOnly = true)
    public List<RecipeBasic> getAllIngredient(Integer integer) throws Exception;

}
