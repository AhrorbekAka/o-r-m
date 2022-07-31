package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.DBCon;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/register")
public class Submit  extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstname = request.getParameter("firstName");
        String lastname = request.getParameter("lastName");
        String age = request.getParameter("age");
        String gender= request.getParameter("inlineRadioOptions");
       boolean gen;
        if (gender=="male") gen=true; else gen=false;
                String email = request.getParameter("email");
        String  phoneNumber = request.getParameter("phoneNumber");
        String  password = request.getParameter("password");
        String s = String.format("insert  into _user_ (first_name,last_name,age,male,role,e_mail,phone_number,password) values ('%s','%s','%s','%s','CUSTOMER','%s','%s','%s')"
                , firstname, lastname, age, gen, email,phoneNumber,password);

                      post(s);
           response.sendRedirect("login.jsp");
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
