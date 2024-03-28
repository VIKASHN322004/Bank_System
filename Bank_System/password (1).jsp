<%-- 
    Document   : password
    Created on : Jun 21, 2021, 3:50:52 PM
    Author     : User
--%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Authenticity</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/A.owl.carousel.min.css+owl.theme.default.min.css,Mcc.hKjMy8bmsx.css.pagespeed.cf.qms1kGIr0J.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css">
<link rel="stylesheet" href="css/A.style.css.pagespeed.cf.xX11irklYY.css">
<link rel="stylesheet" href="style.css" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">LeafyBank</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="customer.jsp">View all Customers</a></li>
      <li><a href="#">About</a></li>
      <li><a href="picture.html">Picture Gallery</a></li>
    </ul>
  </div>
</nav>
        <div>
            <form method="post" action="pass">
                <label for="trans" style="color:grey;">Select Your Name</label>
       <select style="margin-left: 35px;" name="trans1" id="trans" >
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
            
             <option  name="goa1"><%=rs.getString("Name")%></option>
            
  

         <%
        }
    } 
           catch(Exception e)
           {
        System.out.println(e.getMessage());
        
    }
 %>   
       </select>
       <br><br>
               <label style="color:grey" for="mm">Your 4 digit Pin</label>
                <input style="margin-left: 50px;" type="password" id="mm" name="pass11">
                
                <input type="submit" value="Go">
            </form>
        </div>
    </body>
</html>
