<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String airline = request.getParameter("search");
out.print("Search Results");
%><br /><%
out.print("Flight information:");
%><br /><%
%><br /><%
out.print("Flight Number" + "&nbsp;     "+"&nbsp;     " +  " &nbsp; " + "Departure" +"&nbsp;     "+"&nbsp;     " + " &nbsp; "+ "Departure Date" +"&nbsp;     "+"&nbsp;     " + " &nbsp; "+ "Arrival Date" +"&nbsp;     "+"&nbsp;     " + " &nbsp; "+ "Destination" +"&nbsp;     "+"&nbsp;     ");
%><br /><%

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a", "root", "root");
Statement st=conn.createStatement();
ResultSet i = st.executeQuery("select * from `Airline Reservation`.flight where departure='"+airline+"'");
while(i.next()){
	out.print(i.getString(1) +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " + "&nbsp;     "+"&nbsp;     " +  " &nbsp; " + i.getString(2) +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " + "&nbsp;     "+"&nbsp;     " + " &nbsp; "+ i.getString(3)+"&nbsp;     "+"&nbsp;     " +  " &nbsp; " +"&nbsp;     "+"&nbsp;     " + " &nbsp; "+ i.getString(4)+"&nbsp;     "+"&nbsp;     " + " &nbsp; "+ i.getString(5) +"&nbsp;     "+"&nbsp;     ");
	%><br /><%
	%><br /><%
}
}
catch(Exception e)
{
System.out.print("ERROR " + e);
e.printStackTrace();
}
%>