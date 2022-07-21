package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/paid")
public class Paid extends HttpServlet
{
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  String tableorder=request.getParameter("")


}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }




}
