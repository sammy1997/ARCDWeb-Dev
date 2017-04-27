<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student List Id</title>
<link rel="stylesheet" href="tables.css">
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
/*created by Sombuddha Chakravarty */
out.println("<div><span</span></div>");
String IdNo="",Name,PrNo,collected="",DuesPending;
String RaID=request.getParameter("RID");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdata?useSSL=false","root","admin"); 
java.sql.Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/collected_status?useSSL=false","root","admin");
String checked1="",checked="";
Statement st2=con2.createStatement();
String retrn="",retTime="",collectedTime="";
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from data_table where RaID='" + RaID+"'");
out.println("<form action='savedMessage.jsp'><table>");
out.println("<tr><th>ID No.</th><th>Name</th><th>PrNo</th><th>Dues Pending</th><th>Collected Status</th><th>Time of Collection</th><th>Returned</th><th>Returned Time</th></tr>");
while(rs.next()){
	IdNo = rs.getString("IdNo");
	Name=rs.getString("Name");
	PrNo=rs.getString("PrNo");
	DuesPending=rs.getString("DuesPending");
	//collected=rs.getString("collected");
	/* */
ResultSet rs2=st2.executeQuery("select * from data_table2 where IdNo='"+IdNo+"'");
while(rs2.next()){
collected=rs2.getString(4);
retrn=rs2.getString(6);
collectedTime=rs2.getString(5);
retTime=rs2.getString(7);
}
if(collected.equals("Y")){
	checked="checked";
}
else{
	checked="";
}
if(retrn.equals("Y")){
	checked1="checked";
}
else{
	checked1="";
}
out.println("<tr><td>" + IdNo +"</td><td>"+ Name +"</td><td>" + PrNo +"</td><td>"+DuesPending +"</td><td><input  type='checkbox' onclick='func' name='chkbx' value='"+IdNo+"' " + checked +" ></td>" );
out.println("<td>"+ collectedTime +"<td><input  type='checkbox' name='chkbx1' value='"+IdNo+"' " + checked1 +" ></td><td>"+retTime+"</td><tr>");
}
out.println("</table><input type='submit' name='saveBtn' value='Save'></form>");
%>
</body>
</html>