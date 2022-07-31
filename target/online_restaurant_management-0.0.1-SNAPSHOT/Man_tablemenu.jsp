<%--
  Created by IntelliJ IDEA.
  User: vismut
  Date: 14/07/22
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"  %>
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
        }
        th, td{
            margin: 0 !important;
            padding: 7px 0 !important;
        }
        td:hover{
            background-color: #ddd;
        }


    </style>
</head>
<body>
<h2 class="text-center">Table Menu</h2>

<sql:setDataSource var="orm" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://localhost:5432/orm" user="postgres" password="postgres"/>

<sql:query var="rs" dataSource="${orm}">SELECT * FROM _table_  </sql:query>

<div class="container">
    <h4 class="my-4 text-center">saving to your updates click  the change button</h4>
    <form action="managertable" method="get">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Table Number</th>
            <th scope="col">Facilities</th>
            <th scope="col">Type</th>
            <th scope="col">Price</th>
            <th scope="col">Available</th>
            <th scope="col">Button</th>

        </tr>
        </thead>
        <tbody>
            <c:forEach items="${rs.rows}" var="table">
                <tr>
                    <th scope="row"><input type="text" value="${table.id}" /></th>
                    <td><input type="text" value="${table.number}" name="number"/></td>
                    <td><input type="text" value="${table.facilities}" name="facilities"/></td>
    <%--                <td><input type="text" value="${table.type}"/></td>--%>
                    <td>
                        <select name="type" >
                            <option value="${table.type}" ></option>
                            <option value="FAMILY">FAMILY</option>
                            <option value="FAST">FAST</option>
                            <option value="COMFORT" >COMFORT</option>
                            <option value="BUSINESS">BUSINESS</option>

                        </select>
                    </td>
                    <td><input type="text" value="${table.special_price}" name="special_price"/></td>
                    <td><input type="text" value="${table.available}" name="available"/></td>
                    <td><button name="action" class="btn btn-success" value="${table.id}" >Change</button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form >

    <h2 >if you want to add new table , enter new table parametrs  below and click "ADD" button   </h2>
    <form action="managertable"method="post">
        <table class="table table-bordered">
            <thead>
            <tr>

                <th scope="col">Table Number</th>
                <th scope="col">Facilities</th>
                <th scope="col">Type</th>
                <th scope="col">Price</th>
                <th scope="col">Available</th>
                <th scope="col">Button</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" name="number"></td>
                    <td><input type="text" name="facilities"></td>
                    <td><input type="text" name="type"></td>
                    <td><input type="text" name="special_price"></td>
                    <td><input type="text" name="available"></td>
                   <td><button class="btn btn-info" >ADD</button></td>

                </tr>
            </tbody>
        </table>
    </form>
  </div>
</body>
</html>
