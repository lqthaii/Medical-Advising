package controller;

import model.Customer;
import model.Question;
import service.AccountService;
import service.QuestionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "medicalServlet", urlPatterns = {"", "/medical"})
public class MedicalServlet extends HttpServlet {
    AccountService accountService = new AccountService();
    QuestionService questionService = new QuestionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("actionUser");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "pharma":
                listDrug(request, response);
                break;
            case "question":
                showFormQuestion(request, response);
                break;
            case "signup":
                showFormRegister(request, response);
                break;
            case "login":
                showFormLogin(request, response);
                break;
            case "profile":
                showProfile(request, response);
                break;
            case "reply":
                showListQuestion(request, response);
                break;
            default:
                index(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void listDrug(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("Customer/store.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void index(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("/index.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormQuestion(HttpServletRequest request, HttpServletResponse response) {
        List<Question> questions = this.questionService.getAllQuestionReply();
        try {
            request.setAttribute("questions", questions);
            request.getRequestDispatcher("Customer/question.jsp").forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

    private void showFormRegister(HttpServletRequest request, HttpServletResponse response) {
        try {
            String message = null;
            request.setAttribute("message", message);
            try {
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormLogin(HttpServletRequest request, HttpServletResponse response) {
        try {
            String message = null;
            request.setAttribute("message", message);
            try {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showProfile(HttpServletRequest request, HttpServletResponse response) {
        try {
            String message = null;
            request.setAttribute("message", message);
            try {
                Customer customer = this.accountService.getCustomer(((Customer) request.getSession().getAttribute("customer")).getAccount().getUserName());
                request.setAttribute("customer", customer);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListQuestion(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Question> questions = this.questionService.getAllQuestionNoReply();
            request.setAttribute("questions", questions);
            request.getRequestDispatcher("Doctor/question.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
    }
}
