/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Koneksi;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
/**
 *

 */
public class Koneksi {
    public static Connection koneksi;
    public Statement st;
    
    public static Connection getconnetion(){
        if(koneksi==null){
            try{
                String server="jdbc:mysql://localhost:3306/penilaian_karyawan";
                String user="root";
                String password="";
                Class.forName("com.mysql.jdbc.Driver");
                koneksi=DriverManager.getConnection(server,user,password);
            }catch(Exception x){
                JOptionPane.showMessageDialog(null,"Koneksi Gagal, Pesan Error \n"+x);
            }
        }
        return koneksi;
    }
    
    public void koneksi(){
        try{
            getconnetion();
            st=koneksi.createStatement();
        }catch(Exception x){
            JOptionPane.showMessageDialog(null,"Koneksi Ambil Gagal, Pesan error \n"+x);
        }
    }
    
    public void tutupKoneksi(ResultSet rs){
        try{
            if(rs!=null){
                rs.close();
            }
            st.close();
            koneksi.close();
        }catch(Exception x){
            JOptionPane.showMessageDialog(null,"Tutup Koneksi Gagal, Pesan Error \n"+x);
        }
    } 
    
    public ResultSet ambilData(String sql){
         ResultSet rs=null;
         try{
            koneksi();
            rs=st.executeQuery(sql);
         }catch(Exception x){
             JOptionPane.showMessageDialog(null,"Ambil Data Gagal, Pesan Error : \n"+x);
         }
         return rs;
    }
    
    public void simpanData(String sql){
        try{
            koneksi();
            st.executeUpdate(sql);
        }catch(Exception x){
            System.out.print(x);
        }
    }

    public PreparedStatement prepareStatement(String sql) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
