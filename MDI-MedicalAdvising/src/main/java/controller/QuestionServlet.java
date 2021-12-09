package controller;

import model.Customer;
import model.Doctor;
import model.Question;
import service.QuestionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
@WebServlet(name = "question", urlPatterns = "/question")
public class QuestionServlet extends HttpServlet {
    QuestionService questionService = new QuestionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("actionUser");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "questionDetail":
                showDetailQuestion(request,response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "reply":
                inputReplyDoctor(request, response);
                break;
            case "question":
                inputQuestionCustomer(request,response);
                break;
        }
    }

    public void inputQuestionCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String question = request.getParameter("questionContent");
        int id = ((Customer) request.getSession().getAttribute("customer")).getId();
        String title = request.getParameter("title");
        //Xử lý thời gian đặt câu hỏi
        LocalDateTime current = LocalDateTime.now();
        //sử dụng class DateTimeFormatter để định dạng ngày giờ theo kiểu pattern
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
        //sử dụng phương thức format() để định dạng ngày giờ hiện tại rồi gán cho chuỗi formatted
        String formatted = current.format(formatter);
        //-----------------------------
        boolean isCheck = this.questionService.uploadQuestion(id, question, title,formatted);
        if (isCheck) {
            String success = "Bạn đã gửi câu hỏi thành công, Bác sĩ sẽ trả lời câu hỏi của bạn trong giây lát";
            request.setAttribute("success", success);
            request.setAttribute("fail", null);
            request.getRequestDispatcher("Customer/question.jsp").forward(request, response);
        } else {
            String fail = "Lỗi sever, vui lòng thử lại sau";
            request.setAttribute("fail", fail);
            request.setAttribute("success", null);
            request.getRequestDispatcher("Customer/question.jsp").forward(request, response);
        }

    }

    public void inputReplyDoctor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reply = request.getParameter("answerContent");
        Doctor doctor = (Doctor) request.getSession().getAttribute("doctor");
        int id = Integer.parseInt(request.getParameter("idQuestion"));
        Question question = this.questionService.getQuestion(id);
        question.setStatus(2);
        question.setDoctor(doctor);
        question.setAnswer(reply);
        //Xử lý thời gian đặt câu hỏi
        LocalDateTime current = LocalDateTime.now();
        //sử dụng class DateTimeFormatter để định dạng ngày giờ theo kiểu pattern
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
        //sử dụng phương thức format() để định dạng ngày giờ hiện tại rồi gán cho chuỗi formatted
        String formatted = current.format(formatter);
        //-----------------------------
        question.setTimeAnswer(formatted);
        boolean isCheck = this.questionService.updateQuestion(question);
        if (isCheck) {
            String success = "Trả lời câu hỏi thành công";
            List<Question> questions = this.questionService.getAllQuestionNoReply();
            request.setAttribute("questions",questions);
            request.setAttribute("success", success);
            request.setAttribute("fail", null);
            request.getRequestDispatcher("Doctor/question.jsp").forward(request, response);
        } else {
            String fail = "Lỗi sever, vui lòng thử lại sau";
            List<Question> questions = this.questionService.getAllQuestionNoReply();
            request.setAttribute("questions",questions);
            request.setAttribute("fail", fail);
            request.setAttribute("success", null);
            request.getRequestDispatcher("Doctor/question.jsp").forward(request, response);
        }
    }
    private void showDetailQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Question question = this.questionService.getQuestion(id);
        request.setAttribute("question",question);
        List<Question> questions = this.questionService.getAllQuestionReply();
        request.setAttribute("questions", questions);
        request.getRequestDispatcher("Customer/questiondetail.jsp").forward(request,response);
    }
}
