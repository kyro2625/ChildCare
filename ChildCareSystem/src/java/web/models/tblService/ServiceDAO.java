/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblService;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import web.utils.DBHelpers;

/**
 *
 * @author HOANGKHOI
 */
public class ServiceDAO implements Serializable {
    public boolean AddNewService(ServiceDTO serviceDTO) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        
        try {
            //1. Connect Db;
            con =  DBHelpers.makeConnection();
            //2. Create query string
            String query = "INSERT INTO "
                    + "tblService (ServiceName, SpecialtyID, Thumbnail, Description, Price, SalePrice, StatusID, CreatedDate, CreatedPersonID) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            //3 Create statement and assign value
            stm = con.prepareStatement(query);
            stm.setString(1, serviceDTO.getServiceName());
            stm.setString(2, serviceDTO.getSpecialtyId());
            stm.setString(3, serviceDTO.getThumbnail());
            stm.setString(4, serviceDTO.getDescription());
            stm.setDouble(5, serviceDTO.getPrice());
            stm.setDouble(6, serviceDTO.getSalePrice());
            stm.setString(7, serviceDTO.getStatusId());
            stm.setString(8, serviceDTO.getCreatedDate());
            stm.setString(9, serviceDTO.getCreatePersonId());
            
            //4 Execute query
            int row = stm.executeUpdate();
            if (row > 0) {
                return true;
            }            
        } finally {
            if (stm != null) {
                stm.close();
            }
            
            if (con != null) {
                con.close();
            }
        }
        return false;     
    }
    public List<ServiceDTO> getTop3ServiceList() throws SQLException {
        List<ServiceDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT TOP(3) ServiceName,Thumbnail,CreatedDate"
                        + " FROM tblService ORDER BY CreatedDate DESC ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String serviceName = rs.getString("ServiceName");
                    String thumbnail = rs.getString("Thumbnail");
                    String createdDate = rs.getString("CreatedDate");
                    ServiceDTO dto = new ServiceDTO(serviceName, thumbnail, createdDate);
                    result.add(dto);
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
}