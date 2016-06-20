<%@ page language="java" import="java.sql.*"%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="keywords" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0"> 
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../style.css">
	<link rel="stylesheet" href="../css/animate.min.css" /><link rel='stylesheet' href='../css/font-awesome.min.css'/><link href='http://fonts.googleapis.com/css?family=Josefin+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    
	<script src="../js/jquery-2.1.0.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/blocs.js"></script><script src="../js/jqBootstrapValidation.js"></script>
    <title>Actor Info</title>

</head>
<body>
<!-- Main container -->
<div class="page-container">
    
<!-- bloc-6 -->
<div class="bloc l-bloc bgc-white" id="bloc-6">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h1 class="mg-md text-center tc-tufts-blue">
					Actor Information
				</h1>
			</div>
		</div>
	</div>
</div>
<!-- bloc-6 END -->

<!-- bloc-7 -->
<div class="bloc l-bloc bgc-white" id="bloc-7">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<a href="../" class="btn  btn-d  btn-lg">Back</a>
			</div>
		</div>
	</div>
</div>
<!-- bloc-7 END -->

<!-- bloc-8 -->
<div class="bloc bgc-white l-bloc" id="bloc-8">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="panel">
					<div class="panel-body">
						<p>
				<% 
				    String actorID = request.getParameter("actorID");
				    String fname = request.getParameter("fname");
				    String lname = request.getParameter("lname");
					try 
					{
						Class.forName( "org.postgresql.Driver" ).newInstance();
						String url = "jdbc:postgresql://localhost:5432/postgres" ;
						Connection con = DriverManager.getConnection(url, "postgres" , "1111" );
						Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						String sql = "";
						ResultSet rs =null;
						//ResultSet rs = st.executeQuery(sql);
						//Logger log = Logger.getLogger(this.getClass()); 
						//log.info("starts to construct sql");
						
						//out.println("111111111");
						if(actorID !=null)
						{														
							if(actorID.length()!=0)
							{//SELECT fname, lname, gender, count(idmovies) FROM acted_in AS ai, actors AS a WHERE ai.idactors = a.idactors AND a.idactors = '2' GROUP BY fname, lname

								sql = "SELECT fname, lname, gender, count(idmovies) FROM acted_in AS ai, actors AS a WHERE ai.idactors = a.idactors AND a.idactors = '";
								sql += actorID+"' GROUP BY fname, lname, gender";
								//out.println(sql);
								rs = st.executeQuery(sql);
								while (rs.next())
								{
									String r_fname = rs.getString( 1 );
								    String r_lname = rs.getString( 2 );
								    int r_gender = rs.getInt(3);
								    int r_count =rs.getInt(4);
								    /* out.println(rs.getString( 3 ));
								    out.println(rs.getString( 4 )); */
								    %>
								    <b>First Name: </b><%=r_fname %>
									<b>Last Name: </b><%=r_lname %>
									<b>Gender: </b><%=r_gender %>
									<b>Movie Acted In: </b><%=r_count %><br>
									<b>Movies: </b><% 
									
													String movie_sql="SELECT DISTINCT M.idmovies, M.title, M.year FROM acted_in AS ai, actors AS a, movies AS M WHERE ai.idactors = a.idactors AND M.idmovies = ai.idmovies AND a.idactors = '";
													movie_sql += actorID+"'";
													out.println(movie_sql);
													Statement movie_st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
													ResultSet movie_rs = movie_st.executeQuery(movie_sql);
													while(movie_rs.next())
													{
														int r_idmovies = movie_rs.getInt(1);
														String r_title = movie_rs.getString(2);
														int r_year = movie_rs.getInt(3);
														%>
														
														<div class="panel">
															<div class="panel-body">
																<p>
																<b>Movie ID: </b><%=r_idmovies %><br>
																<b>Movie Title: </b><%=r_title %><br>
																<b>Movie Year: </b><%=r_year %><br>	
																</p>
															</div>
														</div>	
														<%														
													}
												
																	
									
								}
							} 
							else if(fname!=null || lname!=null)
							{
								if(fname.length()!=0 && lname.length()!=0)
								{
									sql = "SELECT fname, lname, gender, count(idmovies), a.idactors FROM acted_in AS ai, actors AS a WHERE ai.idactors = a.idactors AND a.fname = '";
									sql += fname+"' AND a.lname='" + lname  + "' GROUP BY fname, lname, gender, a.idactors";
									//out.println(sql);
								}
								else if(fname.length()!=0 && lname.length()==0)
								{
									sql = "SELECT fname, lname, gender, count(idmovies), a.idactors FROM acted_in AS ai, actors AS a WHERE ai.idactors = a.idactors AND a.fname = '";
									sql += fname+"' GROUP BY fname, lname, gender, a.idactors";
									//out.println(sql);
								}
								else if(fname.length()==0 && lname.length()!=0) 
								{
									sql = "SELECT fname, lname, gender, count(idmovies), a.idactors FROM acted_in AS ai, actors AS a WHERE ai.idactors = a.idactors AND a.lname = '";
									sql += lname  + "' GROUP BY fname, lname, gender, a.idactors";
									//out.println(sql);
								}
								
								//out.println(sql);
								rs = st.executeQuery(sql);
								while (rs.next())
								{
									String r_fname = rs.getString( 1 );
								    String r_lname = rs.getString( 2 );
								    int r_gender = rs.getInt(3);
								    int r_count =rs.getInt(4);
								    actorID = rs.getString(5);
								    /* out.println(rs.getString( 3 ));
								    out.println(rs.getString( 4 )); */
								    %>
								    <b>First Name: </b><%=r_fname %>
									<b>Last Name: </b><%=r_lname %>
									<b>Gender: </b><%=r_gender %>
									<b>Movie Acted In: </b><%=r_count %><br>
									<b>Movies: </b><% 
									
													String movie_sql="SELECT DISTINCT M.idmovies, M.title, M.year FROM acted_in AS ai, actors AS a, movies AS M WHERE ai.idactors = a.idactors AND M.idmovies = ai.idmovies AND a.idactors = '";
													movie_sql += actorID+"'";
													//out.println(movie_sql);
													Statement movie_st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
													ResultSet movie_rs = movie_st.executeQuery(movie_sql);
													while(movie_rs.next())
													{
														int r_idmovies = movie_rs.getInt(1);
														String r_title = movie_rs.getString(2);
														int r_year = movie_rs.getInt(3);
														%>
														
														<div class="panel">
															<div class="panel-body">
																<p>
																<b>Movie ID: </b><%=r_idmovies %><br>
																<b>Movie Title: </b><%=r_title %><br>
																<b>Movie Year: </b><%=r_year %><br>	
																</p>
															</div>
														</div>	
														<%														
													}																										
								}
							} 

						}
					}					
					catch (Exception ee)
					{
						System.out.print(ee.getMessage());
					} 	
				%>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- bloc-8 END -->

<!-- ScrollToTop Button -->
<a class="bloc-button btn btn-d scrollToTop" onclick="scrollToTarget('1')"><span class="fa fa-chevron-up"></span></a>
<!-- ScrollToTop Button END-->

</div>
<!-- Main container END -->
    

</body>
    
<!-- Google Analytics -->
 
<!-- Google Analytics END -->

</html>