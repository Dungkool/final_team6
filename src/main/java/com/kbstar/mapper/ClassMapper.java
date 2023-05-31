package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.ClassBasic;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ClassMapper extends KBMapper<Integer, ClassBasic> {
    //
//    public List<ClassBasic> search(ClassBasic classBasic);
    Page<ClassBasic> getpage() throws Exception;
}
