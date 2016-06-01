<%@ page language="java" import="java.sql.*"%>

<html>
<head>
<title>Movie Infomation</title>
</head>
<body>
	<table border="1" width="100%" >
		<tr>
			<td width="60" valign="top" bgcolor="#999999" class="dh"><div align="center">id</div></td>
			<td width="240" valign="top"><div align="left">name<br></div></td>
 		</tr>
 	

 <%   //从表单中获取数据
   String movieId = request.getParameter("movieId");
   String movieTitle = request.getParameter("movieTitle");
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
		if(movieId!=null||movieTitle!=null)
		{
			sql = "select * from movies where ";
			
			if(movieId.length()!=0)
			{
				sql += " idmovies='"+ movieId+"'";
			}
			if(movieTitle.length()!=0)
			{
				if(sql.length()>27)
					sql += " and ";			
				sql +=  "title='"+movieTitle+"'";	
			}
			//out.println(sql);
			rs = st.executeQuery(sql);
			while (rs.next())
			{
				int outFormId = rs.getInt( 1 );
				String outFormTitle =  rs.getString( 2 );
				int outFormYear = rs.getInt( 3 );
				int outFormNumber = rs.getInt( 4 );
				int outFormType = rs.getInt( 5 );
				String outFormLocation =  rs.getString( 6 );
				String outFormLanguage =  rs.getString( 7 );
				/* out.println("id" + outFormId);
				out.println("title" + outFormTitle);
				out.println("year" + outFormYear);
				out.println("number" + outFormNumber);
				out.println("type" + outFormType);
				out.println("location" + outFormLocation);
				out.println("language" + outFormLanguage); */
				//TODO: $$$not only movies,connect all tables
				%>
				
				 
				<tr>
                 <td width="60" valign="top" bgcolor="#999999" class="dh"><div align="center"><span class="style8"><%=outFormId%>" </span></div></td>
                 <td width="240" valign="top"><div align="left"><span class="style8"><%=outFormTitle%></span><br></div></td>
                 <td width="9" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
               </tr>
               <% 
			} 
		}
	}
	catch (Exception ee)
	{
		System.out.print(ee.getMessage());
	} 

%>
	</table>
</body>
</html>