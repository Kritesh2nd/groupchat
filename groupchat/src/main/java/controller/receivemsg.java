package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import com.google.gson.Gson;
@WebServlet(name = "receivemsg", urlPatterns = {"/receivemsg"})
public class receivemsg extends HttpServlet {
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
            String sql="",sql1="",sql2="",sql3="";
            Connection con=null,con1=null,con2=null,con3=null;
            Statement stm=null,stm1=null,stm2=null,stm3=null;
            ResultSet rs=null,rs1=null,rs2=null,rs3=null;
            String tblname="",tblusername="",tblpassword="",newarray="";
            Gson gson = new Gson();
            String tblmessage="",tbluid="";
            int count=0,tblid=0,msgcount=0;
//            inpusrname = request.getParameter("inpusername");
//            "Select * from users where USERNAME=? and PASSWORD=?"
            try{
                Class.forName("com.mysql.jdbc.Driver");  
                con = DriverManager.getConnection(connectionUrl+database, userid, password);
                stm=con.createStatement();
                sql ="select * from message;";
                rs = stm.executeQuery(sql);
                while(rs.next()){
                    msgcount++;
                }
                String[][] arrinfo = new String[msgcount][3];
                rs = stm.executeQuery(sql);
                while(rs.next()){
                    tblid = rs.getInt("id");
                    tbluid = rs.getString("uid");
                    tblmessage = rs.getString("message");
                    arrinfo[count][0] = Integer.toString(tblid);
                    arrinfo[count][1] = tbluid;
                    arrinfo[count][2] = tblmessage;
                    count++;
                }
                newarray = gson.toJson(arrinfo);
                out.print(newarray);
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