package model;

public class Doctor {
    int id;
    String identityCard;
    String fullName;
    String education;
    String specialized;
    String numberPhone;
    String address;
    Account account;
    public Doctor() {
    }

    public Doctor(int id, String identityCard, String fullName, String education, String specialized, String numberPhone, String address, Account account) {
        this.id = id;
        this.identityCard = identityCard;
        this.fullName = fullName;
        this.education = education;
        this.specialized = specialized;
        this.numberPhone = numberPhone;
        this.address = address;
        this.account = account;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getSpecialized() {
        return specialized;
    }

    public void setSpecialized(String specialized) {
        this.specialized = specialized;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdentityCard() {
        return identityCard;
    }

    public void setIdentityCard(String identityCard) {
        this.identityCard = identityCard;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
}
