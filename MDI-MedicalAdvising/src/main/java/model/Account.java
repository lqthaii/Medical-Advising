package model;

public class Account {
    String userName;
    String passWord;
    String email;
    TypeAccount typeAccount;

    public Account() {
    }

    public Account(String userName, String passWord, String email, TypeAccount typeAccount) {
        this.userName = userName;
        this.passWord = passWord;
        this.email = email;
        this.typeAccount = typeAccount;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public TypeAccount getTypeAccount() {
        return typeAccount;
    }

    public void setTypeAccount(TypeAccount typeAccount) {
        this.typeAccount = typeAccount;
    }

    public void getTypeAccount(TypeAccount typeAccount) {
    }
}
