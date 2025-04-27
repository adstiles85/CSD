/*
Name: Andrew Stiles
Course: CSD-402
Assignment: M9 – Program 1 (ArrayList String Handling)
Description: This software creates an ArrayList of Strings, prints the elements,
and allows users to choose them by index. It also handles exceptions for invalid input.
*/

import java.util.ArrayList;
import java.util.Scanner;

public class AndrewStringArrayList {

    public static void main(String[] args) {
        ArrayList<String> items = new ArrayList<>();
        Scanner input = new Scanner(System.in);

        // Populate the ArrayList
        items.add("Apple");
        items.add("Banana");
        items.add("Cherry");
        items.add("Dragonfruit");
        items.add("Elderberry");
        items.add("Fig");
        items.add("Grapes");
        items.add("Honeydew");
        items.add("Kiwi");
        items.add("Lemon");
        items.add("Orange");

        // Display the list
        System.out.println("ArrayList contents:");
        for (String item : items) {
            System.out.println(item);
        }

        // Ask the user
        System.out.print("\nEnter the index of the element you would like to see again (0-10): ");
        String userInput = input.next();

        try {
            int index = Integer.parseInt(userInput); // Manual unboxing: String -> int
            System.out.println("You selected: " + items.get(index));
        } catch (Exception e) {
            System.out.println("Exception thrown: Out of Bounds");
        }

        input.close();
    }
}
