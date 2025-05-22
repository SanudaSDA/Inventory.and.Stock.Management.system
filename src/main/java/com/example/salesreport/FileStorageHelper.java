package com.example.salesreport;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileStorageHelper {
    private static final String FILE_PATH = "transactions.dat";

    public static List<Transaction> loadTransactions() {
        //deserialization(turn byte strem back to java objects)after reading bytes from the file
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(FILE_PATH))) {
            return (List<Transaction>) ois.readObject();//ois.readObject() reads the object and casts it back to List<Transaction>
        }
        catch (FileNotFoundException e) {
            return new ArrayList<>(); // Return empty list if file doesn't exist
        }
        catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public static void saveTransactions(List<Transaction> transactions) {//accepts a parameter: a List<Transaction> named transactions that i want to save to a file.
        //creates a stream to write raw bytes to the file showed by FILE_PATH.
        //then wraps the file output stream, allowing Java objects to be written to the file ( serialization).
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(FILE_PATH))) {
            // serializes(convert to byte) the transactions list and writes it to the file.
            oos.writeObject(transactions);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}