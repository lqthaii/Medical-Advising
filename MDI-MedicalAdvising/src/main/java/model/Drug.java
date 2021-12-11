package model;

import java.io.File;
import java.sql.Blob;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;

public class Drug {
    int id;
    String name;
    double price;
    String description;
    TypeDrug typeDrug;
    private String image;

    public Drug() {
    }

    public Drug(String name, double price, String description, TypeDrug typeDrug, String image, int id) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.typeDrug = typeDrug;
        this.image = image;
        this.id=id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public TypeDrug getTypeDrug() {
        return typeDrug;
    }

    public void setTypeDrug(TypeDrug typeDrug) {
        this.typeDrug = typeDrug;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String priceFormat(){
        Locale locale = new Locale("en", "EN");
        String pattern = "###,###,###.##";
        DecimalFormat dcf = (DecimalFormat) NumberFormat.getNumberInstance(locale);
        dcf.applyPattern(pattern);
        return  dcf.format(this.price);
    }
}

