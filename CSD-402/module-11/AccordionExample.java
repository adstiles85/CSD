/*
Name: Andrew Stiles
Course: CSD-402
Assignment: M11 – JavaFX Accordion Example
Description: Demonstrates the use of JavaFX Accordion layout with multiple collapsible TitledPane sections.
*/

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Accordion;
import javafx.scene.control.Label;
import javafx.scene.control.TitledPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class AccordionExample extends Application {

    @Override
    public void start(Stage primaryStage) {
        // Create content for each titled pane
        VBox content1 = new VBox(new Label("This is content for Section 1"));
        VBox content2 = new VBox(new Label("This is content for Section 2"));
        VBox content3 = new VBox(new Label("This is content for Section 3"));

        // Create titled panes
        TitledPane pane1 = new TitledPane("Section 1", content1);
        TitledPane pane2 = new TitledPane("Section 2", content2);
        TitledPane pane3 = new TitledPane("Section 3", content3);

        // Add them to an Accordion
        Accordion accordion = new Accordion();
        accordion.getPanes().addAll(pane1, pane2, pane3);

        // Set up scene and stage
        Scene scene = new Scene(accordion, 400, 300);
        primaryStage.setTitle("JavaFX Accordion Example");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
