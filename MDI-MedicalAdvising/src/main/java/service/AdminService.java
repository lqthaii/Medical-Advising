package service;

import model.Account;
import model.Admin;
import model.Customer;
import repository.AdminRepository;

import java.util.List;

public class AdminService {
    AdminRepository adminRepository = new AdminRepository();
    public Admin getAdmin(String username){
        return this.adminRepository.getAdmin(username);
    }
    public int DoctorStatic(){
        return this.adminRepository.DoctorStatic();
    }
    public int CustomerStatic(){
        return this.adminRepository.CustomerStatic();
    }
    public List<Customer> getAllCustomer() {
        return this.adminRepository.getAllCustomer();
    }
    public boolean deleteCustomer(int id, String username) {
        return this.adminRepository.deleteCustomer(id,username);
    }
    public boolean editCustomer(int id, Customer customer){
        return this.adminRepository.editCustomer(id,customer);
    }
}
