<%@ page language="java" import="java.sql.*"%>

<html>

<head>
<title> Movie Information</title>
</head>


<body bgcolor="white">

<% 
    String movieID = request.getParameter("movieID");
    String title = request.getParameter("title");
    String actorID = request.getParameter("actorID");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String genres = request.getParameter("genre");
    String year = request.getParameter("year");
    String end_year = request.getParameter("end_year");
%>

<div>
   movieID: <%=movieID %>
   title : <%=title %>
   actorID: <%=actorID %>
   fname: <%=fname %>
   lname:<%=lname %>
   genres: <%=genres %>
   year: = <%=year %>
   end_year:<%=end_year %>
</div>

<%
	try 
	{
		Class.forName( "org.postgresql.Driver" ).newInstance();
		String url = "jdbc:postgresql://localhost:5432/WDM" ;
		Connection con = DriverManager.getConnection(url, "postgres" , "admin" );
		Statement st = con.createStatement();
		String sql = "";
		ResultSet rs =null;
		//ResultSet rs = st.executeQuery(sql);
		//Logger log = Logger.getLogger(this.getClass()); 
		//log.info("starts to construct sql");
		
		//out.println("111111111");
		if(movieID!=null||title!=null)
		{
			sql = "select * from movies where ";
			
			if(movieID.length()!=0){
				sql += " idmovies='"+ movieID+"'";
			}
			if(title.length()!=0){
				if(sql.length()>27)
					sql += " and ";			
				sql +=  "title='"+title+"'";	
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

	} 

	catch (Exception ee)
	{
		System.out.print(ee.getMessage());
	} 	
%>


</body>
</html>

