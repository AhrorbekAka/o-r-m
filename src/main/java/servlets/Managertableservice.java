package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.DBCon;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/managertable")
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
        if (t) {
            update(s);
        }
        response.sendRedirect("Man_tablemenu.jsp");
//        RequestDispatcher rd = request.getRequestDispatcher("Man_tablemenu.jsp");
//        rd.forward(request, response);

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
        RequestDispatcher rd = request.getRequestDispatcher("Man_tablemenu.jsp");
        rd.forward(request, response);
    }


    public void update(String query) {
        try {
            DBCon db = new DBCon();
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
            DBCon db = new DBCon();
            Connection con = db.connect_data_base();
            Statement statement = con.createStatement();

            statement.executeQuery(query);
            System.out.println(" Qo'shish bajarildi ");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}