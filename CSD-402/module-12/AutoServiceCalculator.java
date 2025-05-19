/*
Name: Andrew Stiles
Course: CSD-402
Assignment: M12 – Overloaded Methods
Description: This program calculates the cost of an annual
auto service visit using overloaded methods based on different service combinations.
*/

public class AutoServiceCalculator {

    // Base cost for standard service
    public static double yearlyService() {
        return 79.99;
    }

    // Service + oil change
    public static double yearlyService(double oilChangeFee) {
        return 79.99 + oilChangeFee;
    }

    // Service + oil change + tire rotation
    public static double yearlyService(double oilChangeFee, double tireRotationFee) {
        return 79.99 + oilChangeFee + tireRotationFee;
    }

    // Full service with coupon applied
    public static double yearlyService(double oilChangeFee, double tireRotationFee, double couponAmount) {
        return (79.99 + oilChangeFee + tireRotationFee) - couponAmount;
    }

    public static void main(String[] args) {
        // Test yearlyService with no parameters
        System.out.println("Standard Service (1): $" + yearlyService());
        System.out.println("Standard Service (2): $" + yearlyService());

        // Test yearlyService with 1 parameter
        System.out.println("Service + Oil Change (1): $" + yearlyService(29.95));
        System.out.println("Service + Oil Change (2): $" + yearlyService(34.99));

        // Test yearlyService with 2 parameters
        System.out.println("Service + Oil + Tire Rotation (1): $" + yearlyService(29.95, 19.95));
        System.out.println("Service + Oil + Tire Rotation (2): $" + yearlyService(34.99, 24.99));

        // Test yearlyService with 3 parameters and coupon
        System.out.println("Full Service with Coupon (1): $" + yearlyService(29.95, 19.95, 15.00));
        System.out.println("Full Service with Coupon (2): $" + yearlyService(34.99, 24.99, 10.00));
    }
}

