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
    <title>Movie Info</title>

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
					Movie Information
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
				<a href="../index.jsp" class="btn  btn-d  btn-lg">Back</a>
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
				    String movieID = request.getParameter("movieID");
				    String title = request.getParameter("title");

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
						if(movieID!=null||title!=null)
						{
							sql = "select idmovies,title,year from movies where ";
							
							if(movieID.length()!=0)
							{
								sql += " idmovies='"+ movieID+"'";
								rs = st.executeQuery(sql);
								while (rs.next())
								{
								    int r_idmovies = rs.getInt( 1 );
								    String r_title = rs.getString( 2 );
								    int r_year = rs.getInt(3);
								    /* out.println(rs.getString( 3 ));
								    out.println(rs.getString( 4 )); */
								    
									%>
									<div class="panel">
										<div class="panel-body">
											<p>
												Movie ID: <%=r_idmovies %><br>
												Movie Title: <%=r_title %><br>
												Year: <%=r_year %><br>
												Series: <%
													String series_sql="SELECT name FROM series WHERE ";
													series_sql += " idmovies='"+ r_idmovies +"'";
													//out.println(series_sql);
													Statement series_st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
													ResultSet series_rs = series_st.executeQuery(series_sql);
													while(series_rs.next())
													{
														String series_name=series_rs.getString(1);
														%>
														<%=series_name %>.
														<%
														
													}
												%><br>
												Genres: <% 
													String genre_sql="SELECT genre FROM movies_genres AS MG, genres AS G WHERE MG.idgenres = G.idgenres AND  ";
													genre_sql += " idmovies='"+ r_idmovies +"'";
													//out.println(series_sql);
													Statement genre_st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
													ResultSet genre_rs = genre_st.executeQuery(genre_sql);
													while(genre_rs.next())
													{
														String genre_name=genre_rs.getString(1);
														%>
														<%=genre_name %>.
														<%
														
													}
												%><br>
												Keywords: <% 
													String keywords_sql="SELECT DISTINCT K.keyword FROM keywords AS K,movies_keywords AS MK WHERE K.idkeywords = MK.idkeywords AND ";
													keywords_sql += " idmovies='"+ r_idmovies +"'";
													//out.println(series_sql);
													Statement keywords_st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
													ResultSet keywords_rs = genre_st.executeQuery(keywords_sql);
													while(keywords_rs.next())
													{
														String keywords_name=keywords_rs.getString(1);
														%>
														<%=keywords_name %>. 
														<%
														
													}
												%><br>
												Actors: <% %><br>
											</p>
										</div>
									</div>								
									<%
								}
							} 
 
							
							if(title.length()!=0)
							{
								if(sql.length()>27)
									sql += " and ";			
								sql +=  "title='"+title+"'";
								rs = st.executeQuery(sql);
								while (rs.next())
								{
								    int r_idmovies = rs.getInt( 1 );
								    String r_title = rs.getString( 2 );
								    int r_year = rs.getInt(3);
								    /* out.println(rs.getString( 3 ));
								    out.println(rs.getString( 4 )); */
									%>
									<div class="panel">
										<div class="panel-body">
											<p>
												Movie ID:<%=r_idmovies %><br>
												Movie Title:<%=r_title %><br>
												Year:<%=r_year %><br>
											</p>
										</div>
									</div>								
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





