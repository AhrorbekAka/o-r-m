package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import services.DBConnection;

import java.io.IOException;
import java.sql.*;

@WebServlet("/message")
public class MessageService extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String text = request.getParameter("message");

        HttpSession session = request.getSession(false);
        String number = (String) session.getAttribute("upnumber");

        DBConnection connection = new DBConnection();
        connection.insert("message", "text, up_number", String.format("'%s','%s'", text, number));

        String query = ("SELECT role FROM _user_ WHERE phone_number='" + number + "'");
        String role = null;

        try {
            role = get(query);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (role.equals("CUSTOMER")) {
            request.setAttribute("button", true);
            RequestDispatcher rd = request.getRequestDispatcher("customer.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("button", true);
            RequestDispatcher rd = request.getRequestDispatcher("manager.jsp");
            rd.forward(request, response);
        }
    }

    public String get(String query) throws Exception, SQLException {
        ResultSet rs = null;
        try {
            DBConnection db = new DBConnection();
            Connection con = db.connect_data_base();
            Statement statement = con.createStatement();
            rs = statement.executeQuery(query);
            rs.next();
            System.out.println("topilgan id==> " + rs.getString("role"));
        } catch (Exception e) {
            System.out.println("berilgan kishini topa olmadim");
        }
        return rs.getString("role");
    }
}

