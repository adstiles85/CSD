/*
Name: Andrew Stiles
Course: CSD-402
Assignment: Overloaded Average Methods
Description: This program includes four overloaded methods for calculating the average of
arrays of various numeric types (short, int, long, and double).  It includes a test application that demonstrates each method with various array sizes and types.

*/

public class OverloadedAverage {

    public static void main(String[] args) {
        // Test arrays
        short[] shortArray = {10, 20, 30, 40};
        int[] intArray = {5, 10, 15, 20, 25};
        long[] longArray = {100L, 200L, 300L};
        double[] doubleArray = {1.5, 2.5, 3.5, 4.5, 5.5, 6.5};

        // Display each array and its average
        System.out.println("Short Array: ");
        displayArray(shortArray);
        System.out.println("Average: " + average(shortArray));
        System.out.println();

        System.out.println("Int Array: ");
        displayArray(intArray);
        System.out.println("Average: " + average(intArray));
        System.out.println();

        System.out.println("Long Array: ");
        displayArray(longArray);
        System.out.println("Average: " + average(longArray));
        System.out.println();

        System.out.println("Double Array: ");
        displayArray(doubleArray);
        System.out.println("Average: " + average(doubleArray));
    }

    // Overloaded average methods
    public static short average(short[] array) {
        int sum = 0;
        for (short num : array) {
            sum += num;
        }
        return (short) (sum / array.length);
    }

    public static int average(int[] array) {
        int sum = 0;
        for (int num : array) {
            sum += num;
        }
        return sum / array.length;
    }

    public static long average(long[] array) {
        long sum = 0;
        for (long num : array) {
            sum += num;
        }
        return sum / array.length;
    }

    public static double average(double[] array) {
        double sum = 0;
        for (double num : array) {
            sum += num;
        }
        return sum / array.length;
    }

    // Overloaded display methods
    public static void displayArray(short[] array) {
        for (short num : array) {
            System.out.print(num + " ");
        }
        System.out.println();
    }

    public static void displayArray(int[] array) {
        for (int num : array) {
            System.out.print(num + " ");
        }
        System.out.println();
    }

    public static void displayArray(long[] array) {
        for (long num : array) {
            System.out.print(num + " ");
        }
        System.out.println();
    }

    public static void displayArray(double[] array) {
        for (double num : array) {
            System.out.print(num + " ");
        }
        System.out.println();
    }
}
