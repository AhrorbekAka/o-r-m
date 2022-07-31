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
	<form action="register" onsubmit="submit()" method="post" class="bg-dark was-required"
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
								<div class="card-body p-md-3 text-black">
									<h3 class="mb-3 text-uppercase">Restaurant form</h3>

									<div class="row">
										<div class="col-md-6 mb-3">
											<div class="form-outline">
												<input type="text" id="firstName" name="firstName" required
													class="form-control form-control-lg"
													placeHolder="Firstname" />
											</div>
										</div>
										<div class="col-md-6 mb-3">
											<div class="form-outline">
												<input type="text" id="lastName" name="lastName" required
													class="form-control form-control-lg" placeHolder="Lastname" />
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 mb-3">
											<div class="form-outline">
												<input type="text" id="age" name="age" required
													class="form-control form-control-lg" placeHolder="Age" />
											</div>
										</div>

										<div class="mb-3 pb-2">

											<h6 class="mb-0 me-3">Gender:</h6>

											<div class="form-check form-check-inline mb-0 me-4">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" required id="maleGender" value="option2" />
												<label class="form-check-label" for="maleGender">Male</label>
											</div>


											<div class="form-check form-check-inline mb-0 me-4">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions"  required id="femaleGender" value="option1" />
												<label class="form-check-label" for="femaleGender">Female</label>
											</div>
										</div>
									</div>


									<div class="form-outline mb-3">
										<input type="text" id="email"
											class="form-control form-control-lg" name="email" required
											placeHolder="Email" />
									</div>

									<div class="form-outline mb-3">
										<input type="text" id="phoneNumber" name="phoneNumber" required
											class="form-control form-control-lg"
											placeHolder="Phone number" />
									</div>

									<div class="form-outline mb-3">
										<input type="password" id="password"
											class="form-control form-control-lg" name="password" required
											placeHolder="Password" />
									</div>

									<div class="form-outline mb-3">
										<input type="password" id="confirmPassword"
											class="form-control form-control-lg" name="password" required
											placeHolder="Confirm Password" />
									</div>

									<div class="text-right">
										<button type="submit" class="btn btn-warning btn-lg ms-2">Submit</button>
									</div>
									<div class="text-center">
										<a href="login.jsp" class="text-success">Already have an
											account?</a>
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
	<script>
			const password = document.getElementById("password")
			const confirmPassword = document.getElementById("confirmPassword")
			confirmPassword.addEventListener("keyup", function (){
			document.querySelector("button").disabled = true;
			if(password.value === confirmPassword.value){
			document.querySelector("button").disabled = false;
		}
		})
	</script>
</body>
</html>