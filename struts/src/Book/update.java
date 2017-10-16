package Book;

import com.opensymphony.xwork2.ActionSupport;

import java.sql.*;
import java.util.Date;

public class update extends ActionSupport {
    private String ISBN;
    private String Title;
    private String Author;
    private String Publisher;
    private Date PublishDate;
    private String statu;
    private String Price;

    public static final String url = "jdbc:mysql://localhost:3306/bookdb?useUnicode=true&characterEncoding=UTF-8";
    public static final String diver  = "com.mysql.jdbc.Driver";
    public static final String root  = "root";
    public static final String pw = "";

    public String execute() throws Exception{
        try {
            Class.forName(diver);
            Connection conn = DriverManager.getConnection(url, root, pw);
            Connection conn2 = DriverManager.getConnection(url, root, pw);
            String sqlq = "select * from author where Name=?";

            PreparedStatement pstm1 = conn2.prepareStatement(sqlq);

            pstm1.setObject(1, getAuthor());
            System.out.println(pstm1);
            ResultSet rs = pstm1.executeQuery();
            int ID = -100000000;
            while (rs.next()){
                ID = rs.getInt(1);
            }
            if(ID == -100000000){
                this.statu = "更新失败 请先添加该作者";
                return SUCCESS;
            }
            System.out.println(ID);
            String sql2 = "UPDATE book set Publisher=?,PublishDate=?,AuthorID=?,Price=?, Title=? WHERE ISBN=?";
            PreparedStatement pstm2 = conn.prepareStatement(sql2);
            pstm2.setObject(1, getPublisher());
            pstm2.setObject(2, getPublishDate());
            pstm2.setObject(3, ID);
            pstm2.setObject(4, getPrice());
            pstm2.setObject(5, getTitle());
            pstm2.setObject(6, getISBN());
            System.out.println(pstm2.toString());
            int i = pstm2.executeUpdate();
            System.out.println(i);
            if(i == 1){
                this.statu = "更新成功";
                return SUCCESS;
            }
            else{
                this.statu = "更新失败 请检查输入各项是否符合要求";
                return SUCCESS;
            }
        }catch (Exception e){
            this.statu = "更新失败 请检查输入各项是否符合要求";
            e.printStackTrace();
        }
        return  SUCCESS;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        this.Title = title;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String author) {
        this.Author = author;
    }

    public String getPublisher() {
        return Publisher;
    }

    public void setPublisher(String publisher) {
        this.Publisher = publisher;
    }

    public Date getPublishDate() {
        return PublishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.PublishDate = publishDate;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String price) {
        this.Price = price;
    }

    public String getStatu() {
        return statu;
    }

    public void setStatu(String statu) {
        this.statu = statu;
    }
}
