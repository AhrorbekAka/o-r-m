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
<html>
<head>
<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Title</title>
<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    .contentt{
        width: 100vw;
        height: 100vh;
    }
    table input{
        width: 150px;
        height: 100%;
        text-align: center;
        border: none;
        margin-top: 8px;
    }
    table{
        text-align: center;
        background-color:white;

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
    // response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");

    if (session.getAttribute("upnumber")==null)
        response.sendRedirect("index.jsp");
%>

<div id="img2" class="contentt">

    <h2 class="text-center">Table Menu</h2>

    <sql:setDataSource var="orm" driver="org.postgresql.Driver"
                       url="jdbc:postgresql://localhost:5432/orm" user="postgres" password="0123"/>

    <sql:query var="rs" dataSource="${orm}">SELECT id,number,facilities,type,special_price FROM _table_ where available = true </sql:query>
    <div class="container">
        <h4 class=" my-4 text-center">to order your table click  the "Order" button</h4>

            <table class="table table-bordered">
                <thead>
                <tr>
                    <th scope="col">Id</th>

                    <th scope="col">Table Number</th>
                    <th scope="col">Facilities</th>
                    <th scope="col">Type</th>
                    <th scope="col">Price</th>
                    <th scope="col">Button</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${rs.rows}" var="table">
                    <form action="paid" >
                    <tr>
                        <th scope="row">  ${table.id} </th>
                        <td>${table.number}</td>
                        <td>${table.facilities}</td>
                        <td>${table.type}</td>
                        <td>${table.special_price}</td>
                        <td><button name="table" value="${table.id}" >Order</button></td>
                    </tr>
        </form >
                </c:forEach>
                </tbody>
            </table>

    </div>
</div>

</body>
<script>
    document.querySelectorAll("input").forEach((el)=>{
        console.log(el.value)
    })
</script>
</html>


