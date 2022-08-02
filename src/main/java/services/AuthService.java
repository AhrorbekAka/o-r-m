package services;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AuthService {
    public String login(String phoneNumber, String password) {
        DBConnection dbConnection = new DBConnection();
        ResultSet result = dbConnection.execute("SELECT * FROM _user_ WHERE phone_number = '" + phoneNumber + "' AND password = '" + password + "';");
        try {
            if (result.next())
                return result.getString("role");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "";
    }
}
