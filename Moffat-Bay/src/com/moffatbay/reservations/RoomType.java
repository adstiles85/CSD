package com.moffatbay.reservations;

/**
 * POJO for room types.
 */
public class RoomType {

    private int roomTypeID;
    private String typeName;
    private String description;
    private String rate;
    private int guestsMax;

    public RoomType(int roomTypeID, String typeName, String description, String rate, int guestsMax) {
        this.roomTypeID = roomTypeID;
        this.typeName = typeName;
        this.description = description;
        this.rate = rate;
        this.guestsMax = guestsMax;
    }

    public int getRoomTypeID() {
        return roomTypeID;
    }
    public String getTypeName() {
        return typeName;
    }
    public String getDescription() {
        return description;
    }
    public String getRate() {
        return rate;
    }
    public int getGuestsMax() {
        return guestsMax;
    }
}

