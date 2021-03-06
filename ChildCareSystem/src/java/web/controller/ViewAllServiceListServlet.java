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
import web.models.tblService.ServiceDAO;
import web.models.tblService.ServiceDTO;

/**
 *
 * @author DELL
 */
public class ViewAllServiceListServlet extends HttpServlet {

    private final String VIEW_SERVICE = "serviceDashboard.jsp";
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
        HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();
        String url = VIEW_SERVICE;
        try {
            ServiceDAO dao = new ServiceDAO();
            dao.viewServiceList();
            List<ServiceDTO> service = dao.getServiceList();
            request.setAttribute("SERVICE_LIST", service);

            int activeServiceCount = dao.countServiceActive();
            request.setAttribute("ACTIVE_SERVICE", activeServiceCount);

            int allServiceCount = dao.countAllService();
            request.setAttribute("ALL_SERVICE", allServiceCount);
            String topServiceCount = dao.countMostUseService();
            request.setAttribute("POPULAR_SERVICE", topServiceCount);
            int pending = dao.countServiceDeny();
            request.setAttribute("DENY_SERVICE", pending);
            ServiceDAO serviceDAO = new ServiceDAO();

            if (session != null) {
                String identityID = (String) session.getAttribute("IDENTITY_ID");
                serviceDAO.getServicebyStaff(identityID);
                List<ServiceDTO> serviceForManager = serviceDAO.getServiceList();
                request.setAttribute("SERVICE_LIST_MANAGER", serviceForManager);
            }
        } catch (SQLException | NamingException ex) {
            log("ViewAllServiceListServletError" + ex.getMessage());
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
