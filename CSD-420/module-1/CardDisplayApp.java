/*
Name: Andrew Stiles
Course: CSD-420
Assignment: M1 – JavaFX Random Card Display
Description: JavaFX program that displays four randomly selected card images from a deck of 52
using a refresh button and lambda expressions.
*/

import javafx.application.Application;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;

public class CardDisplayApp extends Application {

    private static final int CARD_COUNT = 52;
    private static final String IMAGE_PATH = "cards/";

    private final HBox cardDisplayBox = new HBox(10);

    @Override
    public void start(Stage primaryStage) {
        cardDisplayBox.setAlignment(Pos.CENTER);
        refreshCards();  // Display initial cards

        Button refreshButton = new Button("Refresh");
        refreshButton.setOnAction(e -> refreshCards());

        VBox root = new VBox(15, cardDisplayBox, refreshButton);
        root.setAlignment(Pos.CENTER);

        Scene scene = new Scene(root, 600, 300);
        primaryStage.setTitle("JavaFX Random Card Display");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    private void refreshCards() {
        // Shuffle list of numbers 1–52
        ArrayList<Integer> cardNumbers = new ArrayList<>();
        for (int i = 1; i <= CARD_COUNT; i++) {
            cardNumbers.add(i);
        }
        Collections.shuffle(cardNumbers);

        // Clear and add 4 new images
        cardDisplayBox.getChildren().clear();
        for (int i = 0; i < 4; i++) {
            String fileName = IMAGE_PATH + cardNumbers.get(i) + ".png";
            Image image = new Image(new File(fileName).toURI().toString());
            ImageView imageView = new ImageView(image);
            imageView.setFitHeight(150);
            imageView.setPreserveRatio(true);
            cardDisplayBox.getChildren().add(imageView);
        }
    }

    public static void main(String[] args) {
        launch(args);
    }
}

