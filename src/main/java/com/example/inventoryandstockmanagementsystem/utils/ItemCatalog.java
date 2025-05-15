package com.example.inventoryandstockmanagementsystem.utils;

import com.example.inventoryandstockmanagementsystem.entities.Item;
import java.io.*;
import java.util.Stack;

public class ItemCatalog {

    private static final String FILE_PATH = "C:/Users/User/Desktop/neeeeeew/data/Item.txt";


    public Stack<Item> loadFromFile() {
        Stack<Item> items = new Stack<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                items.push(Item.fromString(line));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return items;
    }


    public void saveItem(Item item) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(item.toString());
            writer.newLine();
        }
    }


    private void saveAllItems(Stack<Item> items) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Item item : items) {
                writer.write(item.toString());
                writer.newLine();
            }
        }
    }


    public Stack<Item> getAllItems() {
        return loadFromFile();
    }


    public void deleteItem(String itemId) throws IOException {
        Stack<Item> items = getAllItems();
        items.removeIf(item -> item.getItemId().equals(itemId));  // Works since Stack extends Vector
        saveAllItems(items);
    }


    public void editItem(Item updatedItem) throws IOException {
        Stack<Item> items = getAllItems();
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getItemId().equals(updatedItem.getItemId())) {
                items.set(i, updatedItem);
                break;
            }
        }
        saveAllItems(items);
    }


    public Item findItemById(String itemId) {
        Stack<Item> items = getAllItems();
        for (Item item : items) {
            if (item.getItemId().equals(itemId)) {
                return item;
            }
        }
        return null;
    }
}
