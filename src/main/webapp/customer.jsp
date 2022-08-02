<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"  %>

<%
	  // response.setHeader("Pragma","no-cache");
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
	<link rel="stylesheet"
		  href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
		  integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		  crossorigin="anonymous">
</head>
	<title>Document</title>
</head>
<body>
<sql:setDataSource var="orm" driver="org.postgresql.Driver"
				   url="jdbc:postgresql://localhost:5432/orm" user="postgres" password="0123"/>

<sql:query var="rs" dataSource="${orm}">SELECT text,role,first_name,last_name FROM message join _user_ on message.up_number=_user_.phone_number order by message.id asc</sql:query>

<div class="root">
	<div class="card mt-5">
		<div
				class="d-flex flex-row justify-content-between p-3 adiv text-white"
		>
			<i class="fas fa-chevron-left"></i>
			<span class="pb-3">Live chat</span>
			<i class="fas fa-times"></i>
		</div>

		<div class="chat_content">
			<c:forEach items="${rs.rows}" var="mess">

			<div class="d-flex flex-row p-3 float-end">
				<div class="bg-white mr-2 p-3">
					<span class="d-block text-primary" style="font-size: 11px;"><span class="text-danger">${mess.role}</span> / ${mess.first_name}</span>
              <span class="text-black"
			  >${mess.text}</span
			  >
				</div>
				<img
						src="https://img.icons8.com/color/48/000000/circled-user-male-skin-type-7.png"
						width="30"
						height="30"
				/>
			</div>
			</c:forEach>
		</div>

		<form action="message" method="post">
		<div class="form-group px-3 d-flex justify-content-around align-items-center">
          <textarea
				  name="message"
				  class="form-control rounded w-75"
				  rows="1"
				  placeholder="Type your message"
		  ></textarea>
			<button id="send" class="btn btn-success mb-1" type="submit">Send</button>
		</div>
		</form>
	</div>

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
			<div class="collapse navbar-collapse  d-flex justify-content-between" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link active" aria-current="page" href="#">    </a>
					<a class="nav-link" href="#">     </a>
				</div>
				<form action="Logout", method="post">
					<input type="submit" class="btn btn-success" value="Logout ">
				</form>
			</div>
		</div>
	</nav>

	<div id="img2" class="d-grid">
		<div class="div meal">
			<h3>Customer's Menu</h3>
		</div>
		<div
				class="div tables d-flex align-items-center justify-content-around"
		>
			<a href="cus_table_menu.jsp" class="btn btn-info" >Table menu</a>
			<a href="cus_meal_menu.jsp" class="btn btn-info" >Meal menu</a>
		</div>
		<div
				class="div buttuns d-flex align-items-center justify-content-around"
		>
			<div class="di"></div>

			<button class="chat_btn">Chat</button>
		</div>
	</div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	const queryAll = document.querySelectorAll.bind(document);
	const query = document.querySelector.bind(document);
	let btn = ''

	setTimeout(()=>{
		btn = sessionStorage.getItem("btn")
		if(btn){
			query(".card").classList.toggle("show");
			query(".chat_content").scrollTop = query(".chat_content").scrollHeight;
		}
	}, 100)

	query("#send").addEventListener("click", function (){
		sessionStorage.setItem("btn", "true")
		query(".chat_content").scrollTop = query(".chat_content").scrollHeight;
	})

	query(".chat_btn").addEventListener("click", function () {
		query(".card").classList.toggle("show");
		query(".chat_content").scrollTop = query(".chat_content").scrollHeight;
	});
</script>
</html>