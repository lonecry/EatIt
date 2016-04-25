<%@ page language="java" import="java.util.*" import="java.sql.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/classify.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.base64.js" type="text/javascript" charset="utf-8"></script>
<script src="js/search.js" type="text/javascript" charset="utf-8"></script>
<title>搜索结果</title>
</head>
<body>
	<div class="logo">
		<%@include file="header.jsp"%>
	</div>
	<script>
		document.getElementById("searchinput").style.height="24px";
	</script>
	<div class="navigate">
		<%@include file="trimble.jsp"%>
	</div>
	<div id="content">
		<div class="list">
			<div class="salerlist">
				<ul id="record" style="padding: 0;">
					<%
String value="";
if(null != request.getCookies()){
   Cookie[] cookie = request.getCookies();
   for(int i = 0; i < cookie.length; i++)
   {
       if(cookie[i].getName().equals("searchcontent"))
       {
           value = cookie[i].getValue(); break;
       }
   }
}
%>
					<%!  
 int pageSize=15;
 int pageCount;
 int showPage;
%>
					<!-- 连接数据库并从数据库中调取记录-->
					<%
 Connection con;
 Statement sql;
 ResultSet rs;
 try{
	 Class.forName("com.mysql.jdbc.Driver");
	 }
 catch(ClassNotFoundException e)
 { }
 try{
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eatit","root","123456");
	sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	//sql的select语句使用变量的形式
	String sqlexecute="select * from eatit_saler where name like'%"+java.net.URLDecoder.decode(value,"utf-8")+"%'";
	//out.print(sqlexecute);
	rs=sql.executeQuery(sqlexecute);  //"select * from eatit_saler where name like'%奶茶%'"
	rs.last();
	int recordCount=rs.getRow();
	pageSize=recordCount;
	pageCount=(recordCount%pageSize==0)?(recordCount/pageSize):(recordCount/pageSize+1);
	String integer=request.getParameter("showPage");
	if(integer==null){
		integer="1";
		}
	try{
			showPage=Integer.parseInt(integer);
		}
	catch(NumberFormatException e){
			showPage=1;
		}
	if(showPage<=1){
		showPage=1;
		}
	if(showPage>=pageCount){
		showPage=pageCount;
		}
	int position=(showPage-1)*pageSize+1;
	rs.absolute(position);
	for(int i=1;i<=pageSize;i++){  
%>

					<li id="<%=rs.getInt("id") %>"><a target="_blank"
						href="brief.do?name=<%=rs.getString("name") %>"> <img
							src="images/<%=rs.getString("imgName")%>.jpg" />
					</a>
						<div class="salertext">
							<p>
								<a target="_blank" href="brief.do?name=<%=rs.getString("name") %>"><%=rs.getString("name") %></a>
							</p>
							<p>
								折扣: <a href="brief.do?name=<%=rs.getString("name") %>"><%=rs.getString("discount") %></a>
							</p>
						</div></li>


					<% 
		rs.next();
	} 
	rs.close();
	con.close();
	} 
	catch(Exception e){
		e.printStackTrace();
	}
%>
				</ul>
				<div style="clear: both"></div>
			</div>
			<div class="classify">
				<div class="wordclassify">
					<div style="clear: both"></div>
					<span class="afix" id="type">按类型</span>
					<p>
						<a class="afix" href="classify.do?type=eat"><img
							src="images/logo/eat.png"
							style="vertical-align: middle; line-height: auto;"><span>吃</span></a>
					</p>
					<p>
						<a class="afix" href="classify.do?type=drink"><img
							src="images/logo/drink.png"
							style="vertical-align: middle; line-height: auto;"><span>喝</span></a>
					</p>
					<p>
						<a class="afix" href="classify.do?type=play"><img
							src="images/logo/play.png"
							style="vertical-align: middle; line-height: auto;"><span>玩</span></a>
					</p>
					<p>
						<a class="afix" href="classify.do?type=fun"><img
							src="images/logo/fun.png"
							style="vertical-align: middle; line-height: auto;"><span>乐</span></a>
					</p>
					<div style="clear: both"></div>
				</div>
			</div>
		</div>
		<div style="clear: both"></div>
	</div>
	<div style="margin: 18px 0 0 0; padding: 0;">
		<%@include file="footer.jsp"%>
	</div>
	<div style="clear: both"></div>
</body>
<script type="text/javascript" charset="utf-8">
		$(".searchinput").val($.cookie("searchcontent"));
</script>
</html>