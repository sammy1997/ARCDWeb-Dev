<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.Date"  %>
<%@ page import ="java.text.DateFormat"  %>
<%@ page import ="java.text.SimpleDateFormat"  %>
<%
/*created by Sombuddha Chakravarty */
DateFormat df = new SimpleDateFormat("HH:mm:ss");
Date dateobj = new Date();
String time=df.format(dateobj);
java.sql.Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/collected_status?useSSL=false","root","admin");
String[] ids=request.getParameterValues("chkbx");
String[] retIds=request.getParameterValues("chkbx1");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdata?useSSL=false","root","admin"); 
Statement st2=con2.createStatement();
Statement st= con.createStatement();
try{
for(String tempId:ids){
	String sql;
	boolean b=false;
	ResultSet rs3 = st2.executeQuery("select * from data_table2 where IdNo='" + tempId+"'");
	while(rs3.next()){
		if(rs3.getString(4).equals("N")){
			b=true;
			break;
			}
			}
	if(b){
		sql="update data_table2 set TimeCollected='"+time+"' where IdNo='"+tempId+"'";
		st2.executeUpdate(sql);
	}
	sql="update data_table2 set cStatus='Y' where IdNo='"+tempId+"'";
	st2.executeUpdate(sql);
	}
}catch(Exception e){
	e.printStackTrace();
}
try{
for(String tempId:retIds){
	String sql;
	boolean b=false;
	ResultSet rs3 = st2.executeQuery("select * from data_table2 where IdNo='" + tempId+"'");
	while(rs3.next()){
		if(rs3.getString(6).equals("N")){
			b=true;
			}
			}
	if(b){
	sql="update data_table2 set TimeRet='"+time+"' where IdNo='"+tempId+"'";
	st2.executeUpdate(sql);
	}
	sql="update data_table2 set rStatus='Y' where IdNo='"+tempId+"'";
	st2.executeUpdate(sql);
	
}
}catch(Exception e){
	e.printStackTrace();
}
int i=0,j=0,k=0;
ResultSet rs=st.executeQuery("select * from data_table");
ResultSet rs2=st2.executeQuery("select * from data_table2");
while(rs.next()){
	if(rs.getString("DuesPending").equals("Y")){
		j++;
	}
}

while(rs2.next()){
	if(rs2.getString("cStatus").equals("Y")){
		i++;
	}
	if(rs2.getString("rStatus").equals("Y")){
		k++;
	}
}
out.println("Data Saved!! <br> No of students collected = " + i + "<br>No of students with Dues Pending = "+j+"<br>No of students who have returned their cards="+k);
%>
</body>
</html>