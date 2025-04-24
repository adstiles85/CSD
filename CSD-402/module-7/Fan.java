/*
Name: Andrew Stiles
Course: CSD-402
Assignment: M7 – UseFans
Description: This program defines a Fan class using
the 'this' reference where applicable.
*/

public class Fan {

    public static final int STOPPED = 0;
    public static final int SLOW = 1;
    public static final int MEDIUM = 2;
    public static final int FAST = 3;

    private int speed = STOPPED;
    private boolean on = false;
    private double radius = 6;
    private String color = "white";

    public Fan() {
        // Defaults already set
    }

    public Fan(int speed, boolean on, double radius, String color) {
        this.speed = speed;
        this.on = on;
        this.radius = radius;
        this.color = color;
    }

    public int getSpeed() {
        return this.speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public boolean isOn() {
        return this.on;
    }

    public void setOn(boolean on) {
        this.on = on;
    }

    public double getRadius() {
        return this.radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public String getColor() {
        return this.color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public String toString() {
        if (this.on) {
            return "Fan is ON | Speed: " + speedToString(this.speed) + " | Color: " + this.color + " | Radius: " + this.radius;
        } else {
            return "Fan is OFF | Color: " + this.color + " | Radius: " + this.radius;
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



