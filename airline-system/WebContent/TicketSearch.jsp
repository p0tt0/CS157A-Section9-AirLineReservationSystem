<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String airline = request.getParameter("ticket_id");
out.print("Search Results");
%><br /><%
out.print("Flight information:");
%><br /><%
%><br /><%
out.print("ticket_id" + "&nbsp;     "+"&nbsp;     " +  " &nbsp; " + "ticket_price" +"&nbsp;     "+"&nbsp;     " + " &nbsp; "+ "ticket status" +"&nbsp;     "+"&nbsp;     " + " &nbsp; "+ "flight Number" +"&nbsp;     "+"&nbsp;     " + " &nbsp; "+ "airline" +"&nbsp;     "+"&nbsp;     ");
%><br /><%

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a", "root", "root");
Statement st=conn.createStatement();
ResultSet i = st.executeQuery("select * from `Airline Reservation`.ticket where ticket_id='"+airline+"'");
while(i.next()){
	out.print(i.getString(1) +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " + "&nbsp;     "+"&nbsp;     " +  " &nbsp; " + i.getString(2) +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " + "&nbsp;     "+"&nbsp;     " + " &nbsp; "+ i.getString(3)+"&nbsp;     "+"&nbsp;     " +  " &nbsp; " +"&nbsp;     "+"&nbsp;     " + " &nbsp; "+"&nbsp;     " + " &nbsp; "+"&nbsp;     " + " &nbsp; "+ i.getString(4)+"&nbsp;     "+"&nbsp;     " + " &nbsp; "+"&nbsp;     " + " &nbsp; "+"&nbsp;     " + " &nbsp; "+"&nbsp;     " + " &nbsp; "+ i.getString(5) +"&nbsp;     "+"&nbsp;     ");
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