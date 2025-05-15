package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Classe singleton sur la source de données
 */
public class DbConnectionManager{
    private static final String URL = "jdbc:postgresql://localhost:5432/FanfaronDB";
    private static final String USER = "fanfaron_user";
    private static final String PASSWORD = "fanfaron_password";
    private static DbConnectionManager instance;// Singleton de DbConnectionManager
    DbConnectionManager(){
        try{
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e){ throw new RuntimeException("Pb de driver", e); }
    }

    public Connection getConnection() throws SQLException{
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static DbConnectionManager getInstance(){
        if (instance == null) {
            synchronized (DbConnectionManager.class){
                if (instance == null) {
                    instance = new DbConnectionManager();
                }
            }
        }
        return instance;
    }
}