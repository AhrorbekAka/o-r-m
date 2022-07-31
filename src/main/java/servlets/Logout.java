package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/Logout")

public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        HttpSession session=request.getSession();
        session.removeAttribute("upnumber");
        session.invalidate();

//        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//        rd.forward(request, response);
       response.sendRedirect("index.jsp");





    }








}
