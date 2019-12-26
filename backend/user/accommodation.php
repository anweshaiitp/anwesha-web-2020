<?php 
    include("./functions/init.php");

    $loggedIn = logged_in();
    $celestaid=""; $access_token="";
    if($loggedIn){
      $celestaid = $_SESSION['celestaid'];
      $access_token=$_SESSION['access_token'];
    } else {
		redirect('./login.php');
	}
?>


<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Anwesha 2k20| Accommodation Portal</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Comfortaa:400,700'>
<link rel="stylesheet" href="./css/signup.css">
<link href="./images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link href="./images/favicon.ico" rel="apple-touch-icon">
</head>
<body>


<div class="container">
  <div id="login" class="login">
    <div class="login-icon-field">
      <div class="login-icon">
        <img src="./images/logo_favi.png" alt="Anwesha" width="100%">
        <h3 style="text-align: center;">Accomadation Portal for Anwesha2k20</h3>
      </div>
	<form method="POST" id="accoForm signup-form" >
		<div class="login-form">
			<div class="username-row row" data-validate="Select choice">
				<select class="input100" type="select" name="daySelect" id="daySelect">
					<option value="day1">Day 1</option>
					<option value="day2">Day 2</option>
					<option value="day3">Day 3</option>
					<option value="day1_day2">Day 1 & 2</option>
					<option value="day2_day3">Day 2 & 3</option>
					<option value="all_day">All 3 Days</option>
				</select>
				<span class="focus-input100" data-placeholder="&#xe82a;"></span>    
			</div>
			
			<input type="hidden" value="<?php echo $celestaid?>" name="celestaid" id="celestaid">
			<input type="hidden" value="<?php echo $access_token?>" name="access_token" id="access_token">

			<div class=" row">
				<button id="login-button"  type="submit">
					Book Accommodation &nbsp;&nbsp;<span class="spinner-border spinner-border-sm spinner" style="display: none"></span>
				</button>
			</div>
			<div id="login-button" >
				<a href="./profile.php" style="color:hover: red">
					Cancel
				</a>
			</div>
		</div>
	</form>
  </div>
</div>
<!-- partial -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdn.jsdelivr.net/velocity/1.2.2/velocity.min.js'></script>
<script src='https://cdn.jsdelivr.net/velocity/1.2.2/velocity.ui.min.js'></script>
<script  src="./js/signup.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script>
		var accoForm = document.querySelector('#accoForm');
		accoForm.addEventListener('submit', async (e) => {
		e.preventDefault();
		let spinner = document.querySelector(".spinner");
      	spinner.style.display = "inline-block";
		var anweshaid=document.querySelector('#anweshaid').value;
		var access_token=document.querySelector('#access_token').value;
		var daySelect=document.querySelector('#daySelect').value;

		let formData = new FormData();
		formData.append("anweshaid", anweshaid);
		formData.append("access_token", access_token);

		// formData.append(daySelect, daySelect);

		if(daySelect==="day1"){
			formData.append("day1", daySelect);
		} else if(daySelect==="day2"){
			formData.append("day2", daySelect);
		} else if(daySelect==="day3"){
			formData.append("day3", daySelect);
		} else if(daySelect==="all_day"){
			formData.append("all_day", daySelect);
		} else if(daySelect==="day1_day2"){
			formData.append("day1_day2", daySelect);
		} else if(daySelect==="day2_day3"){
			formData.append("day2_day3", daySelect);
		}
		
		let url="http://localhost/anwesha-web-2020/backend/user/functions/book_accomodation.php";
		let res = await fetch(
			url,
			{
			body: formData,
			method: "post"
			}
		);
		res = await res.json();
		spinner.style.display = "none";
		let htmlData='';
		var responses=document.querySelector('#responses');
		if(res.status === 404){
			res.message.forEach((msg) => {
				htmlData+=`
				<div class="alert alert-danger alert-dismissible fade show" role="alert">
					 ${msg}
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				`;
			})
		}
		else if(res.status === 401){
			res.message.forEach((msg) => {
				htmlData+=`
				<div class="alert alert-danger alert-dismissible fade show" role="alert">
					 ${msg}
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				`;
			})
		}
		else if(res.status === 208){
			res.message.forEach((msg) => {
				htmlData+=`
				<div class="alert alert-warning alert-dismissible fade show" role="alert">
					 ${msg}
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				`;
			})
		}
		else if(res.status === 202){
			res.message.forEach((msg) => {
				htmlData+=`
				<div class="alert alert-success alert-dismissible fade show" role="alert">
					 ${msg}
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				`;
			})
		}
		responses.innerHTML=htmlData;
		});
	</script>

</body>
</html>