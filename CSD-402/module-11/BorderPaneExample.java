/*
Name: Andrew Stiles
Course: CSD-402
Assignment: M11 – JavaFX BorderPane Example
Description: Demonstrates the use of JavaFX BorderPane layout with five regions: top, bottom, left, right, and center.
*/

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class BorderPaneExample extends Application {

    @Override
    public void start(Stage primaryStage) {
        BorderPane borderPane = new BorderPane();

        // Top
        HBox topBox = new HBox(new Label("Top Menu Bar"));
        topBox.setStyle("-fx-background-color: lightgray; -fx-padding: 10;");
        borderPane.setTop(topBox);

        // Bottom
        HBox bottomBox = new HBox(new Label("Status Bar"));
        bottomBox.setStyle("-fx-background-color: lightgray; -fx-padding: 10;");
        borderPane.setBottom(bottomBox);

        // Left
        VBox leftBox = new VBox(new Button("Nav 1"), new Button("Nav 2"));
        leftBox.setStyle("-fx-background-color: #f0f0f0; -fx-padding: 10;");
        borderPane.setLeft(leftBox);

        // Right
        VBox rightBox = new VBox(new Label("Ads"), new Label("Tips"));
        rightBox.setStyle("-fx-background-color: #f0f0f0; -fx-padding: 10;");
        borderPane.setRight(rightBox);

        // Center
        Label centerLabel = new Label("Main Content Area");
        centerLabel.setStyle("-fx-font-size: 18px; -fx-padding: 20;");
        borderPane.setCenter(centerLabel);

        Scene scene = new Scene(borderPane, 600, 400);
        primaryStage.setTitle("JavaFX BorderPane Example");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}

