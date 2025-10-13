/* 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: Modules 5 & 6 – CRUD-READ, JDBC, & JavaBeans
Date: 9/8/2025
File: MovieBean.java
Purpose: Serializable JavaBean representing a movie record.
*/

package edu.bu.csd430.beans;
import java.io.Serializable;

public class MovieBean implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private String title;
    private int releaseYear;
    private String genre;
    private String director;
    private double rating;
    private String notes;

    public MovieBean() {}

    public MovieBean(int id, String title, int releaseYear, String genre, String director, double rating, String notes) {
        this.id = id;
        this.title = title;
        this.releaseYear = releaseYear;
        this.genre = genre;
        this.director = director;
        this.rating = rating;
        this.notes = notes;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public int getReleaseYear() { return releaseYear; }
    public void setReleaseYear(int releaseYear) { this.releaseYear = releaseYear; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }

    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }

    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
}
