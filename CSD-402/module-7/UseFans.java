/*
Name: Andrew Stiles
Course: CSD-402
Assignment: M7 – UseFans
Description: This program creates a collection of Fan objects and demonstrates displaying
fan attributes without using the toString() method.
*/

import java.util.ArrayList;

public class UseFans {

    public static void main(String[] args) {
        ArrayList<Fan> fans = new ArrayList<>();

        fans.add(new Fan());
        fans.add(new Fan(Fan.FAST, true, 10, "blue"));
        fans.add(new Fan(Fan.SLOW, false, 12, "red"));
        fans.add(new Fan(Fan.MEDIUM, true, 8.5, "black"));

        System.out.println("Displaying all fans using displayFanCollection():");
        displayFanCollection(fans);

        System.out.println("\nDisplaying a single fan using displayFan():");
        displayFan(fans.get(1));  // Display second fan
    }

    // Display fans without toString()
    public static void displayFanCollection(ArrayList<Fan> fanList) {
        for (int i = 0; i < fanList.size(); i++) {
            System.out.print("Fan " + (i + 1) + ": ");
            displayFan(fanList.get(i));
        }
    }

    // Display one fan without toString()
    public static void displayFan(Fan fan) {
        String status = fan.isOn() ? "ON" : "OFF";
        String speed = switch (fan.getSpeed()) {
            case Fan.STOPPED -> "STOPPED";
            case Fan.SLOW -> "SLOW";
            case Fan.MEDIUM -> "MEDIUM";
            case Fan.FAST -> "FAST";
            default -> "UNKNOWN";
        };

        System.out.println("Status: " + status +
                " | Speed: " + speed +
                " | Color: " + fan.getColor() +
                " | Radius: " + fan.getRadius());
    }
}
