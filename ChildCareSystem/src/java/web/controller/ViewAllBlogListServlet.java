/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.tblBlog.BlogDAO;
import web.models.tblBlog.BlogDTO;
import web.models.tblStaff.StaffDAO;
import web.models.tblStaff.StaffDTO;

/**
 *
 * @author DELL
 */
public class ViewAllBlogListServlet extends HttpServlet {

    private final String VIEW_BLOG = "blogDashboard.jsp";
    private final String ERROR = "systemError.html";

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
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String url = VIEW_BLOG;
        try {
            BlogDAO dao = new BlogDAO();
            dao.viewBlogList();
            List<BlogDTO> blog = dao.getBlogList();
            request.setAttribute("BLOG_LIST", blog);
            int allBlog = dao.countAllBlog();
            request.setAttribute("ALL_BLOG", allBlog);
            int activeBlog = dao.countBlogActive();
            request.setAttribute("ACTIVE_BLOG", activeBlog);
            int pendingBlog = dao.countBlogPending();
            request.setAttribute("PENDING_BLOG", pendingBlog);

            BlogDAO blogDAO = new BlogDAO();
            if (session != null) {
                String identityID = (String) session.getAttribute("IDENTITY_ID");
                
                blogDAO.queryBlogbyAuthor(identityID);
                List<BlogDTO> blogForManager = blogDAO.getBlogList();
                request.setAttribute("BLOG_LIST_MANAGER", blogForManager);

            }
        } catch (SQLException | NamingException ex) {
            log("ViewAllBlogListServletError" + ex.getMessage());
            url = ERROR;
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
            out.close();
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

}
