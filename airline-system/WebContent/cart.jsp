<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String username = (String)session.getAttribute("username");
out.print("Professionally made Cart where you cant checkout or remove yet!:");
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
ResultSet i = st.executeQuery("select * from `Airline Reservation`.booking Natural Join `Airline Reservation`.flight where username='"+username+"'");
while(i.next()){
	out.print(i.getString(1) +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " + "&nbsp;     "+"&nbsp;     " +  " &nbsp; " + i.getString(3) +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " +"&nbsp;     "+"&nbsp;     " +  " &nbsp; " + "&nbsp;     "+"&nbsp;     " + " &nbsp; "+ i.getString(4)+"&nbsp;     "+"&nbsp;     " +  " &nbsp; " +"&nbsp;     "+"&nbsp;     " + " &nbsp; "+ i.getString(5)+"&nbsp;     "+"&nbsp;     " + " &nbsp; "+ i.getString(6) +"&nbsp;     "+"&nbsp;     ");
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
<Form method="post" action="removefromcart.jsp">
<input type="text" name="removefromcart" placeholder="Enter flight Number" required="">
<input type="submit" value="Remove flight from Cart">
</Form>