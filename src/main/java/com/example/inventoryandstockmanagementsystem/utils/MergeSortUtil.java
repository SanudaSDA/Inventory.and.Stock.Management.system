package com.example.inventoryandstockmanagementsystem.utils;

import com.example.inventoryandstockmanagementsystem.entities.Item;

import java.time.LocalDate;

public class MergeSortUtil {

    public static void sortByExpiryDate(Item[] arr, int left, int right) {
        if (left < right) {
            int mid = (left + right) / 2;
            sortByExpiryDate(arr, left, mid);
            sortByExpiryDate(arr, mid + 1, right);
            merge(arr, left, mid, right);
        }
    }

    private static void merge(Item[] arr, int left, int mid, int right) {
        int n1 = mid - left + 1;
        int n2 = right - mid;

        Item[] L = new Item[n1];
        Item[] R = new Item[n2];

        for (int i = 0; i < n1; i++) L[i] = arr[left + i];
        for (int j = 0; j < n2; j++) R[j] = arr[mid + 1 + j];

        int i = 0, j = 0, k = left;
        while (i < n1 && j < n2) {
            LocalDate d1 = LocalDate.parse(L[i].getExpiryDate());
            LocalDate d2 = LocalDate.parse(R[j].getExpiryDate());

            if (!d1.isAfter(d2)) {
                arr[k++] = L[i++];
            } else {
                arr[k++] = R[j++];
            }
        }

        while (i < n1) arr[k++] = L[i++];
        while (j < n2) arr[k++] = R[j++];
    }
}
