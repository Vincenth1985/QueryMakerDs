package com.vincent.main;

import com.vincent.services.DataProcessing;

import java.io.*;

public class QueryMaker {


    public static void main(String[] args) throws IOException {


        DataProcessing dataProcessing = new DataProcessing();

        dataProcessing.readDataFromFile("DS3PATCH.Bat");
        dataProcessing.writeDataToFile();


    }
}

