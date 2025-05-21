package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import modal.User;
import utils.UserHandle;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email").trim().toLowerCase();
        String password = request.getParameter("password").trim();

        // ✅ Ensure users are loaded from file before checking login
        if (UserHandle.getUsers().isEmpty()) {
            String path = getServletContext().getRealPath("/data/users.txt");
            UserHandle.loadFromFile(path);  // Make sure this version of loadFromFile accepts a path
        }

        User user = UserHandle.findUserByEmail(email);

        if (user == null || !user.getPassword().equals(password)) {
            request.setAttribute("error", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            System.out.println("User logged in: " + user.getEmail());

            if (user.getRole().equalsIgnoreCase("admin")) {
                response.sendRedirect("admin/AdminDashboard.jsp");
            } else {
                response.sendRedirect("user-interface.jsp");
            }
        }
    }
}