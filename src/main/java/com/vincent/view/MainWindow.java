package com.vincent.view;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.File;
import java.nio.file.Paths;

public class MainWindow extends Application {

    @Override
    public void start(Stage stage) throws Exception {

        File file = Paths.get("/Users/vincenthonca/Documents/Intelij/Ds/DS.fxml").toFile();
        Parent parent = FXMLLoader.load(file.toURI().toURL());

        stage.setTitle("QueryMaker");

        stage.setScene(new Scene(parent, 600, 400));
        stage.setResizable(false);
        stage.show();

    }

    public void startGui(java.lang.String[] args) {


        launch(args);

    }


}

