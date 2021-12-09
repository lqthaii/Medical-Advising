package controller;

import model.Account;
import model.Customer;
import model.TypeAccount;
import service.AccountService;
import service.AdminService;
import service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {
    AdminService adminService = new AdminService();
    CustomerService customerService = new CustomerService();
    AccountService accountService = new AccountService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("actionUser");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addCustomer(request,response);
                break;
            case "editCustomer":
                editCustomer(request,response);
                break;
            default:
                showControll(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("actionUser");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "customer":
                showCustomerController(request, response);
                break;
            case "editCustomer":
                showeditCustomer(request, response);
                break;
            case "deleteCustomer":
                deleteCustomer(request, response);
                break;
            case "addCustomer":
                showFormAddCustomer(request,response);
                break;
            default:
                showControll(request, response);
        }
    }

    private void showControll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int doctorStatic = this.adminService.DoctorStatic();
        int customerStatic = this.adminService.CustomerStatic();
        request.setAttribute("doctorStatic", doctorStatic);
        request.setAttribute("customerStatic", customerStatic);
        request.getRequestDispatcher("/Admin/index.jsp").forward(request, response);
    }

    private void showCustomerController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = this.adminService.getAllCustomer();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("/Admin/user.jsp").forward(request, response);
    }

    private void showeditCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.getCustomer(id);
        List<Customer> customers = this.adminService.getAllCustomer();
        List<TypeAccount> typeAccounts = this.accountService.getAllTypeAccount();
        request.setAttribute("action", "edit");
        request.setAttribute("typeAccounts", typeAccounts);
        request.setAttribute("customers", customers);
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("/Admin/user.jsp").forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.getCustomer(id);
        boolean isCheck = this.adminService.deleteCustomer(id, customer.getAccount().getUserName());
        if (isCheck) {
            List<Customer> customers = this.adminService.getAllCustomer();
            List<TypeAccount> typeAccounts = this.accountService.getAllTypeAccount();
            request.setAttribute("typeAccounts", typeAccounts);
            request.setAttribute("customers", customers);
            request.getRequestDispatcher("/Admin/user.jsp").forward(request, response);
        } else {
            response.sendRedirect("/Admin/index.jsp");
        }
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String psw = request.getParameter("psw");
        String name = request.getParameter("name");
        this.accountService.addAccount(username, psw, email, name);
        response.sendRedirect("/admin");
    }
    private void showFormAddCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("action", "add");
        List<Customer> customers = this.adminService.getAllCustomer();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("/Admin/user.jsp").forward(request, response);
    }
    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int typeAccount = Integer.parseInt(request.getParameter("typeAccount"));
        if(typeAccount == 1){
            int id = Integer.parseInt(request.getParameter("id"));
            Customer customer = this.customerService.getCustomer(id);
            String name = request.getParameter("name");
            customer.setFullName(name);
            boolean isCheck = this.adminService.editCustomer(id,customer);
        }
    }
}

