package services;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbCon {

    public Connection connect_data_base()
    {
        Connection conn=null;
        try
        { Class.forName("org.postgresql.Driver");
            conn= DriverManager.getConnection("jdbc:postgresql://localhost:5432/orm","postgres","postgres");
            if (conn!=null)
                System.out.println("connection was  established");
            else System.out.println("connection Failed ");}
        catch (Exception e)
        {
            System.out.println(e);
        }
        return conn;
    }

}
