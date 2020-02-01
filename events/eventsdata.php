<?php
if(isset($_GET['data'])){
  $param=$_GET['data'];
  $isComp=1;
  if($param=="pronite"||$param=="proshow"||$param=="informal"||$param=="pre-anwesha"){
	  $isComp=0;
  }
  elseif($param!="technical"&&$param!="cultural"&&$param!="awelfare"){
	header('location:../404.html');
  }
}
else{
	header('location:../404.html');
}
$heading='';
if($param=="technical"){
	$heading="TECHNICAL";
}elseif($param=="cultural"){
	$heading="CULTURAL";
}elseif($param=="awelfare"){
	$heading="ARTS & WELFARE";
}elseif($param=="pronite"){
	$heading="PRONITES";
}elseif($param=="proshow"){
	$heading="PROSHOWS";
}elseif($param=="informal"){
	$heading="INFORMALS & WORKSHOPS";
}elseif($param=="pre-anwesha"){
	$heading="PRE-ANWEHSA EVENTS";
}
 $service_url = 'http://localhost/anwesha-web-2020/backend/admin/functions/events_api.php';
 $service_url = 'https://anwesha.info/backend/admin/functions/events_api.php';
  $curl = curl_init($service_url);
  curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
  $curl_response = curl_exec($curl);
  if ($curl_response === false) {
    $info = curl_getinfo($curl);
    curl_close($curl);
    die('error occured during curl exec. Additioanl info: ' . var_export($info));
  }
  curl_close($curl);
  $data = json_decode($curl_response, true);
//   var_dump($data);
  $events=array();
  foreach($data as $d){
  	if($d['ev_category']==ucfirst($param) || $d['ev_category']==$param){
  	array_push($events,$d);
  	}
  }

  $filters="";
  if($param=="technical"){
    $filters='
      <li><a href="#" data-filter=".filter-TECH">TECH</a></li>
      <li><a href="#" data-filter=".filter-PHOTO">PHOTOGRAPHY</a></li>
      <li><a href="#" data-filter=".filter-CODING">CODING</a></li>
      <li><a href="#" data-filter=".filter-QUIZ">QUIZ</a></li>
	  <li><a href="#" data-filter=".filter-ROBOTICS">ROBOTICS</a></li>
	  <li><a href="#" data-filter=".filter-POSTER">POSTER MAKING</a></li>
    ';
  }elseif($param=="cultural"){
    $filters='
     <li><a href="#" data-filter=".filter-MUSIC">MUSIC</a></li>
     <li><a href="#" data-filter=".filter-DANCE">DANCE</a></li>
	 <li><a href="#" data-filter=".filter-DRAMATICS">DRAMATICS</a></li>
	 <li><a href="#" data-filter=".filter-FASHION">FASHION</a></li>
	 <li><a href="#" data-filter=".filter-ARTS">ARTS & CREATION</a></li>
    ';
  }elseif($param=="awelfare"){
    $filters='
     <li><a href="#" data-filter=".filter-ARTS">ARTS & CREATION</a></li>
     <li><a href="#" data-filter=".filter-QUIZ">QUIZ & DEBATE</a></li>
	 <li><a href="#" data-filter=".filter-ONLINE">ONLINE</a></li>
	 <li><a href="#" data-filter=".filter-WELFARE">WELFARE</a></li>
    ';
  }elseif($param=="pronite"){
	$filters='
	 <li><a href="#" data-filter=".filter-BOLLYWOOD">BOLLYWOOD NIGHT</a></li>
     <li><a href="#" data-filter=".filter-CLASSIC">CLASSICAL NIGHT</a></li>
	 <li><a href="#" data-filter=".filter-EDM">EDM NIGHT</a></li>
	 <li><a href="#" data-filter=".filter-COMEDY">COMEDY NIGHT</a></li>
	';
  }elseif($param=="proshow"){
	$filters='
	 <li><a href="#" data-filter=".filter-GUEST">GUEST LECTURES</a></li>
	';
  }elseif($param=="informal"){
	$filters='
	 <li><a href="#" data-filter=".filter-GAME">GAMING ZONE</a></li>
     <li><a href="#" data-filter=".filter-WORK">TECHNICAL WORKSHOPS</a></li>
	';
  }elseif($param=="pre-anwesha"){
	$filters='
	 <li><a href="#" data-filter=".filter-ALREADY_COMEDY">COMEDY EVENTS</a></li>
	 <li><a href="#" data-filter=".filter-CULTURAL">CULTURAL EVENTS</a></li>
	 <li><a href="../multicity.html">MULTICITY</a></li>
	';
  }
  
?>
<!doctype html>
<html lang="ZXX">

<head>
	<title>Anwesha ♥ | IIT Patna</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name=description content="">
	<meta name=author content="Enventer">
	<link rel="icon" href="../img/favicon.png" type="image/png">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Nunito:400,700,900&display=swap" rel="stylesheet">
	<!-- Meanmenu css -->
	<link rel="stylesheet" href="../css/meanmenu.css">
	<!-- Magnific css -->
	<link rel="stylesheet" href="../css/magnific-popup.min.css">
	<!-- Animation CSS -->
	<link href="../css/aos.min.css" rel="stylesheet">
	<!-- Slick Carousel CSS -->
	<link href="../css/slick.css" rel="stylesheet">
	<!-- Main CSS -->
	<link rel="stylesheet" href="../style.css">
	<link rel="stylesheet" href="../css/responsive.css">
	<!-- Scrollbar CSS -->
	<link type="text/css"
		href="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.9.1/css/OverlayScrollbars.min.css"
		rel="stylesheet" />
	<!-- Scrollbar JS -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.9.1/js/OverlayScrollbars.min.js"></script>
		<style>
		.portfolio-filter ul li a {
			color: ivory;
            font-family: inherit;
		}.portfolio-filter ul li a:hover{
           color: rgb(13, 170, 123);
           font-family: inherit;
		   font-weight: bold;
		   font-size: 120%;
		}
		

		</style>
		<!---->	
</head>

<body style="background-color:#121216">
	<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

	<!--  Preloader Start
========================-->
	<div id='preloader'>
		<div id='status'>
			<img class="fade-in-fade-out" src='../img/favicon.png' alt='LOADING....!!!!!' />
			<img src='../img/loading.gif' alt='LOADING....!!!!!' />
		</div>
	</div>

	<!--=========== Main Header Area ===============-->
	<header id="home">
		<div class="main-navigation-1">
			<div class="container">
				<div class="row">
					<!-- logo-area-->
					<div class="col-xl-2 col-lg-3 col-md-3">
						<div class="logo-area">
							<a href="../index.html"><img src="../img/logo.png" alt="enventer"></a>
						</div>
					</div>
					<!-- mainmenu-area-->
					<div class="col-xl-10 col-lg-9 col-md-9">
						<div class="main-menu f-right">
							<nav id="mobile-menu">
							<ul>
									<li>
										<a href="../">home</a>
									</li>
									<li>
										<a href="https://www.townscript.com/e/anwesha-iit-patna-214401">register</a>
									</li>
									<li>
										<a href="../events.html">events</a>
									</li>
									<li>
										<a href="../competition.html">Competitions</a>
									</li>
									<li>
										<a href="../comingsoon/index.html">sponsors</a>
									</li>
									<li>
										<a href="../gallery.html">gallery</a>
									</li>
									<!-- <li>
										<a  href="pronites.html">Pronites</a>
									</li> -->
									<li>
										<a href="../ca/ca.php">CA</a>
									</li>
									<!-- dropdown menu-area-->
									<li>
										<a href="#" onclick="return false">more <i class="fas fa-angle-down"></i>
										</a>
										<ul class="dropdown">
											<li><a href="https://www.townscript.com/e/anwesha-iit-patna-214401">accomodation</a></li>
											<li><a href="../multicity.html">multicity</a></li>
											<!-- <li><a href="faq.html">FAQ</a></li> -->
											<li><a href="../team.html">our team</a></li>
											<!-- <li>
												<a  href="pronites.html">Pronites</a>
											</li> -->
											<li><a href="../contact.html">contact</a></li>
											<!-- <li><a href="single-blog.html">single blog</a></li>
												<li><a href="single-blog2.html">single blog two</a></li>
												<li><a href="team.html">our team</a></li>
												<li><a href="contact.html">contact us</a></li>
												<li><a href="404.html">404 Page</a></li> -->
										</ul>
									</li>
								</ul>
							</nav>
						</div>
						<!-- mobile menu-->
						<div class="mobile-menu"></div>
						<!--Search-->
						
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- =========Portfolio Image Area=========== -->
	<div class="jumbotron jumbotron-fluid" style="background-color:  #121216;max-height: 200px;border-bottom: 5px solid #1b8a5f;margin-top:80px;">
		
       <h1 class="text-title" style="text-align: center;color: rgb(125, 192, 136); "><?php echo $heading;?></h1>
      	
	</div>
	<div class="portfolio-main-area" style="background-color:  #121216;height:auto;">
		<div class="container">
			<div class="row">
				<!-- portfolio filtering button -->
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12" ><!--style="background-color:rgb(61, 173, 79);"-->
					<div class="portfolio-filter">
						<ul>
							<li class="active"  style="color: blanchedalmond;"><a href="#" data-filter="*"> All</a></li>
							<?php echo $filters; ?>
						</ul>
					</div>
				</div>
			</div>
			<div class="row grid">
				<!-- single portfolio -->
				<?php foreach($events as $e) { ?>
					<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 filter-<?php echo $e['ev_club']?> default-margin-mt portfolio-headmove">
						<div class="single-portfolio">
							<div class="portfolio-image">
								<img src="<?php echo $e['ev_poster_url']?>" alt="">
								<div class="portfolio-content">
									<p><?php echo $e['ev_description']?></p>
									<p><a href="./eventsdetails.php?id=<?php echo $e['ev_id']?>">view details</a></p>
								</div>
							</div>
						</div>
						<div class="portfolio-titile">
							<h3 style="color:#fff;font-family: inherit;"><?php echo $e['ev_name']?></h3>
						</div>
					</div>	
        		<?php } ?>
				<!-- single portfolio -->
				
			</div>
		</div>
		<!-- Pagination -->
		<!-- <div class="col-xl-12">
			<div class="next-previous-page">
				<nav aria-label="...">
					<ul class="pagination">
						<li class="page-item disabled">
							<a class="page-link" href="#" tabindex="-1"> &#60; </a></li>
						<li class="page-item active"><a class="page-link" href="#">1 <span class="sr-only">(current)</span></a></li>
						<li class="page-item">
							<a class="page-link" href="#">2</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item">
							<a class="page-link" href="#">&#62;</a>
						</li>
					</ul>
				</nav>
			</div>
		</div> -->
	</div>
	<!-- =========Call to Action=========== -->
	<div class="callto-action">
		<div class="container">
			<div class="row">
				<div class="col-xl-8 col-lg-8 col-md-8 col-sm-7">
					<div class="callto-action-text">
						<h5>Like what you see? <span>Let’s work</span> </h5>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-4 col-sm-5">
					<div class="callto-action-btn">
						<a href="#">contact us</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- =========Footer Area=========== -->
	<section id="footer-fixed">
		<div class="big-footer">
			<div class="container">
				<div class="row">
					<!--footer logo-->
					<div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
						<div class="footer-logo">
							<a href="#">
								<img src="../img/logo.png" alt="">
							</a>
							<p> Think. Dream. Live. Anwesha. <br>  A Reflection of Fond Remembrances.</p>
						</div>
						<!--footer social-->
						<div class="social">
							<ul>
								<li><a class="footer-socials" href="https://www.facebook.com/anwesha.iitpatna/"><i
											class="fab fa-facebook"></i></a></li>
								<li><a class="footer-socials" href="https://www.instagram.com/anwesha.iitp/?hl=en"><i
											class="fab fa-instagram"></i></a></li>
								<li><a class="footer-socials" href="#"><i class="fab fa-twitter"></i></a></li>
								<li><a class="footer-socials"
										href="https://www.youtube.com/channel/UCVVdnGvmkm-Z9v9IKAq77JQ"><i
											class="fab fa-youtube"></i></a></li>
							</ul>
						</div>
					</div>
					<!--footer quick links-->
					<div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
						<div class="footer-heading">
							<h3>quick links</h3>
						</div>
						<div class="footer-content">
						<ul>
								<li><a href="https://www.townscript.com/e/anwesha-iit-patna-214401">register</a></li>
								<li><a href="../events.html">events</a></li>
								<li><a href="https://www.townscript.com/e/anwesha-iit-patna-214401">accomodation</a></li>
								<li><a href="../comingsoon/index.html">sponsors</a></li>
								<li><a href="../gallery.html">gallery</a></li>
							</ul>
						</div>
					</div>
					<!--footer latest work-->
					<div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
						<div class="footer-heading">
							<h3>&nbsp;</h3>
						</div>
						<div class="footer-content">
							<ul>
								<li><a href="../ca/ca.php">Campus Ambassador</a></li>
                                <!--<li><a href="">FAQ</a></li>-->
                                <li><a href="../competition.html">Competitions</a></li>
								<li><a href="../contact.html">contact</a></li>
								<li><a href="../team.html">team</a></li>
								<li><a href="../multicity.html">multicity</a></li>
							</ul>
						</div>
					</div>
					<!--footer subscribe-->
					<!-- <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
						<div class="footer-heading">
							<h3>Get Updates</h3>
						</div>
						<div class="footer-content footer-cont-mar-40">
							<form action="#">
								<input id="leadgenaration" type="email" placeholder="Enter your email">
								<input id="subscribe" type="submit" value="Subscribe">
							</form>
						</div>
					</div> -->
				</div>
			</div>
		</div>
		<!--copyright-->
		<footer>
			<p>© 2020 Anwesha IIT Patna Web and App. All rights reserved.</p>
		</footer>
	</section>
	<!-- Jquery JS -->
	<script src="../js/vendor/jquery-2.2.4.min.js"></script>
	<!-- Proper JS -->
	<script src="../js/popper.min.js"></script>
	<!-- Bootstrap Js -->
	<script src="../js/bootstrap.min.js"></script>
	<!-- Video popup Js -->
	<script src="../js/magnific-popup.min.js"></script>
	<!-- Waypoint Up Js -->
	<script src="../js/waypoints.min.js"></script>
	<!-- Counter Up Js -->
	<script src="../js/counterup.min.js"></script>
	<!-- Meanmenu Js -->
	<script src="../js/meanmenu.min.js"></script>
	<!-- Animation Js -->
	<script src="../js/aos.min.js"></script>
	<!-- Filtering Js -->
	<script src="../js/isotope.min.js"></script>
	<!-- Background Move Js -->
	<script src="../js/jquery.backgroundMove.js"></script>
	<!-- Slick Carousel Js -->
	<script src="../js/slick.min.js"></script>
	<!-- ScrollUp Js -->
	<script src="../js/scrollUp.js"></script>
	<!-- Main Js -->
	<script src="../js/main.js"></script>
</body>

</html> 
