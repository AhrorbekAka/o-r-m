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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/customermeal")
public class CustomerMealService extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mealid = request.getParameter("action");
        System.out.println("servicega yetib keldi");
        System.out.println(mealid);
         //int ac=Integer.parseInt(action);
        // RequestDispatcher rd=request.getRequestDispatcher("customer/paid.jsp");
        // rd.forward(request,response);
        HttpSession session = request.getSession(false);
        String number = (String) session.getAttribute("upnumber");



        String query="Select id from _order_ where (up_number='"+number+"') and (paid=false)" ;
 String id=null;
        try {
             id=get(query);
        } catch (Exception e) {
            e.printStackTrace();

        }

          query=String.format("insert  into order_meal (order_id,meal_id) values ('%s','%s')",id,mealid);
        insert(query);

        response.sendRedirect("Answer.jsp");

    }



    public String get (String query) throws Exception,SQLException {
        ResultSet rs=null;
    try {
        DBCon db = new DBCon();
        Connection con = db.connect_data_base();
        Statement statement = con.createStatement();
        rs=statement.executeQuery(query);
        rs.next();
        System.out.println("topilgan id==> "+rs.getString("id"));
          }
    catch (Exception e)
    {
        System.out.println("berilgan kishini topa olmadim");
    }

    return rs.getString("id");
    }

               public void insert( String query)
    {
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