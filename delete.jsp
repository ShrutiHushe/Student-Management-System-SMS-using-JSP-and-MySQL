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

<h1>Delete Page</h1>

<form>
<input type="number" name="r" placeholder="enter rno " required/>
<br></br>
<input type="submit" name="btn" value="Delete"/>
<br><br>
</form>

<%
if(request.getParameter("btn") != null)
{
int rno=Integer.parseInt(request.getParameter("r"));
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url ="jdbc:mysql://localhost:3306/sms1oct23";
Connection con = DriverManager.getConnection(url, "root", "abc456");
String sql = "delete from student where rno = ?";
PreparedStatement pst = con.prepareStatement(sql);
pst.setInt(1, rno);
long r = pst.executeUpdate();
out.println(r + "record's deleted");
con.close();
}
catch(SQLException e)
{
out.println("issue" +e);
}
}
%>
<center>
</body>
</html>