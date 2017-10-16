package Book;

import com.opensymphony.xwork2.ActionSupport;

import java.sql.*;

public class insert_author extends ActionSupport {
    private String Name;
    private int Age;
    private String Country;
    private String statu;

    public static final String url = "jdbc:mysql://localhost:3306/bookdb?useUnicode=true&characterEncoding=UTF-8";
    public static final String diver  = "com.mysql.jdbc.Driver";
    public static final String root  = "root";
    public static final String pw = "";


    public String execute() throws Exception{
        try{
            Class.forName(diver);
            Connection conn = DriverManager.getConnection(url, root, pw);
            String sqlInset = "insert into author(Name, Age, Country) values(?, ?, ?)";
            if(getName().length() == 0) {
                statu = "添加失败";
                return SUCCESS;
            }
            PreparedStatement pst = conn.prepareStatement(sqlInset);
            pst.setObject(1, getName());
            pst.setObject(2, getAge());
            pst.setObject(3, getCountry());
            int i = pst.executeUpdate();
            if(i == 1){
                statu = "添加成功";
                return SUCCESS;
            }
            else{
                statu = "添加失败";
                return SUCCESS;
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return  SUCCESS;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public int getAge() {
        return Age;
    }

    public void setAge(int age) {
        Age = age;
    }

    public String getCountry() {
        return Country;
    }

    public void setCountry(String country) {
        Country = country;
    }

    public String getStatu() {
        return statu;
    }

    public void setStatu(String statu) {
        this.statu = statu;
    }
}
