package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modal.User;
import utils.UserHandle;

import java.io.IOException;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    public void init() {
        try {
            UserHandle.loadFromFile();
            System.out.println("Users loaded");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String path = getServletContext().getRealPath("/data/users.txt");

        if (action.equals("add")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phoneNumber");
            String password = request.getParameter("editPassword");
            String role = request.getParameter("role");
            String gender = request.getParameter("gender");

            User newUser = new User(firstName, lastName, email, phone, password);
            newUser.setRole(role);
            newUser.setGender(gender);

            UserHandle.addUser(newUser, path);

            response.sendRedirect(request.getContextPath() + "/admin/ManageUsers.jsp");
        }

        if (action.equals("update")) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phoneNumber");
            String password = request.getParameter("editPassword");
            String role = request.getParameter("role");
            String gender = request.getParameter("gender");

            UserHandle.updateUser(userId, firstName, lastName, email, phone, password, role, gender, path);

            System.out.println(UserHandle.findUserById(userId).getFirstName() + " " + UserHandle.findUserById(userId).getLastName() + " Data Was Updated");

            if (role.equals("admin")) {
                response.sendRedirect(request.getContextPath() + "/admin/ManageUsers.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/Profile.jsp");
            }
        }

        if (action.equals("delete")) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String role = request.getParameter("role");

            UserHandle.removeUser(UserHandle.findUserById(userId), path);

            if (role.equals("admin")) {
                response.sendRedirect(request.getContextPath() + "/admin/ManageUsers.jsp");
            } else {
                response.sendRedirect(request.getContextPath());
            }
        }
    }
}