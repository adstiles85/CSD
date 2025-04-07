/*
Name: Andrew Stiles
Course: CSD-402
Assignment: Nested Loops Pattern
Description: This program uses nested for loops to display a symmetrical numeric pyramid pattern
             ending each line with the @ symbol.
*/

public class NestedLoopsPattern {
    public static void main(String[] args) {
        int rows = 7;

        for (int i = 0; i < rows; i++) {
            // Print spaces
            for (int s = 0; s < rows - i - 1; s++) {
                System.out.print("  ");
            }

            // Print, increasing numbers
            int num = 1;
            for (int j = 0; j <= i; j++) {
                System.out.print(num + " ");
                num *= 2;
            }

            // Print decreasing numbers
            num /= 4; // Step back to avoid repeating the middle number
            for (int j = 0; j < i; j++) {
                System.out.print(num + " ");
                num /= 2;
            }

            // Print @ then move to next line
            System.out.println("@");
        }
    }
}
