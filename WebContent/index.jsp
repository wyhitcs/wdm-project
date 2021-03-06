<%@ page language="java" import="java.sql.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0" />
		
			<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
			<link rel="stylesheet" type="text/css" href="style.css">
			<link rel="stylesheet" href="css/animate.min.css" />
			<link rel='stylesheet' href='css/font-awesome.min.css'/>
			<link href='http://fonts.googleapis.com/css?family=Josefin+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
		    
			<script src="js/jquery-2.1.0.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script src="js/blocs.js"></script>
			<script src="js/jqBootstrapValidation.js"></script>

		<!-- <script src="./js/formHandler.js"></script> -->
		<title>Home</title>
	</head>
	<body>
		<!-- Main container -->
		<div class="page-container">
			<!-- main-page -->
			<div id="main-page" class="bloc bloc-fill-screen bg-mountainsdusk bgc-white l-bloc" style="height: 471px;">
				<div class="container fill-bloc-top-edge">
					<nav class="navbar row">
						<div class="navbar-header">
							<button id="nav-toggle" class="ui-navbar-toggle navbar-toggle" data-target=".navbar-1" data-toggle="collapse" type="button">
								<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
							</button>
						</div>
						<div class="navbar-collapse navbar-1 collapse"> 
						</div>
					</nav>
				</div>
				<div class="container">
					<div class="row undefined animLoopInfinite animated" style="visibility: visible;">
						<div class="col-sm-5 col-sm-12">
							<h1 class="mountaindusk-hero-text glow-t animSpeedLazy fadeIn animDelay02 tc-white animated" style="visibility: visible;">
								Movie Searcher
							</h1>
						</div>
					</div>
				</div>
				<div class="container fill-bloc-bottom-edge">
					<div class="row">
						<div class="col-sm-12">
							<a id="scroll-hero" class="blocs-hero-btn-dwn" href="#">
								<span class="fa fa-chevron-down"></span></a>
						</div>
					</div>
				</div>
			</div>
			<!-- main-page END -->
			<!-- block-list -->
			<div id="block-list" class="bloc l-bloc bgc-white">
				<div class="container bloc-sm">
					<div class="row">
						<div class="col-sm-6">
							<a onclick="scrollToTarget('#movie-info')">
								<img id="pic-to-movie-info" class="img-responsive center-block" src="img/camera.jpg" /></a>
							<h3 class="mg-md">
								Detailed Movie Information
							</h3>
						</div>
						<div class="col-sm-6">
							<a onclick="scrollToTarget('#actor')">
								<img id="pic-to-actor" class="img-responsive" src="img/lake.jpg" /></a>
							<h3 class="mg-md">
								Actor Information and Statistics
							</h3>
						</div>
					</div>
					<div class="row voffset">
						<div class="col-sm-6">
							<a onclick="scrollToTarget('#genre-explore')">
								<img id="pic-to-genre-exploration" class="img-responsive center-block" src="img/desk-equipment.jpg" /></a>
							<h3 class="mg-md">
								Genre Exploration
							</h3>
						</div>
						<div class="col-sm-6">
							<a onclick="scrollToTarget('#genre-statistics')">
								<img id="pic-to-genre-statistics" class="img-responsive center-block" src="img/field.jpg" /></a>
							<h3 class="mg-md">
								Genre Statistics
							</h3>
						</div>
					</div>
				</div>
			</div>
			<!-- block-list END -->
			<!-- movie-info -->
			<div id="movie-info" class="bloc bloc-fill-screen bg-camera b-parallax bgc-white l-bloc" style="height: 471px;">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<form id="movie_info_form" method="post" action="./includes/movie_info_form.jsp">
								<div class="form-group">
									<label id="movie-id-label" style="color:#ffffff;">Movie Id<br /></label>
									<input id="movie_id_input" name="movieID" class="form-control" aria-invalid="false" />
									<div class="help-block"></div>
								</div>
								<div class="form-group">
									<label id="movie-name-label" style="color:#ffffff;">Movie Name 
									</label>
									<input id="movie_name_input" name="title" class="form-control" aria-invalid="false" />
									<div class="help-block"></div>
								</div>
								<button id="movie-submit" class="bloc-button btn btn-d btn-lg btn-block" type="submit">
									Submit
								</button>
								<div id="form-alert"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- movie-info END -->
			<!-- actor -->
			<div id="actor" class="bloc bgc-white bloc-fill-screen bg-lake d-bloc b-parallax" style="height: 471px;">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<form id="actor_info_statistics_form" method="post" action="./includes/actor_info_statistics_form.jsp">
								<div class="form-group">
									<label id="actor-id-label">Actor Id<br /></label>
									<input id="actor_id_input" name="actorID" class="form-control" />
									<div class="help-block"></div>
								</div>
								<div class="form-group">
									<label id="fname-label">Actor First Name<br /></label>
									<input id="fname_input" name="fname" class="form-control" />
									<div class="help-block"></div>
								</div>
								<div class="form-group">
									<label id="lname-label">Actor Last Name<br /></label>
									<input id="lname_input" name="lname" class="form-control" />
									<div class="help-block"></div>
								</div>
								<button id="actor-submit" class="bloc-button btn btn-d btn-lg btn-block" type="submit">
									Submit
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- actor END -->
			<!-- genre-explore -->
			<div id="genre-explore" class="bloc bloc-fill-screen bg-desk-equipment b-parallax bgc-white l-bloc" style="height: 471px;">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<form id="genre_exploration_form" method="post" action="./includes/genre_exploration_form.jsp">
								<div class="form-group">
									<label id="exp-genre-label-label">Genre Label<br /></label>
									<input id="exploration_genre_label_input" name="genre" class="form-control" />
									<div class="help-block"></div>
								</div>
								<div class="form-group">
									<label id="exp-year-label">Year<br /></label>
									<input id="exploration_year_input" name="year" class="form-control" />
									<div class="help-block"></div>
								</div>
								<div class="form-group">
									<label id="exp-endyear-label">End Year(optional)<br /></label>
									<input id="exploration_endyear_input" name="end_year" class="form-control" />
									<div class="help-block"></div>
								</div>
								<button id="exploration-submit" class="bloc-button btn btn-d btn-lg btn-block" type="submit">
									Submit
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- genre-explore END -->
			<!-- genre-statistics -->
			<div id="genre-statistics" class="bloc bloc-fill-screen bg-field b-parallax bgc-white l-bloc" style="height: 471px;">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<form id="genre_statistics_form" method="post" action="./includes/genre_statistics_form.jsp">
								<div class="form-group">
									<label id="sta-year-label">Year<br /></label>
									<input id="genre_statistics_year_input" name="year" class="form-control" />
									<div class="help-block"></div>
								</div>
								<div class="form-group">
									<label id="sta-endyear-label">End Year (optional)<br /></label>
									<input id="genre_statistics_endyear_input" name="end_year" class="form-control" />
									<div class="help-block"></div>
								</div>
								<button id="statistics-submit" class="bloc-button btn btn-d btn-lg btn-block" type="submit">
									Submit
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- genre-statistics END -->
			<!-- ScrollToTop Button -->
			<a class="bloc-button btn btn-d scrollToTop showScrollTop" onclick="scrollToTarget('1')">
				<span class="fa fa-chevron-up"></span></a>
			<!-- ScrollToTop Button END-->
			<!-- Footer - group-info -->
			<div id="group-info" class="bloc bg-citysky-overlay bgc-white l-bloc">
				<div class="container bloc-sm">
					<div class="row">
						<div class="col-sm-12">
							<h2 class="text-center mg-md">
								Web Data Management Group 9
							</h2>
						</div>
					</div>
					<div class="row voffset-lg">
						<div class="col-sm-6">
							<h3 class="mg-md">
								Changliang Luo
							</h3>
							<p>
								Student ID: 4501357
							</p>
							<br />
							<a href="https://github.com/YourDaddyIsHere" target="_blank">
								<span class="fa fa-github pull-left icon-md"></span></a>
						</div>
						<div class="col-sm-6">
							<h3 class="mg-md">
								Xiaonan Qiao
							</h3>
							<p>
								Student ID: 4513657
							</p>
							<br />
							<a href="https://github.com/QiaoN" target="_blank">
								<span class="fa fa-github pull-left icon-md"></span></a>
						</div>
					</div>
					<div class="row voffset-lg">
						<div class="col-sm-6">
							<h3 class="mg-md">
								Xilin Li
							</h3>
							<p>
								Student ID: 4500563
							</p>
							<br />
							<a href="https://github.com/lixilin2301" target="_blank">
								<span class="fa fa-github pull-left icon-md"></span></a>
						</div>
						<div class="col-sm-6">
							<h3 class="mg-md">
								Yu Wang
							</h3>
							<p>
								Student ID: 4503988
							</p>
							<br />
							<a href="https://github.com/wyhitcs" target="_blank">
								<span class="fa fa-github pull-left icon-md"></span></a>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer - group-info END -->
		</div>
		<!-- Main container END -->
		<!-- Google Analytics -->
		<!-- Google Analytics END -->
	</body>

</body>
</html>