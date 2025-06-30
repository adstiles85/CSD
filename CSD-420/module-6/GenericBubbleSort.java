/*
Name: Andrew Stiles
Course: CSD-420
Assignment: M6 – Generic Bubble Sort
Date: 6/29/2025
Description: This program includes two generic bubble sort methods — one using Comparable,
and the other using a Comparator — and demonstrates their use with test arrays.
*/

import java.util.Comparator;

public class GenericBubbleSort {

    // 1. Bubble Sort using Comparable interface
    public static <E extends Comparable<E>> void bubbleSort(E[] list) {
        for (int i = 0; i < list.length - 1; i++) {
            for (int j = 0; j < list.length - 1 - i; j++) {
                if (list[j].compareTo(list[j + 1]) > 0) {
                    E temp = list[j];
                    list[j] = list[j + 1];
                    list[j + 1] = temp;
                }
            }
        }
    }

    // 2. Bubble Sort using Comparator interface
    public static <E> void bubbleSort(E[] list, Comparator<? super E> comparator) {
        for (int i = 0; i < list.length - 1; i++) {
            for (int j = 0; j < list.length - 1 - i; j++) {
                if (comparator.compare(list[j], list[j + 1]) > 0) {
                    E temp = list[j];
                    list[j] = list[j + 1];
                    list[j + 1] = temp;
                }
            }
        }
    }

    // Utility method to print arrays
    public static <E> void printArray(E[] array) {
        System.out.print("{ ");
        for (E item : array) {
            System.out.print(item + " ");
        }
        System.out.println("}");
    }

    // Main method for testing
    public static void main(String[] args) {
        // Test 1: Integers with Comparable
        Integer[] numbers = {5, 3, 9, 1, 6};
        System.out.println("Original Integer array:");
        printArray(numbers);

        bubbleSort(numbers);
        System.out.println("Sorted using Comparable:");
        printArray(numbers);

        // Test 2: Strings with Comparator (reverse order)
        String[] words = {"banana", "apple", "grape", "orange", "kiwi"};
        System.out.println("\nOriginal String array:");
        printArray(words);

        Comparator<String> reverseAlphabetical = (a, b) -> b.compareTo(a); // Lambda expression
        bubbleSort(words, reverseAlphabetical);
        System.out.println("Sorted using Comparator (descending):");
        printArray(words);
    }
}
