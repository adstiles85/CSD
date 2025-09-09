/* 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: M4 – JavaBean
Date: 9/8/2025
File: BookBean.java
Explanation: A simple Serializable JavaBean that models a book record used by booksBean.jsp.
*/

// Intention: define a classic JavaBean with private fields, no-arg ctor, getters/setters
package edu.bu.csd430.beans;

import java.io.Serializable;

public class BookBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private String title;
    private String author;
    private String genre;
    private int year;
    private String note;

    public BookBean() { /* Intention: no-arg constructor for bean compliance */ }

    public BookBean(String title, String author, String genre, int year, String note) {
        this.title = title;
        this.author = author;
        this.genre = genre;
        this.year = year;
        this.note = note;
    }

    // Intention: standard getters/setters
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }

    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }

    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
}
