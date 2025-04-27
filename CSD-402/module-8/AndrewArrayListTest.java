/*
Name: Andrew Stiles
Course: CSD-402
Assignment: M8 – ArrayList Max Value
Description: This application takes user-input integers and stores them in an ArrayList until 0 is inputted.
 It then detects and shows the ArrayList's maximum value.
*/

import java.util.ArrayList;
import java.util.Scanner;

public class AndrewArrayListTest {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        ArrayList<Integer> numbers = new ArrayList<>();

        System.out.println("Enter integers (enter 0 to stop):");

        // Read integers from the user
        while (true) {
            try {
                int number = input.nextInt();
                numbers.add(number);
                if (number == 0) {
                    break;
                }
            } catch (Exception e) {
                System.out.println("Invalid input. Please enter an integer.");
                input.next(); // clear invalid input
            }
        }

        // Call the max method and display result
        Integer maxValue = max(numbers);
        System.out.println("The largest value in the list is: " + maxValue);

        input.close();
    }

    // Method to return the maximum value from an ArrayList
    public static Integer max(ArrayList<Integer> list) {
        if (list == null || list.isEmpty()) {
            return 0;
        }

        Integer max = list.get(0);
        for (Integer num : list) {
            if (num > max) {
                max = num;
            }
        }
        return max;
    }
}
