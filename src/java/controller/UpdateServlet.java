
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Activity;
import model.User;

/**
 *
 * @author khanhlvm98
 */
public class UpdateServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        response.setContentType("text/html;charset=UTF-8");
        String actID = request.getParameter("actID");
        Activity a = new Activity(Integer.valueOf(actID));
        HttpSession ss = request.getSession();
        request.getSession().setAttribute("au", a);
        request.getRequestDispatcher("update.jsp").include(request, response);
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
        HttpSession ss = request.getSession();
        Activity au = (Activity)ss.getAttribute("au");
        User u = (User)ss.getAttribute("u");
        String actName = request.getParameter("actName");
        String actLocation = request.getParameter("actLocation");
        String actTime = request.getParameter("actTime");
        String actDate = request.getParameter("actDate");
        String categories = request.getParameter("categories");
        String description = request.getParameter("description");
        Activity a = new Activity(au.getActID(),u.getUsername(),actName,actLocation,actTime,actDate,categories,description);
        if(a.updateActivity(a)) {
            request.getRequestDispatcher("manage.jsp?success=1").include(request, response);
        }else{
            request.getRequestDispatcher("update.jsp?error=0").include(request, response);
        }       
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

}
