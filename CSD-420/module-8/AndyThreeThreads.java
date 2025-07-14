/*
Name: Andrew Stiles
Course: CSD-420
Assignment: M8 – ThreeThreads
Description: Launches three threads to generate random letters, numbers, and symbols, and displays them in a JavaFX TextArea.
*/

import javafx.application.Application;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.control.TextArea;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

import java.util.Random;

public class AndyThreeThreads extends Application {

    private static final int CHARACTER_COUNT = 10000;
    private final Random random = new Random();
    private final TextArea textArea = new TextArea();

    @Override
    public void start(Stage primaryStage) {
        textArea.setWrapText(true);

        VBox root = new VBox(textArea);
        Scene scene = new Scene(root, 800, 600);

        primaryStage.setTitle("ThreeThreads Output");
        primaryStage.setScene(scene);
        primaryStage.show();

        startThreads();
    }

    private void startThreads() {
        Thread letterThread = new Thread(() -> generateCharacters("letters"));
        Thread numberThread = new Thread(() -> generateCharacters("numbers"));
        Thread symbolThread = new Thread(() -> generateCharacters("symbols"));

        // Optionally set thread names
        letterThread.setName("LetterThread");
        numberThread.setName("NumberThread");
        symbolThread.setName("SymbolThread");

        letterThread.start();
        numberThread.start();
        symbolThread.start();
    }

    private void generateCharacters(String type) {
        StringBuilder output = new StringBuilder();
        for (int i = 0; i < CHARACTER_COUNT; i++) {
            char c;
            switch (type) {
                case "letters" -> c = (char) (random.nextInt(26) + 'a'); // a-z
                case "numbers" -> c = (char) (random.nextInt(10) + '0'); // 0-9
                case "symbols" -> {
                    char[] symbols = {'!', '@', '#', '$', '%', '&', '*'};
                    c = symbols[random.nextInt(symbols.length)];
                }
                default -> throw new IllegalArgumentException("Unknown type: " + type);
            }
            output.append(c);
        }

        Platform.runLater(() -> {
            textArea.appendText("\n[" + Thread.currentThread().getName() + "]\n");
            textArea.appendText(output.toString() + "\n");
        });
    }

    public static void main(String[] args) {
        launch(args);
    }
}
