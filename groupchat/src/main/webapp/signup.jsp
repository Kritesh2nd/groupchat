<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.*,java.util.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String sessemail = String.valueOf(session.getAttribute("uemail"));
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "blog";
String userid = "root";
String password = "";
String sql="",sql1="",sql2="",sql3="";
Connection con=null,con1=null,con2=null,con3=null;
Statement stm=null,stm1=null,stm2=null,stm3=null;
ResultSet rs=null,rs1=null,rs2=null,rs3=null;
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Log In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <style>
       body{background:#444;}
      .mainbody{height:auto;background:#444;color:#fff;}
      .titlebox{font-size:34px;font-weight:bold;padding:10px;height:70px;text-align: center;}
      .signupform{height:calc(100vh - 80px);padding-top:100px;}
      .inrsignupform{width:360px;}

      .inrsignupform{padding:20px;border-radius:5px;background:#333;}
      .textbox{font-size:18px;padding:3px 0;color:#ccc;}
      .textbox:first-child{font-size:26px;text-align: center;}
      
      .inpbox{padding:0 0 5px 0;}
      .inpinput{font-size:16px;padding:7px 10px;width:100%;border:var(--borx1);border-radius:3px;background:#444;color:#ccc;}

      .btnbox{padding:7px 0;}
      .signupbtn,.signinbtn{font-size:16px;background:#fff;padding:7px 15px;border:var(--borx2);border-radius:3px;cursor: pointer;
        transition:.3s;background: #555;color:#ccc;}
      .signinbtn{background:#444;color:#ccc;border:var(--borx1);}
    </style>
  </head>
  <body>
    <div class="mainbody bo flex">
      <div class="inrmainbody bo hw100 flex fdc aic">
        <div class="titlebox bo w100 flex aic jcc">Group Chat</div>
        <form action="signup" method="post" class="signupform bo w100 flex fdc aic">
          <div class="inrsignupform borx2 flex fdc">
            <div class="textbox bo">Sign Up</div>
            <div class="textbox bo">Name</div>
            <div class="inpbox bo">
              <input type="text" class="inpinput" placeholder="your name..." value="" name="name">
            </div>
            <div class="textbox bo">User name</div>
            <div class="inpbox bo">
              <input type="text" class="inpinput" placeholder="username..." value="" name="uname">
            </div>
            <div class="textbox bo">Password</div>
            <div class="inpbox bo">
              <input type="text" class="inpinput" placeholder="password..." value="" name="upass">
            </div>
            <div class="btnbox bo">
              <input type="submit" value="Sign Up" class="signupbtn w100">
            </div>
            <div class="btnbox bo flex">
              <a href="signin.jsp" class="signinbtn txt w100 flex jcc">Sign In</a>
            </div>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
