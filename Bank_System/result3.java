/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.View;

/**
 *
 * @author User
 */
@WebServlet("/result3")
public class result3 extends HttpServlet {
       

    
    
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String amount;
        amount = request.getParameter("fname");
        String user=request.getParameter("gao");
        String user2;
        user2 = request.getParameter("trans");
        String amount2=amount;
        try 

    {
        //database connection
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con;  
            con = DriverManager.getConnection("jdbc:mysql://sql302.epizy.com/epiz_28938406_stuti","epiz_28938406","Hellosir12@");
        Statement st=con.createStatement();
        String Query="Select * from customers";
        String Query2="Select * from history";
        ResultSet rs=st.executeQuery(Query);
        PrintWriter writer  = response.getWriter();
        int c=0;
        while(rs.next())
        {
            if(user2.equals(rs.getString("Name")))
                     {
                          
                             int amount12=Integer.parseInt(rs.getString("Balance"))+Integer.parseInt((amount));
                             String amount23;
                             amount23 = String.valueOf(amount12);
                            PreparedStatement ts;
                             ts = (PreparedStatement) con.prepareStatement("UPDATE customers SET Balance=? WHERE Name=?");
                             ts.setString(1, amount23);
                             ts.setString(2,user2);
                             ts.executeUpdate();
                             ts.close();
                             
                             
                         }
            
            if(user.equals(rs.getString("Name")))
            {
                c=1;
                if(Integer.parseInt(amount)<=Integer.parseInt(rs.getString("Balance")))
                {
                    int amount1=Integer.parseInt(rs.getString("Balance"))-Integer.parseInt((amount));
                    amount=String.valueOf(amount1);
                    String htmlResponse = "<html>" ;
                    htmlResponse += "<h4>Your money Transferred Rs:"+amount2+"</h4>";
                    htmlResponse += "<h4>Current Balance Rs:"+amount+"</h4>";
                     htmlResponse += "</html>";
                     writer.println(htmlResponse);
                     String m = "<html>";
                     m+=  "<a href='history.jsp'>View Transfer History"+"</a>";
                     m+="</html>" ;     
                     writer.println(m);
                     String html2="<html>";
                     html2+= "<a href='customer.jsp'>View Customers";
                         
                          
                         html2+="</a>";
                         html2 += "</html>";
                         writer.println(html2);
                    PreparedStatement ps;
                    PreparedStatement ts;
                    ps = (PreparedStatement) con.prepareStatement("UPDATE customers SET Balance=? WHERE Name=?");
                    ps.setString(1, amount);
                    ps.setString(2,user);
                    ps.executeUpdate();
                    ps.close();
                    String query211="Insert into history(user1, user2, his)values(?,?,?)";
                    ts = (PreparedStatement) con.prepareStatement(query211);
                    ts.setString(1,user);
                    ts.setString(2,user2);
                    ts.setString(3,amount2);
                    ts.executeUpdate();
                   
                    
                     
                     } 
                else {
                         
                         String htmlResponse = "<html>" ;
                         htmlResponse += "<h4>Insufficient Balanace:"+amount+"</h4>";
                         htmlResponse += "</html>";
                         writer.println(htmlResponse);
                     }
                
            } 
            
             
                                   
        }
       
       if(c==0) 
       {
                        String htmlResponse21 = "<html>" ;
                         htmlResponse21 += "<h4>Enter the correct name</h4>";
                         htmlResponse21 += "<a href='transfer.jsp'>Go Back</a>" ;
                         htmlResponse21 += "</html>";
                         writer.println(htmlResponse21);
            }
           
       
                          
    }
        catch(IOException | ClassNotFoundException | NumberFormatException | SQLException e)
        {
        System.out.println(e.getMessage());
        
        }
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


