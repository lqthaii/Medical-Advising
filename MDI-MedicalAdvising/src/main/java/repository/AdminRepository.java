package repository;

import model.*;
import service.AccountService;

import javax.servlet.annotation.MultipartConfig;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@MultipartConfig
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

    public int QuestionrStatic() {
        int numberQuestion = 0;
        try {
            Connection connection = baseRepository.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select  count(id) as number_question from question;");
            while (resultset.next()) {
                numberQuestion = resultset.getInt("number_question");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return numberQuestion;
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
            if (row > 0 && deleteAccount(username))
                return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public boolean deleteAccount(String username) {
        String sql = "DELETE FROM Account WHERE user_name=?";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            int row = preparedStatement.executeUpdate();
            if (row > 0)
                return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public boolean editCustomer(int id, Customer customer) {
        String sql = "update customer set full_name= ? where id = ?";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, customer.getFullName());
            preparedStatement.setInt(2, id);
            int row = preparedStatement.executeUpdate();
            if (row > 0)
                return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public List<Customer> getFiveUser() {
        List<Customer> customers = new ArrayList<>();
        try {
            Connection connection = baseRepository.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from get5customer order by id; ");
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

    public boolean addDrug(Drug drug,InputStream image) {
        Connection connection = baseRepository.getConnection();
        try {
        String sql = "Insert into drugs(name,price,img,type_drug,description) value(?,?,?,?,?)";
        PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, drug.getName());
            pstm.setDouble(2,drug.getPrice());
            pstm.setBlob(3, image);
            pstm.setInt(4,drug.getTypeDrug().getId());
            pstm.setString(5, drug.getDescription());
           int row = pstm.executeUpdate();
           if(row>0)
               return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public TypeDrug getTypeDrug(int id){
        TypeDrug typeDrug = null;
        String sql = "select * from type_drug where id = ?";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                typeDrug = new TypeDrug(id, resultSet.getString("type_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return typeDrug;
    }

    public List<TypeDrug> getAllTypeDrug() {
        List<TypeDrug> typeDrugs = new ArrayList<>();
        try {
            Connection connection = baseRepository.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from type_drug");
            TypeDrug typeDrug = null;
            while (resultset.next()) {
                typeDrug = new TypeDrug();
                typeDrug.setId(resultset.getInt("id"));
                typeDrug.setName(resultset.getString("type_name"));
                typeDrugs.add(typeDrug);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return typeDrugs;
    }

    public List<Drug> getAllDrug(){
        List<Drug> drugs = new ArrayList<>();
        try {
            Connection connection = baseRepository.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from drugs");
            Drug drug = null;
            while (resultset.next()) {
                drug = new Drug();
                drug.setName(resultset.getString("name"));
                drug.setId(resultset.getInt("id"));
                drug.setPrice(resultset.getDouble("price"));
                drug.setTypeDrug(getTypeDrug(resultset.getInt("type_drug")));
                drug.setDescription(resultset.getString("description"));
                drug.setImage(getBase64img(resultset.getBlob("img")));
                drugs.add(drug);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return drugs;
    }
    private String getBase64img(Blob blob){
        InputStream inputStream = null;
        try {
            inputStream = blob.getBinaryStream();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;

        while (true) {
            try {
                if (!((bytesRead = inputStream.read(buffer)) != -1)) break;
            } catch (IOException e) {
                e.printStackTrace();
            }
            outputStream.write(buffer, 0, bytesRead);
        }

        byte[] imageBytes = outputStream.toByteArray();
        return Base64.getEncoder().encodeToString(imageBytes);
    }
    public boolean addTypeDrug(String name) {
        Connection connection = baseRepository.getConnection();
        try {
            String sql = "Insert into type_drug(type_name) value(?)";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);
            int row = pstm.executeUpdate();
            if(row>0)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
