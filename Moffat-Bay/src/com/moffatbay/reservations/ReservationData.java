package com.moffatbay.reservations;

import java.time.LocalDate;

/**
 * Holds reservation state across multiple JSP steps.
 */
public class ReservationData {

    private LocalDate checkInDate;
    private LocalDate checkOutDate;

    private int numberOfRooms;
    private int numberOfGuests;
    private int numberOfNights;

    private double ratePerNight;
    private double totalPrice;

    private int roomTypeId;
    private String roomTypeName;

    private int selectedRoomId;

    private String occasionType;
    private String occasionDetails;

    private int guestsMax;

    public LocalDate getCheckInDate() {
        return checkInDate;
    }
    public void setCheckInDate(LocalDate checkInDate) {
        this.checkInDate = checkInDate;
    }

    public LocalDate getCheckOutDate() {
        return checkOutDate;
    }
    public void setCheckOutDate(LocalDate checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public int getNumberOfRooms() {
        return numberOfRooms;
    }
    public void setNumberOfRooms(int numberOfRooms) {
        this.numberOfRooms = numberOfRooms;
    }

    public int getNumberOfGuests() {
        return numberOfGuests;
    }
    public void setNumberOfGuests(int numberOfGuests) {
        this.numberOfGuests = numberOfGuests;
    }

    public int getNumberOfNights() {
        return numberOfNights;
    }
    public void setNumberOfNights(int numberOfNights) {
        this.numberOfNights = numberOfNights;
    }

    public double getRatePerNight() {
        return ratePerNight;
    }
    public void setRatePerNight(double ratePerNight) {
        this.ratePerNight = ratePerNight;
    }

    public double getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getRoomTypeId() {
        return roomTypeId;
    }
    public void setRoomTypeId(int roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }
    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    public int getSelectedRoomId() {
        return selectedRoomId;
    }
    public void setSelectedRoomId(int selectedRoomId) {
        this.selectedRoomId = selectedRoomId;
    }

    public String getOccasionType() {
        return occasionType;
    }
    public void setOccasionType(String occasionType) {
        this.occasionType = occasionType;
    }

    public String getOccasionDetails() {
        return occasionDetails;
    }
    public void setOccasionDetails(String occasionDetails) {
        this.occasionDetails = occasionDetails;
    }

    public int getGuestsMax() {
        return guestsMax;
    }
    public void setGuestsMax(int guestsMax) {
        this.guestsMax = guestsMax;
    }
}
