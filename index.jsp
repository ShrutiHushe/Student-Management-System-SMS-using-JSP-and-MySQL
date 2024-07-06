<%@ page import="java.sql.*" %>

<html>
<head>
<title> SMS App </title>
<link rel="stylesheet" href="mystyle.css"/>
</head>

<body>
<center>
<div class="nav">
<a href="index.jsp"> Home </a>
<a href="create.jsp"> Create </a>
<a href="delete.jsp"> Delete </a>
</div>

<h1>Home Page</h1>
<table border="5" style="width:80%;">
<tr>
<th>Rno</th>
<th>Name</th>
<th>Marks</th>
</tr>

<%
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url ="jdbc:mysql://localhost:3306/sms1oct23";
Connection con = DriverManager.getConnection(url, "root", "abc456");
String sql = "select * from student";
PreparedStatement pst = con.prepareStatement(sql);
ResultSet rs =pst.executeQuery();
while(rs.next())
{
%>
<tr style="textalign:center;">
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>   
<td><%=rs.getInt(3)%></td>
<%
}
con.close();
}
catch(SQLException e)
{
out.println("issue" +e);
}
%>
</table>
<center>
</body>
</html>