<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String airline = request.getParameter("search");
String sql, air;
Statement st;
ResultSet r = null;
ResultSet rs = null;
ResultSet rst = null;
java.sql.Connection con;
%>

<!DOCTYPE html>
<html>
	<body>

	<table border="1">
	<tr>
	<td>Flight Number</td>
	<td>Airline</td>
	<td>Airline Logo</td>
	<td>Departure</td>
	<td>Destination</td>
	<td>Departure Time</td>
	<td>Arrival Time</td>
	<td>Route</td>
	<td>Price</td>
	</tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ars","root","potato");
	st= con.createStatement();
	air = "select * from 'ars'.airline where 'ars'.airlineName='"+airline+"'";
	//out.println(airline);
	r = st.executeQuery(air);
	
	while(r.next()){
	
	//if(r.getString("airlineName").equals(airline)){
		
		sql = "select * from 'ars'.flight";
		out.println(sql);
		rs = st.executeQuery(sql);
		while(rs.next()){

		out.println(rs.getString("airlineName"));

		}// 
	} 

	con.close();
} catch (Exception e) {
  e.printStackTrace();
}
%>
</table>
</body>
</html>