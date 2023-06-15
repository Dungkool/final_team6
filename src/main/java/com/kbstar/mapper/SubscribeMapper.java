package com.kbstar.mapper;

import com.kbstar.dto.Subscribe;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface SubscribeMapper extends KBMapper<Integer, Subscribe> {

}
