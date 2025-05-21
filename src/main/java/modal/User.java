
package modal;

public class User {
    private int userId;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private String password;
    private String role;
    private String gender;

    // Constructor for registration (no ID or role initially)
    public User(String firstName, String lastName, String email, String phoneNumber, String password) {
        this.userId = -99; // temporary ID until assigned
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.role = "user"; // default role
    }

    // Full constructor for loading from file
    public User(int userId, String firstName, String lastName, String email,
                String phoneNumber, String password, String role, String gender) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.role = role;
        this.gender = gender;
    }

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    // Convert User object to a string line for file
    public String userToString() {
        return userId + "," + firstName + "," + lastName + "," + email + "," +
                phoneNumber + "," + password + "," + role + "," + gender;
    }

    // Convert a string line to a User object
    public static User stringToUser(String line) {
        String[] parts = line.split(",");
        if (parts.length == 8) {
            int id = Integer.parseInt(parts[0]);
            return new User(id, parts[1], parts[2], parts[3], parts[4], parts[5], parts[6], parts[7]);
        } else {
            System.out.println("Invalid user string format: " + line);
            return null;
        }
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        User other = (User) obj;
        return this.getUserId() == other.getUserId();  // Compare by userId
    }

    @Override
    public int hashCode() {
        return Integer.hashCode(userId);
    }
}