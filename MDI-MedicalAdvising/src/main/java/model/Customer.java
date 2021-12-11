package model;

public class Customer {
    int id;
    String identityCard;
    String fullName;
    String numberPhone;
    String birthday;
    Account account;
    public Customer() {
    }

    public Customer(int id, String identityCard, String fullName, String numberPhone, String birthday, Account account) {
        this.id = id;
        this.identityCard = identityCard;
        this.fullName = fullName;
        this.numberPhone = numberPhone;
        this.birthday = birthday;
        this.account = account;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
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
