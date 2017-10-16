package Book;

import com.opensymphony.xwork2.ActionSupport;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class detail extends ActionSupport{
    private String name;
    private HashMap<String, ArrayList> result;
    private String detailISBN;


    public static final String url = "jdbc:mysql://localhost:3306/bookdb?useUnicode=true&characterEncoding=UTF-8";
    public static final String diver  = "com.mysql.jdbc.Driver";
    public static final String root  = "root";
    public static final String pw = "";
    public String execute() throws Exception {
        try {
            Class.forName(diver);
            Connection conn = DriverManager.getConnection(url, root, pw);
            String sql = "select b.*, a.* from book b,author a where b.AuthorID=a.AuthorID and b.ISBN=?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setObject(1, detailISBN);
            ResultSet rs = pstm.executeQuery();
            result = new HashMap<>();
            while (rs.next()){
                result.put(rs.getObject(1).toString(), new ArrayList());
                result.get(rs.getObject(1).toString()).add(rs.getObject(2));
                result.get(rs.getObject(1).toString()).add(rs.getObject(3));
                result.get(rs.getObject(1).toString()).add(rs.getObject(4));
                result.get(rs.getObject(1).toString()).add(rs.getObject(5).toString());
                result.get(rs.getObject(1).toString()).add(rs.getObject(6));
                result.get(rs.getObject(1).toString()).add(rs.getObject(7));
                result.get(rs.getObject(1).toString()).add(rs.getObject(8));
                result.get(rs.getObject(1).toString()).add(rs.getObject(9));
                result.get(rs.getObject(1).toString()).add(rs.getObject(10));
            }

        } catch (Exception e){
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
        System.out.println(name);
    }

    public HashMap<String, ArrayList> getResult() {
        return result;
    }

    public void setResult(HashMap<String, ArrayList> result) {
        this.result = result;
    }

    public void setDetailISBN(String detailISBN) {
        this.detailISBN = detailISBN;
    }
}
