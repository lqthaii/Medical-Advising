package controller;

import model.Account;
import model.Admin;
import model.Customer;
import model.Doctor;
import service.AccountService;
import service.AdminService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AccountServlet", value = "/account")
public class AccountServlet extends HttpServlet {
    AccountService accountService = new AccountService();
    AdminService adminService = new AdminService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("actionUser");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "logout":
                logoutUser(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("actionUser");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "register":
                registerCustomer(request,response);
                break;
            case "login":
                loginUser(request,response);
                break;
            case "logout":
                logoutUser(request,response);
                break;
        }
    }
    private void registerCustomer(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String psw = request.getParameter("psw");
        String pswRepeat = request.getParameter("psw-repeat");
        String name = request.getParameter("name");
        String message = null;
        if(!psw.equals(pswRepeat)){
            message = "Mật khẩu bạn nhập không khớp";
            request.setAttribute("message",message);
            request.setAttribute("email",email);
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }else {
            this.accountService.addAccount(username,psw,email,name);
            message = "Đăng ký thành công. Vui lòng đăng nhập";
            request.setAttribute("message",message);
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }
    private void loginUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        String username = request.getParameter("username");
        String password = request.getParameter("psw");
        boolean isCheck = this.accountService.checkLogin(username,password);
        Account account = this.accountService.getAccount(username);

        if(isCheck){
            if(account.getTypeAccount().getId()==1){
                Customer customer = this.accountService.getCustomer(account.getUserName());
                HttpSession session = request.getSession();
                session.setAttribute("account",account);
                session.setAttribute("customer",customer);
                request.getRequestDispatcher("/index.jsp").forward(request,response);
            }else if(account.getTypeAccount().getId()==2){
                Doctor doctor = this.accountService.getDoctor(account.getUserName());
                HttpSession session = request.getSession();
                session.setAttribute("account",account);
                session.setAttribute("doctor",doctor);
                request.getRequestDispatcher("/index.jsp").forward(request,response);
            } else if(account.getTypeAccount().getId()==4){
                Admin admin = this.adminService.getAdmin(account.getUserName());
                admin.setAccount(account);
                HttpSession session = request.getSession();
                session.setAttribute("account",account);
                session.setAttribute("admin",admin);
                response.sendRedirect("/admin");
            }
        }else {
            String message = "Sai tài khoản hoặc mật khẩu";
            request.setAttribute("message",message);
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }
    private void logoutUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        HttpSession session = request.getSession();
        session.invalidate();
        request.getRequestDispatcher("/medical?ActionUser=login").forward(request,response);
    }
}