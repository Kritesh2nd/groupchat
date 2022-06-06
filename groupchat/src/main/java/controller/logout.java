package controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "logout", urlPatterns = {"/logout"})
public class logout extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
//        from here
            
            String inpusrname="";
            inpusrname = request.getParameter("inpusername");
//            "Select * from users where USERNAME=? and PASSWORD=?"
            try{
                HttpSession session=request.getSession(false);  
                session.removeAttribute("uemail");
                response.sendRedirect("index.jsp");
            }
            catch(Exception ex) {
                System.out.println(ex.toString());
            }
//            to here
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}