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
    <%
        //    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
//
        if (session.getAttribute("upnumber")==null)
            response.sendRedirect("index.jsp");




    %>

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
        #img2{
            background-image: url(./img/meal1.jpg);
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
    </style>
    Manager meal menu
</head>
  <body>
  <div id="img2" class="contentt">
  <h2 class="text-center" >first meals</h2>>

  <sql:setDataSource var="orm" driver="org.postgresql.Driver"
                     url="jdbc:postgresql://localhost:5432/orm" user="postgres" password="postgres"/>

  <sql:query var="rs" dataSource="${orm}">SELECT * FROM meal where type='FIRST'   </sql:query>

          <table class="table table-bordered">
              <thead>
              <tr>
                  <th scope="col">id </th>
                  <th scope="col">name </th>
                  <th scope="col">price  </th>
                  <th scope="col">type    </th>
                  <th scope="col">preparation time  </th>
                  <th scope="col">available </th>
                  <th scope="col">description </th>
                  <th scope="col">Button </th>


              </tr>
              </thead>
              <tbody>
              <c:forEach items="${rs.rows}" var="meal">
                  <form action="ManagerMeal" method="get">
                  <tr>
                      <th scope="row">${meal.id}</th>
                      <td><input type="text" value="${meal.name}" name="name"/></td>

                      <td><input type="text" value="${meal.price}" name="price"/></td>
                          <%--                <td><input type="text" value="${table.type}"/></td>--%>
                      <td>
                          <select  id="${table.id}" name="type"  value="${meal.type}">
                              <option   value="${meal.type}" >${meal.type}</option>
                              <option value="DESERT">DESERT</option>
                              <option value="FIRST">FIRST</option>
                              <option value="SECOND">SECOND</option>

                          </select>
                      </td>
                      <td><input type="text" value="${meal.preparation_time}" name="preparation_time"/></td>
                      <td><input type="text" value="${meal.available}" name="available"/></td>
                      <td><input type="text" value="${meal.description}" name="description"/></td>
                      <td><button name="action" class="btn btn-success" value="${meal.id}" >Change</button></td>
                  </tr>
                      </form >
              </c:forEach>
              </tbody>
          </table>


      <h2 class="text-center" >
      Second meals:
      <br>
  </h2>
  <sql:query var="rs" dataSource="${orm}">SELECT * FROM meal where type='SECOND'   </sql:query>

      <table class="table table-bordered">
          <thead>
          <tr>
              <th scope="col">id </th>
              <th scope="col">name </th>
              <th scope="col">price  </th>
              <th scope="col">type    </th>
              <th scope="col">preparation time  </th>
              <th scope="col">available </th>
              <th scope="col">description </th>
              <th scope="col">Button </th>


          </tr>
          </thead>
          <tbody>
          <c:forEach items="${rs.rows}" var="meal">
          <form action="ManagerMeal" method="get">
              <tr>
                  <th scope="row">${meal.id}</th>
                  <td><input type="text" value="${meal.name}" name="name"/></td>

                  <td><input type="text" value="${meal.price}" name="price"/></td>
                      <%--                <td><input type="text" value="${table.type}"/></td>--%>
                  <td>
                      <select  id="${meal.id}" name="type"  value="${meal.type}">
                          <option   value="${meal.type}" >${meal.type}</option>
                          <option value="DESERT">DESERT</option>
                          <option value="FIRST">FIRST</option>
                          <option value="SECOND">SECOND</option>

                      </select>
                  </td>
                  <td><input type="text" value="${meal.preparation_time}" name="preparation_time"/></td>
                  <td><input type="text" value="${meal.available}" name="available"/></td>
                  <td><input type="text" value="${meal.description}" name="description"/></td>
                  <td><button name="action" class="btn btn-success" value="${meal.id}" >Change</button></td>
              </tr>
          </form >
          </c:forEach>
          </tbody>
      </table>




  <h2 class="text-center" >
      DESSERT's:
      <br>
  </h2>
  <sql:query var="rs" dataSource="${orm}">SELECT * FROM meal where type='DESERT'   </sql:query>
=================

      <table class="table table-bordered">
          <thead>
          <tr>

              <th scope="col">id </th>
              <th scope="col">name </th>
              <th scope="col">price  </th>
              <th scope="col">type    </th>
              <th scope="col">preparation time  </th>
              <th scope="col">available </th>
              <th scope="col">description </th>
              <th scope="col">Button </th>


          </tr>
          </thead>
          <tbody>
          <c:forEach items="${rs.rows}" var="meal">
          <form action="ManagerMeal" method="get">
              <tr>
                  <th scope="row">${meal.id}</th>
                  <td><input type="text" value="${meal.name}" name="name"/></td>

                  <td><input type="text" value="${meal.price}" name="price"/></td>
                      <%--                <td><input type="text" value="${table.type}"/></td>--%>
                  <td>
                      <select  id="${table.id}" name="type"  value="${meal.type}">

                          <option   value="${meal.type}" >${meal.type}</option>
                          <option value="DESERT">DESERT</option>
                          <option value="FIRST">FIRST</option>
                          <option value="SECOND">SECOND</option>

                      </select>
                  </td>
                  <td><input type="text" value="${meal.preparation_time}" name="preparation_time"/></td>
                  <td><input type="text" value="${meal.available}" name="available"/></td>
                  <td><input type="text" value="${meal.description}" name="description"/></td>
                  <td><button name="action" class="btn btn-success" value="${meal.id}" >Change</button></td>
              </tr>
          </form >
          </c:forEach>
          </tbody>
      </table>

            ===================
  <h2>If you want to add new meal, enter new meal parametrs below and click ADD button</h2>
  <form action="ManagerMeal" method="post">

      <table class="table table-bordered">
          <thead>
          <tr>

              <th scope="col">name </th>
              <th scope="col">price  </th>
              <th scope="col">type    </th>
              <th scope="col">preparation time  </th>
              <th scope="col">available </th>
              <th scope="col">description </th>
              <th scope="col">Button </th>
          </tr>

          </thead>

          <tbody>
          <tr>
              <td><input type="text" name="name"></td>
              <td><input type="text" name="price"></td>
              <td><input type="text" name="type"></td>
              <td><input type="text" name="preparation_time"></td>
              <td><input type="text" name="available"></td>
              <td><input type="text" name="description"></td>
              <td><button class="btn btn-info" >ADD</button></td>

          </tr>
          </tbody>
      </table>
  </form>
  </div>
  </body>
<script>
    document.querySelectorAll("input").forEach((el)=>{
        console.log(el.value)
    })
</script>
</html>