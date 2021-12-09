package repository;

import model.Account;
import model.Customer;
import model.Doctor;
import service.AccountService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DoctorRepository {
    BaseRepository baseRepository = new BaseRepository();
    AccountService accountService = new AccountService();
    public Doctor getDoctor(int id) {
        String sql = "SELECT * FROM doctor where id= ? ";
        PreparedStatement preparedStatement = null;
        Doctor doctor = new Doctor();
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                doctor.setId(resultSet.getInt("id"));
                Account account = accountService.getAccount(resultSet.getString("user_name"));
                doctor.setAccount(account);
                doctor.setEducation(resultSet.getString("education"));
                doctor.setIdentityCard(resultSet.getString("identity_card"));
                doctor.setSpecialized(resultSet.getString("specialized"));
                doctor.setFullName(resultSet.getString("full_name"));
                doctor.setAddress(resultSet.getString("address"));
                doctor.setNumberPhone(resultSet.getString("number_phone"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doctor;
    }
}
