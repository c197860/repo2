package cn.kgc.crud.controller;

import cn.kgc.crud.bean.Employee;
import cn.kgc.crud.bean.EmployeeExample;
import cn.kgc.crud.bean.Msg;
import cn.kgc.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;
    /**
     * 查询员工数据(分页查询)
     * @return
     */
   @RequestMapping("/emps")
   @ResponseBody
    public Msg getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
       //这不是一个分页查询
       //引入PageHelper分页插件(坐标已引入,mybatis配置文件中配置插件)
       //在查询之前只需要调用,传入页码,以及每页的大小
       PageHelper.startPage(pn,5);
       //startPage后面紧跟的这个查询就是一个分页查询
       List<Employee> emps=employeeService.getAll();
       //使用PageInfo包装查询后的结果,只需要将PageInfo对象交个页面就行了
       //封装了详细的分页信息,包括我们查出来的数据 ,navigatePages连续显示的页数 为5页
       PageInfo page=new PageInfo(emps,5);
       return Msg.suessce().add("pageInfo",page);
   }

   @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg savgEmp(@Valid Employee employee, BindingResult result){
       Map<String,Object> map=new HashMap<>();
       if (result.hasErrors()){
           List<FieldError> error=result.getFieldErrors();
           for (FieldError fieldError:error){

               map.put(fieldError.getField(),fieldError.getDefaultMessage());
           }
           return Msg.fail().add("errorFields",map);
       }
       employeeService.saveEmp(employee);
       return Msg.suessce();
   }
   @RequestMapping(value = "/checkUser",method = RequestMethod.POST)
    @ResponseBody
    public Msg checkUser(@RequestParam(value = "empName")String empName){
       String regx="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
       if (!empName.matches(regx)){
          return Msg.fail().add("va_msg","用户名必须是2-5位中文或者6-16位英文和数字的组合");
       }
       Boolean b=employeeService.checkUser(empName);
       if (b){
           return Msg.suessce();
       }else {
           return Msg.fail().add("va_msg","用户名不可用");
       }

   }

@RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable Integer id){
       Employee employee=employeeService.getEmp(id);
       return Msg.suessce().add("emp",employee);
}
     @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Employee employee){
       employeeService.updateEmp(employee);
       return Msg.suessce();
     }
}

