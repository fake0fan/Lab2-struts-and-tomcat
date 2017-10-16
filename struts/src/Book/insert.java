package Book;

import com.opensymphony.xwork2.ActionSupport;

import java.sql.*;
import java.util.Date;


public class insert extends ActionSupport {
    private String ISBN;
    private String Title;
    private String Author;
    private String Publisher;
    private Date PublishDate;
    private String Price;
    private String statu;

    public static final String url = "jdbc:mysql://localhost:3306/bookdb?useUnicode=true&characterEncoding=UTF-8";
    public static final String diver  = "com.mysql.jdbc.Driver";
    public static final String root  = "root";
    public static final String pw = "";

    public String execute() throws Exception{
        String result = ERROR;
        try {
            Class.forName(diver);
            Connection conn = DriverManager.getConnection(url, root, pw);
            Connection conn2 = DriverManager.getConnection(url, root, pw);
            String sqlInset = "insert into book(ISBN, Title, AuthorID, Publisher, PublishDate, Price) values(?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(sqlInset);
            pst.setObject(1,getISBN());
            pst.setObject(2,getTitle());
            String sqlq = "select * from author where Name=\"" + getAuthor() + "\"";
            Statement sta = conn2.createStatement();
            ResultSet rs = sta.executeQuery(sqlq);
            int cnt = 0;
            int AuthorID = new Integer(0);
            while (rs.next()){
                AuthorID = (rs.getInt(1));
                cnt ++;
                break;
            }
            if(cnt == 0){
                this.statu = "添加失败 请先添加该作者";
                return SUCCESS;
            }
            pst.setObject(3,AuthorID);
            pst.setObject(4,getPublisher());
            pst.setObject(5,getPublishDate());
            pst.setObject(6,getPrice());
            int i = pst.executeUpdate();
            if(i == 1){
                conn.close();
                this.statu = "添加成功";
            }
        }catch (Exception e){
            e.printStackTrace();
            this.statu = "添加失败 请检查输入各项是否符合要求";
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

    public String getPublisher() {
        return Publisher;
    }

    public void setPublisher(String publisher) {
        this.Publisher = publisher;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String author) {
        this.Author = author;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String price) {
        this.Price = price;
    }

    public Date getPublishDate() {
        return PublishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.PublishDate = publishDate;
    }

    public String getStatu() {
        return statu;
    }

    public void setStatu(String statu) {
        this.statu = statu;
    }
}
