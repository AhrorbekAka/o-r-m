package servlets;

import entities.UserRole;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import services.AuthService;

import java.io.IOException;
import java.io.Serial;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Serial
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String phoneNumber = request.getParameter("phoneNumber");
		String password = request.getParameter("password");

		HttpSession session=request.getSession();
		response.setContentType("text/html");

		String userRole = new AuthService().login(phoneNumber, password);
		String path;
		session.setAttribute("upnumber", phoneNumber);

		switch (userRole) {
			case "MANAGER" -> path = "manager.jsp";
			case "STAFF" -> path = "staff.jsp";
			case "CUSTOMER" -> path = "customer.jsp";
			default -> {
				path = "login.jsp";
				session.removeAttribute("upnumber");
				session.invalidate();
			}
		}

		response.sendRedirect(path);
	}
}
