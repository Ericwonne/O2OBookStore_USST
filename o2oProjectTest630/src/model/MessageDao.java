package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.catalina.connector.Request;


public class MessageDao extends BaseDao{

	public ArrayList<Message> getMessageByBookId(int bookId,int is_sale) {
		// TODO Auto-generated method stub
		String sql=null;
		if(is_sale==0)
			sql = "select content,release_time,sender,user.name senderName,user.st_num senderSt_num from message,user where user.id=message.sender &&record_id=? && if_sale=? && if_private=0";
		else if(is_sale==1)
			sql = "select content,release_time,sender,user.name senderName,user.st_num senderSt_num from message,user where user.id=message.sender && record_id=? && if_sale=? && if_private=0";
		try(Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, bookId);
			pstmt.setInt(2,is_sale);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<Message> messages = new ArrayList<>(); 
			while(rs.next()){
				Message message = new Message();
				message.setContent(rs.getString("content"));
				message.setRelease_time(rs.getString("release_time"));
				message.setSender(rs.getInt("sender"));
				message.setSenderName(rs.getString("senderName"));
				message.setSenderSt_num(rs.getString("senderSt_num"));
				messages.add(message);
			}
			return messages;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public boolean addMessage(int sender, int recordId, int if_sale, int accepter, String content, String date,int if_private) {
		// TODO Auto-generated method stub
		String sql = "insert into message(sender,content,release_time,accepter,record_id,status,if_private,if_sale)"
				+ " values(?,?,?,?,?,?,?,?)";
		try(Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql) ){
			pstmt.setInt(1,sender);
			pstmt.setString(2,content);
			pstmt.setString(3,date);
			pstmt.setInt(4, accepter);
			pstmt.setInt(5,recordId);
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 1);
			pstmt.setInt(8, if_private);
			int count = pstmt.executeUpdate();
			if(count>0){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
}
