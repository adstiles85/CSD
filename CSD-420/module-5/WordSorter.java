/*
Name: Andrew Stiles
Course: CSD-420
Assignment: M5 – Word Sorter
Date: 6/29/2025
Description: This program reads words from a text file, removes duplicates,
and displays them in ascending and descending order.
*/

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.TreeSet;
import java.util.Collections;
import java.util.ArrayList;

public class WordSorter {
    public static void main(String[] args) {
        String filename = "collection_of_words.txt";
        TreeSet<String> wordSet = new TreeSet<>();

        try (Scanner fileScanner = new Scanner(new File(filename))) {
            while (fileScanner.hasNext()) {
                String word = fileScanner.next().toLowerCase().replaceAll("[^a-z]", "");
                if (!word.isEmpty()) {
                    wordSet.add(word);
                }
            }

            System.out.println("Non-duplicate words in ascending order:");
            for (String word : wordSet) {
                System.out.println(word);
            }

            System.out.println("\nNon-duplicate words in descending order:");
            ArrayList<String> descending = new ArrayList<>(wordSet);
            Collections.reverse(descending);
            for (String word : descending) {
                System.out.println(word);
            }

        } catch (FileNotFoundException e) {
            System.out.println("File not found: " + filename);
        }
    }
}
