package br.com.infox.dal;
import java.sql.*;
/**
 *
 * @author gabriel
 */
public class ModuloConexao {
    
    
    public static Connection conector(){
        Connection conexao = null;
        
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/db_infox";
        String user = "root";
        String password = "";
        
        try{
            Class.forName(driver);
            conexao = DriverManager.getConnection(url,user,password);
            return conexao;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }
    }
    
    
}
