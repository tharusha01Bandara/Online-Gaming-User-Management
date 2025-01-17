package com.uniquedeveloper.registratration;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uemail = request.getParameter("username");
        String upwd = request.getParameter("password");

        HttpSession session = request.getSession();
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersinfodb?useSSL=false", "root", "200104603632");

            PreparedStatement pst = con.prepareStatement("select utype, uname from gaminusers where uemail = ? and upwd = ?");

            pst.setString(1, uemail);
            pst.setString(2, upwd);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                String utype = rs.getString("utype");
                String userName = rs.getString("uname");



                // Set the utype and userName in the session
                session.setAttribute("utype", utype);
                session.setAttribute("userName", userName);

                // Redirect to the corresponding home page
                if ("admin".equalsIgnoreCase(utype)) {
                    response.sendRedirect("admin_home.jsp");
                } else if ("manager".equalsIgnoreCase(utype)) {
                    response.sendRedirect("manager_home.jsp");
                } else if ("player".equalsIgnoreCase(utype)) {
                    response.sendRedirect("player_home.jsp");
                } else if ("gamedeveloper".equalsIgnoreCase(utype)) {
                    response.sendRedirect("gamedeveloper_home.jsp");
                } else {
                    // Handle other cases or redirect to a default page
                    response.sendRedirect("index.jsp");
                }
            } else {
                request.setAttribute("status", "failed");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
