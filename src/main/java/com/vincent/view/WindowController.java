package com.vincent.view;

import com.vincent.services.DataProcessing;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.stage.FileChooser;

import java.io.File;
import java.io.IOException;

public class WindowController {

    DataProcessing dataProcessing = new DataProcessing();

    @FXML
    private Button selectFileButton;

    @FXML
    private ListView selectedFilesList;


    @FXML
    private TextField newVer;

    @FXML
    private TextField newReg;

    @FXML
    private TextField oldVer;

    @FXML
    private TextField oldReg;


    private String fileToReadData;


    @FXML
    public void SelectFileButton(ActionEvent event) {
        FileChooser fc = new FileChooser();
        File selectedFile = fc.showOpenDialog(null);

        if (selectedFile != null) {

            selectedFilesList.getItems().add(selectedFile.getName());
            fileToReadData = selectedFile.getAbsolutePath();
        } else
            System.out.println("File is not Valid");

    }

    @FXML
    public void generateQuery(ActionEvent event) throws IOException {

        dataProcessing.readDataFromFile(fileToReadData);
        dataProcessing.writeDataToFile(newVer.getText(), newReg.getText(), oldVer.getText(), oldReg.getText());
        selectedFilesList.getItems().clear();
        selectedFilesList.getItems().add("Sql File is generated");

    }


}
