<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<form action="login" method="post" class="bg-dark"
		style="height: 100vh">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col">
					<div class="card card-registration my-4">
						<div class="row g-0">
							<div class="col-xl-6 d-none d-xl-block">
								<img src="resources/register.jpeg" alt="Sample photo"
									class="img-fluid" style="height: 100%; width: 100%;"
									style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
							</div>
							<div class="col-xl-6">
								<div class="card-body p-md-5 mt-md-5 text-black">
									<h3 class="mb-4 text-center">Login</h3>

									<div class="form-outline mb-4">
										<input type="text" id="phoneNumber" name="phoneNumber"
											class="form-control form-control-lg"
											placeHolder="Phone number" />
									</div>

									<div class="form-outline mb-4">
										<input type="password" id="password"
											class="form-control form-control-lg" name="password"
											placeHolder="Password" />
									</div>

									<div class="text-center mb-4">
										<button type="submit" class="btn btn-warning btn-lg ms-2">Submit</button>
									</div>
									<div class="text-center">
										<a href="register.jsp" class="text-danger">Don't have account?</a>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>


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