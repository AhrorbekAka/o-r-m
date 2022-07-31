package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import services.DBCon;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/customertable")
public class CustomerTableService extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");


        // RequestDispatcher rd=request.getRequestDispatcher("customer/paid.jsp");
        // rd.forward(request,response);

        HttpSession session = request.getSession(false);
        String number = (String) session.getAttribute("upnumber");




        System.out.println("mana o'zgaruvchini oldim======>  " + action);


        String query="update _table_  set available=false where id="+action;
        update(query);
        query=String.format("insert  into _order_ (table_id,up_number) values ('%s','%s')",action,number);
                insert(query);

        response.sendRedirect("Answer.jsp");
    }

    public void update( String query) {

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

    public void insert( String query) {

        try {
            DBCon db = new DBCon();
            Connection con = db.connect_data_base();
            Statement statement = con.createStatement();


            statement.executeQuery(query);
            System.out.println("topshiriq bajarildi");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }



}