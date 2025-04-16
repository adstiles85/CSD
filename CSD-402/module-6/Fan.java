/*
Name: Andrew Stiles
Course: CSD-402
Assignment: M6 – Fan Class
Description: This program defines a Fan class with speed constants, private fields,
overloaded constructors, getter/setter methods, and a toString method.
It also includes test code to demonstrate the functionality of the Fan class.
*/

public class Fan {

    // Speed constants
    public static final int STOPPED = 0;
    public static final int SLOW = 1;
    public static final int MEDIUM = 2;
    public static final int FAST = 3;

    // Fields
    private int speed = STOPPED;
    private boolean on = false;
    private double radius = 6;
    private String color = "white";

    // No-arg constructor
    public Fan() {
        // Default values already set above
    }

    // Overloaded constructor
    public Fan(int speed, boolean on, double radius, String color) {
        this.speed = speed;
        this.on = on;
        this.radius = radius;
        this.color = color;
    }

    // Getters and setters
    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public boolean isOn() {
        return on;
    }

    public void setOn(boolean on) {
        this.on = on;
    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    // toString method
    @Override
    public String toString() {
        if (on) {
            return "Fan is ON | Speed: " + speedToString(speed) + " | Color: " + color + " | Radius: " + radius;
        } else {
            return "Fan is OFF | Color: " + color + " | Radius: " + radius;
        }
    }

    private String speedToString(int speed) {
        return switch (speed) {
            case STOPPED -> "STOPPED";
            case SLOW -> "SLOW";
            case MEDIUM -> "MEDIUM";
            case FAST -> "FAST";
            default -> "UNKNOWN";
        };
    }
}
