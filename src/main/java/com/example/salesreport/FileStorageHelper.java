package com.example.salesreport;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileStorageHelper {
    private static final String FILE_PATH = "transactions.dat";

    public static List<Transaction> loadTransactions() {
        try (ObjectInputStream ois = new ObjectInputStream(
                new FileInputStream(FILE_PATH))) {
            return (List<Transaction>) ois.readObject();
        }
        catch (FileNotFoundException e) {
            return new ArrayList<>(); // Return empty list if file doesn't exist
        }
        catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public static void saveTransactions(List<Transaction> transactions) {
        try (ObjectOutputStream oos = new ObjectOutputStream(
                new FileOutputStream(FILE_PATH))) {
            oos.writeObject(transactions);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}