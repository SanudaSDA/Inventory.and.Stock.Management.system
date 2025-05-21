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

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        // Set attributes to pre-fill the form
        request.setAttribute("fullName", user.getFirstName() + " " + user.getLastName());
        request.setAttribute("email", user.getEmail());
        request.setAttribute("phone", user.getPhoneNumber());
        request.setAttribute("gender", user.getGender());

        request.getRequestDispatcher("editProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        // Get updated form values
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");

        // Safer split for full name
        String[] nameParts = fullName.trim().split("\\s+", 2);
        user.setFirstName(nameParts[0]);
        user.setLastName(nameParts.length > 1 ? nameParts[1] : "");

        user.setEmail(email);
        user.setPhoneNumber(phone);
        user.setGender(gender);

        // Save updates to file
        String path = getServletContext().getRealPath("/data/users.txt");

        UserHandle.updateUser(
                user.getUserId(),
                user.getFirstName(),
                user.getLastName(),
                user.getEmail(),
                user.getPhoneNumber(),
                user.getPassword(),
                user.getRole(),
                user.getGender(),
                path
        );

        // Update session and redirect
        session.setAttribute("user", user);
        response.sendRedirect("profile?updated=true");
    }
}