/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.SysLapp.dao.Inicio;

/**
 *
 * @author Administrador
 */
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.SysLapp.bean.LoginBean;
import org.SysLapp.util.DBConnection;
 
    public class LoginDao {
        
        public static Connection con;
        public static Statement st;
        public static ResultSet rs; 
        public static String User;
        
        public String authenticateUser(LoginBean loginBean){
            String Usuario = loginBean.getUserName(); //Keeping user entered values in temporary variables.
            String Password = loginBean.getPassword();
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            String UsuarioDB = "", PasswordDB = "";
            try{
                con = DBConnection.createConnectionSysLapp(); //establishing connection
                st = con.createStatement(); //Statement is used to write queries. Read more about it.
                rs = st.executeQuery("select Usuario, Password from usuarios"); //Here table name is users and userName,password are columns. fetching all the records and storing in a resultSet.
                while(rs.next()){
                    UsuarioDB = rs.getString("Usuario"); //fetch the values present in database
                    PasswordDB = rs.getString("Password");
                    if(Usuario.equals(UsuarioDB) && Password.equals(PasswordDB)){
                        User = Usuario;
                        return "SUCCESS"; ////If the user entered values are already present in database, which means user has already registered so I will return SUCCESS message.
                    }
                    else if(Usuario.equals(UsuarioDB) && !Password.equals(PasswordDB)){
                        return "Contraseña incorrecta";
                    }
                    else if(!Usuario.equals(UsuarioDB) && Password.equals(PasswordDB)){
                        return "Usuario incorrecto";
                    }
                }
                con.close();
            }
            catch(SQLException e){
                e.printStackTrace();
            }
            return "Usuario y contraseña incorrectas"; // Just returning appropriate message otherwise
        }
        
        
        public String[] Privilegio(){
            try{
                String Priv[] = new String[2];
                con = DBConnection.createConnectionSysLapp();
                st = con.createStatement();
                rs = st.executeQuery("select privilegios.Nombre, usuarios.Estado from privilegios, usuarios where usuarios.Usuario = '" + User + "' and usuarios.IdPrivilegio = privilegios.Id");
                while(rs.next()){
                    Priv[0] = rs.getString(1);
                    Priv[1] = rs.getString(2);
                }
                con.close();
                return Priv;
            }
            catch(Exception ex){
                ex.printStackTrace();
                return null;
            }
        }
        
        public String Privilegio(int index){
            try{
                String Priv[] = Privilegio();
                return Priv[index];
            }
            catch(Exception ex){
                ex.printStackTrace();
                return null;
            }
        }
    }
