package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import modal.User;
import utils.UserHandle;

import java.io.IOException;

@WebServlet("/deleteAccount")
public class DeleteAccountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        // File path to user data
        String path = getServletContext().getRealPath("/data/users.txt");

        // Remove user from file
        UserHandle.loadFromFile(path); // Ensure latest data is loaded
        UserHandle.removeUser(user, path);

        // Clear session
        session.invalidate();

        // Redirect to login page or home
        response.sendRedirect("login.jsp");
    }
}