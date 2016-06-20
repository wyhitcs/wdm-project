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
    <title>Movie Information</title>
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
				    String genres = request.getParameter("genre");
				    String year = request.getParameter("year");
				    String end_year = request.getParameter("end_year");
				%>

				
				<%
				
					try 
					{
						Class.forName( "org.postgresql.Driver" ).newInstance();
						String url = "jdbc:postgresql://localhost:5432/postgres" ;
						Connection con = DriverManager.getConnection(url, "postgres" , "1111" );
						Statement st = con.createStatement();
						String sql = "";
						ResultSet rs =null;
			
						if(genres!=null || year!=null || end_year!=null)
						{
							sql = "select M.idmovies,M.title,M.year from genres as G, movies_genres as MG, movies as M where M.idmovies=MG.idmovies and G.idgenres=MG.idgenres";
							//out.println(sql.length());
							if(genres.length()!=0){
								sql += " and ";
								sql += "genre='"+genres+"'";
							}			
							if(year.length()!=0 && end_year.length()==0){							
								sql += " and ";
								sql += "year='"+year+"'";
							}			
							if(year.length()!=0 && end_year.length()!=0){
								sql += " and ";
								sql += "year>='"+year+"' and ";
								sql += "year<='"+end_year+"'";				
							}
							//out.println(sql);
							rs = st.executeQuery(sql);
							while (rs.next())
							{
								
								%>
								<div class="panel">
									<div class="panel-body">
										<p>
										<b>Movie ID: </b><%=rs.getInt( 1 ) %><br>
										<b>Movie Title: </b><%=rs.getString( 2 ) %><br>
										<b>Movie Year: </b><%=rs.getString( 3 ) %><br>	
										</p>
									</div>
								</div>	
								<%					   
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

