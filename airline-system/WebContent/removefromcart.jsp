<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String flightid = request.getParameter("removefromcart");
String username = (String)session.getAttribute("username");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a", "root", "root");
Statement st=conn.createStatement();

int i = st.executeUpdate("Delete from `Airline Reservation`.booking WHERE username='"+username+"' and flightid='"+flightid+"'");
out.println("The item has been removed from your cart! Go <a href='index.html'>Home</a> to continue.");
}
catch(Exception e)
{
System.out.print("ERROR " + e);
e.printStackTrace();
}
%>