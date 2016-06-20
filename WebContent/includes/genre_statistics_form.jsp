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
    <title>Genre Statistic</title>

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
					Genre Statistic
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
				<% 
				    String year = request.getParameter("year");
				    String end_year = request.getParameter("end_year");

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
						%>
						<div class="panel">
							<div class="panel-body">
								<p>
									
						<%
						if(year!=null)
						{														
							if(end_year.length()!=0)
							{
								sql = "SELECT  G.genre,count(G.genre) FROM movies_genres AS MG,genres AS G, movies AS M WHERE MG.idgenres = G.idgenres AND M.idmovies=MG.idmovies AND M.year<=";
								sql += "'"+ end_year + "' AND M.year>='" + year + "' GROUP BY G.genre";
								//out.println(sql);
								rs = st.executeQuery(sql);
								while (rs.next())
								{
									String r_genre = rs.getString( 1 );
								    int r_num = rs.getInt( 2 );
								    
								    //out.println(r_genre);
								    //out.println(r_num);
								    /* out.println(rs.getString( 3 ));
								    out.println(rs.getString( 4 )); */
								    %>
								    <b><%=r_genre %>: </b><%=r_num %><br>
								    <%
								}
							} 
							else 
							{
								sql = "SELECT  G.genre,count(G.genre) FROM movies_genres AS MG,genres AS G, movies AS M WHERE MG.idgenres = G.idgenres AND M.idmovies=MG.idmovies AND M.year='";
								sql += year + "' GROUP BY G.genre";
								//out.println(sql);
								rs = st.executeQuery(sql);
								while (rs.next())
								{
									String r_genre = rs.getString( 1 );
								    int r_num = rs.getInt( 2 );
								    
								    //out.println(r_genre);
								    //out.println(r_num);
								    /* out.println(rs.getString( 3 ));
								    out.println(rs.getString( 4 )); */
								    %>
								    <b><%=r_genre %>: </b><%=r_num %><br>
								    <%
								}
						

							
							}
							//out.println(sql);

						}
					}					
					catch (Exception ee)
					{
						System.out.print(ee.getMessage());
					} 	
				%>
						</p>
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