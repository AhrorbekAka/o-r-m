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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/paid")
public class Paid extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tableOrder = request.getParameter("table");
        String mealOrder = request.getParameter("meal");

        if (tableOrder != null) {
            request.setAttribute("table_id", tableOrder);

            RequestDispatcher rd = request.getRequestDispatcher("tablepaid.jsp");
            rd.forward(request, response);
        } else {

            HttpSession session = request.getSession(false);
            String number = (String) session.getAttribute("upnumber");
            String query = "select id from _order_ where (up_number='" + number + "')and (paid=false)";
            System.out.println("foydalanuvchi" + number);
            String s = null;
            try {
                s = get(query);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (s != null) {
                request.setAttribute("meal_id", mealOrder);

                RequestDispatcher rd = request.getRequestDispatcher("mealpaid.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("rule.jsp");
                rd.forward(request, response);
            }
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
            System.out.println("topilgan id==> " + rs.getString("id"));
        } catch (Exception e) {
            System.out.println("berilgan kishini topa olmadim");
        }

        return rs.getString("id");
    }
}
