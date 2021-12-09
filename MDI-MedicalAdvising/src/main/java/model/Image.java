package model;

public class Image {
    int id;
    private byte[] imageData;
    private String imageFileName;

    public Image() {
    }

    public Image(int id, byte[] imageData, String imageFileName) {
        this.id = id;
        this.imageData = imageData;
        this.imageFileName = imageFileName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public byte[] getImageData() {
        return imageData;
    }

    public void setImageData(byte[] imageData) {
        this.imageData = imageData;
    }

    public String getImageFileName() {
        return imageFileName;
    }

    public void setImageFileName(String imageFileName) {
        this.imageFileName = imageFileName;
    }
}
