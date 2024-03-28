
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
<head>
  <title>Customers</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">LeafyBank</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.html">Home</a></li>
      <li><a href="customer.jsp">View all Customers</a></li>
      <li><a href="about.html">About</a></li>
      <li><a href="picture.html">Picture Gallery</a></li>
    </ul>
  </div>
</nav>
<div class="container">
    <h2>LIST OF CUSTOMERS ENROLLED</h2>
    <h6 style="color:red">**The below PIN displayed here is only to inspect the project easily , whereas in real time this PIN will not be on display for security purpose.**</h6>
  <table class="table table-striped">
      <thead>
      <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Balance</th>
        <th>Pin</th>
      </tr>
      </thead>
      <tbody>
      <tr>
    <%
 try
    {
        //database connection
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://sql302.epizy.com/epiz_28938406_stuti","epiz_28938406","Hellosir12@");  
        Statement st=con.createStatement();
        String Query="Select * from customers";
        ResultSet rs=st.executeQuery(Query);
        while(rs.next())
        {
            %>
            
                <td ><a href="password.jsp"><%=rs.getString("Name")%></a></td>
                <td><%=rs.getString("Email")%></td>
                <td>Rs.<%=rs.getInt("Balance")%></td>
                <td><%=rs.getInt("PIN")%></td>
                </tr>
                </tbody>
       <%
        }
    }catch(Exception e){
        System.out.println(e.getMessage());
        
    }
 %>
    
  </table>
</div>

</body>
</html>
