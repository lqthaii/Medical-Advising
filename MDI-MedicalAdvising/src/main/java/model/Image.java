package model;

import java.sql.Blob;

public class Image {
    int id;
    String fileName;
    Blob fileData;
    public Image() {
    }

    public Image(int id, String fileName, Blob fileData) {
        this.id = id;
        this.fileName = fileName;
        this.fileData = fileData;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Blob getFileData() {
        return fileData;
    }

    public void setFileData(Blob fileData) {
        this.fileData = fileData;
    }

}
