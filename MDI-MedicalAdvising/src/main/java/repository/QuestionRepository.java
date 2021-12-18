package repository;

import model.Customer;
import model.Doctor;
import model.Question;
import service.CustomerService;
import service.DoctorService;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuestionRepository {
    BaseRepository baseRepository = new BaseRepository();
    CustomerService customerService = new CustomerService();
    DoctorService doctorService = new DoctorService();
    public boolean uploadQuestion(int id, String question, String title, String timeQuestion) {
        String sql = "insert into question(question,status,id_customer, title,time_question) values (?,?,?,?,?)";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, question);
            preparedStatement.setInt(2, 1);
            preparedStatement.setInt(3, id);
            preparedStatement.setString(4, title);
            preparedStatement.setString(5, timeQuestion);
            int row = preparedStatement.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Question> getAllQuestionNoReply() {
        List<Question> questions = new ArrayList<>();
        try {
            Connection connection = baseRepository.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from question where status = 1");
            while (resultset.next()) {
                Question question = new Question();
                question.setId(resultset.getInt("id"));
                question.setCustomer(this.customerService.getCustomer(resultset.getInt("id_customer")));
                question.setQuestion(resultset.getString("question"));
                question.setTitle(resultset.getString("title"));
                questions.add(question);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return questions;
    }
    public List<Question> getAllQuestionReply() {
        List<Question> questions = new ArrayList<>();
        try {
            Connection connection = baseRepository.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from question where status = 2");
            while (resultset.next()) {
                Question question = new Question();
                question.setId(resultset.getInt("id"));
                question.setCustomer(this.customerService.getCustomer(resultset.getInt("id_customer")));
                question.setDoctor(this.doctorService.getDoctor(resultset.getInt("id_doctor")));
                question.setQuestion(resultset.getString("question"));
                question.setTitle(resultset.getString("title"));
                question.setAnswer(resultset.getString("reply"));
                question.setStatus(resultset.getInt("status"));
                questions.add(question);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return questions;
    }
    public Question getQuestion(int id) {
        Question question = new Question();
        String sql = "select * from question where id=?";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,id);
            ResultSet resultset = preparedStatement.executeQuery();
            while(resultset.next()){
                question.setId(resultset.getInt("id"));
                question.setCustomer(this.customerService.getCustomer(resultset.getInt("id_customer")));
                question.setQuestion(resultset.getString("question"));
                question.setTitle(resultset.getString("title"));
                question.setDoctor(this.doctorService.getDoctor(resultset.getInt("id_doctor")));
                question.setAnswer(resultset.getString("reply"));
                question.setTimeAnswer(resultset.getString("time_answer"));
                question.setTimeQuestion(resultset.getString("time_question"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return question;
    }
    public boolean updateQuestion(Question question){
        String sql = "update question set id_doctor = ?, reply = ?, status =?, time_answer=? where id = ?;";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,question.getDoctor().getId());
            preparedStatement.setString(2, question.getAnswer());
            preparedStatement.setInt(3,2);
            preparedStatement.setString(4,question.getTimeAnswer());
            preparedStatement.setInt(5,question.getId());
            int row = preparedStatement.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public List<Question> getFiveQuestion() {
        List<Question> questions = new ArrayList<>();
        try {
            Connection connection = baseRepository.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from get5question order by id; ");
            Question question = null;
            while (resultset.next()) {
                int id = resultset.getInt("id");
                Customer customer = this.customerService.getCustomer(resultset.getInt("id_customer"));
                Doctor doctor = this.doctorService.getDoctor(resultset.getInt("id_doctor"));
                String questionCustomer = resultset.getString("question");
                String timeQuestion = resultset.getString("time_question");
                String timeAnswer = resultset.getString("time_answer");
                String title = resultset.getString("title");
                String reply = resultset.getString("reply");
                int status = resultset.getInt("status");
                question = new Question(id, title, customer,doctor,status, questionCustomer,reply,timeQuestion,timeAnswer);
                questions.add(question);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return questions;
    }
}
