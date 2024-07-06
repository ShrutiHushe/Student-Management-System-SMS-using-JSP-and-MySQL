<%@ page import="java.sql.*" %> 

<html>
<head>
<title> SMS App </title>
<link rel="stylesheet" href="mystyle.css"/>
</head>

<body>
<center>
<div class="nav"> value="
<a href="index.jsp"> Home </a>
<a href="create.jsp"> Create </a>
<a href="delete.jsp"> Delete </a>
</div>

<h1>Create Page</h1>
<form>
<input type="number" name="r" placeholder="enter rno"required/>
<br><br>
<input type="text" name="n" placeholder="enter name"required/>
<br><br>
<input type="number" name="m" placeholder="enter marks"required/>
<br><br>
<input type="submit" name="btn" value="Save"/>
<br><br>
</form>

<%
if(request.getParameter("btn") != null)
{
int rno=Integer.parseInt(request.getParameter("r"));
String name=request.getParameter("n");
int marks=Integer.parseInt(request.getParameter("m"));

try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url ="jdbc:mysql://localhost:3306/sms1oct23";
Connection con = DriverManager.getConnection(url, "root", "abc456");
String sql = "insert into student values(?, ?, ?)";
PreparedStatement pst = con.prepareStatement(sql);
pst.setInt(1, rno);
pst.setString(2, name);
pst.setInt(3, marks);

pst.executeUpdate();
%>
<script>
alert("Record Created");
</script>
<%
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