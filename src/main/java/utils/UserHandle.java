package utils;

import modal.User;
import java.io.IOException;
import java.util.LinkedList;

public class UserHandle {
    private static LinkedList<User> users = new LinkedList<>();
    private static int lastUserId = 0;

    // Generate incremental user IDs
    private static int generateUserId() {
        lastUserId++;
        return lastUserId;
    }

    // Get all users
    public static LinkedList<User> getUsers() {
        return users;
    }

    // Add user and save to file
    public static void addUser(User user, String filePath) throws IOException {
        if (user.getUserId() == -99) {
            user.setUserId(generateUserId());
        }
        users.add(user);
        DataHandle.userDataSaveToFile(users, filePath);
    }

    // Remove a user and save to file
    public static void removeUser(User user, String filePath) throws IOException {
        users.remove(user);
        DataHandle.userDataSaveToFile(users, filePath);
    }

    // Find user by ID
    public static User findUserById(int userId) {
        for (User user : users) {
            if (user.getUserId() == userId) {
                return user;
            }
        }
        System.out.println("User not found");
        return null;
    }

    // Find user by email
    public static User findUserByEmail(String email) {
        for (User user : users) {
            if (user.getEmail().equalsIgnoreCase(email)) {
                return user;
            }
        }
        System.out.println("User not found");
        return null;
    }

    // Update user details and save
    public static void updateUser(int userId, String firstName, String lastName, String email,
                                  String phoneNumber, String password, String role, String gender, String filePath) throws IOException {
        // Always reload fresh data from file
        users = DataHandle.userDataLoadFromFile(filePath);

        User user = null;
        for (User u : users) {
            if (u.getUserId() == userId) {
                user = u;
                break;
            }
        }

        if (user != null) {
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);
            user.setPassword(password);
            user.setRole(role);
            user.setGender(gender);
        }

        DataHandle.userDataSaveToFile(users, filePath);
    }

    // Load users from default file path
    public static void loadFromFile() throws IOException {
        users = DataHandle.userDataLoadFromFile();  // Assumes this uses a default internal path
        if (!users.isEmpty()) {
            lastUserId = users.getLast().getUserId();
        }
        System.out.println("Users loaded from default path");
    }

    // ✅ Load users from a specific file path (used in LoginServlet)
    public static void loadFromFile(String filePath) throws IOException {
        users = DataHandle.userDataLoadFromFile(filePath);  // ✅ Fixed typo
        if (!users.isEmpty()) {
            lastUserId = users.getLast().getUserId();
        }
        System.out.println("Users loaded from: " + filePath);
    }

    // Optionally save to default path
    public static void saveToFile(String filePath) throws IOException {
        DataHandle.userDataSaveToFile(users, filePath);
        System.out.println("Users data " +
                "saved to " + filePath);
    }
}