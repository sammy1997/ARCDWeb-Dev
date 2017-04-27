<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ARCD REG</title>
<link rel="stylesheet" href="arcdPage.css">
</head>
<body>
<% out.println("<div><span</span></div>"); %>
<h1>List of Registrars </h1>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
/*created by Sombuddha Chakravarty */
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registrar?useSSL=false","root","admin"); 
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from reg_id");
out.println("<form action='viewpage.jsp'>");
int i=0;
while(rs.next()){
	i++;
	out.println("<input  type='radio' id='radio"+i+"' name='RID' value='"+rs.getString("RaID")+"'><label for='radio"+i+"'><span></span>"+rs.getString("RaID")+"</label><br><br>" );
}
out.println("<input id='btn' type='submit' name='submitBtn' value='See Student List'></form>" );
%>
</body>
</html>
