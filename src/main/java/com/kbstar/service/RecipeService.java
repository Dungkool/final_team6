package com.kbstar.service;

import com.kbstar.dto.RecipeBasic;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.RecipeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RecipeService implements KBService<Integer, RecipeBasic> {
    @Autowired
    RecipeMapper mapper;


    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param recipeBasic
     */
    @Override
    public void register(RecipeBasic recipeBasic) throws Exception {
        mapper.insert(recipeBasic);
    }

    @Override
    public void remove(Integer recipepin) throws Exception {
        mapper.delete(recipepin);
    }

    @Override
    public void modify(RecipeBasic recipeBasic) throws Exception {
        mapper.update(recipeBasic);
    }

    @Override
    public RecipeBasic get(Integer recipepin) throws Exception {
        return mapper.select(recipepin);
    }

    @Transactional(readOnly = true)
    @Override
    public List<RecipeBasic> get() throws Exception {
        return mapper.selectall();
    }
}
