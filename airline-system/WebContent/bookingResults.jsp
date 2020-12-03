<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String Null = "";
Boolean dateGiven = true;
String From = request.getParameter("from");
String To = request.getParameter("to");
String Depart = request.getParameter("departDate");
String Return = request.getParameter("returnDate");
if(Depart.compareTo(Null) == 0 || Return.compareTo(Null) == 0){
	dateGiven = false;
}
String username = request.getParameter("class");
if (dateGiven){
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a","root","root");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from `Airline Reservation`.flight where departure='"+From+"' and destination='"+To+"'and departureDate='"+Depart+"'and arrivalDate='"+Return+"'");
out.print("Search Results:");
%> <br></br> <%
out.print("   &nbsp;" +"   &nbsp;" + "Departure  |  Destination  | flight Number  | Departure Date  | Return Date");
%> <br></br> <%
try{
while(rs.next()){
	out.println("&nbsp;     "+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+rs.getString(2)+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+rs.getString(5)+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+"&nbsp;     " + rs.getString(1)+"&nbsp;    "+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+rs.getString(3)+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+"&nbsp;     "+ rs.getString(4));
	%> <br></br> <%
}
con.close();

}
catch (Exception e) {
out.print(e);
}
} else {
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a","root","root");
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select * from `Airline Reservation`.flight where departure='"+From+"' and destination='"+To+"'");
	out.print("Search Results:");
	%> <br></br> <%
	out.print("   &nbsp;" +"   &nbsp;" + "Departure  |  Destination  | flight Number  | Departure Date  | Return Date");
	%> <br></br> <%
	try{
		while(rs.next()){
			out.print("   &nbsp;" +"   &nbsp;" + rs.getString("departure"));
			out.print("   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;" + rs.getString("destination"));
			out.print("   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;"  + rs.getString("flightid"));
			out.print("   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;"  + rs.getString("departureDate"));
			out.print("   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;" +"   &nbsp;"  + rs.getString("arrivalDate"));
			%> <br></br> <%
			}
	}
	catch (Exception e) {
	out.print(e);
	}
}
%>

<Form method="post" action="addtocart.jsp">
<input type="text" name="addtocart" placeholder="Enter flight Number" required="">
<input type="submit" value="Add to Cart">
</Form>




