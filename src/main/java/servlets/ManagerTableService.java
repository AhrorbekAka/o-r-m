package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.DBConnection;

import java.io.IOException;
import java.io.Serial;

@WebServlet("/managertable")
public class ManagerTableService extends HttpServlet {
	@Serial
    private static final long serialVersionUID = 1L;

    @Override// we use it for updating
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("action");
        String number = request.getParameter("number");
        String facilities = request.getParameter("facilities");
        String type = request.getParameter("type");
        String special_price = request.getParameter("special_price");
        String available = request.getParameter("available");
        String s = "update _table_ set ";
        boolean t = false;
        String v="";
        if (number !="") {
            s = s +v+ "number=" + number;
            t = true;
            v=",";
        }
        if (facilities !="") {
            s = s +v+ "facilities='" + facilities+"'";
            t = true;
            v=",";
        }
        if (type != "") {
            s = s + v+"type='" + type+"'";
            t = true; v=",";
        }
        if (special_price !="") {
            s = s +v+ "special_price=" + special_price;
            t = true; v=",";
        }
        if (available !="") {
            s = s +v+ "available=" + available;
            t = true; v=",";
        }

        s = s + " where id=" + id;
        System.out.println("+++++++++++++++ s ni qiymati  ===> " + s);
        DBConnection connection = new DBConnection();
        if (t) {
            connection.update(s);
        }
        response.sendRedirect("man_table_menu.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String number = request.getParameter("number");
        String facilities = request.getParameter("facilities");
        String type = request.getParameter("type");
        String special_price = request.getParameter("special_price");
        String available = request.getParameter("available");

        DBConnection connection = new DBConnection();
        connection.insert("_table_",
                "number,facilities,type,special_price,available",
                String.format("'%s','%s','%s','%s','%s'", number, facilities, type, special_price, available));
        RequestDispatcher rd = request.getRequestDispatcher("man_table_menu.jsp");
        rd.forward(request, response);
    }
}