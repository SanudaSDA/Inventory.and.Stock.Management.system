package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import modal.User;
import utils.UserHandle;

import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");

        // Check if user already exists
        if (UserHandle.findUserByEmail(email) != null) {
            request.setAttribute("error", "Email already exists.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }

        // Create and populate new user
        User newUser = new User(firstName, lastName, email, phone, password);
        newUser.setGender(gender);
        newUser.setRole("user");

        // Save user to file
        String path = getServletContext().getRealPath("/data/users.txt");
        UserHandle.addUser(newUser, path);

        // Redirect to login with success message
        response.sendRedirect("login.jsp?success=registered");
    }
}

