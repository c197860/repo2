<%--
  Created by IntelliJ IDEA.
  User: suxia
  Date: 2020/6/22
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
<link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<head>
</head>
<body>
<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"  data-dismiss="modal" aria-label="close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLab">员工添加</h4>
            </div>
            <div class="modal-body">
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">empName</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="empName" id="empName_add_input" placeholder="请填昵称">
                        <span class="help-block"></span>
                    </div>
                </div>
                <!--email-->
                <div class="form-group">
                    <label  class="col-sm-2 control-label">email</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="email" id="email_add_input" placeholder="email@bdqn.com">
                        <span class="help-block"></span>
                    </div>
                </div>
                <!--性别 -->
                <div class="form-group">
                    <label  class="col-sm-2 control-label">gender</label>
                    <div class="col-sm-10">
                        <!--内联单选-->
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                        </label>
                    </div>
                </div>
                <!--下拉列表-->
                <div class="form-group">
                    <label  class="col-sm-2 control-label">deptName</label>
                    <div class="col-sm-4">
                        <!--下拉列表   下拉列表的下拉项必须是数据库里面查出来的-->
                        <!--部门提交部门Id即可-->
                        <select class="form-control" name="dId">

                        </select>
                    </div>
                </div>
            </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">用户修改</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                           <p class="form-control-static" id="empName_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email_update_input" placeholder="email@bdqn.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-10">
                            <!--下拉列表   下拉列表的下拉项必须是数据库里面查出来的-->
                            <!--部门提交部门Id即可-->
                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_model_btn">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row">
        <!--中等屏幕col-md-12铺满-->
        <div class="col-md-12" id="emps_table">
            <!--全局CSS样式 表格 表格各行变色-->
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>

            </table>
        </div>
    </div>

    <div class="col-md-6" id="page_info_area">
    </div>
    <div class="col-md-6" id="page_nav_area">
    </div>
</div>
</div>
<script type="text/javascript">
    var totalRecord,currentPage;

    $(function(){

            to_page(1)
        }
    )
    function to_page(pn){
      $.ajax({
          "url":"${pageContext.request.contextPath}/emps",
          "type":"get",
          "data":"pn="+pn,
          "dataType":"json",
          "success":function (result) {
              console.log(result)
                build_emps_table(result);
              build_page_info(result);
              build_page_nav(result);
          },
          "error":function () {
           alert("获取用户数据错误")
          }
      })

        function build_emps_table(result) {
          $("#emps_table tbody").empty();
           //拿到员工集合数据
            var emps=result.aextend.pageInfo.list;
            $.each(emps,function (index,item) {
             //拼接员工数据
                var empIdTd=$("<td></td>").append(item.empId);
                var empNameT=$("<td></td>").append(item.empName);
                var genderTd=$("<td></td>").append(item.gender=="M" ? "男":"女");
                var  emailTd=$("<td></td>").append(item.email);
                var deptNameTd=$("<td></td>").append(item.department.deptName);
                var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<button></button>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                editBtn.attr("edit-id",item.empId)
                var delBtn=$("<button></button>").addClass("btn btn-primary btn-sm delete_btn")
                    .append($("<button></button>").addClass("glyphicon glyphicon-trash")).append("删除");
                var btn=$("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(empIdTd).append(empNameT)
                .append(genderTd).append(emailTd).append(deptNameTd).append(btn).appendTo("#emps_table tbody")
            })

        }
        function build_page_info(result) {
            $("#page_info_area").empty()
             $("#page_info_area").append("当前"+result.aextend.pageInfo.pageNum+"页，总"+
                 result.aextend.pageInfo.pages+"页 ,总"+result.aextend.pageInfo.total+"条记录")
                   totalRecord=result.aextend.pageInfo.total;
            currentPage=result.aextend.pageInfo.pageNum
        }

   function  build_page_nav(result){
          $("#page_nav_area").empty();
          var ul=$("<ul></ul>").addClass("pagination");
          var firstPageli=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
          var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
          if (result.aextend.pageInfo.hasPreviousPage==false){
              firstPageli.addClass("disabled");
              prePageLi.addClass("disabled");
          }else {
              firstPageli.click(function () {
                   to_page(1)
              });
              prePageLi.click(function () {
             to_page(result.aextend.pageInfo.pageNum-1);
              })
          }
       var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
         var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
       if (result.aextend.pageInfo.hasNextPage==false){
           nextPageLi.addClass("disabled");
           lastPageLi.addClass("disabled");
       }else {
           lastPageLi.click(function () {
               to_page(result.aextend.pageInfo.pages);
           });
           nextPageLi.click(function () {
               to_page(result.aextend.pageInfo.pageNum+1);
           })
       }
         ul.append(firstPageli).append(prePageLi);
          $.each(result.aextend.pageInfo.navigatepageNums,function (index,item) {
                var numLi=$("<li></li>").append($("<a></a>").append(item));
                if (result.aextend.pageInfo.pageNum==item){
                    numLi.addClass("active");
                }
                numLi.click(function () {
                  to_page(item);
                })
                ul.append(numLi);
                ul.append(nextPageLi).append(lastPageLi);
                var navEle=$("<nav></nav>").append(ul);
                navEle.appendTo("#page_nav_area");
          })
   }
    }
    //点击新增按钮弹出模拟框
    $("#emp_add_model_btn").click(function () {
      $("#empAddModel select").empty()

        //发送ajax请求 请求部门信息显示在下拉列表中
        getDepts("#empAddModel select");
      //设置模态框 点击背景不删除
        $("#empAddModel").modal({});

    })
    function getDepts(ele) {
        $(ele).empty()
        //发送请求
        $.ajax({
            "url":"${pageContext.request.contextPath}/depts",
            "datatype":"json",
            "type":"get",
            "success":function (result) {
                $.each(result.aextend.depts,function () {
                    //显示部门信息在列表中  在option后拼接当前对象
                      var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
                      optionEle.appendTo(ele);
                })
            },
            "error":function () {
              alert("获取用户失败")
            }
        })
    }
function validate_add_form() {
        var empName=$("#empName_add_input").val();
    var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
    if (!regName.test(empName)){
        show_validate_msg("#empName_add_input","error","用户名可以是2-5位中文或者6-16位英文和数字的组合");
        return false;
    }else {
        show_validate_msg("#empName_add_input","success","");
    }
    var email=$("#email_add_input").val();
    var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
    if (!regEmail.test(email)){
        show_validate_msg("#email_add_input","error","邮箱不正确");
        return  false
    }else {
        show_validate_msg("#email_add_input","success","");

    }
    return  true;

}
function show_validate_msg(ele,status,msg) {
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success"==status){
           $(ele).parent().addClass("has-success");
           $(ele).next("span").text(msg);
        }else if ("error"==status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg)
        }

}
$("#emp_save_btn").click(function (){
if (!validate_add_form()){
    return false;
}

    $("#empName_add_input").change(function () {
        var  empName=this.value;
        $.ajax({
            "url":"${pageContext.request.contextPath}/checkUser",
            "type":"post",
            "data":"empName="+empName,
            "dataType":"json",
            "success":function (result) {
                if (result.code==100){
                    show_validate_msg("#empName_add_input","success","用户名可用");
                    $("#emp_save_btn").attr("ajax-va","success");
                }else {
                    show_validate_msg("#empName_add_input","error","用户名不可用");
                    $("#emp_save_btn").attr("ajax-va","error");
                }
            },
            "error":function () {
                alert("校验用户是否可用错误");
            }
        })
    })

    if($(this).attr("ajax-va")=="error"){
        return false;
    }

    $.ajax({
      "url":"${pageContext.request.contextPath}/emp",
      "data":$("#empAddModel form").serialize(),
      "type":"post",
      "success":function (result) {
          if (result.code==100){
              $("#empAddModel").modal('hide')
              to_page(totalRecord)
          }else {
              if (undefined !=result.aextend.errorFields.email){
                  show_validate_msg("#email_add_input","error",result.aextend.errorFields.email)
              }
              if (undefined != result.aextend.errorFields.empName){
                  show_validate_msg("#empName_add_input","error",result.aextend.errorFields.empName)
              }
          }
      },
      "error":function () {
        alert("error")
      }

  })




})


    //清空
    function resset_form(ele) {
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
$(document).on("click",".edit_btn",function () {
    getEmp($(this).attr("edit-id"))
    getDepts("#empUpdateModel select")
    $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
    $("#empUpdateModel").modal({

    })
})

function getEmp(id) {
        $.ajax({
            "url":"${pageContext.request.contextPath}/emp/"+id,
            "type":"get",
            "dataType":"json",
            "success":function (result) {
                var empDate=result.aextend.emp;
                $("#empName_update_static").text(empDate.empName);
                $("#email_update_input").val(empDate.email);
                $("#empUpdateModel input[name=gender]").val([empDate.gender])
                $("#empUpdateModel select").val([empDate.dId]);

            },
            "error":function () {
               alert("获取数据失败")
            }
        })

}
$("#emp_update_btn").click(function () {
   var email=$("#email_update_input").val();
   var regemil=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
   if (!regemil.test(email)){
       show_validate_msg("#email_update_input","error","邮箱不正确")
   }else {
       show_validate_msg("#email_update_input","success","")
   }
   $.ajax({
       "url":"${pageContext.request.contextPath}/emp/"+$(this).attr("edit-id"),
       "type":"post",
       "data":$("#empUpdateModel form").serialize()+"&_method=PUT",
       "success":function (result) {
           $("#empUpdateModel").modal('hide');
           to_page(currentPage)
       },
       "error":function () {
              alert("获取错误")
       }
   })
})
</script>
</body>
</html>
