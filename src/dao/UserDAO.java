package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import util.DBUtil;
import entity.Saler;
import entity.User;

public class UserDAO {
	 
	public void addUser(User user){
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			conn=DBUtil.getConnection();
			ps=conn.prepareStatement("insert into EatIt_User(name,email,password,tel) values(?,?,?,?)");
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getTel());
			ps.executeUpdate();
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
 
	public User findByEmail(String email){
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		User user=null;
		try {
			conn=DBUtil.getConnection();
			ps=conn.prepareStatement("select * from EatIt_User where email=?");
			ps.setString(1, email);
			rs=ps.executeQuery();
			if(rs.next()){
				user=new User();
				user.setId(Integer.parseInt(rs.getString("id")));
				user.setEmail(email);
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setTel(rs.getString("tel"));
				user.setCollection("123");
			}			
		 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	
	//修改
	public void Update(User user) throws Exception{ 
		String sql="update Fix set ";
		sql+="Collection='"+user.getCollection()+"' where id='"+user.getId()+"'";
		Statement stat = null;
		ResultSet rs = null;
		Connection conn = DBUtil.getConnection();
		try{
			stat = conn.createStatement();
			stat.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (stat != null)
					stat.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
