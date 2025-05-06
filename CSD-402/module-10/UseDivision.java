/*
Name: Andrew Stiles
Course: CSD-402
Assignment: M10 – UseDivision
Description: Test application that creates instances of Domestic and International divisions
and displays their information.
*/

public class UseDivision {
    public static void main(String[] args) {
        Division d1 = new DomesticDivision("Sales West", 101, "California");
        Division d2 = new DomesticDivision("Support East", 102, "New York");

        Division i1 = new InternationalDivision("Global Sales", 201, "Germany", "German");
        Division i2 = new InternationalDivision("Asia Ops", 202, "Japan", "Japanese");

        d1.display();
        d2.display();
        i1.display();
        i2.display();
    }
}