package repository;

import model.Account;
import model.Customer;
import model.Doctor;
import model.TypeAccount;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountRepository {
    BaseRepository baseRepository = new BaseRepository();

    public void addAccount(String username, String password, String email,String name) {
        String sql = "insert into account values (?,?,?,?)";
        String sqlCustomer = "insert into customer(full_name,user_name) value(?,?)";
        PreparedStatement preparedStatement = null;
        PreparedStatement preparedStatement1 = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);
            preparedStatement.setInt(4, 1);
            preparedStatement.executeUpdate();
            preparedStatement1 = connection.prepareStatement(sqlCustomer);
            preparedStatement1.setString(1,name);
            preparedStatement1.setString(2,username);
            preparedStatement1.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public boolean checkLogin(String username, String password){
        boolean isCheck = false;
        String sql = "SELECT * FROM medical_advising.account where user_name = ? and `password`=? ";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                isCheck = true;
            }else{
                isCheck = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isCheck;
    }
    public TypeAccount getTypeAccount(int id){
        TypeAccount typeAccount = null;
        String sql = "select * from type_account where id = ?";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                typeAccount = new TypeAccount(id,resultSet.getString("type_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return typeAccount;
    }
    public Account getAccount(String username){
        Account account = new Account();
        String sql = "select * from `account` where user_name = ?";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                account.setUserName(resultSet.getString("user_name"));
                account.setEmail(resultSet.getString("email"));
                account.setPassWord(resultSet.getString("password"));
                int id = resultSet.getInt("type_account");
                account.setTypeAccount(getTypeAccount(id));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }
    public Customer getCustomer(String username){
        Customer customer = new Customer();
        String sql = "select id,full_name from customer inner join " +
                " `account` on customer.user_name = `account`.user_name " +
                " where customer.user_name = ? ";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                customer.setFullName(resultSet.getString("full_name"));
                customer.setId(resultSet.getInt("id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }
    public Doctor getDoctor(String username){
        Doctor doctor = new Doctor();
        String sql = "select id,identity_card,full_name,education,specialized,number_phone,address from doctor inner join " +
                " `account` on doctor.user_name = `account`.user_name " +
                " where doctor.user_name = ? ";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                doctor.setId(resultSet.getInt("id"));
                doctor.setIdentityCard(resultSet.getString("identity_card"));
                doctor.setFullName(resultSet.getString("full_name"));
                doctor.setEducation(resultSet.getString("education"));
                doctor.setSpecialized(resultSet.getString("specialized"));
                doctor.setNumberPhone(resultSet.getString("number_phone"));
                doctor.setAddress(resultSet.getString("address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doctor;
    }
    public List<TypeAccount> getAllTypeAccount() {
        List<TypeAccount> typeAccounts = new ArrayList<>();
        try {
            Connection connection = baseRepository.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from type_account");
            TypeAccount typeAccount = null;
            while (resultset.next()) {
                typeAccount = new TypeAccount();
                typeAccount.setId(resultset.getInt("id"));
                typeAccount.setTypeName(resultset.getString("type_name"));
                typeAccounts.add(typeAccount);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return typeAccounts;
    }
}
