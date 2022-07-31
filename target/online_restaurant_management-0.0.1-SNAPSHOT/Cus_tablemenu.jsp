<%--
  Created by IntelliJ IDEA.
  User: vismut
  Date: 14/07/22
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql"  uri="http://java.sun.com/jsp/jstl/sql"  %>
< html>
<head>
    <title>Title</title>
</head>
<body>
Bu yerda aviable tablelar ro'yxati beriladi

<br>
<sql:setDataSource var="orm" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://localhost:5432/orm" user="postgres" password="postgres"/>

<sql:query var="rs" dataSource="${orm}">SELECT id,number,facilities,type,special_price FROM _table_ where available = true </sql:query>

<c:forEach items="${rs.rows}" var="table">

    </br>
    <c:out value="${table.id}" >  </c:out>
    <form action="paid.jsp" >
        <button name="table" value="${table.id}" >Order</button>

    </form>

       </c:forEach>>


</body>
</html>
