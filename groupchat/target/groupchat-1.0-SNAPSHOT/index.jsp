<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.*,java.util.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String sessemail="",sessname="",sesspass="",sessutype="";
int sessid=0;
sessemail = String.valueOf(session.getAttribute("uemail"));
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "groupchat";
String userid = "root";
String password = "";
String sql="",sql1="",sql2="",sql3="";
Connection con=null,con1=null,con2=null,con3=null;
Statement stm=null,stm1=null,stm2=null,stm3=null;
ResultSet rs=null,rs1=null,rs2=null,rs3=null;
String opt="";
opt = request.getParameter("opt");
if(sessemail.equals("null")){
    response.sendRedirect("signin.jsp");
}
else{
try{
    Class.forName("com.mysql.jdbc.Driver");  
    con = DriverManager.getConnection(connectionUrl+database, userid, password);
    stm=con.createStatement();
    sql ="select * from userinfo where username='"+sessemail+"';";
    rs = stm.executeQuery(sql);
    while(rs.next()){
        sessid = rs.getInt("id");
        sessname = rs.getString("name");
        sesspass = rs.getString("password");
        sessutype = rs.getString("utype");
        
    }
    con.close();
}
catch(Exception ex) {
    System.out.println(ex.toString());
    out.print("ERROR: "+ex.toString());
}
%>
<!DOCTYPE html>
<html>
  <head>
    <title><%=sessemail%> | Group Chat</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <style>
      .mainbody{height:100vh;background:#444;color:#fff;}
      .mbody{height:96vh;min-width:720px;width:50vw;padding:20px;background:#333;border-radius:10px;}

      .r2lvl1{height:8%;}
      .r2lvl2{height:84%;overflow:auto;padding:10px 0 0 0;}
      .r2lvl3{height:8%;}
      .r2l1A,.r2l1B{width:50%;}
      .r2l1A{font-size:36px;}
      .r2btn1{font-size:18px;padding:6px 12px;border-radius:5px;cursor: pointer;background:#444;transition:.3s;}
      .r2btn1:hover{background:#555;}

      .r2l3A{width:82%;}
      .r2input{font-size:17px;padding:5px 10px;width:100%;border-radius:5px;color:#bbb;background:#444;}
      .r2l3B{width:15%;}
      .r2l3btn1{font-size:17px;padding:6px;width:100%;text-align: center;border-radius:5px;background:#444;}
      .r2l3btn1:hover{background:#555;cursor: pointer;}

      .r2l2mbox{padding-bottom:15px;}      
      .r2l2b1{width:8%;}
      .r2imgbox1{height:45px;width:45px;overflow: hidden;border-radius:50px;box-shadow: 0 0 4px #ccc;margin:2px;}
      .r2l2b2{width:70%;}
      .r2l2txt1{font-size:15px;font-weight:600;padding:5px 0;color:#ddd;}
      .r2l2txt2{font-size:15px;color:#bbb;}


      .r3lvl2{height:92%;padding-top:20px;}
      .r3l2links{font-size:20px;text-align: center;padding:5px;margin:10px 0;cursor: pointer;}

      .r42l2box0{padding-bottom:15px;}
      .r4lvl2{height:92%;padding-top:20px;}
      .r4inp0{font-size:16px;background:#555;padding:5px 10px;border-radius:5px;width:100%;color:#ccc;}
      .r4l2b1btn0{font-size:16px;background:#555;padding:5px 10px;border-radius:5px;width:10%;cursor: pointer;color:#ccc;}
      .r4updatebtn,.r4cancelbtn{font-size:16px;padding:5px 10px;border-radius:5px;background:#444;color:#ccc;
        margin-right:10px;cursor:pointer;transition:.3s;}
      .r4updatebtn:hover,.r4cancelbtn:hover{background:#555;}
    </style>
  </head>
  <body>
    <div class="mainbody bor">
      <div class="inrmainbody bor hw100 flex jcc aic">
        <div class="mbody borx3">
          <div class="inrmbody bor hw100 rel">
            <!-- ============================================= ROOM 1 ============================================= -->
            <div class="room1 rooms bor abs hw100 none"></div>
            <!-- ============================================= ROOM 2 ============================================= -->
            <div class="room2 rooms bo abs hw100">
              <div class="r2lvl1 flex bor">
                <div class="r2l1A bor flex aic">Chat Box</div>
                <div class="r2l1B bor flex aic jcfe">
                  <div class="r2btn1 borx2 menubtn">Menu</div>
                </div>
              </div>
              <div class="r2lvl2 flex bor fdc">
                <!-- ///////////////////////// from here ///////////////////////// -->
                <div class="r2l2mbox bor flex">
                  <div class="r2l2b1 bor">
                    <div class="r2imgbox1 bor">
                      <img src="image/person.jpg" alt="" class="r2img1 w100">
                    </div>
                  </div>
                  <div class="r2l2b2 bor flex fdc">
                    <div class="r2l2txt1 r2l2txt0 bor">lamp</div>
                    <div class="r2l2txt2 r2l2txt0 bor">
                      Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem adipisci omnis assumenda. Eius sint commodi asperiores, saepe consequuntur sed inventore aspernatur ut distinctio tempore harum aperiam quidem repellendus eos dignissimos?
                    </div>
                  </div>
                  <div class="r2l2b3 bor"></div>
                </div>
                <!-- ///////////////////////// to here ///////////////////////// -->
              </div>
              <div class="r2lvl3 flex bor flex jcsb">
                <div class="r2l3A bor flex fdc jcfe">
                  <input type="text" class="r2input borx2" placeholder="your message...">
                </div>
                <div class="r2l3B bor flex fdc jcfe">
                  <div class="r2l3btn1 borx2">Send</div>
                </div>
              </div>
            </div>
            <!-- ============================================= ROOM 3 ============================================= -->
            <div class="room3 rooms bor abs hw100 none">
              <div class="r2lvl1 flex bor">
                <div class="r2l1A bor flex aic">Menu</div>
                <div class="r2l1B bor flex aic jcfe">
                  <div class="r2btn1 borx2 homebtn">Home</div>
                </div>
              </div>
              <div class="r3lvl2 flex fdc bor">
                <div class="r3l2link1 r3l2links bor txtw homebtn1">Home</div>
                <div class="r3l2link1 r3l2links bor txtw profilebtn">Profile</div>
                <div class="r3l2link1 r3l2links bor txtw settingbtn">Setting</div>
                <a href="logout" class="r3l2link1 r3l2links bor txtw logoutbtn">Log Out</a>
              </div>
            </div>
            <!-- ============================================= ROOM 4 ============================================= -->
            <div class="room4 rooms bor abs hw100 none">
              <div class="r2lvl1 flex bor">
                <div class="r2l1A bor flex aic">Profile</div>
                <div class="r2l1B bor flex aic jcfe">
                  <div class="r2btn1 borx2 homebtn2">Home</div>
                </div>
              </div>
              <div class="r4lvl2 flex fdc bor">
                <form action="updateinfo" method="post" class="r4form bor hw100">
                  <div class="r42l2box1 r42l2box0 bor"></div>
                  <div class="r42l2box2 r42l2box0 bor flex jcsb">
                      <input type="text" class="r4inp1 r4inp0 borx2" placeholder="name..." value="<%=sessname%>" name="name">
                    <!-- <div class="r4l2b1btn1 r4l2b1btn0 bor flex aic jcc">Edit</div> -->
                  </div>
                  <div class="r42l2box2 r42l2box0 bor flex jcsb">
                    <input type="text" class="r4inp1 r4inp0 borx2" placeholder="username..." value="<%=sessemail%>" name="uname">
                  </div>
                  <div class="r42l2box2 r42l2box0 bor flex jcsb">
                    <input type="text" class="r4inp1 r4inp0 borx2" placeholder="email..." value="example@gmail.com" name="email">
                  </div>
                  <div class="r42l2box2 r42l2box0 bor flex jcsb">
                    <input type="password" class="r4inp1 r4inp0 borx2" placeholder="password..." value="<%=sesspass%>" name="password">
                  </div>
                  <div class="r4l2btnbox w100 bor">
                    <input type="submit" class="r4updatebtn borx2" value="Update">
                    <a href="#" class="r4cancelbtn txtw borx2">Cancel</a>
                  </div>
                </form>
              </div>
            </div>
            <!-- ============================================= ROOM 5 ============================================= -->
            <div class="room5 rooms bor abs hw100 none"></div>
          </div>
        </div>

          
      </div>
    </div>
    <script src="js/script.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    /* 
        var menubtn = document.querySelector(".menubtn");
        var rooms = document.querySelectorAll(".rooms");
    */
    var r2l3btn1 = document.querySelector(".r2l3btn1");
    var r2input = document.querySelector(".r2input");
    var r2l2txt1 = document.querySelector(".r2l2txt1");
    var r2l2txt2 = document.querySelector(".r2l2txt2");
    var sessemailvar = "<%=sessemail%>";
    var msgvar=r2input.value;
    var messageArr="";
    
    var r2lvl2 = document.querySelector(".r2lvl2");
    var divPart1 = "<div class='r2l2mbox bor flex'><div class='r2l2b1 bor'><div class='r2imgbox1 bor'><img src='image/person.jpg' class='r2img1 w100'></div></div><div class='r2l2b2 bor flex fdc'><div class='r2l2txt1 r2l2txt0 bor'>@";
    var divPart2 = "</div><div class='r2l2txt2 r2l2txt0 bor'>";
    var divPart3 = "</div></div><div class='r2l2b3 bor'>";
    var divPart4 = "</div></div>";
    var divPartX1="",divPartX2="";
    var msgArrLen=messageArr.length;
    
    r2input.addEventListener('keyup',()=>{
        console.log(r2input.value);
        msgvar = r2input.value;
    });
    r2l3btn1.addEventListener('click',()=>{clicksend();});
    document.onkeypress = function(evt) {if(evt.key=='Enter'){clicksend();}};
    function clicksend(){if(msgvar!=""){ajaxcall();r2input.value="";}}
    function ajaxcall(){
        $.ajax({url:"sendmsg",type:"POST",data:{message:msgvar,uname:sessemailvar},dataType:"json"})
        .done(function (msg){$(".r2l2txt2").html(msg);console.log(msg);});
    }
    
    ajaxreceive();
    setInterval(function () {ajaxreceive()}, 100);
    function ajaxreceive(){
        $.ajax({url:"receivemsg",type:"GET",dataType:"json"})
        .done(function (msg){
            messageArr=msg;
            appendMessage();
        console.log("phone"+msg.length);
        })
    }
    
    
    
    
    function appendMessage(){
      msgArrLen=messageArr.length;
      r2lvl2.innerHTML = "";
      divPartX1="";
      divPartX2="";
      for(a=0;a<msgArrLen;a++){
        divPartX1 = divPart1 + messageArr[a][1] + divPart2 + messageArr[a][2] + divPart3 + divPart4;
        divPartX2 = divPartX2 + divPartX1;
      }
      r2lvl2.innerHTML = divPartX2;
      r2lvl2.scroll(0, 10000);
    }
    </script>
  </body>
</html>
<%}%>
