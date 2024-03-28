<%-- 
    Document   : ping
    Created on : Jun 16, 2021, 11:33:30 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTtml>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
    </head>
    <body>
        
        <table>
        <%
         String amount;
        amount = request.getParameter("fname");
        String user=request.getParameter("gao");
        String user2;
        user2 = request.getParameter("trans");
         
        %>
            
                
                <td><%=user%></td>
                <td><%=user2%></td>
                <td><%=amount%></td>
        </table>
           
        
        
    
 
        
        
    </body>
</html>
