package service;

import model.Customer;
import repository.CustomerRepository;

public class CustomerService {
    CustomerRepository customerRepository = new CustomerRepository();

    public Customer getCustomer(int id) {
        return this.customerRepository.getCustomer(id);
    }
}
