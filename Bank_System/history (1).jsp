<%-- 
    Document   : history
    Created on : Jun 17, 2021, 12:41:39 AM
    Author     : User
--%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>History</title>
    </head>
    <body>
        <div class='container'>
            <h2>Transaction Table</h2>
  <p>This table will ensure what all transaction took place.</p>
        <table class='table'>
      <thead>
      <tr>
        <th>User</th>
        <th>Transferred To</th>
        <th>Amount</th>
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
        String Query3="Select * from history";
        ResultSet rs1=st.executeQuery(Query3);
        while(rs1.next())
        {
            %>
            
                <td><%=rs1.getString("user1")%></td>
                <td><%=rs1.getString("user2")%></td>
                <td>Rs.<%=rs1.getInt("his")%></td>
                </tr>
                </tbody>
       <%
        }
    }catch(Exception e){
        System.out.println(e.getMessage());
        
    }
 %>
    
  </table>
 <a style=color:grey" href='index.html'>Back to Home</a>
        </div>
    </body>
</html>
