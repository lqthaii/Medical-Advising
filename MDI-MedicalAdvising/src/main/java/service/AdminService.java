package service;

import model.*;
import repository.AdminRepository;

import java.io.InputStream;
import java.util.List;

public class AdminService {
    AdminRepository adminRepository = new AdminRepository();

    public Admin getAdmin(String username) {
        return this.adminRepository.getAdmin(username);
    }

    public int DoctorStatic() {
        return this.adminRepository.DoctorStatic();
    }

    public int CustomerStatic() {
        return this.adminRepository.CustomerStatic();
    }

    public int QuestionrStatic() {
        return this.adminRepository.QuestionrStatic();
    }

    public List<Customer> getAllCustomer() {
        return this.adminRepository.getAllCustomer();
    }

    public boolean deleteCustomer(int id, String username) {
        return this.adminRepository.deleteCustomer(id, username);
    }

    public boolean editCustomer(int id, Customer customer) {
        return this.adminRepository.editCustomer(id, customer);
    }

    public List<Customer> getFiveUser() {
        return this.adminRepository.getFiveUser();
    }

    public boolean addDrug(Drug drug, InputStream image) {
        return this.adminRepository.addDrug(drug, image);
    }

    public List<Drug> getAllDrug() {
        return this.adminRepository.getAllDrug();
    }

    public List<TypeDrug> getAllTypeDrug() {
        return this.adminRepository.getAllTypeDrug();
    }

    public TypeDrug getTypeDrug(int id) {
        return this.adminRepository.getTypeDrug(id);
    }
    public boolean addTypeDrug(String name) {
        return this.adminRepository.addTypeDrug(name);
    }
}
