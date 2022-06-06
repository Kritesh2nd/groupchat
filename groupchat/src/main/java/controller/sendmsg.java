package controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
@WebServlet(name = "sendmsg", urlPatterns = {"/sendmsg"})
public class sendmsg extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
//        from here
            String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String database = "groupchat";
            String userid = "root";
            String password = "";
            String sql="";
            Connection con=null;
            Statement stm=null;
            ResultSet rs=null;
            String msg="",unamestr="";
            int idint=0;
            msg = request.getParameter("message");
            unamestr = request.getParameter("uname");
            out.print("hello white "+msg+" ");
            try{
                Class.forName("com.mysql.jdbc.Driver");  
                con = DriverManager.getConnection(connectionUrl+database, userid, password);
                stm=con.createStatement();
                sql ="insert into message(uid,message)values('"+unamestr+"','"+msg+"');";
                stm.executeUpdate(sql);
                con.close();
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