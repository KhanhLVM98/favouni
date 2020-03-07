
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
public class Activity extends User implements DatabaseInfo{
    int actID;
    String actName;
    String actTime;
    String actDate;
    String actLocation;
    String categories;
    String description;
    String joinDate;

    public Activity() {
    }
    
    public Activity(int actID, String username, String actName, String actLocation, 
            String actTime, String actDate, String categories, String description) {
        super(username);
        this.actID = actID;
        this.actName = actName;
        this.actTime = actTime;
        this.actDate = actDate;
        this.actLocation = actLocation;
        this.categories = categories;
        this.description = description;
    }
    
    public Activity(int actID, String username) {
        super(username);
        this.actID = actID;
    }
    
    public Activity(int actID, String username, String joinDate) {
        super(username);
        this.actID = actID;
        this.joinDate = joinDate;
    }    

    public int getActID() {
        return actID;
    }

    public void setActID(int actID) {
        this.actID = actID;
    }

    public String getActName() {
        return actName;
    }

    public void setActName(String actName) {
        this.actName = actName;
    }

    public String getActTime() {
        return actTime;
    }

    public void setActTime(String actTime) {
        this.actTime = actTime;
    }

    public String getActDate() {
        return actDate;
    }

    public void setActDate(String actDate) {
        this.actDate = actDate;
    }

    public String getActLocation() {
        return actLocation;
    }

    public void setActLocation(String actLocation) {
        this.actLocation = actLocation;
    }

    public String getCategories() {
        return categories;
    }

    public void setCategories(String categories) {
        this.categories = categories;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(String joinDate) {
        this.joinDate = joinDate;
    }
    
    public Activity(int actID) {
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "SELECT * FROM ActivityTB WHERE actID=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, actID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                this.actID = rs.getInt(1);
                username = rs.getString(2);
                actName = rs.getString(3);
                actLocation = rs.getString(4);
                actTime = rs.getString(5);
                actDate = rs.getString(6);                
                categories = rs.getString(7);
                description = rs.getString(8);
            }
            con.close();
        }catch(Exception e) {
            e.printStackTrace();
        }      
    }
    
    public boolean createActivity(Activity a, String username){    
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "INSERT INTO ActivityTB(actID,username,actName,actLocation,"
                    + "actTime,actDate,actCategory,actDescription)VALUES(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, a.getActID());
            ps.setString(2, username);
            ps.setString(3, a.getActName());
            ps.setString(4, a.getActLocation());
            ps.setString(5, a.getActTime());
            ps.setString(6, a.getActDate());
            ps.setString(7, a.getCategories());
            ps.setString(8, a.getDescription());
            int rs = ps.executeUpdate();
            con.close();
            return rs == 1;
        }catch(Exception e) {
            e.printStackTrace();
        }                
        return false;
    }
    
    public boolean updateActivity(Activity a){
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "UPDATE ActivityTB SET username=?, actName=?, actLocation=?, actTime=?, actDate=?, actCategory=?, actDescription=? WHERE actID = ?";
            PreparedStatement ps = con.prepareStatement(sql);            
            ps.setString(1, a.getUsername());
            ps.setString(2, a.getActName());
            ps.setString(3, a.getActLocation());
            ps.setString(4, a.getActTime());
            ps.setString(5, a.getActDate());
            ps.setString(6, a.getCategories());
            ps.setString(7, a.getDescription());
            ps.setInt(8, a.getActID());
            int rs = ps.executeUpdate();
            con.close();
            return rs == 1;
        }catch(Exception e) {
            e.printStackTrace();
        }                
        return false;
    }
    
    public boolean deleteActivity(int actID) {
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
            PreparedStatement stmt = con.prepareStatement("DELETE FROM ActivityTB WHERE actID=?");
            stmt.setInt(1, actID);
            int rs = stmt.executeUpdate();
            con.close();
            return rs == 1;
        }catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean getActivity(int actID, String username) {
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "SELECT * FROM ActivityTB WHERE actID=? AND username=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, actID);
            ps.setString(2, username);
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
    
    public ArrayList<Activity> getAllActivity() {
        ArrayList<Activity> al = new ArrayList<>();
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "SELECT * FROM ActivityTB";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                actID = rs.getInt(1);
                username = rs.getString(2);
                actName = rs.getString(3);
                actLocation = rs.getString(4);
                actTime = rs.getString(5);
                actDate = rs.getString(6);                
                categories = rs.getString(7);
                description = rs.getString(8);
                Activity a = new Activity(actID,username,actName,actLocation,actTime,actDate,categories,description);
                al.add(a);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }   
        return al;
    }
    
    public boolean getLike(int actID, String username) {
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "SELECT * FROM LikeTB WHERE actID=? AND username=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, actID);
            ps.setString(2, username);
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
    
    public boolean setLike(Activity a){    
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "INSERT INTO LikeTB(actID,username) VALUES(?,?)";           
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, a.getActID());
            ps.setString(2, a.getUsername());
            int rs = ps.executeUpdate(); 
            con.close();
            return rs == 1;
        }catch(Exception e) {
            e.printStackTrace();
        }                
        return false;
    }
    
    public boolean disLike(int actID) {
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
            PreparedStatement stmt = con.prepareStatement("DELETE FROM LikeTB WHERE actID = ?");
            stmt.setInt(1, actID);
            int rs = stmt.executeUpdate();
            con.close();
            return rs == 1;
        }catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public ArrayList<Activity> getAllJoin() {
        ArrayList<Activity> al = new ArrayList<>();
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "SELECT * FROM JoinTB";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                actID = rs.getInt(1);
                username = rs.getString(2);
                joinDate = rs.getString(3);
                Activity a = new Activity(actID,username,joinDate);
                al.add(a);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }   
        return al;
    }
    
    public boolean getJoin(int actID, String username) {
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "SELECT * FROM JoinTB WHERE actID=? AND username=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, actID);
            ps.setString(2, username);
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
    
    public boolean setJoin(Activity a){    
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "INSERT INTO JoinTB(actID,username,joinDate) VALUES(?,?,?)";           
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, a.getActID());
            ps.setString(2, a.getUsername());
            ps.setString(3, a.getJoinDate());
            int rs = ps.executeUpdate(); 
            con.close();
            return rs == 1;
        }catch(Exception e) {
            e.printStackTrace();
        }                
        return false;
    }
    
    public boolean unJoin(int actID) {
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
            PreparedStatement stmt = con.prepareStatement("DELETE FROM JoinTB WHERE actID = ?");
            stmt.setInt(1, actID);
            int rs = stmt.executeUpdate();
            con.close();
            return rs == 1;
        }catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
}
