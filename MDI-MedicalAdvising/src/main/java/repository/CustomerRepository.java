package repository;

import model.Account;
import model.Customer;
import model.Drug;
import service.AccountService;
import service.AdminService;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class CustomerRepository {
    BaseRepository baseRepository = new BaseRepository();
    AccountService accountService = new AccountService();
    AdminService adminService = new AdminService();

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

    public List<Drug> getAllDrug() {
        List<Drug> drugs = new ArrayList<>();
        try {
            Connection connection = baseRepository.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from drugs");
            Drug drug = null;
            while (resultset.next()) {
                drug = new Drug();
                drug.setId(resultset.getInt("id"));
                drug.setPrice(resultset.getDouble("price"));
                drug.setName(resultset.getString("name"));
                drug.setDescription(resultset.getString("description"));
                drug.setTypeDrug(this.adminService.getTypeDrug(resultset.getInt("type_drug")));
                Blob blob = resultset.getBlob("img");
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);


                inputStream.close();
                outputStream.close();
                drug.setImage(base64Image);
                drugs.add(drug);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return drugs;
    }

    public List<Drug> getDrugByType(int id) {
        List<Drug> drugs = new ArrayList<>();
        String sql = "SELECT * FROM drugs where type_drug= ? ";
        PreparedStatement preparedStatement = null;
        Drug drug = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                drug = new Drug();
                drug.setId(resultSet.getInt("id"));
                drug.setPrice(resultSet.getDouble("price"));
                drug.setName(resultSet.getString("name"));
                drug.setDescription(resultSet.getString("description"));
                drug.setTypeDrug(this.adminService.getTypeDrug(resultSet.getInt("type_drug")));
                Blob blob = resultSet.getBlob("img");
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);


                inputStream.close();
                outputStream.close();
                drug.setImage(base64Image);
                drugs.add(drug);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return drugs;
    }
}
