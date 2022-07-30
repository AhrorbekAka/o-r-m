package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.dbCon;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/Managertable")
public class Managertableservice extends HttpServlet {
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

        if (number != "") {
            s = s + "number=" + number;
            t = true;
        }
        if (facilities != "") {
            s = s + ",facilities=" + facilities;
            t = true;
        }
        if (type != "") {
            s = s + ",type=" + type;
            t = true;
        }
        if (special_price != "") {
            s = s + ",special_price=" + special_price;
            t = true;
        }
        if (available != "") {
            s = s + ",available=" + available;
            t = true;
        }

        s = s + " where id=" + id;
        System.out.println("+++++++++++++++ s ni qiymati  ===> " + s);
        if (t) {
            update(s);
        }
        RequestDispatcher rd = request.getRequestDispatcher("manager/tablemenu.jsp");
        rd.forward(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String number = request.getParameter("number");
        String facilities = request.getParameter("facilities");
        String type = request.getParameter("type");
        String special_price = request.getParameter("special_price");
        String available = request.getParameter("available");
        String s = String.format("insert  into _table_ (number,facilities,type,special_price,available) values ('%s','%s','%s','%s','%s')"
                , number, facilities, type, special_price, available);

        System.out.println(s);
        post(s);
        RequestDispatcher rd = request.getRequestDispatcher("manager/tablemenu.jsp");
        rd.forward(request, response);
    }


    public void update(String query) {
        try {
            dbCon db = new dbCon();
            Connection con = db.connect_data_base();
            Statement statement = con.createStatement();

            statement.executeUpdate(query);
            System.out.println("topshiriq bajarildi");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }


    public void post(String query) {
        try {
            dbCon db = new dbCon();
            Connection con = db.connect_data_base();
            Statement statement = con.createStatement();

            statement.executeQuery(query);
            System.out.println(" Qo'shish bajarildi ");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}