package controller;

import model.*;
import service.AccountService;
import service.AdminService;
import service.CustomerService;
import service.QuestionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.List;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
@WebServlet(name = "AdminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {
    AdminService adminService = new AdminService();
    CustomerService customerService = new CustomerService();
    AccountService accountService = new AccountService();
    QuestionService questionService = new QuestionService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("actionUser");
        if (action == null) {
            action = "";
        }
        if (request.getSession().getAttribute("account") == null) {
            response.sendRedirect("error.jsp");
        } else {
            switch (action) {
                case "add":
                    addCustomer(request, response);
                    break;
                case "editCustomer":
                    editCustomer(request, response);
                    break;
                case "addDrug":
                    addDrug(request, response);
                    break;
                case "addType":
                    addTypeDrug(request, response);
                    break;
                case "editDrug":
                    editDrug(request,response);
                    break;
                default:
                    showControll(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("actionUser");
        if (action == null) {
            action = "";
        }
        if (request.getSession().getAttribute("account") == null) {
            response.sendRedirect("error.jsp");
        } else {
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
                case "deleteDrug":
                    deleteDrug(request, response);
                    break;
                case "addCustomer":
                    showFormAddCustomer(request, response);
                    break;
                case "drugManager":
                    showDrugManager(request, response);
                    break;
                case "addDrug":
                    showFormAddDrug(request, response);
                    break;
                case "addTypeDrug":
                    showFormAddTypeDrug(request, response);
                    break;
                case "editDrug":
                    showEditDrug(request, response);
                    break;
                case "doctor":
                    showDoctorController(request,response);
                    break;
                default:
                    showControll(request, response);
            }
        }
    }

    private void showControll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int doctorStatic = this.adminService.DoctorStatic();
        int customerStatic = this.adminService.CustomerStatic();
        int questionStatic = this.adminService.QuestionrStatic();
        List<Customer> customers = this.adminService.getFiveUser();
        List<TypeDrug> typeDrugs = this.adminService.getAllTypeDrug();
        request.setAttribute("typeDrugs", typeDrugs);
        request.setAttribute("doctorStatic", doctorStatic);
        request.setAttribute("customerStatic", customerStatic);
        request.setAttribute("questionStatic", questionStatic);
        List<Question> questions = this.questionService.getFiveQuestion();
        request.setAttribute("questions", questions);
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("/Admin/index.jsp").forward(request, response);
    }

    private void showCustomerController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = this.adminService.getAllCustomer();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("/Admin/user.jsp").forward(request, response);
    }
    private void showDoctorController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Doctor> doctors = this.adminService.getAllDoctor();
        request.setAttribute("doctors", doctors);
        request.getRequestDispatcher("/Admin/doctor.jsp").forward(request, response);
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

    private void showEditDrug(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Drug drug = this.customerService.getDrug(id);
        List<Drug> drugs = this.adminService.getAllDrug();
        List<TypeDrug> typeDrugs = this.adminService.getAllTypeDrug();
        request.setAttribute("typeDrugs", typeDrugs);
        request.setAttribute("drugs", drugs);
        request.setAttribute("action", "edit");
        request.setAttribute("drug", drug);
        request.getRequestDispatcher("/Admin/medicine.jsp").forward(request, response);
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
        boolean isCheck = this.accountService.addAccount(username, psw, email, name);
        if (isCheck) {
            String messeger = "Bạn đã thêm thuốc tên " + name + " thành công!";
            request.setAttribute("messeger", messeger);
        } else {
            String error = "Lỗi sever vui lòng thử lại sau";
            request.setAttribute("error", error);
        }
        List<Customer> customers = this.adminService.getAllCustomer();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("/Admin/user.jsp").forward(request, response);
    }

    private void showFormAddCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("action", "add");
        List<Customer> customers = this.adminService.getAllCustomer();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("/Admin/user.jsp").forward(request, response);
    }

    private void showFormAddDrug(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Drug> drugs = this.adminService.getAllDrug();
        List<TypeDrug> typeDrugs = this.adminService.getAllTypeDrug();
        request.setAttribute("drugs", drugs);
        request.setAttribute("typeDrugs", typeDrugs);
        request.setAttribute("action", "add");
        request.getRequestDispatcher("/Admin/medicine.jsp").forward(request, response);
    }

    private void showFormAddTypeDrug(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Drug> drugs = this.adminService.getAllDrug();
        request.setAttribute("drugs", drugs);
        request.setAttribute("action", "addType");
        request.getRequestDispatcher("/Admin/medicine.jsp").forward(request, response);
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        String name = request.getParameter("name");
        Account account = this.accountService.getAccount(request.getParameter("username"));
        account.setEmail(request.getParameter("email"));
        String birthday = request.getParameter("birthday");
        String numberPhone = request.getParameter("numberphone");
        Customer customer = new Customer(id, null, name, numberPhone, birthday, account);
        boolean isCheck = this.adminService.editCustomer(customer);
        if (isCheck) {
            String success = "Sửa thông tin người dùng thành công";
            request.setAttribute("messeger", success);
        } else {
            String fail = "Sửa thông tin thất bại!";
            request.setAttribute("error", fail);
        }
        List<Customer> customers = this.adminService.getAllCustomer();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("Admin/user.jsp").forward(request, response);
    }

    private void editDrug(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("idDrug");
        int id = Integer.parseInt(idStr);
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        TypeDrug typeDrug = this.adminService.getTypeDrug(Integer.parseInt(request.getParameter("type")));
        String price = request.getParameter("price");
        Part part = request.getPart("image");
        InputStream image = part.getInputStream();
        Drug drug = new Drug();
        drug.setId(id);
        drug.setName(name);
        drug.setTypeDrug(typeDrug);
        drug.setDescription(description);
        drug.setPrice(Double.parseDouble(price));
        boolean isCheck = this.adminService.editDrug(drug, image);
        if (isCheck) {
            String messeger = "Bạn đã sửa thuốc tên " + name + " thành công!";
            request.setAttribute("messeger", messeger);
        } else {
            String error = "Lỗi sever vui lòng thử lại sau";
            request.setAttribute("error", error);
        }
        List<Drug> drugs = this.adminService.getAllDrug();
        request.setAttribute("drugs", drugs);
        request.getRequestDispatcher("/Admin/medicine.jsp").forward(request, response);
    }

    private void showDrugManager(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Drug> drugs = this.adminService.getAllDrug();
        request.setAttribute("drugs", drugs);
        request.getRequestDispatcher("/Admin/medicine.jsp").forward(request, response);
    }

    private void addDrug(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        TypeDrug typeDrug = this.adminService.getTypeDrug(Integer.parseInt(request.getParameter("type")));
        String price = request.getParameter("price");
        Part part = request.getPart("image");
        InputStream image = part.getInputStream();
        Drug drug = new Drug();
        drug.setName(name);
        drug.setTypeDrug(typeDrug);
        drug.setDescription(description);
        drug.setPrice(Double.parseDouble(price));
        boolean isCheck = this.adminService.addDrug(drug, image);
        if (isCheck) {
            String messeger = "Bạn đã thêm thuốc tên " + name + " thành công!";
            request.setAttribute("messeger", messeger);
        } else {
            String error = "Lỗi sever vui lòng thử lại sau";
            request.setAttribute("error", error);
        }
        List<Drug> drugs = this.adminService.getAllDrug();
        request.setAttribute("drugs", drugs);
        request.getRequestDispatcher("/Admin/medicine.jsp").forward(request, response);
    }

    private void addTypeDrug(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeName = request.getParameter("typeName");
        boolean isCheck = this.adminService.addTypeDrug(typeName);
        if (isCheck) {
            String messeger = "Bạn đã thêm loại thuốc " + typeName + " thành công!";
            request.setAttribute("messeger", messeger);
        } else {
            String error = "Lỗi sever vui lòng thử lại sau";
            request.setAttribute("error", error);
        }
        List<Drug> drugs = this.adminService.getAllDrug();
        request.setAttribute("drugs", drugs);
        request.getRequestDispatcher("/Admin/medicine.jsp").forward(request, response);
    }

    private void deleteDrug(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Drug drug = this.customerService.getDrug(id);
        boolean isCheck = this.adminService.deleteDrug(drug);
        if (isCheck) {
            List<Drug> drugs = this.adminService.getAllDrug();
            request.setAttribute("drugs", drugs);
            request.getRequestDispatcher("/Admin/medicine.jsp").forward(request, response);
        } else {
            List<Drug> drugs = this.adminService.getAllDrug();
            request.setAttribute("drugs", drugs);
            request.getRequestDispatcher("/Admin/medicine.jsp").forward(request, response);
        }
    }
}


