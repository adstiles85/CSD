/*
Name: Andrew Stiles
Course: CSD-420
Assignment: M7 – JavaFX CSS Styling
Description: Displays four circles with styles from an external CSS file (mystyle.css).
*/

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.HBox;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import javafx.stage.Stage;

public class StyledCircleDemo extends Application {

    @Override
    public void start(Stage primaryStage) {
        // Create four circles
        Circle circle1 = new Circle(50);
        Circle circle2 = new Circle(50);
        Circle circle3 = new Circle(50);
        Circle circle4 = new Circle(50);

        // Apply style class to all
        circle1.getStyleClass().add("plaincircle");
        circle2.getStyleClass().add("plaincircle");
        circle3.getStyleClass().add("plaincircle");
        circle4.getStyleClass().add("plaincircle");

        // Apply IDs to two specific circles
        circle2.setId("redcircle");
        circle4.setId("greencircle");

        // Add circles to layout
        HBox hbox = new HBox(20, circle1, circle2, circle3, circle4);
        hbox.setStyle("-fx-padding: 20; -fx-alignment: center;");

        // Create scene and load external stylesheet
        Scene scene = new Scene(hbox, 500, 200);
        scene.getStylesheets().add("file:mystyle.css");

        // Show stage
        primaryStage.setTitle("JavaFX Styled Circles");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
