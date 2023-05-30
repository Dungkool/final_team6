package com.kbstar.mapper;

import com.kbstar.dto.RecipeComment;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface RecipeCommentMapper extends KBMapper<Integer, RecipeComment> {

}
