<%--
  Created by IntelliJ IDEA.
  User: vismut
  Date: 18/07/22
  Time: 07:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>


    <title>Title</title>
</head>
<body>
<h1>Welcome staf's menu</h1>

<h2>welcome Staff's menu </h2>
<sql:setDataSource var="orm" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://localhost:5432/orm" user="postgres" password="postgres"/>
<h2>
    <sql:query var="rs" dataSource="${orm}">select id FROM _order_ </sql:query>
    <c:forEach items=" ${rs.rows} " var ="but">

            ${but.id}
                 <%--  meals: <br>--%>
        <%--    <sql:query var="st" dataSource="${orm}">SELECT name FROM order_meal join meal on order_meal.meal_id=meal.id where order_id=${rs.id}  </sql:query>--%>
        <%--    <c:forEach items="${st.rows}" var="meal">--%>
        <%--       meal: <c:out value="${meal.name}" >  </c:out>--%>
        <%--             <br>--%>
        <%--        </c:forEach>--%>

        <%--     table id: <c:out value="${rs.table_id}" >  </c:out><br>--%>
        <%--    Customer : first name:<c:out value="${rs.first_name},    " >  </c:out>--%>
        <%--     last name: <c:out value="${rs.last_name},    " >  </c:out>--%>

    </c:forEach>



</body>
</html>





</body>
</html>
