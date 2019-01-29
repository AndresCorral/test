/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.SysLapp.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Administrador
 */
public class DBConnection {
        
    public static Connection createConnectionSysLapp(){
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/SysLapp"; //MySQL URL and followed by the database name
        String username = "root"; //MySQL username
        String password = "ELEMI4029"; //MySQL password
        try{
            try{
                Class.forName("com.mysql.jdbc.Driver"); //loading mysql driver 
            } 
            catch (ClassNotFoundException e){
                e.printStackTrace();
            }   
            con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
        } 
        catch (Exception e){
            e.printStackTrace();
        }
        return con; 
    }
}
