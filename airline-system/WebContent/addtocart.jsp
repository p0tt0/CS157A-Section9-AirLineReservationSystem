<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String flightid = request.getParameter("addtocart");
String username = (String)session.getAttribute("username");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a", "root", "root");
Statement st=conn.createStatement();

int i = st.executeUpdate("insert into `Airline Reservation`.booking(username, flightid)values('"+username+"','"+flightid+"')");
out.println("The item has been added to your cart! Go <a href='index.html'>Home</a> to continue.");
}
catch(Exception e)
{
System.out.print("ERROR " + e);
e.printStackTrace();
}
%>