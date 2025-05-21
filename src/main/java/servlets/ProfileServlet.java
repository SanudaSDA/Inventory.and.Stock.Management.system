package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modal.User;

import java.io.IOException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Prevent creating a new session if none exists
        HttpSession session = request.getSession(false);

        // Redirect to login if no user is in session
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User currentUser = (User) session.getAttribute("user");

        // Set user details as request attributes
        request.setAttribute("fullName", currentUser.getFirstName() + " " + currentUser.getLastName());
        request.setAttribute("email", currentUser.getEmail());
        request.setAttribute("phone", currentUser.getPhoneNumber());
        request.setAttribute("role", currentUser.getRole());
        request.setAttribute("gender", currentUser.getGender());

        // Forward to JSP to display profile
        request.getRequestDispatcher("userProfile.jsp").forward(request, response);
    }
}