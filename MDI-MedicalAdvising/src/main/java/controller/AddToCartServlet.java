package controller;

import model.Drug;
import model.Item;
import model.Order;
import model.TypeDrug;
import service.AdminService;
import service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddToCartServlet", value = "/cart")
public class AddToCartServlet extends HttpServlet {
    CustomerService customerService = new CustomerService();
    AdminService adminService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("actionUser");
        if (action == null) {
            action = "";
        }
        if (request.getSession().getAttribute("account") == null) {
            response.sendRedirect("error.jsp");
        } else {
            switch (action) {
                case "add":
                    addToCart(request, response);
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int quantity = 1;
        int id;
        if (request.getParameter("drugId") != null) {
            id = Integer.parseInt(request.getParameter("drugId"));
            Drug drug = this.customerService.getDrug(id);
            if (drug != null) {
                if (request.getParameter("quantity") != null) {
                    quantity = Integer.parseInt(request.getParameter("quantity"));
                }
                HttpSession session = request.getSession();
                if (session.getAttribute("order") == null) {
                    Order order = new Order();
                    List<Item> listItems = new ArrayList<Item>();
                    Item item = new Item();
                    item.setQuantity(quantity);
                    item.setDrug(drug);
                    item.setPrice(drug.getPrice());
                    listItems.add(item);
                    order.setItemList(listItems);
                    session.setAttribute("order", order);
                    session.setAttribute("totalPrice", totalPrice(request,response));
                    session.setAttribute("orderNum", listItems.size());
                } else {
                    Order order = (Order) session.getAttribute("order");
                    List<Item> listItems = order.getItemList();
                    boolean check = false;
                    for (Item item : listItems) {
                        if (item.getDrug().getId() == drug.getId()) {
                            item.setQuantity(item.getQuantity() + quantity);
                            check = true;
                        }
                    }
                    if (check == false) {
                        Item item = new Item();
                        item.setQuantity(quantity);
                        item.setDrug(drug);
                        item.setPrice(drug.getPrice());
                        listItems.add(item);
                    }
                    session.setAttribute("order", order);
                    session.setAttribute("totalPrice", totalPrice(request,response));
                    session.setAttribute("orderNum", listItems.size());
                }
                List<Drug> drugs = this.customerService.getAllDrug();
                List<TypeDrug> typeDrugs = this.adminService.getAllTypeDrug();
                request.setAttribute("drugs", drugs);
                request.setAttribute("typeDrugs", typeDrugs);
                request.getRequestDispatcher("Customer/store.jsp").forward(request, response);
            }
        } else {
            List<Drug> drugs = this.customerService.getAllDrug();
            List<TypeDrug> typeDrugs = this.adminService.getAllTypeDrug();
            request.setAttribute("drugs", drugs);
            request.setAttribute("typeDrugs", typeDrugs);
            request.getRequestDispatcher("Customer/store.jsp").forward(request, response);
        }
    }

    private double totalPrice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("order");
        List<Item> list = order.getItemList();
        double price = 0;
        for (Item item : list) {
            price += item.getPrice() * item.getQuantity();
        }
        return price;
    }
}
