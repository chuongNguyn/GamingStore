/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rft8.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author vnxa0
 */
public class DBConnection {
      public static Connection getConnection() {
        Connection conn = null;
        String url="jdbc:sqlserver://localhost:1433;databaseName=swpdb";
        String user = "sa";
        String password="admin";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = (Connection) DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    public static void main(String[] args) {
        if(getConnection() != null) System.out.println("ok");
        else System.out.println("fail");
    }
}
