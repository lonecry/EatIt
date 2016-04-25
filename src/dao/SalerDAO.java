package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;
import entity.Saler;

public class SalerDAO {
 
	public void addSaler(Saler saler){
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			conn=DBUtil.getConnection();
			ps=conn.prepareStatement("insert into EatIt_Saler(name,password,tel,discount,address,type,email) values (?,?,?,?,?,?,?)");
			ps.setString(1, saler.getName());
			ps.setString(2, saler.getPassword());
			ps.setString(3, saler.getTel());
			ps.setString(4, saler.getDiscount());
			ps.setString(5, saler.getAddress());
			ps.setString(6, saler.getType());
			ps.setString(7, saler.getEmail());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(conn);
		}
	}
	
	public List<Saler> findByType(String value){
		Connection conn=null;
		Statement ps=null;
		ResultSet rs=null;
		List<Saler> list=new ArrayList<Saler>();
		try {
			conn=DBUtil.getConnection();
			ps=conn.createStatement();
			rs=ps.executeQuery("select * from EatIt_Saler where type ='"+ value+"'");
			while(rs.next()){
				Saler saler=new Saler();
				saler.setAddress(rs.getString("address"));
				saler.setDiscount(rs.getString("discount"));
				saler.setEmail(rs.getString("email"));
				saler.setId(Integer.parseInt(rs.getString("id")));
				saler.setImgName(rs.getString("imgName"));
				saler.setName(rs.getString("name"));
				saler.setPassword(rs.getString("password"));
				saler.setTel(rs.getString("tel"));
				saler.setType(rs.getString("type"));
				list.add(saler);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(conn);
		}
		return list;
	}
	
	 
	public Saler findByAttribute(String Attribute,String value){
		Connection conn=null;
		Statement ps=null;
		ResultSet rs=null;
		Saler saler=null;
		try {
			conn=DBUtil.getConnection();
			ps=conn.createStatement();
			rs=ps.executeQuery("select * from EatIt_Saler where "+Attribute+" like '%"+value+"%'");
			while(rs.next()){
				saler=new Saler();
				saler.setAddress(rs.getString("address"));
				saler.setDiscount(rs.getString("discount"));
				saler.setEmail(rs.getString("email"));
				saler.setId(Integer.parseInt(rs.getString("id")));
				saler.setImgName(rs.getString("imgName"));
				saler.setName(rs.getString("name"));
				saler.setPassword(rs.getString("password"));
				saler.setTel(rs.getString("tel"));
				saler.setType(rs.getString("type"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(conn);
		}
		return saler;
	}
}
