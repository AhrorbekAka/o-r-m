package servlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import services.AuthService;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String phoneNumber = request.getParameter("phoneNumber");
		String password = request.getParameter("password");

		System.out.println("mana hammasi "+phoneNumber);

		HttpSession session=request.getSession();
		response.setContentType("text/html");

		ServletContext sc = this.getServletContext();
		RequestDispatcher rd;


		String userRole = new AuthService().login(phoneNumber, password);
		switch (userRole) {
			case "MANAGER":

				rd = sc.getRequestDispatcher("/manager.jsp");


				session.setAttribute("upnumber", phoneNumber);

				break;
			case "STAFF":
				rd = sc.getRequestDispatcher("/staff.jsp");


				session.setAttribute("upnumber",phoneNumber);

				break;
			case "CUSTOMER":
				rd = sc.getRequestDispatcher("/customer.jsp");

				session.setAttribute("upnumber",phoneNumber);
				break;
			default:
				rd = sc.getRequestDispatcher("/login.jsp");
		}
		rd.forward(request, response);
	}

}
