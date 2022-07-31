<%--
  Created by IntelliJ IDEA.
  User: vismut
  Date: 14/07/22
  Time: 23:43
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql"  uri="http://java.sun.com/jsp/jstl/sql"  %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>first meals </h3>
<br>
<sql:setDataSource var="orm" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://localhost:5432/orm" user="postgres" password="postgres"/>

<sql:query var="rs" dataSource="${orm}">SELECT name,price,preparation_time,description FROM meal where (available = true) and (type = 'FIRST') </sql:query>

<c:forEach items="${rs.rows}" var="table">
<h5>
    <c:out value="${table.name}" ></c:out>:
    :<c:out value="${table.price}" ></c:out>
    :<c:out value="${table.preparation_time}" ></c:out>
    : <c:out value="${table.description}" ></c:out>
    </c:forEach>>
</h5><br>

<sql:query var="rs" dataSource="${restaurant}">SELECT name,price,preparation_time,description FROM meal where (available = true) and (type = 'SECOND') </sql:query>

<h3>second meals </h3>
<br>
<c:forEach items="${rs.rows}" var="table">
<h5>

    <c:set value="2" target="${student}"></c:set>
    <form action="hello-servlet" method="post">

        <input type="submit",value="table">
    </form>

    <c:out value="${table.name}" ></c:out>:
    :<c:out value="${table.price}" ></c:out> :<c:out value="${table.preparation_time}" ></c:out>
    : <c:out value="${table.description}" ></c:out>

    </c:forEach>>
</h5><br>

<sql:query var="rs" dataSource="${restaurant}">SELECT name,price,preparation_time,description FROM meal where (available = true) and (type = 'DESERT') </sql:query>


<h3>DESERTs </h3>
<c:forEach items="${rs.rows}" var="table">
<h5>
    <c:out value="${table.name}" ></c:out>:
    :<c:out value="${table.price}" ></c:out> :<c:out value="${table.preparation_time}" ></c:out>
    : <c:out value="${table.description}" ></c:out>  </c:forEach>>
</h5><br>

<br>

</body>
</html>
