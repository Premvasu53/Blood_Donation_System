package app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DBcontrol {
	String url="jdbc:mysql://localhost:3306/blooddonation";
	String user="root";
	String pass="admin";
	private Connection con;
	public DBcontrol()throws SQLException,ClassNotFoundException{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection(url,user,pass);
	}
	public int AddDonars(String name,String number,String city,String bg,String pass,String RtD)throws SQLException {
		String q="insert into userdata values(?,?,?,?,?,?)";
		PreparedStatement pst=con.prepareStatement(q);
		pst.setString(1, name);
		pst.setString(2, number);
		pst.setString(3, city);
		pst.setString(4, bg);
		pst.setString(5, pass);
		pst.setString(6, RtD);
		int r=pst.executeUpdate();
		return r;
	}
	public ArrayList<UsersData> GetDonars(String bg, String city) throws SQLException {
        ArrayList<UsersData> users = new ArrayList<>();
        String query = "SELECT * FROM userdata WHERE userbloodgroup=? AND usercity=?";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setString(1, bg);
        pst.setString(2, city);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
        		if(rs.getString("readytodonate").equals("Yes")) {
        			UsersData user = new UsersData();
                    user.setName(rs.getString("username"));
                    user.setNumber(rs.getString("usermobilenumber"));
                    user.setCity(rs.getString("usercity"));
                    user.setBg(rs.getString("userbloodgroup"));
                    users.add(user);
        		}
        }
        return users;
    }
	public boolean checkUser(String number, String pass) throws SQLException {
        String query = "SELECT * FROM userdata WHERE usermobilenumber=? AND userpassword=?";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setString(1, number);
        pst.setString(2, pass);
        ResultSet rs = pst.executeQuery();
        return rs.next();
    }
	public UsersData getIndividualUser(String number) throws SQLException {
	    UsersData user = null;
	    String query = "SELECT * FROM userdata WHERE usermobilenumber=?";
	    PreparedStatement pst = con.prepareStatement(query);
	    pst.setString(1, number);
	    ResultSet rs = pst.executeQuery();
	    if (rs.next()) {
	        user = new UsersData();
	        user.setName(rs.getString("username"));
	        user.setNumber(rs.getString("usermobilenumber"));
	        user.setCity(rs.getString("usercity"));
	        user.setBg(rs.getString("userbloodgroup"));
	        user.setRtD(rs.getString("readytodonate"));
	    }
	    return user;
	}
	public int UpdateUser(String number, String name, String city, String RtD) throws SQLException {
	    String query = "UPDATE userdata SET username=?, usercity=?, readytodonate=? WHERE usermobilenumber=?";
	    PreparedStatement pst = con.prepareStatement(query);
	    pst.setString(1, name);
	    pst.setString(2, city);
	    pst.setString(3, RtD);
	    pst.setString(4, number);
	    int rowsUpdated = pst.executeUpdate();
	    return rowsUpdated;
	}
}
