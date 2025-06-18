/*
Name: Andrew Stiles
Course: CSD-420
Assignment: M3 – Remove Duplicates
Description: This program fills an ArrayList with 50 random integers (1–20), then removes duplicates using a generic method.
*/

import java.util.ArrayList;
import java.util.Random;

public class RemoveDuplicatesProgram {

    public static void main(String[] args) {
        ArrayList<Integer> originalList = new ArrayList<>();
        Random rand = new Random();

        // Fill with 50 random integers between 1 and 20
        for (int i = 0; i < 50; i++) {
            originalList.add(rand.nextInt(20) + 1);
        }

        System.out.println("Original List (50 values with duplicates):");
        System.out.println(originalList);

        // Remove the duplicates
        ArrayList<Integer> noDuplicates = removeDuplicates(originalList);

        System.out.println("\nList after removing duplicates:");
        System.out.println(noDuplicates);
    }

    // GENERIC method to remove duplicates
    public static <E> ArrayList<E> removeDuplicates(ArrayList<E> list) {
        ArrayList<E> result = new ArrayList<>();
        for (E element : list) {
            if (!result.contains(element)) {
                result.add(element);
            }
        }
        return result;
    }
}
