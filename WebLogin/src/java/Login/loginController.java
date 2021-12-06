package Login;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

@Path("logincontroller")
public class loginController {
    //For connection to Database
    Connection con = null;
    String username = "root";
    String password = "";
    
    //Password hashing using SHA512 and salt
    public String getSecurePassword(String user, String pass, byte[] salt) throws ClassNotFoundException, SQLException {
        String Strsalt = ""; //Salt in String form
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dxctech?zeroDateTimeBehavior=convertToNull",username,password);
        Statement st = con.createStatement();
        String query = "SELECT salt FROM users where username = '" + user + "'";
        ResultSet rs = st.executeQuery(query);
        while(rs.next()){
            Strsalt = rs.getString("salt");
        }
        salt = Strsalt.getBytes(); //Salt in byte[]
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            md.update(salt);
            byte[] bytes = md.digest(pass.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        System.out.println(generatedPassword);
        return generatedPassword;
    }
    
    //Getting Name, Username, Role from Database
    @GET
    @Path("/getdetails") //path to identify method
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList<String> getDetails(@QueryParam("user") String user,@QueryParam("pass") String pass) throws ClassNotFoundException, SQLException {
        String StrSalt = ""; //Salt in String form
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dxctech?zeroDateTimeBehavior=convertToNull",username,password);
        Statement st2 = con.createStatement();
        String query2 = "SELECT salt FROM users WHERE username = '" + user + "'";
        ResultSet rs2 = st2.executeQuery(query2);
        while(rs2.next()){
            StrSalt = rs2.getString("salt");
        }
        byte[] salt = StrSalt.getBytes(); //Salt in byte[]
        String pass2 = getSecurePassword(user, pass, salt); //Hashed password
        ArrayList<String> userDetails = new ArrayList<String>();
        String query = "SELECT username,name,role FROM users WHERE username = '" + user + "' AND password = '" + pass2 +"'";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        while(rs.next()){
            userDetails.add(rs.getString("username"));
            userDetails.add(rs.getString("name"));
            userDetails.add(rs.getString("role"));
        }
        return userDetails;
    }
}
