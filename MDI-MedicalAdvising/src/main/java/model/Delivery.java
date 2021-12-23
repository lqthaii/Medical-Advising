package model;

public class Delivery {
    int id;
    Customer customer;
    Order order;
    String name;
    String numberPhone;
    String address;

    public Delivery() {
    }

    public Delivery(int id, Customer customer, Order order, String name, String numberPhone, String address) {
        this.id = id;
        this.customer = customer;
        this.order = order;
        this.name = name;
        this.numberPhone = numberPhone;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}

