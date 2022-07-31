<%--
  Created by IntelliJ IDEA.
  User: vismut
  Date: 14/07/22
  Time: 23:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"  %>

<html>
<head>
    <title>Title</title>
</head>
<body>


<h3>first meals </h3>
<br>
<sql:setDataSource var="orm" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://localhost:5432/orm" user="postgres" password="postgres"/>

<sql:query var="rs" dataSource="${orm}">SELECT name,price,preparation_time,available,description FROM meal where  type = 'FIRST' </sql:query>

<c:forEach items="${rs.rows}" var="meal">
<h5>
    <form action="ManagerMeal" method="get">
        name:<c:out value="${meal.name}" ></c:out>::              <input type="text" name="name">
        price:<c:out value="${meal.price}" ></c:out>::             <input type="text" name="price">
        preparation_time:<c:out value="${meal.preparation_time}" ></c:out>:: <input type="text" name="preparation_time">
        available:  <c:out value="${meal.available}" ></c:out>::  <input type="text" name="available">
        description:<c:out value="${meal.description}" ></c:out>:: <input type="text" name="description">
        saving to your updates click  the change button
        <button name="action" value="${meal.id}" >Change</button>
        </c:forEach>
    </form>
</h5>
<br>

<sql:query var="rs" dataSource="${orm}">SELECT name,price,preparation_time,available,description FROM meal where type = 'SECOND' </sql:query>

<h3>second meals </h3>
<c:forEach items="${rs.rows}" var="meal">
<h5>
    <form action="ManagerMeal" method="get">
        name:<c:out value="${meal.name}" ></c:out>::              <input type="text" name="name">
        price:<c:out value="${meal.price}" ></c:out>::             <input type="text" name="price">
        preparation_time:<c:out value="${meal.preparation_time}" ></c:out>:: <input type="text" name="preparation_time">
        available:  <c:out value="${meal.available}" ></c:out>::  <input type="text" name="available">
        description:<c:out value="${meal.description}" ></c:out>:: <input type="text" name="description">
        saving to your updates click  the change button
        <button name="action" value="${meal.id}" >Change</button>
        </c:forEach>
    </form>
</h5>
<br>

<sql:query var="rs" dataSource="${orm}">SELECT name,price,preparation_time,available,description FROM meal where type = 'DESERT' </sql:query>


<h3>DESERTs </h3>
<c:forEach items="${rs.rows}" var="meal">
<h5>
    <form action="ManagerMeal" method="get">
        name:<c:out value="${meal.name}" ></c:out>::              <input type="text" name="name">
        price:<c:out value="${meal.price}" ></c:out>::             <input type="text" name="price">
        preparation_time:<c:out value="${meal.preparation_time}" ></c:out>:: <input type="text" name="preparation_time">
        available:  <c:out value="${meal.available}" ></c:out>::  <input type="text" name="available">
        description:<c:out value="${meal.description}" ></c:out>:: <input type="text" name="description">
        saving to your updates click  the change button
        <button name="action" value="${meal.id}" >Change</button>
        </c:forEach>
    </form>
</h5>
<br>

<h2 >if you want to add new meal , enter new meal parametrs  below and click "ADD" button   </h2>
<form action="ManagerMeal" method="post">
    <br> name : <input type="text" name="name">,
    <br> price :<input type="text" name="price">
    <br> type :<input type="text" name="type">,
    <br> preparation_time:<input type="text" name="preparation_time">
    <br> available   :  <input type="text" name="available">
    <br> description : <input type="text" name="description">
    <button  >ADD</button>

</form>


</body>
</html>
