/*
Name: Andrew Stiles
Course: CSD-402
Assignment: M5 Locate Largest and Smallest in 2D Arrays
Description: This program defines overloaded methods that return row and column position
of the largest and smallest elements in both int and double 2D arrays.
*/

public class ArrayLocator {

    public static void main(String[] args) {
        int[][] intArray = {
                {3, 8, 2},
                {14, 5, 6},
                {7, 0, 9}
        };

        double[][] doubleArray = {
                {1.5, 6.2, 3.9},
                {0.4, 8.8, 2.1},
                {7.7, 5.5, 9.3}
        };

        // Locate largest
        int[] largestInt = locateLargest(intArray);
        int[] largestDouble = locateLargest(doubleArray);

        // Locate smallest
        int[] smallestInt = locateSmallest(intArray);
        int[] smallestDouble = locateSmallest(doubleArray);

        // Print results
        System.out.printf("Largest in the intArray is at [%d][%d]%n", largestInt[0], largestInt[1]);
        System.out.printf("Largest in the doubleArray is at [%d][%d]%n", largestDouble[0], largestDouble[1]);
        System.out.printf("Smallest in the intArray is at [%d][%d]%n", smallestInt[0], smallestInt[1]);
        System.out.printf("Smallest in the doubleArray is at [%d][%d]%n", smallestDouble[0], smallestDouble[1]);
    }

    // Locate Largest Methods
    public static int[] locateLargest(int[][] arrayParam) {
        int max = arrayParam[0][0];
        int[] location = {0, 0};

        for (int i = 0; i < arrayParam.length; i++) {
            for (int j = 0; j < arrayParam[i].length; j++) {
                if (arrayParam[i][j] > max) {
                    max = arrayParam[i][j];
                    location[0] = i;
                    location[1] = j;
                }
            }
        }
        return location;
    }

    public static int[] locateLargest(double[][] arrayParam) {
        double max = arrayParam[0][0];
        int[] location = {0, 0};

        for (int i = 0; i < arrayParam.length; i++) {
            for (int j = 0; j < arrayParam[i].length; j++) {
                if (arrayParam[i][j] > max) {
                    max = arrayParam[i][j];
                    location[0] = i;
                    location[1] = j;
                }
            }
        }
        return location;
    }

    // The Locate Smallest Methods
    public static int[] locateSmallest(int[][] arrayParam) {
        int min = arrayParam[0][0];
        int[] location = {0, 0};

        for (int i = 0; i < arrayParam.length; i++) {
            for (int j = 0; j < arrayParam[i].length; j++) {
                if (arrayParam[i][j] < min) {
                    min = arrayParam[i][j];
                    location[0] = i;
                    location[1] = j;
                }
            }
        }
        return location;
    }

    public static int[] locateSmallest(double[][] arrayParam) {
        double min = arrayParam[0][0];
        int[] location = {0, 0};

        for (int i = 0; i < arrayParam.length; i++) {
            for (int j = 0; j < arrayParam[i].length; j++) {
                if (arrayParam[i][j] < min) {
                    min = arrayParam[i][j];
                    location[0] = i;
                    location[1] = j;
                }
            }
        }
        return location;
    }
}

