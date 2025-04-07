import java.util.Scanner;
import java.util.Random;


/*
Name: Andrew Stiles
Course: CSD-402
Assignment: RockPaperScissors Game
Description: This program creates a Rock-Paper-Scissors game, and loops back to beginning.
 */
public class RockPaperScissors {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Random rand = new Random();
        String playAgain = ""; // initialize loop

        do {
            // Display start of program
            System.out.println("Welcome to Rock-Paper-Scissors!");
            System.out.println("Enter 1 for Rock, 2 for Paper, or 3 for Scissors:");

            // Get choice
            int userChoice = input.nextInt();

            // Validate user input
            if (userChoice < 1 || userChoice > 3) {
                System.out.println("Invalid choice. Please enter 1, 2, or 3.");
                continue;
            }

            // Generate Computers choice
            int computerChoice = rand.nextInt(3) + 1;

            // Display choices
            System.out.println("Your choice: " + choiceToString(userChoice));
            System.out.println("Computer's choice: " + choiceToString(computerChoice));

            // Determine the winner
            if (userChoice == computerChoice) {
                System.out.println("TIE!");
            } else if (
                    (userChoice == 1 && computerChoice == 3) ||
                            (userChoice == 2 && computerChoice == 1) ||
                            (userChoice == 3 && computerChoice == 2)
            ) {
                System.out.println("You Win!");
            } else {
                System.out.println("Computer wins! Womp Womp!");
            }

            // Ask to play again
            System.out.print("Do you want to play again? (y/n): ");
            playAgain = input.next();

        } while (playAgain.equalsIgnoreCase("y")); // Loop back to beginning

        System.out.println("Thanks for playing!");
        input.close();
    }

    // Convert number choice to String
    public static String choiceToString(int choice) {
        return switch (choice) {
            case 1 -> "Rock";
            case 2 -> "Paper";
            case 3 -> "Scissors";
            default -> "Unknown";
        };
    }
}


