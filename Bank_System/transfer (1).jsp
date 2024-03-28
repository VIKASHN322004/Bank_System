
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction Page</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
      
  </div>
 </nav> 
        <div style="background-color:lightgray">
   <form action="result3" method="post" id="carform">
       <br><br>
       
           
       <label>Transfer Rs:</label>
            <input type="number" name="fname">
 
  <br><br><br>
  
      <label for="fuser">Your Name:</label>

        <input type="text"  name="gao" id="fuser">
  
  <br><br><br>
  
      <label for="trans">Transfer To:</label>
       <select name="trans" id="trans" >
        <% 
            try
    {
        //database connection
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://sql302.epizy.com/epiz_28938406_stuti","epiz_28938406","Hellosir12@");  
        Statement st = con.createStatement();
        String Query = "Select Name from customers";
        ResultSet rs = st.executeQuery(Query);
        while(rs.next())
        {
            %>
            
             <option name="transferto"><%=rs.getString("Name")%></option>
            
  

         <%
        }
    } 
           catch(Exception e)
           {
        System.out.println(e.getMessage());
        
    }
 %>   
</select>
<br><br><br>

    <input type="submit" value="Transfer">
<br><br>
       
  </form>          
        </div>

    </body>
</html>
