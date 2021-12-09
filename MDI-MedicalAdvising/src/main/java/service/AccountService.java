package service;

import model.Account;
import model.Customer;
import model.Doctor;
import model.TypeAccount;
import repository.AccountRepository;

import java.util.List;

public class AccountService {
    AccountRepository accountRepository = new AccountRepository();
    public void addAccount(String username, String password, String email, String name){
        this.accountRepository.addAccount(username,password,email,name);
    }
    public boolean checkLogin(String username, String password){
        return this.accountRepository.checkLogin(username,password);
    }
    public Account getAccount(String username){
        return  this.accountRepository.getAccount(username);
    }
    public Customer getCustomer(String username){
        return this.accountRepository.getCustomer(username);
    }
    public TypeAccount getTypeAccount(int id){
        return this.accountRepository.getTypeAccount(id);
    }
    public Doctor getDoctor(String username) {
        return this.accountRepository.getDoctor(username);
    }
    public List<TypeAccount> getAllTypeAccount() {
        return this.accountRepository.getAllTypeAccount();
    }
}
