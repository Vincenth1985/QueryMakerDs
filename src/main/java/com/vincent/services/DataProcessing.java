package com.vincent.services;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class DataProcessing {

    List<String> files = new ArrayList<>();

    List<String> md = new ArrayList<>();

    List<String> old = new ArrayList<>();


    public void readDataFromFile(String fileToRead) throws IOException {

        BufferedReader reader = new BufferedReader(new FileReader(fileToRead));
        String line;

        while ((line = reader.readLine()) != null) {
            if (line.startsWith("set \"Files")) {
                files.add(line);
            }
            if (line.startsWith("set \"MD5")) {
                md.add(line);
            }
            if (line.startsWith("set \"OLD_MD5")) {
                old.add(line);

            }
        }
        reader.close();
    }


    public void writeDataToFile() throws IOException {

        File toWrite = new File("DS3PATCH.sql");
        FileOutputStream linesToWrite = new FileOutputStream(toWrite);
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(linesToWrite));

        bw.write("INSERT INTO ds3filesmd5 (version, regulation, ");

        for (int i = 0; i < files.size(); i++) {
            if (i == files.size() - 1) {
                bw.write("`" + files.get(i).substring(files.get(i).indexOf("=") + 1, files.get(i).length() - 1) + "`)");
            } else
                bw.write("`" + files.get(i).substring(files.get(i).indexOf("=") + 1, files.get(i).length() - 1) + "`,");
        }

        bw.write(" VALUES (1.15, 1.35,");

        for (int i = 0; i < md.size(); i++) {
            if (i == files.size() - 1) {
                bw.write("'" + md.get(i).substring(md.get(i).indexOf("=") + 1, md.get(i).length() - 1) + "');");
            } else {
                bw.write("'" + md.get(i).substring(md.get(i).indexOf("=") + 1, md.get(i).length() - 1) + "',");
            }
        }

        bw.newLine();

        bw.write("INSERT INTO ds3filesmd5 (version, regulation, ");

        for (int i = 0; i < files.size(); i++) {
            if (i == files.size() - 1) {
                bw.write("`" + files.get(i).substring(files.get(i).indexOf("=") + 1, files.get(i).length() - 1) + "`)");
            } else
                bw.write("`" + files.get(i).substring(files.get(i).indexOf("=") + 1, files.get(i).length() - 1) + "`,");
        }

        bw.write(" VALUES (1.35, 1.04,");

        for (int i = 0; i < old.size(); i++) {
            if (i == files.size() - 1) {
                bw.write("'" + old.get(i).substring(old.get(i).indexOf("=") + 1, old.get(i).length() - 1) + "');");
            } else {
                bw.write("'" + old.get(i).substring(old.get(i).indexOf("=") + 1, old.get(i).length() - 1) + "',");
            }


        }
        bw.close();


    }
}
