package com.pioneers.vcrn.webviews.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pioneers.vcrn.data.Account;
import com.pioneers.vcrn.request.LoginRequest;
import com.pioneers.vcrn.webviews.helper.RestHelper;

public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        LoginRequest loginRequest = new LoginRequest();
        loginRequest.setUsername(request.getParameter("username"));
        loginRequest.setPassword(request.getParameter("password"));
        Account account = null;
        try {
            account = (Account) new RestHelper().callRestService("/facade/loginget", "GET", null, Account.class);
            if (account != null)
                System.out.println(account.toString());
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        request.setAttribute("account", account);

        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

}
