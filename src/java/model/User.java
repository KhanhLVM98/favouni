package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import static model.DatabaseInfo.dbURL;
import static model.DatabaseInfo.driverName;
import static model.DatabaseInfo.passDB;
import static model.DatabaseInfo.userDB;

/**
 *
 * @author khanhlvm98
 */
public class User implements DatabaseInfo{
    String username;
    String fullname;
    String userpass;
    String dob;
    Boolean gender;
    String email;
    String phone;
    String userLocation;
    String bio;
    String addDate;   

    public User() {
    }   
    
    public User(String username, String fullname, String userpass, String dob, Boolean gender) {
        this.username = username;
        this.fullname = fullname;
        this.userpass = userpass;
        this.dob = dob;
        this.gender = gender;     
    }
    
    public User(String username, String fullname, String userpass, String dob, Boolean gender, String email, String phone, String userLocation, String bio) {
        this.username = username;
        this.fullname = fullname;
        this.userpass = userpass;
        this.dob = dob;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.userLocation = userLocation;
        this.bio = bio;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpass() {
        return userpass;
    }

    public void setUserpass(String userpass) {
        this.userpass = userpass;
    }
    
    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    
    public String getDob() {        
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String isGender() {
        return gender?"M":"F";
    }

    public void setGender(String gender) {
        this.gender = gender.equals("M");
    }
    
    public String getGender() {
        return gender?"Male":"Female";
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUserLocation() {
        return userLocation;
    }

    public void setUserLocation(String userLocation) {
        this.userLocation = userLocation;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }  
    
    public String getAddDate() {
        return addDate;
    }

    public void setAddDate(String addDate) {
        this.addDate = addDate;
    }
    
    public User(String username) {
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "SELECT * FROM UserTB WHERE username=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                this.username = rs.getString(1);
                fullname = rs.getString(2);
                userpass = rs.getString(3);
                dob = rs.getString(4);
                gender = rs.getString(5).equals("M");
                email = rs.getString(6);
                phone = rs.getString(7);
                userLocation = rs.getString(8);
                bio = rs.getString(9);
            }
            con.close();
        }catch(Exception e) {
            e.printStackTrace();
        }      
    }
    
    public boolean createAccount(User u){    
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "INSERT INTO UserTB(username,fullname,userpass,dob,gender) VALUES(?,?,?,?,?)";           
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getFullname());
            ps.setString(3, u.getUserpass());
            ps.setString(4, u.getDob());
            ps.setString(5, u.isGender());
            int rs = ps.executeUpdate(); 
            con.close();
            return rs == 1;
        }catch(Exception e) {
            e.printStackTrace();
        }                
        return false;
    }
    
    public boolean checkLogin(String username, String password) {
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "SELECT * FROM UserTB WHERE username=? "
                    + "AND userpass=? ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return true;
            }
            con.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateUser(User u){
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "UPDATE UserTB SET fullname=?, dob=?, gender=?, email=?, phone=?, userLocation=?, bio=? WHERE username = ?";
            PreparedStatement ps = con.prepareStatement(sql);            
            ps.setString(1, u.getFullname());
            ps.setString(2, u.getDob());
            ps.setString(3, u.isGender());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getPhone());
            ps.setString(6, u.getUserLocation());
            ps.setString(7, u.getBio());
            ps.setString(8, u.getUsername());
            int rs = ps.executeUpdate();
            con.close();
            return rs == 1;
        }catch(Exception e) {
            e.printStackTrace();
        }                
        return false;
    }
    
    public boolean updatePassword(String username, String userpass){
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "UPDATE UserTB SET userpass=? WHERE username = ?";
            PreparedStatement ps = con.prepareStatement(sql);            
            ps.setString(1, userpass);
            ps.setString(2, username);
            int rs = ps.executeUpdate();
            con.close();
            return rs == 1;
        }catch(Exception e) {
            e.printStackTrace();
        }                
        return false;
    }
    
    public User getUser(String username) {
        User u = new User();
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "SELECT * FROM UserTB WHERE username=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String uname = rs.getString(1);
                String ufname = rs.getString(2);
                String upass = rs.getString(3);
                String udob = rs.getString(4);
                String ugender = rs.getString(5);
                String uemail = rs.getString(6);
                String uphone = rs.getString(7);
                String uLocation = rs.getString(8);
                String ubio = rs.getString(9);
                u = new User(uname,ufname,upass,udob,ugender.equals("M"),uemail,uphone,uLocation,ubio);
                return u;
            }
            con.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return u;
    }
    
    public ArrayList<User> getAllUser() {
        ArrayList<User> al = new ArrayList<>();
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "SELECT * FROM UserTB";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                String uname = rs.getString(1);
                String ufname = rs.getString(2);
                String upass = rs.getString(3);
                String udob = rs.getString(4);
                String ugender = rs.getString(5);
                String uemail = rs.getString(6);
                String uphone = rs.getString(7);
                String uLocation = rs.getString(8);
                String ubio = rs.getString(9);
                User u = new User(uname,ufname,upass,udob,ugender.equals("M"),uemail,uphone,uLocation,ubio);
                al.add(u);
            }
            con.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return al;
    }
    
    public ArrayList<User> getTopUser() {
        ArrayList<User> al = new ArrayList<>();
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "SELECT TOP 3 * FROM UserTB";  
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                String uname = rs.getString(1);
                String ufname = rs.getString(2);
                String upass = rs.getString(3);
                String udob = rs.getString(4);
                String ugender = rs.getString(5);
                String uemail = rs.getString(6);
                String uphone = rs.getString(7);
                String uLocation = rs.getString(8);
                String ubio = rs.getString(9);
                User u = new User(uname,ufname,upass,udob,ugender.equals("M"),uemail,uphone,uLocation,ubio);
                al.add(u);
            }
            con.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return al;
    }
    
    public boolean addFriend(String user1, String user2, int statusFriend, String addDate){    
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "INSERT INTO FriendTB(username_1,username_2,statusFriend,addDate) VALUES(?,?,?,?)";           
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user1);
            ps.setString(2, user2);
            ps.setInt(3, statusFriend);
            ps.setString(4, addDate);
            int rs = ps.executeUpdate(); 
            con.close();
            return rs == 1;
        }catch(Exception e) {
            e.printStackTrace();
        }                
        return false;
    }
    
    public int getFriend(String user1, String user2) {
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "SELECT * FROM FriendTB WHERE (username_1 = ? AND username_2 = ?) OR (username_1 = ? AND username_2 = ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user1);            
            ps.setString(2, user2);
            ps.setString(3, user2);
            ps.setString(4, user1);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){               
                String u1 = rs.getString(1);
                String u2 = rs.getString(2);
                int statusLike = rs.getInt(3);
                return statusLike;
            }
            con.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return 0;
    }  
}

