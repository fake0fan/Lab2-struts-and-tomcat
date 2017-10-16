package Book;

import com.opensymphony.xwork2.ActionSupport;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class delete extends ActionSupport{
    public static final String url = "jdbc:mysql://localhost:3306/bookdb?useUnicode=true&characterEncoding=UTF-8";
    public static final String diver  = "com.mysql.jdbc.Driver";
    public static final String root  = "root";
    public static final String pw = "";

    private String delISBN;
    private String statu;
    public String execute() throws Exception {
        try {
            Class.forName(diver);
            Connection conn2  = DriverManager.getConnection(url,root,pw);
            String sql2 = "delete from book where ISBN=?";
            PreparedStatement stem = conn2.prepareStatement(sql2);
            stem.setObject(1, delISBN);
            int i = stem.executeUpdate();
            if(i == 1) {
                this.statu = "删除成功";
            }
            else{
                this.statu = "删除失败";
            }
        }
        catch (Exception e){
            e.printStackTrace();
            this.statu = "删除失败";
        }
        return SUCCESS;
    }
    public String getDelISBN() {
        return delISBN;
    }

    public void setDelISBN(String delISBN) {
        this.delISBN = delISBN;
    }

    public String getStatu() {
        return statu;
    }

    public void setStatu(String statu) {
        this.statu = statu;
    }
}
