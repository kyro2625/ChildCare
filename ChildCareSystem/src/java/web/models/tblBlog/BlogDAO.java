/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblBlog;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import web.controller.ViewBlogServlet;
import web.utils.DBHelpers;

/**
 *
 * @author DELL
 */
public class BlogDAO implements Serializable {

    public boolean createBlog(String title, String authorID, String description, String categoryID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "Insert into "
                        + "tblBlog (Thumbnail, Title, AuthorID, Description, CategoryID, StatusID) "
                        + "Values(?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, "test");
                stm.setString(2, title);
                stm.setString(3, authorID);
                stm.setString(4, description);
                stm.setString(5, categoryID);
                stm.setString(6, "1");
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
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
    private List<BlogDTO> blogList;
    public List<BlogDTO> getBlogList() {
        return blogList;
    }

    public void viewBlogList() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            //if (con != null) {
                String sql = "Select BlogID, Thumbnail, Title, AuthorID, Description, CategoryID, StatusID "
                        + "From tblBlog";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String blogID = rs.getString("BlogID");
                    String thumbnail = rs.getString("Thumbnail");
                    String title = rs.getString("Title");
                    String authorID = rs.getString("AuthorID");
                    String description = rs.getString("Description");
                    String categoryID = rs.getString("CategoryID");
                    String statusID = rs.getString("StatusID");
                    BlogDTO dto = new BlogDTO(blogID, thumbnail, title, authorID, description, categoryID, statusID);
                    if (this.blogList == null) {
                        this.blogList = new ArrayList<>();
                    }
                    this.blogList.add(dto);
                }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
}