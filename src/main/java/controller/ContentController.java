package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by faisaljarkass on 29-10-2016.
 */
public class ContentController extends HttpServlet {
    private static Logger logger = Logger.getLogger(HomeController.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newContent = request.getParameter("newContent");

        logger.log(Level.INFO, "doPost start...");
        logger.log(Level.INFO, newContent);

        //TODO: Persist newly added content


        logger.log(Level.INFO, "alt godt");

        HttpSession session = request.getSession();

        //TODO: Fetch all content from datastore
        List<String> contentList = new ArrayList<String>();

        session.setAttribute("contentList", contentList);
        String redirect = response.encodeRedirectURL(request.getContextPath() + "/loginSuccessAdmin.jsp");
        response.sendRedirect(redirect);
    }
}
