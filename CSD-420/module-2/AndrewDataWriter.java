/*
Name: Andrew Stiles
Course: CSD-420
Assignment: M2 – Data Writer
Description: This program creates or appends to
a .dat file with five random integers and five random doubles.
*/

import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;

public class AndrewDataWriter {
    public static void main(String[] args) {
        String filename = "Andrew_datafile.dat";
        Random random = new Random();

        try (DataOutputStream dos = new DataOutputStream(new FileOutputStream(filename, true))) {
            System.out.println("Writing 5 random integers:");
            for (int i = 0; i < 5; i++) {
                int value = random.nextInt(100); // random int 0-99
                System.out.print(value + " ");
                dos.writeInt(value);
            }

            System.out.println("\nWriting 5 random doubles:");
            for (int i = 0; i < 5; i++) {
                double value = random.nextDouble() * 100; // random double 0.0–100.0
                System.out.printf("%.2f ", value);
                dos.writeDouble(value);
            }

            System.out.println("\nData written to " + filename);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
