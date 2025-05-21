package utils;

import modal.User;
import java.io.*;
import java.util.LinkedList;

public class DataHandle {

    private static final String USER_FILE = "src/main/webapp/data/users.txt";

    // ✅ Save user list to a specified file path
    public static void userDataSaveToFile(LinkedList<User> users, String path) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(path))) {
            for (User u : users) {
                writer.write(u.userToString());
                writer.newLine();
            }
        }
    }

    // ✅ Load user list from default path
    public static LinkedList<User> userDataLoadFromFile() throws IOException {
        return userDataLoadFromFile(USER_FILE); // Reuse the overload below
    }

    // ✅ Load user list from a custom file path
    public static LinkedList<User> userDataLoadFromFile(String path) throws IOException {
        LinkedList<User> users = new LinkedList<>();
        File file = new File(path);

        if (!file.exists()) return users;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                User user = User.stringToUser(line);
                if (user != null) {
                    users.add(user);
                }
            }
        }

        System.out.println("Users loaded from: " + path);
        return users;
    }
}