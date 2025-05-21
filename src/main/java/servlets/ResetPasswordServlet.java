package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modal.User;
import utils.UserHandle;

import java.io.IOException;

@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String current = request.getParameter("currentPassword");
        String newPass = request.getParameter("newPassword");
        String confirm = request.getParameter("confirmPassword");

        // Validate current password
        if (!user.getPassword().equals(current)) {
            request.setAttribute("error", "Current password incorrect.");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            return;
        }

        // Validate new passwords match
        if (!newPass.equals(confirm)) {
            request.setAttribute("error", "New passwords do not match.");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            return;
        }

        // Update password
        user.setPassword(newPass);

        String path = getServletContext().getRealPath("/data/users.txt");
        UserHandle.updateUser(
                user.getUserId(),
                user.getFirstName(),
                user.getLastName(),
                user.getEmail(),
                user.getPhoneNumber(),
                newPass,
                user.getRole(),
                user.getGender(),
                path
        );

        session.setAttribute("user", user);
        response.sendRedirect("profile");
    }
}