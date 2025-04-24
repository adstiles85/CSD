/*
Name: Andrew Stiles
Course: CSD-402
Assignment: M6 Fan Class
Description: This program tests the functionality of the Fan class by creating two instances.
one using the default constructor and another using the argument constructor.
It also demonstrates the use of setter methods and displays the fan states.
*/


public class FanTest {
    public static void main(String[] args) {
        // Fan with default constructor
        Fan defaultFan = new Fan();
        System.out.println("Default Fan: " + defaultFan);
        System.out.println();

        // Fan with argument constructor
        Fan customFan = new Fan(Fan.FAST, true, 10.5, "blue");
        System.out.println("Custom Fan: " + customFan);
        System.out.println();

        // Demonstrate setters
        defaultFan.setOn(true);
        defaultFan.setSpeed(Fan.MEDIUM);
        defaultFan.setColor("green");
        defaultFan.setRadius(8);
        System.out.println("Updated Default Fan: " + defaultFan);
    }
}
