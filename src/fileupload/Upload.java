package fileupload;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;   

import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;   

import org.apache.commons.fileupload.FileItem; 
import org.apache.commons.fileupload.disk.DiskFileItemFactory; 
import org.apache.commons.fileupload.servlet.ServletFileUpload;   
import util.DBUtil;
@SuppressWarnings("serial") 
public class Upload extends HttpServlet {     
	private String uploadPath = "C:\\EatIt\\WebRoot\\images"; // 上传文件的目录  
	private String tempPath   = "C:\\Users\\lonec\\OneDrive\\EatIt\\EatIt\\WebRoot\\images\\buffer"; // 临时文件目录     
	File tempPathFile;      
	@SuppressWarnings("unchecked")     
	public void doPost(HttpServletRequest request, HttpServletResponse response)            
	throws IOException, ServletException { 
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {            
			// Create a factory for disk-based file items            
			DiskFileItemFactory factory = new DiskFileItemFactory();             
			 
			// Set factory constraints            
			factory.setSizeThreshold(4096); // 设置缓冲区大小，这里是 4kb            
			factory.setRepository(tempPathFile); // 设置缓冲区目录             
			
			// Create a new file upload handler            
			ServletFileUpload upload = new ServletFileUpload(factory); 
			upload.setHeaderEncoding("utf-8"); 
			
			// Set overall request size constraint            
			upload.setSizeMax(2097152); // 设置最大文件尺寸，这里是 4MB 
			 
			List<FileItem> items = upload.parseRequest(request);// 得到 所有的文件            
			Iterator<FileItem> i = items.iterator(); 
			String imgnameString0=null; 
			if (i.hasNext()) {               
				FileItem fi = (FileItem) i.next();               
				String fileName = fi.getName();
				if (fileName != null&&(fileName.endsWith(".jpg")||fileName.endsWith(".JPG")||fileName.endsWith(".png")||fileName.endsWith(".PNG"))) { 
					System.out.println(fi);
				
					DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
					Calendar calendar = Calendar.getInstance();
					String imageName = df.format(calendar.getTime());
					String endname=imageName+".jpg";
					System.out.println(imageName);
					imgnameString0=endname;
					
					File savedFile = new File(uploadPath,endname); 
					System.out.println(savedFile);
					fi.write(savedFile); 
					 
				}else{
					out.println("<script>alert('请上传正确的文件类型！');history.go(-1);</script>");
				}
				
			}  
			
			//写进数据库
			
			String[] imgnameString = imgnameString0.split("\\.");
			System.out.println(imgnameString[0]);
			
			Connection conn=null;
			Statement ps=null;
		 
			
			String salername=request.getParameter("name");
			byte[] sn = salername.getBytes("iso-8859-1");
			salername = new String(sn,"utf-8");
			
			String sqlString=" UPDATE EatIt_Saler SET imgName ='"+imgnameString[0]+"' WHERE name ='"+salername+"'"; 
			try {
				conn=DBUtil.getConnection();
				ps=conn.createStatement();
		    	ps.executeUpdate(sqlString);
				  
			} catch (Exception e) {
				e.printStackTrace();
			} 
			 
			//成功后页面跳转，并且刷新
			String page="published.do?name="+salername;    //published.do?name=<%=saler.getName()%>setTimeout();
			out.println("<script>alert('上传成功！');  window.location.href=\""+page+"\";  </script>");//页面带参数跳转
					
		} catch (Exception e) {       
			// 可以跳转出错页面      
			System.out.print("失败： 图片大小超过1M！ ");
			String salername=request.getParameter("name");
			byte[] sn = salername.getBytes("iso-8859-1");
			salername = new String(sn,"utf-8");
			//out.println("<script>alert('图片大小超过1M！');history.go(-1); </script>");
			String page="published.do?name="+salername;
			System.out.println(page);
			out.println("<script>alert('图片大小超过1M！!');  window.location.href=\""+page+"\";  </script>");
			 e.printStackTrace();       
		}    
	}       
	public void init() throws ServletException {       
		File uploadFile = new File(uploadPath);        
		if (!uploadFile.exists()) { 
			uploadFile.mkdirs();        
		}        
		File tempPathFile = new File(tempPath);         
		if (!tempPathFile.exists()) {           
			tempPathFile.mkdirs();        
		}    
	} 
} 
