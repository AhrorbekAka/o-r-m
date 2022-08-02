package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import services.DBConnection;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/customermeal")
public class CustomerMealService extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mealId = request.getParameter("action");
        System.out.println("servicega yetib keldi");
        System.out.println(mealId);
        //int ac=Integer.parseInt(action);
        // RequestDispatcher rd=request.getRequestDispatcher("customer/paid.jsp");
        // rd.forward(request,response);
        HttpSession session = request.getSession(false);
        String number = (String) session.getAttribute("upnumber");

        DBConnection connection = new DBConnection();
        String query = "SELECT id FROM _order_ WHERE up_number = '" + number + "' AND paid = false";
        ResultSet resultSet = connection.execute(query);
        String id = null;
        try {
            resultSet.next();
            id = resultSet.getString("id");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        query = String.format("insert  into order_meal (order_id,meal_id) values ('%s','%s')", id, mealId);
        connection.execute(query);

        response.sendRedirect("answer.jsp");
    }
}