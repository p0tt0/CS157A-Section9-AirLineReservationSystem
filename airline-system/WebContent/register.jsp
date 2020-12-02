<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String f_name = request.getParameter("firstname");
String l_name = request.getParameter("lastname");
String username = request.getParameter("username");
String email = request.getParameter("email");
String password = request.getParameter("password");
String phone_number = request.getParameter("phonenumber");
String address = request.getParameter("address");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a", "root", "root");
Statement st=conn.createStatement();

int i = st.executeUpdate("insert into `Airline Reservation`.customer(username, email, phone_number, first_name,last_name, address)values('"+username+"','"+email+"','"+phone_number+"','"+f_name+"','"+l_name+"','"+address+"')");
out.println("Thank you for registering as a customer! Please <a href='login.html'>Login</a> to continue.");
}
catch(Exception e)
{
System.out.print("ERROR " + e);
e.printStackTrace();
}

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a", "root", "root");
Statement st=conn.createStatement();

int i = st.executeUpdate("insert into `Airline Reservation`.member(username, password)values('"+username+"','"+password+"')");
out.println("Thank you for registering as a customer! Please <a href='login.html'>Login</a> to continue.");
}
catch(Exception e)
{
System.out.print("ERROR " + e);
e.printStackTrace();
}

%>