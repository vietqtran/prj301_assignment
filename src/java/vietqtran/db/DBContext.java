/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vietqtran.db;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class DBContext {

    protected Connection connection;

    public DBContext() {
	try {
	    String url = "jdbc:sqlserver://localhost:1433;databaseName=PRJ301_Assignment";
	    String username = "sa";
	    String password = "123456";
	    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    connection = DriverManager.getConnection(url, username, password);
	} catch (ClassNotFoundException | SQLException ex) {
	    System.out.println(ex);
	}
    }

    public static void main(String[] args) {
	try {
	    System.out.println(new DBContext().connection);
	} catch (Exception e) {
	}
    }
}
