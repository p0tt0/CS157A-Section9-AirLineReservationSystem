<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a","root","root");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from `Airline Reservation`.member where username='"+username+"' and password='"+password+"'");
try{
rs.next();
if(rs.getString("password").equals(password) && rs.getString("username").equals(username))
{
out.println("Hello " +username);
}
}
catch (Exception e) {
out.print("Wrong username or password, Try Again!");
}
%>