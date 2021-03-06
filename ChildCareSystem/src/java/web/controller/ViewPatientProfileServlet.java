/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.viewModels.Reservation.ReservationHistoryDTO;
import web.models.tblPatient.PatientDAO;
import web.models.tblPatient.PatientDTO;
import web.models.tblReservation.ReservationDAO;
import web.models.tblSystemSetting.SystemSettingDAO;

/**
 *
 * @author nguye
 */
public class ViewPatientProfileServlet extends HttpServlet {

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
        ReservationDAO reservationDAO = new ReservationDAO();
        PatientDAO dao1 = new PatientDAO();
        try {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpSession session = req.getSession();
            String customerID = (String) session.getAttribute("CUSTOMER_ID");
            List<PatientDTO> listPatients = dao1.getAllPatientProfile(customerID);
            List<ReservationHistoryDTO> historyList = reservationDAO.getAllPatientReservation(customerID);
            SystemSettingDAO systemDAO = new SystemSettingDAO();
            int maxPatientProfileAllowed = Integer.parseInt(systemDAO.getSettingByName("Max Patient Profile").getSettingValue());

            if (listPatients.size() >= maxPatientProfileAllowed) {
                request.setAttribute("reachMaxPatient", "S??? h??? s??? b???nh nh??n ???? ?????t t???i ??a m?? h??? th???ng cho ph??p.");
            }
            request.setAttribute("listPatients", listPatients);
            request.setAttribute("historyList", historyList);
        } catch (Exception e) {
            log("ERROR at ViewPatientProfileServlet: " + e.getMessage());
            request.getRequestDispatcher("systemError.html").forward(request, response);

        } finally {
            request.getRequestDispatcher("viewPatientProfile.jsp").forward(request, response);
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
