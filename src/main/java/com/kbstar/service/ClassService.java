package com.kbstar.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kbstar.dto.ClassBasic;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ClassMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassService implements KBService<Integer, ClassBasic> {
    @Autowired
    ClassMapper mapper;


    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param classBasic
     */
    @Override
    public void register(ClassBasic classBasic) throws Exception {
        mapper.insert(classBasic);
    }

    @Override
    public void remove(Integer classpin) throws Exception {
        mapper.delete(classpin);
    }

    @Override
    public void modify(ClassBasic classBasic) throws Exception {
        mapper.update(classBasic);
    }

    @Override
    public ClassBasic get(Integer classpin) throws Exception {
        return mapper.select(classpin);
    }

    @Override
    public List<ClassBasic> get() throws Exception {
        List<ClassBasic> list = mapper.selectall();
        return list;
    }

    public Page<ClassBasic> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 6); // 3: 한화면에 출력되는 개수
        return mapper.getpage();
    }

    public Page<ClassBasic> getSearch(int pageNo, String classtitle) throws Exception {
        PageHelper.startPage(pageNo, 6); // 3: 한화면에 출력되는 개수
        return mapper.getsearch(classtitle);
    }
}
