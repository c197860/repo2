package cn.kgc.crud.controller;

import cn.kgc.crud.bean.Department;
import cn.kgc.crud.bean.Msg;
import cn.kgc.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {
   @Autowired
    DepartmentService departmentService;
   @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
       List<Department> list=departmentService.getDepts();
       return Msg.suessce().add("depts",list);
   }

   @RequestMapping("/etu")
    public String lisu(){
       return "list";
   }
}
