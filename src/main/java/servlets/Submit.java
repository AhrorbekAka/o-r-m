package servlets;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.DBConnection;

import java.io.IOException;

@WebServlet("/register")
public class Submit extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String firstname = request.getParameter("firstName");
        String lastname = request.getParameter("lastName");
        String age = request.getParameter("age");

        String gender = request.getParameter("inlineRadioOptions");
        boolean gen = gender.equals("male");

        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        DBConnection connection = new DBConnection();
        connection.insert("_user_",
                "first_name,last_name,age,male,role,e_mail,phone_number,password",
                String.format("'%s','%s','%s','%s','CUSTOMER','%s','%s','%s'", firstname, lastname, age, gen, email, phoneNumber, password)
        );

        response.sendRedirect("login.jsp");
    }
}
