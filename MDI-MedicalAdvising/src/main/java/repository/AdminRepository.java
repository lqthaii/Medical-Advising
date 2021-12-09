package repository;

import model.Account;
import model.Admin;
import model.Customer;
import model.Question;
import service.AccountService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminRepository {
    BaseRepository baseRepository = new BaseRepository();
    AccountService accountService = new AccountService();

    public Admin getAdmin(String username) {
        Admin admin = new Admin();
        String sql = "select id,full_name from `admin` inner join " +
                " `account` on `admin`.user_name = `account`.user_name " +
                " where `admin`.user_name = ? ";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                admin.setFullName(resultSet.getString("full_name"));
                admin.setId(resultSet.getInt("id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    public int DoctorStatic() {
        int numberDoctor = 0;
        try {
            Connection connection = baseRepository.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select  count(id) as number_doctor from doctor;");
            while (resultset.next()) {
                numberDoctor = resultset.getInt("number_doctor");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return numberDoctor;
    }

    public int CustomerStatic() {
        int numberCustomer = 0;
        try {
            Connection connection = baseRepository.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select  count(id) as number_customer from customer;");
            while (resultset.next()) {
                numberCustomer = resultset.getInt("number_customer");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return numberCustomer;
    }

    public List<Customer> getAllCustomer() {
        List<Customer> customers = new ArrayList<>();
        try {
            Connection connection = baseRepository.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from `account`\n" +
                    "inner join customer on `account`.user_name = customer.user_name");
            Customer customer = null;
            while (resultset.next()) {
                customer = new Customer();
                customer.setAccount(this.accountService.getAccount(resultset.getString("user_name")));
                customer.setNumberPhone(resultset.getString("number_phone"));
                customer.setFullName(resultset.getString("full_name"));
                customer.setIdentityCard(resultset.getString("identity_card"));
                customer.setId(resultset.getInt("id"));
                customers.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customers;
    }

    public boolean deleteCustomer(int id, String username) {
        String sql = "DELETE FROM Customer WHERE id=?";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            int row = preparedStatement.executeUpdate();
            if(row>0&&deleteAccount(username))
                return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public boolean deleteAccount(String username){
        String sql = "DELETE FROM Account WHERE user_name=?";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            int row = preparedStatement.executeUpdate();
            if(row>0)
                return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public boolean editCustomer(int id, Customer customer){
        String sql = "update customer set full_name= ? where id = ?";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, customer.getFullName());
            preparedStatement.setInt(2, id);
            int row = preparedStatement.executeUpdate();
            if(row>0)
                return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
