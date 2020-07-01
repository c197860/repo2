<%--
  Created by IntelliJ IDEA.
  User: suxia
  Date: 2020/6/22
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <!--引入bootstrap样式-->
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
    <div class="col-lg-12">
   <h1>SSM-CRUD</h1>
    </div>
</div>
<%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row">
        <!--中等屏幕col-md-12铺满-->
        <div class="col-md-12">
            <!--全局CSS样式 表格 表格各行变色-->
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <th>${emp.empId}</th>
                        <th>${emp.empName}</th>
                        <th>${emp.gender=="M" ? "男":"女"}</th>
                        <th>${emp.email}</th>
                        <th>${emp.department.deptName}</th>
                        <th>
                            <!--按钮 样式 小尺寸-->
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
    <div class="col-md-6">
        当前${pageInfo.pageNum}页,总${pageInfo.pages},总${pageInfo.total}条记录
    </div>
    <!--分页条信息  组件 分页-->
    <div class="col-md-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a href="${pageContext.request.contextPath}/emps?pn=1">首页</a></li>
                <c:if test="${pageInfo.hasPreviousPage}">
                <li>
                    <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                    <!--判断是不是当前页 如果是当前页码 显示高亮-->
                    <c:if test="${page_Num==pageInfo.pageNum}">
                        <li class="active"><a href="#">${page_Num}</a></li>
                    </c:if>
                    <c:if test="${page_Num!=pageInfo.pageNum}">
                        <!--发送请求-->
                        <li><a href="${pageContext.request.contextPath}/emps?pn=${page_Num}">${page_Num}</a></li>
                    </c:if>
                </c:forEach>
                <!--是否有下一页-->
                <c:if test="${pageInfo.hasNextPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>

                </c:if>

                <li><a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pages}">末页</a></li>
            </ul>
        </nav>

    </div>
</div>
</div>
</body>
</html>
