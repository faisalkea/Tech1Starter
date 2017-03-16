package main.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by faisaljarkass on 22-10-2016.
 */
public class HomeController extends HttpServlet {

    private static Logger logger = Logger.getLogger(HomeController.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        logger.log(Level.INFO, "doPost start...");
        logger.log(Level.INFO, "Username: " + username);
        logger.log(Level.INFO, "Password: " + password);
        logger.log(Level.INFO, "Checkbox: " + request.getParameter("rememberMe"));


        if (username.equals(username)) {
            //TODO: Common for both user and admin and username to the request


            if (password.equals(password)) {



                RequestDispatcher rd = request.getRequestDispatcher("/loginSuccessAdmin.jsp");
                rd.forward(request, response);
            } else {

                RequestDispatcher rd = request.getRequestDispatcher("/loginSuccess.jsp");
                rd.forward(request, response);
            }
        } else {
            logger.log(Level.INFO, "creds invalid");
            request.setAttribute("errorMessage", "true");
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        }

    }
}
