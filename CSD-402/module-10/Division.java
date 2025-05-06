/*
Name: Andrew Stiles
Course: CSD-402
Assignment: M10 – Division Classes
Description: Abstract Division class containing name, account number,
and abstract display method.
*/

public abstract class Division {
    protected String divisionName;
    protected int accountNumber;

    public Division(String divisionName, int accountNumber) {
        this.divisionName = divisionName;
        this.accountNumber = accountNumber;
    }

    public abstract void display();
}
