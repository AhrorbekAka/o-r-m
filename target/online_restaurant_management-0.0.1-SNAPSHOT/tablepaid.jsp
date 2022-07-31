<%--
  Created by IntelliJ IDEA.
  User: vismut
  Date: 16/07/22
  Time: 12:17
  To change this template use File | Settings | File Templates.
--%>
<h2>Paid menu</h2>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="style.css" />
    <link

            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Document</title>
    <style>
        .pay_img{
            width: 280px;
            height: 160px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            border-radius: 8px;
            background-color: rgba(255, 255, 255, 0.7);
            cursor: pointer;
        }
        #full{
            width: 280px !important;
            height: 160px !important;
        }
        .masterc{
            background-color: rgb(255, 255, 255);
        }
        img{
            width: 260px;
        }

    </style>
</head>
<body>
<div class="root" id="img">
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

            </div>
        </div>
    </nav>

    <div id="img" class="d-grid">
        <div class="pay_img masterc">
            <img id="ms" src="./img/MasterCard_Logo.svg.png" alt="">
        </div>
        <div class="pay_img visa">
            <img  id="full" src="./img/Visa.svg.png" alt="">
        </div>
        <div class="pay_img payme">
            <img id="full" src="./img/og-image.png" alt="">
        </div>
        <div class="pay_img clickk">
            <img src="./img/click-logo.png" alt="">
        </div>
        <form action="customertable">
            <button class="btn btn-primary" style="font-size: 40px;" name = "action"   value="${table_id}"  >paid </button >
        </form>
    </div>
</div>
</body>
<script src="script.js"></script>
</html>




