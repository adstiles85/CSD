import java.util.Scanner;

/*
Name: Andrew Stiles
Course: CSD-402
Assignment: WaterHeatingCalculator
Description: Calculates how much energy (Joules) is needed to heat water (kg) to a higher temperature in Celcius
 */

public class WaterHeatingCalculator {

    public static void main(String[] args) {
        // Create a Scanner object to read input
        Scanner input = new Scanner(System.in);
        
        // Prompt the user to enter the amount of water in kilograms
        System.out.print("Enter the amount of water in kilograms: ");
        double waterMass = input.nextDouble();
        
        // Prompt the user to enter the initial temperature in Celsius
        System.out.print("Enter the initial temperature in Celsius: ");
        double initialTemperature = input.nextDouble();
        
        // Prompt the user to enter the final temperature in Celsius
        System.out.print("Enter the final temperature in Celsius: ");
        double finalTemperature = input.nextDouble();
        
        // Calculate the energy required
        double Q = waterMass * (finalTemperature - initialTemperature) * 4184;
        
        // Display the result
        System.out.printf("The energy required to heat the water is %.2f Joules.%n", Q);
        
        // Close the scanner
        input.close();
    }
}