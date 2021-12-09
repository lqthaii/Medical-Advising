package model;

public class Admin {
    String fullName;
    int id;
    Account account;

    public Admin() {
    }

    public Admin(String fullName, int id, Account account) {
        this.fullName = fullName;
        this.id = id;
        this.account = account;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
}
