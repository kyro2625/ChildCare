/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author HOANGKHOI
 */
public class DBHelpers implements Serializable{
    public static Connection makeConnection() throws NamingException, SQLException {
        Context currentContext = new InitialContext();
        Context tomcatContext = (Context)currentContext.lookup("java:comp/env");
        DataSource ds = (DataSource) tomcatContext.lookup("SWP391");
        Connection con = ds.getConnection();
        return con;
    }
}
