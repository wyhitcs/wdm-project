<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0" />
		<link rel="stylesheet" href="./css/bootstrap.css" type="text/css" />
		<link rel="stylesheet" href="style.css" type="text/css" />
		<link rel="stylesheet" href="./css/animate.css" />
		<link rel="stylesheet" href="./css/font-awesome.min.css" />
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Josefin+Sans&subset=latin,latin-ext" type="text/css" />
		<script src="./js/jquery-2.1.0.js"></script>
		<script src="./js/bootstrap.js"></script>
		<script src="./js/blocs.js"></script>
		<script src="./js/jqBootstrapValidation.js"></script>
		<!--  <script src="./js/formHandler.js"></script>-->
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
							<form id="movie_info_form" method="post" action="./movie_info.jsp">
								<div class="form-group">
									<label id="movie-id-label" style="color:#ffffff;">Movie Id<br /></label>
									<input id="movie_id_input" name="movieId" class="form-control" aria-invalid="false" />
									<div class="help-block"></div>
								</div>
								<div class="form-group">
									<label id="movie-title-label" style="color:#ffffff;">Movie Name 
									</label>
									<input id="movie_title_input" name="movieTitle" class="form-control" aria-invalid="false" />
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
							<form id="actor_info_statistics_form" novalidate="">
								<div class="form-group">
									<label id="actor-id-label">Actor Id<br /></label>
									<input id="actor_id_input" class="form-control" />
									<div class="help-block"></div>
								</div>
								<div class="form-group">
									<label id="actor-fname-label">First Name<br /></label>
									<input id="actor_fname_input" class="form-control" />
									<div class="help-block"></div>
								</div>
								<div class="form-group">
									<label id="actor-lname-label">Last Name<br /></label>
									<input id="actor_lname_input" class="form-control" />
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
							<form id="genre_exploration_form" novalidate="">
								<div class="form-group">
									<label id="exp-genre-label-label">Genre Label<br /></label>
									<input id="exploration_genre_label_input" class="form-control" />
									<div class="help-block"></div>
								</div>
								<div class="form-group">
									<label id="exp-year-label">Year<br /></label>
									<input id="exploration_year_input" class="form-control" />
									<div class="help-block"></div>
								</div>
								<div class="form-group">
									<label id="exp-endyear-label">End Year(optional)<br /></label>
									<input id="exploration_endyear_input" class="form-control" />
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
							<form id="genre_statistics_form" novalidate="">
								<div class="form-group">
									<label id="sta-year-label">Year<br /></label>
									<input id="genre_statistics_year_input" class="form-control" />
									<div class="help-block"></div>
								</div>
								<div class="form-group">
									<label id="sta-endyear-label">End Year (optional)<br /></label>
									<input id="genre_statistics_endyear_input" class="form-control" />
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

<div>
	<form name="form1" action="">
		movie ID:<input type="text" name="movieID" />
    	title:   <input type="text" name="title" />
    	
    <input type = "submit" value = "submit"/>
</form>
</div>

<div>
	<form name="form2" action = "">
		actor ID:<input type="text" name="actorID" />
    	first name:<input type="text" name="first name" />
    	last name:<input type="text" name="last name" />
    	<input type = "submit" value = "submit"/>
	</form>
</div>

<div>
	<form name = "form3" action ="">
		genres:<input type="text" name="genre" />
    	year:<input type="text" name="year" />
    	end year(optional):<input type="text" name="end year" />
    	<input type = "submit" value = "submit"/>
	</form>
</div>

<% 
    String movie_ID = request.getParameter("movieID");
    String title = request.getParameter("title");
    String actorID = request.getParameter("actorID");
    String fname = request.getParameter("first name");
    String lname = request.getParameter("last name");
    String genres = request.getParameter("genre");
    String year = request.getParameter("year");
    String end_year = request.getParameter("end year");
%>

<div>
   movie ID: <%=movie_ID %>
   title : <%=title %>
   actor ID: <%=actorID %>
   fname : <%=fname %>
   lname:<%=lname %>
   genres: <%=genres %>
   year: = <%=year %>
   end_year:<%=end_year %>
</div>

<%

	try 
	{
		Class.forName( "org.postgresql.Driver" ).newInstance();
		String url = "jdbc:postgresql://localhost:5432/postgres" ;
		Connection con = DriverManager.getConnection(url, "postgres" , "1111" );
		Statement st = con.createStatement();
		String sql = "";
		ResultSet rs =null;
		//ResultSet rs = st.executeQuery(sql);
		//Logger log = Logger.getLogger(this.getClass()); 
		//log.info("starts to construct sql");
		
		//out.println("111111111");
		
		if(actorID!=null || fname!=null || lname!=null)
		{
			sql = "select * from actors where ";
			if(actorID.length()!=0){
				sql += "idactors='"+ actorID+"'";
			}
			if(fname.length()!=0){
				if(sql.length()>27)
					sql += " and ";
				sql += "fname='"+fname+"'";	
			}
			if(lname.length()!=0){
				if(sql.length()>27)
					sql += " and ";
				sql += "lname='"+lname+"'";	
			}						
			//out.println(sql);
			rs = st.executeQuery(sql);
			while (rs.next())
			{
			    out.println(rs.getInt( 1 ));
			    out.println(rs.getString( 2 ));
			    out.println(rs.getString( 3 ));
			    out.println(rs.getString( 4 ));
			} 
		}
		
		if(genres!=null || year!=null || end_year!=null)
		{
			sql = "select * from genres,movies where ";
			out.println(sql.length());
			if(genres.length()!=0){
				sql += "genre='"+genres+"'";
			}			
			if(year.length()!=0 && end_year.length()==0){
				if(sql.length()>34)
					sql += " and ";
				sql += "year='"+year+"'";
			}			
			if(year.length()!=0 && end_year.length()!=0){
				if(sql.length()>34)
					sql += " and ";
				sql += "year>='"+year+"' and ";
				sql += "year<'"+end_year+"'";				
			}
			out.println(sql);
			rs = st.executeQuery(sql);
			while (rs.next())
			{
			    out.println(rs.getInt( 1 ));
			    out.println(rs.getString( 2 ));
			    out.println(rs.getString( 3 ));
			    out.println(rs.getString( 4 ));
			} 
		}				
		//while (rs.next())
		//{
		    //out.print(rs.getInt( 1 ));
		    //out.println(rs.getString( 2 ));
		//} 
		//rs.close();
		//st.close();
		//con.close();
		//out.println("2222222");
	} 
	catch (Exception ee)
	{
		System.out.print(ee.getMessage());
	} 	
%>
</body>
</html>