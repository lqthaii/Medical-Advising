package model;

public class Customer {
    int id;
    String identityCard;
    String fullName;
    String numberPhone;
    Account account;
    public Customer() {
    }

    public Customer(int id, String identityCard, String fullName, String numberPhone, Account account) {
        this.id = id;
        this.identityCard = identityCard;
        this.fullName = fullName;
        this.numberPhone = numberPhone;
        this.account = account;
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
