

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

/**
 *
 * @author User
 */
@WebServlet("/pass")
public class pass extends HttpServlet {
       

    
    
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
        String pas;
        String nme;
        pas = request.getParameter("pass11");
        nme = request.getParameter("trans1");
        try 

    {
        //database connection
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://sql302.epizy.com/epiz_28938406_stuti","epiz_28938406","Hellosir12@");  
        Statement st=con.createStatement();
        String Query="Select * from customers";
        
        ResultSet rs=st.executeQuery(Query);
        PrintWriter writer  = response.getWriter();
        int c=0;
        while(rs.next())
        {
             if((nme.equals(rs.getString("Name"))) && (pas.equals(rs.getString("PIN"))))
             {
                 c=1;
                 String htmlResponse = "<html>" ;
                 htmlResponse += "<a style='color:black' href='transfer.jsp'>Ready To Transfer</a>";
                 htmlResponse += "</html>";
                 writer.println(htmlResponse);
             } 
            } 
            
             if(c==0){
                String htmlResponse = "<html>" ;
                htmlResponse += "<h4>Incorrect Pin</h4>";
                htmlResponse += "</html>";
                writer.println(htmlResponse);
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


