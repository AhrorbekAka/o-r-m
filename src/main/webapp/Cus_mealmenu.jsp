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
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Title</title>
    <style>
        table input{
            width: 150px;
            height: 100%;
            text-align: center;
            border: none;
            margin-top: 8px;
        }
        table{
            text-align: center;
            background-color: khaki;
        }
        th, td{
            margin: 0 !important;
            padding: 7px 0 !important;
        }
        td:hover{
            background-color: #ddd;
        }
        #img1{
            background-image: url(./img/meal1.jpg);
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
        #img2{
            background-image: url(./img/meal5.jpg);
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
    </style>
</head>
<body>
<%
//    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
//
    if (session.getAttribute("upnumber")==null)
       response.sendRedirect("index.jsp");

%>

<div id="img2" class="contentt">
    <h2 class="text-center">Meal menu</h2> <br>
                       <h3 class="text-center">To order your meal click  the "Order" button </h3>
<br>
<sql:setDataSource var="orm" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://localhost:5432/orm" user="postgres" password="postgres"/>

<sql:query var="rs" dataSource="${orm}">SELECT id,name,price,preparation_time,description FROM meal where (available = true) and (type = 'FIRST') </sql:query>


    <div class="container">
    <h4 class="my-4 text-center">FIRST MEALS</h4>

    <table class="table table-bordered">
    <thead>
    <tr>

    <th scope="col">Name</th>
    <th scope="col">Price</th>
    <th scope="col">Preparation_time</th>
    <th scope="col">Description</th>
    <th scope="col">Button</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${rs.rows}" var="meal">
        <form action="paid" >
        <tr>
           <th scope="row">  ${meal.name} </th>
            <td>${meal.price}</td>
            <td>${meal.preparation_time}</td>
            <td>${meal.description}</td>
            <td><button name="meal" value="${meal.id}" >Order</button></td>

        </form >
        </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>



<sql:query var="rs" dataSource="${orm}">SELECT id,name,price,preparation_time,description FROM meal where (available = true) and (type = 'SECOND') </sql:query>


<br>

    <div class="container">
    <h4 class="my-4 text-center">SECOND MEALS</h4>

    <table class="table table-bordered">
    <thead>
    <tr>


    <th scope="col">Name</th>
    <th scope="col">Price</th>
    <th scope="col">Preparation_time</th>
    <th scope="col">Description</th>
    <th scope="col">Button</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${rs.rows}" var="meal">
        <form action="paid" >
            <tr>
                <th scope="row">  ${meal.name} </th>

                <td>${meal.price}</td>
                <td>${meal.preparation_time}</td>
                <td>${meal.description}</td>
                <td><button name="meal" value="${meal.id}" >Order</button></td>

        </form >
        </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
<sql:query var="rs" dataSource="${orm}">SELECT id,name,price,preparation_time,description FROM meal where (available = true) and (type = 'DESERT') </sql:query>



        <br>

        <div class="container">
            <h4 class="my-4 text-center">DESSERTS</h4>

            <table class="table table-bordered">
                <thead>
                <tr>


                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Preparation_time</th>
                    <th scope="col">Description</th>
                    <th scope="col">Button</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${rs.rows}" var="meal">
                    <form action="paid" >
                        <tr>
                            <th scope="row">  ${meal.name} </th>

                            <td>${meal.price}</td>
                            <td>${meal.preparation_time}</td>
                            <td>${meal.description}</td>
                            <td><button name="meal" value="${meal.id}" >Order</button></td>

                    </form >
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        </body>
       </html>
