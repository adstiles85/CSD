/*
Name: Andrew Stiles
Course: CSD-402
Assignment: M9 – Program 2 (File Handling)
Description: This application adds 10 random integers to a file
called data.file before reading and displaying its contents.
*/

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;
import java.util.Scanner;

public class AndrewFileData {

    public static void main(String[] args) {
        File file = new File("data.file");
        Random rand = new Random();

        // Write or append 10 random numbers
        try (FileWriter writer = new FileWriter(file, true)) { // true enables appending
            for (int i = 0; i < 10; i++) {
                int randomNum = rand.nextInt(100); // Picks Random number between 0-99
                writer.write(randomNum + " ");
            }
            System.out.println("10 random numbers written/appended to data.file.");
        } catch (IOException e) {
            System.out.println("Error writing to file: " + e.getMessage());
        }

        // Read and display the contents
        System.out.println("\nContents of data.file:");
        try (Scanner fileReader = new Scanner(file)) {
            while (fileReader.hasNext()) {
                System.out.print(fileReader.next() + " ");
            }
            System.out.println();
        } catch (IOException e) {
            System.out.println("Error reading from file: " + e.getMessage());
        }
    }
}
