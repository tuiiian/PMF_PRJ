package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	
        String uname = request.getParameter("name");
        String umail = request.getParameter("email");
        String upwd = request.getParameter("pass");
        String ure_pwd = request.getParameter("re_pass");
        String uphone = request.getParameter("contact");

        RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
        String status = "failed"; // Default status

        try (Connection con = DatabaseManager.getConnection()) {
            PreparedStatement pst = con.prepareStatement(
                    "insert into users(uname, umail, upwd, ure_pwd, uphone) values (?, ?, ?, ?, ?)");
            pst.setString(1, uname);
            pst.setString(2, umail);
            pst.setString(3, upwd);
            pst.setString(4, ure_pwd);
            pst.setString(5, uphone);

            int rowCount = pst.executeUpdate();

            if (rowCount > 0) {
                status = "success";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception and set an appropriate error message
        }

        request.setAttribute("status", status);
        dispatcher.forward(request, response);
    }
}
