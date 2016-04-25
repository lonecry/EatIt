package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.fabric.Response;
import com.sun.net.httpserver.Authenticator.Success;

import util.DBUtil;


import dao.SalerDAO;
import dao.UserDAO;
import entity.Saler;
import entity.User;

public class ActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession hs = request.getSession(true);
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		System.out.println("触发了："+action+".action");
		
		/*首页action*/
		
		if ("/in".equals(action)) {
			SalerDAO dao=new SalerDAO();
			List<Saler> eat=dao.findByType("eat");
			request.setAttribute("eat", eat);
			List<Saler> drink=dao.findByType("drink");
			request.setAttribute("drink", drink);
			List<Saler> play=dao.findByType("play");
			request.setAttribute("play", play);
			List<Saler> fun=dao.findByType("fun");
			request.setAttribute("fun", fun);
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
		
		/*分类action*/
		
		else if("/classify".equals(action)){
			String type=request.getParameter("type");
			SalerDAO dao=new SalerDAO();
			try {
				List<Saler> salers=dao.findByType(type);
				request.setAttribute("salers", salers);
				RequestDispatcher rd=request.getRequestDispatcher("classify.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		/*详情页面action*/
		else if("/brief".equals(action)){
			String name=request.getParameter("name");
			byte[] b = name.getBytes("iso-8859-1");
			name = new String(b,"utf-8");
			try {
				SalerDAO dao = new SalerDAO();
				Saler saler=dao.findByAttribute("name",name);
				request.setAttribute("saler", saler);
				RequestDispatcher rd=request.getRequestDispatcher("brief.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/*查看发布action*/
		
		else if("/published".equals(action)){
			String name=request.getParameter("name");
			byte[] b = name.getBytes("iso-8859-1");
			name = new String(b,"utf-8");
			try {
				SalerDAO dao = new SalerDAO();
				Saler saler=dao.findByAttribute("name",name);
				request.setAttribute("saler", saler);
				RequestDispatcher rd=request.getRequestDispatcher("published.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/*登录 action*/
		
		else if("/check_login".equals(action)){
			String email=request.getParameter("login");
			String password=request.getParameter("password");
			String role=request.getParameter("role");
			HttpSession session=request.getSession();
			try {
				if("saler".equals(role)){
					SalerDAO salerdao=new SalerDAO();
					Saler saler=salerdao.findByAttribute("email", email);
					System.out.println(saler+"saler"+saler.getPassword());
					if(saler.getPassword().equals(password)){
						request.setAttribute("saler", saler);
						session.setAttribute("saler", saler);
						RequestDispatcher rd=request.getRequestDispatcher("in.do");
						rd.forward(request, response);
					}else{
						request.setAttribute("email", email);
						request.setAttribute("password", "");		
						request.getRequestDispatcher("login.jsp").forward(
								request, response);
					}
				}else{
					UserDAO userdao=new UserDAO();
					User user=userdao.findByEmail(email);
					if(user.getPassword().equals(password)){
						request.setAttribute("user", user);
						session.setAttribute("user", user);
						System.out.println(user+"登录成功");
						RequestDispatcher rd=request.getRequestDispatcher("in.do");
						rd.forward(request, response);
					}else{
						request.setAttribute("email", email);
						request.setAttribute("password", "");		
						request.getRequestDispatcher("login.jsp").forward(
								request, response);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("email", "");
				request.setAttribute("password", "");
				request.getRequestDispatcher("login.jsp").forward(request,
						response);
			}
		}
		
		/*注册*/
		
		else if("/check_regist".equals(action)){
			String role=request.getParameter("role");
			System.out.println(role);
			if("user".equals(role)){
				UserDAO userdao=new UserDAO();
				User user=new User();
				//字符转码
				String username= request.getParameter("name");
				byte[] coll = username.getBytes("iso-8859-1");
				username = new String(coll,"utf-8");
				user.setEmail(request.getParameter("at"));
				user.setPassword(request.getParameter("password1"));
				user.setName(username);
				user.setTel(request.getParameter("phone"));
				
				userdao.addUser(user);
				
				
			}else if("saler".equals(role)){
				SalerDAO salerdao=new SalerDAO();
				Saler saler=new Saler();
				
				String username= request.getParameter("name");
				byte[] coll = username.getBytes("iso-8859-1");
				username = new String(coll,"utf-8");
				
				String address= request.getParameter("address");
				byte[] dizhi = address.getBytes("iso-8859-1");
				address = new String(dizhi,"utf-8");
				
				String discount= request.getParameter("discount");
				byte[] zhekou = discount.getBytes("iso-8859-1");
				discount = new String(zhekou,"utf-8");
				
				saler.setEmail(request.getParameter("at"));
				saler.setPassword(request.getParameter("password1"));
				saler.setName(username);
				saler.setAddress(address);
				saler.setDiscount(discount);
				saler.setTel(request.getParameter("phone"));
				saler.setType(request.getParameter("type"));
				salerdao.addSaler(saler);
			}
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		
		/*登录表单验证action*/
		
		else if("/check_01".equals(action)){
			String email = request.getParameter("email");
			UserDAO userdao = new UserDAO();
			User user = userdao.findByEmail(email);
			SalerDAO salerdao=new SalerDAO();
			Saler saler=salerdao.findByAttribute("email",email);
			if (user != null && saler!=null) {
				out.print("yes");
			} else {
				out.print("no");
			}
		}
		
		/*收藏action*/
		
		else if("/collection".equals(action)){		 
			
			String logname  =request.getParameter("logname");
			byte[] lgn = logname.getBytes("iso-8859-1");
			logname = new String(lgn,"utf-8");

			String collection= request.getParameter("name");
			byte[] coll = collection.getBytes("iso-8859-1");
			collection = new String(coll,"utf-8");
			
			String discount= request.getParameter("discount");
			byte[] disc = discount.getBytes("iso-8859-1");
			discount = new String(disc,"utf-8");
			
			String fav=collection+'|'+discount+',';
			
			Connection conn=null;
			Statement ps=null;
			ResultSet rs=null,rs2=null;
			
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String timenow=df.format(new Date());// new Date()为获取当前系统时间
		 
			//for 用户
			String sqlString1="SELECT collection from EatIt_User WHERE name ='"+logname+"'"; 
			String sqlString=" UPDATE EatIt_User SET collection = CONCAT(collection,'"+fav+"') WHERE name ='"+logname+"'"; 
			String sqlStringnull="UPDATE EatIt_User SET collection = '"+fav+"' WHERE name ='"+logname+"'"; 
			
			//for 商家
			String sqlaccount="SELECT email from EatIt_User WHERE name ='"+logname+"'";
			String sqlcollrec="SELECT collrec from EatIt_Saler WHERE name ='"+collection+"'";
			System.out.println(logname);
			
			 
			//记录写进用户数据库
			try {
				conn=DBUtil.getConnection();
				ps=conn.createStatement();
				rs=ps.executeQuery(sqlString1); 
					if(rs.next()) {
						String str = rs.getString("collection");
					    System.out.println("数据库为："+str);
					    if(str==null||str.isEmpty()){
					    	ps.executeUpdate(sqlStringnull);
					    	out.println("<script>alert('恭喜你收藏成功！');history.go(-1);</script>");
					    }
					    else if(!str.contains(fav)){
							ps.executeUpdate(sqlString);
							System.out.println("Success");
							out.println("<script>alert('恭喜你收藏成功！');history.go(-1);</script>");
						    }else {
						    	System.out.println("Failed");
						    	out.println("<script>alert('你已经收藏，请勿重复操作！');history.go(-1);</script>");
							}
					}
					rs.close();  
			} catch (Exception e) {
				e.printStackTrace();
			};
			
			//记录写进商家数据库
	 
			try {
				conn=DBUtil.getConnection();
				ps=conn.createStatement();
				rs=ps.executeQuery(sqlaccount);
				String useremail=null;
				
				if(rs.next()){
					 useremail = rs.getString("email");
					 System.out.println("查到用户的email：" +useremail);
				}
				
				rs2=ps.executeQuery(sqlcollrec);
					if(rs2.next()) {
						String cr = rs2.getString("collrec");
						String sqlsaler=logname+","+useremail+","+timenow+"|";
						if(cr==null||cr.isEmpty()){
							System.out.println(sqlsaler);
							String sqlcollrec2=" UPDATE EatIt_Saler SET collrec = '"+sqlsaler+"'   WHERE name ='"+collection+"'"; 
							ps.executeUpdate(sqlcollrec2);
						} else if(!cr.contains(logname)){
							String sqlcollrec2=" UPDATE EatIt_Saler SET collrec =CONCAT('"+sqlsaler+"',collrec)   WHERE name ='"+collection+"'"; 
							ps.executeUpdate(sqlcollrec2);
						}
					     
					}
					rs.close();
				  
			} catch (Exception e) {
				e.printStackTrace();
			}
			 
			
		} 
		
		/*查看收藏action*/
		
		else if("/view".equals(action)){		 
			 
			/*HttpSession session=request.getSession();
			User user = (User)session.getAttribute("user");*/
			String logname=request.getParameter("name");
			byte[] coll = logname.getBytes("iso-8859-1");
			logname = new String(coll,"utf-8");
			System.out.println(logname);
			Connection conn=null;
			Statement ps=null;
			ResultSet rs=null;
			String sqlString1="SELECT collection from EatIt_User WHERE name ='"+logname+"'"; 
			try {
				conn=DBUtil.getConnection();
				ps=conn.createStatement();
				rs=ps.executeQuery(sqlString1);
				if(rs.next()) {
					String str = rs.getString("collection"); 
					Cookie cookie = new Cookie("collection",java.net.URLEncoder.encode(str,"utf-8"));
					response.addCookie(cookie);
					RequestDispatcher rd=request.getRequestDispatcher("collview.jsp");
					rd.forward(request, response);
			    }else {
			    	out.println("<script>alert('null');</script>");
				}
				rs.close();
				  
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
		/*商家查看收藏的用户记录*/
		
		else if("/collrecciew".equals(action)){
			
			String logname=request.getParameter("name");
			byte[] coll = logname.getBytes("iso-8859-1");
			logname = new String(coll,"utf-8");
			System.out.println(logname);
			
			Connection conn=null;
			Statement ps=null;
			ResultSet rs=null;
			String sqlString1="SELECT collrec from EatIt_Saler WHERE name ='"+logname+"'"; 
			try {
				conn=DBUtil.getConnection();
				ps=conn.createStatement();
				rs=ps.executeQuery(sqlString1);
				if(rs.next()) {
					String str = rs.getString("collrec"); 
					Cookie cookie = new Cookie("collrecview",java.net.URLEncoder.encode(str,"utf-8"));
					response.addCookie(cookie);
					RequestDispatcher rd=request.getRequestDispatcher("collrecview.jsp");
					rd.forward(request, response);
			    }else {
			    	out.println("<script>alert('null');</script>");
				}
				rs.close();
				  
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
		}
		
		/*修改折扣*/
		
		else if("/discountcg".equals(action)){
			String discount=request.getParameter("disc");
			System.out.println(discount);
			
			
			String logname=request.getParameter("name");
			byte[] coll = logname.getBytes("iso-8859-1");
			logname = new String(coll,"utf-8");
			System.out.println(logname);
			Connection conn=null;
			Statement ps=null;
			String sqlcdisc="UPDATE EatIt_Saler SET discount = '"+discount+"'   WHERE name ='"+logname+"'"; 
			try {
				conn=DBUtil.getConnection();
				ps=conn.createStatement();
				ps.executeUpdate(sqlcdisc);
				String page="published.do?name="+logname;    //published.do?name=<%=saler.getName()%>setTimeout();
				out.println("<script>alert('修改折扣成功！');  window.location.href=\""+page+"\";  </script>");//页面带参数跳转
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
		}
			
		
		/*退出*/
		
		else if("/logout".equals(action)){
			request.setAttribute("user",null);
			hs.setAttribute("user", null);
			request.setAttribute("saler",null);
			hs.setAttribute("saler", null);
			response.sendRedirect("in.do");
		}
	}
	
}
