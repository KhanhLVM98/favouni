
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static model.DatabaseInfo.dbURL;
import static model.DatabaseInfo.driverName;
import static model.DatabaseInfo.passDB;
import static model.DatabaseInfo.userDB;

/**
 *
 * @author khanhlvm98
 */
public class Comment extends Activity implements DatabaseInfo{
    String content;
    String dateComment;

    public Comment() {
    }

    public Comment(int actID, String username, String content, String dateComment) {
        super(actID, username);
        this.content = content;
        this.dateComment = dateComment;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDateComment() {
        return dateComment;
    }

    public void setDateComment(String dateComment) {
        this.dateComment = dateComment;
    }
    
    public boolean setComment(Comment c){    
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "INSERT INTO CommentTB(actID,username,content,dateComment) VALUES(?,?,?,?)";           
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, c.getActID());
            ps.setString(2, c.getUsername());
            ps.setString(3, c.getContent());
            ps.setString(4, c.getDateComment());
            int rs = ps.executeUpdate(); 
            con.close();
            return rs == 1;
        }catch(Exception e) {
            e.printStackTrace();
        }                
        return false;
    }
    
    public ArrayList<Comment> getAllComment(int actID) {
        ArrayList<Comment> al = new ArrayList<>();
        try{
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            String sql = "SELECT * FROM CommentTB WHERE actID=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, actID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int aID = rs.getInt(1);
                String un = rs.getString(2);
                String cont = rs.getString(3);
                String datecmt = rs.getString(4);
                Comment c = new Comment(aID,un,cont,datecmt);
                al.add(c);
            }
            con.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return al;
    }
    
}
