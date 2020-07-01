package cn.kgc.crud.service;



import cn.kgc.crud.bean.Department;
import cn.kgc.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("departmentService")
public class DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    public List<Department> getDepts(){
      List<Department> list =departmentMapper.selectByExample(null);
        return list;
    }
}
