package repository;

import model.Account;
import model.Customer;
import service.AccountService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class CustomerRepository {
    BaseRepository baseRepository = new BaseRepository();
    AccountService accountService = new AccountService();
    public Customer getCustomer(int id) {
        String sql = "SELECT * FROM customer where id= ? ";
        PreparedStatement preparedStatement = null;
        Customer customer = new Customer();
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            customer.setId(resultSet.getInt("id"));
            Account account = accountService.getAccount(resultSet.getString("user_name"));
            customer.setAccount(account);
            customer.setFullName(resultSet.getString("full_name"));
            customer.setNumberPhone(resultSet.getString("number_phone"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }
}
