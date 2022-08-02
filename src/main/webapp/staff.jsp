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
<%
    //    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
//
    if (session.getAttribute("upnumber")==null)
        response.sendRedirect("index.jsp");

%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style.css" />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Document</title>
</head>
<body>

<div class="root">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarNavAltMarkup"
                    aria-controls="navbarNavAltMarkup"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">

                </div>

            </div>
        </div>
    </nav>

    <div id="img" class="d-grid stuff">
        <h4 class="my-4 text-center">Staff's web page</h4>

        <sql:setDataSource var="orm" driver="org.postgresql.Driver"
                           url="jdbc:postgresql://localhost:5432/orm" user="postgres" password="0123"/>
        <sql:query var="rs" dataSource="${orm}">SELECT _order_.id,table_id,first_name,last_name FROM _order_ join _user_ ON _order_.up_number=_user_.phone_number where paid=false </sql:query>
        <c:forEach items="${rs.rows}" var="order">
            <div class="div p-5 bg-white d-grid" style="font-size: 20px" >
            Order number: <c:out value="${order.id}" ></c:out> <br>
            meal name:
            <sql:query var="ts" dataSource="${orm}">SELECT name FROM order_meal join meal on order_meal.meal_id=meal.id join _order_ on order_meal.order_id=_order_.id where (paid=false)and(_order_.id=${order.id})</sql:query>
            <c:forEach items="${ts.rows}" var="nnn">
                <c:out value="${nnn.name}" ></c:out>,

            </c:forEach>
              <form action="staff">
            table Id:           <c:out value="${order.table_id}" ></c:out>, <br>
            Customer:  fisrt_name:  <c:out value="${order.first_name},     " ></c:out>
            last_name:         <c:out value="${order.last_name}" ></c:out>. <br>
            <button class="btn btn-success" name="id" value="${order.id}" >DONE </button>
              </form>
            </div>
        </c:forEach>
    </div>
</div>
</body>
<script src="script.js"></script>
</html>
