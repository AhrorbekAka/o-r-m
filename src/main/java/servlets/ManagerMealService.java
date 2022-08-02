package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.DBConnection;

import java.io.IOException;

@WebServlet("/ManagerMeal")
public class ManagerMealService extends HttpServlet {

    @Override// it is used for updating
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("action");

        String name = request.getParameter("name");
        System.out.println("name0000000  " + name);
        String price = request.getParameter("price");
        String type = request.getParameter("type");
        String preparation_time = request.getParameter("preparation_time");
        String available = request.getParameter("available");
        String description = request.getParameter("description");
        boolean t = false;
        String s = "update meal set ";
        String v = "";
        if (name != "") {
            s = s + "name='" + name + "'";
            t = true;
            v = ",";
        }
        if (price != "") {
            s = s + v + "price=" + price;
            t = true;
            v = ",";
        }
        if (type != "") {
            s = s + v + "type='" + type + "'";
            t = true;
            v = ",";
        }
        if (preparation_time != "") {
            s = s + v + "preparation_time='" + preparation_time + "'";
            t = true;
            v = ",";
        }
        if (available != "") {
            s = s + v + "available=" + available;
            t = true;
            v = ",";
        }
        if (description != "") {
            s = s + v + "description='" + description + "'";
            t = true;
            v = ",";
        }

        s = s + " where id=" + id;
        System.out.println(s);
        DBConnection connection = new DBConnection();
        if (t) {
            connection.update(s);
        }
        RequestDispatcher rd = request.getRequestDispatcher("man_meal_menu.jsp");
        rd.forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String type = request.getParameter("type");
        String preparation_time = request.getParameter("preparation_time");
        String available = request.getParameter("available");
        String description = request.getParameter("description");

        DBConnection connection = new DBConnection();
        connection.insert("meal",
                "name,price,type,preparation_time,available,description",
                String.format("'%s','%s','%s','%s','%s','%s'", name, price, type, preparation_time, available, description)
        );

        RequestDispatcher rd = request.getRequestDispatcher("man_meal_menu.jsp");
        rd.forward(request, response);
    }
}
