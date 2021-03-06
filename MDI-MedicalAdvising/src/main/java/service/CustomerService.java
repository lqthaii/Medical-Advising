package service;

import model.Customer;
import model.Drug;
import repository.CustomerRepository;

import java.util.List;

public class CustomerService {
    CustomerRepository customerRepository = new CustomerRepository();

    public Customer getCustomer(int id) {
        return this.customerRepository.getCustomer(id);
    }
    public List<Drug> getAllDrug(){
        return this.customerRepository.getAllDrug();
    }
    public List<Drug> getDrugByType(int id) {
        return this.customerRepository.getDrugByType(id);
    }
    public Drug getDrug(int id){
        return this.customerRepository.getDrug(id);
    }
    public List<Drug> getDrugByName(String name){
        return this.customerRepository.getDrugByName(name);
    }
}
