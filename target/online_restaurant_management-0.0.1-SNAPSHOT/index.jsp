<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body
	style="background: url('resources/image.jpg'); background-repeat: no-repeat; height: 100vh; overflow-x: hidden;">

	<div class="row">
		<div id="carouselExampleIndicators"
			class="carousel slide w-100" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="resources/tuna2.jpg"
						style="height: 100vh !important" alt="First slide">
					<div class="carousel-caption d-none d-md-block">
						<h5>Plov</h5>
						<p>The most popular Uzbek food</p>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="resources/creme.jpg"
						style="height: 100vh !important" alt="Second slide">
					<div class="carousel-caption d-none d-md-block">
						<h5>Salad from tomato, cucumber and onion</h5>
						<p>...</p>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="resources/chicken-1.jpg"
						style="height: 100vh !important" alt="Second slide">
					<div class="carousel-caption d-none d-md-block">
						<h5>Salad from tomato, cucumber and onion</h5>
						<p>...</p>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="resources/vesper.jpg"
						style="height: 100vh !important" alt="Third slide">
					<div class="carousel-caption d-none d-md-block">
						<h5>No time to wait</h5>
						<p>Just have it!</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<div class="position-relative">
		<div class="position-fixed fixed-top pt-3 container d-flex">
			<h3 class="mr-auto text-info font-weight-light"><strong class="font-weight-bold">Your</strong> Restaurant</h3>
			<div class="ml-auto">
				<a href="login.jsp" class="btn btn-outline-info">Order Now -></a>
			</div>
		</div>
	</div>


	<section
		style="height: 100vh; width: 100%; background-position: center; background-repeat: no-repeat; background-size: cover; background-attachment: fixed; background-image: url('resources/image4.jpg');">

	</section>

	<section
		style="height: 100vh; width: 100%; background-position: center; background-repeat: no-repeat; background-size: cover; background-attachment: fixed; background-image: url('resources/image2.jpg');">

	</section>
	<section
		style="height: 100vh; width: 100%; background-position: center; background-repeat: no-repeat; background-size: cover; background-attachment: fixed; background-image: url('resources/image3.jpg');">

	</section>
	<section
		style="height: 100vh; width: 100%; background-position: center; background-repeat: no-repeat; background-size: cover; background-attachment: fixed; background-image: url('resources/image.jpg');">

	</section>


	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>