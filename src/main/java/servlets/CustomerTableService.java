package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import services.DBConnection;

import java.io.IOException;

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

        DBConnection connection = new DBConnection();
        String query = "UPDATE _table_ SET available = false WHERE id = " + action;
        connection.update(query);
        connection.insert("_order_", "table_id, up_number", action + ", " + number);

        response.sendRedirect("answer.jsp");
    }
}