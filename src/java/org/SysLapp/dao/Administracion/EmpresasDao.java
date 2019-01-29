/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.SysLapp.dao.Administracion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import org.SysLapp.util.DBConnection;

/**
 *
 * @author Administrador
 */
public class EmpresasDao {
    private static Connection con;
    private static Statement st;
    private static ResultSet rs;
    
    public static String[][] ConsultarEmpresas(){
        try{
            int x = 0;
            String[][] Empresas;
            con = DBConnection.createConnectionSysLapp();
            st = con.createStatement();
            rs = st.executeQuery("select count(*) from empresas");
            while(rs.next()){
                x = rs.getInt(1);
            }
            Empresas = new String[x][6];
            x = 0;
            rs = st.executeQuery("select * from empresas group by Nit order by Nit asc");
            while(rs.next()){
                for (int i = 0; i < 6; i++) {
                    Empresas[x][i] = rs.getString(i + 1);
                }
                x++;
            }
            con.close();
            return Empresas;
        }
        catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
    
}
