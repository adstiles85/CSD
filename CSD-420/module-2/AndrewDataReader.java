/*
Name: Andrew Stiles
Course: CSD-420
Assignment: M2 – Data Reader
Description: This program reads integer and double values from
a .dat file and displays them.
*/

import java.io.DataInputStream;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.IOException;

public class AndrewDataReader {
    public static void main(String[] args) {
        String filename = "Andrew_datafile.dat";

        try (DataInputStream dis = new DataInputStream(new FileInputStream(filename))) {
            int record = 1;
            while (true) {
                System.out.println("\nRecord " + record + ":");
                System.out.print("Integers: ");
                for (int i = 0; i < 5; i++) {
                    System.out.print(dis.readInt() + " ");
                }

                System.out.print("\nDoubles:  ");
                for (int i = 0; i < 5; i++) {
                    System.out.printf("%.2f ", dis.readDouble());
                }

                record++;
            }
        } catch (EOFException e) {
            System.out.println("\n\nEnd of file reached.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
