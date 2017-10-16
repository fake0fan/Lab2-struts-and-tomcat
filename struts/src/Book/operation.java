package Book;

import com.opensymphony.xwork2.ActionSupport;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class operation extends ActionSupport{

    private String name;
    private String delISBN;
    private String changeISBN;
    private String password;
    private String detailISBN;


    public static final String url = "jdbc:mysql://localhost:3306/bookdb?useUnicode=true&characterEncoding=UTF-8";
    public static final String diver  = "com.mysql.jdbc.Driver";
    public static final String root  = "root";
    public static final String pw = "";

    public Connection conn = null;
    public PreparedStatement pst = null;

    public String execute() throws Exception{
        return  SUCCESS;
    }



    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDelISBN() {
        return delISBN;
    }

    public void setDelISBN(String delISBN) {
        System.out.println(delISBN);
        this.delISBN = delISBN;
    }

    public String getChangeISBN() {
        return changeISBN;
    }

    public void setChangeISBN(String changeISBN) {
        System.out.println(changeISBN);
        this.changeISBN = changeISBN;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetailISBN() {
        return detailISBN;
    }

    public void setDetailISBN(String detailISBN) {
        this.detailISBN = detailISBN;
    }
}
