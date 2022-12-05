/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package quanlycanbo;

/**
 *
 * @author Huy Laptop
 */
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class connect {

     private final Connection conn;
    public connect() throws ClassNotFoundException, SQLException{
        //Nạp trình điều khiển
        Class.forName("com.mysql.jdbc.Driver");
        //Tạo kết nối
        String url="jdbc:mysql://localhost:3306/qlcb";//Đường dẫn vào Data Base
        this.conn=DriverManager.getConnection(url,"root","");
    }
    public ResultSet getData(String tbname) throws SQLException{
        
        ResultSet rs;
        //Tạo đối tượng Statement()
        Statement ts= this.conn.createStatement();
        String sql="select * from "+tbname;
        //Két quả trả về được lưu trong rs
        rs=ts.executeQuery(sql);
        return rs;
    }
      public void Close() throws SQLException {
        if (this.conn != null) {
            this.conn.close();
        }
    }
        public void UserUpdate(int id, String name, String passwd , int isAdmin, int isOpen) throws SQLException {
        Statement sta = this.conn.createStatement();
        String sql1 = "Update user set username='" + name + "', password='" + passwd + "' where id =" + id + "";
        String sql2 = "UPDATE `user` SET `mod`= "+isAdmin+",`state`="+isOpen+" WHERE `id`=" + id + ";";
        sta.executeUpdate(sql1);
        sta.executeUpdate(sql2);
    }
    public void UserUpdatePasswd(int id, String passwd) throws SQLException{
        Statement sta = this.conn.createStatement();
        String sql1 = "Update user set password='" + passwd + "' where id =" + id + "";
        sta.executeUpdate(sql1);
    }
    public void UserInsert(int id, String name, String passwd , int isAdmin, int isOpen) throws SQLException {
        Statement sta = this.conn.createStatement();
        String sql1 = "Insert user values('" + id + "','" + name + "', '"+passwd+"','" + isAdmin + "', '" +isOpen+ "')";
        sta.executeUpdate(sql1);
    }
    
    public void StudentUpdate(int id, String name, String classID, int gender, String date, String dt, String address, String chucvu) throws SQLException {
        Statement sta = this.conn.createStatement();
        String sql1 = "Update canbo set hoten='" + name + "' , mapb='"+ classID +"' , gioitinh ='"+gender+"' where macb =" + id + "";
        String sql2 = "Update canbo set ngaysinh='" + date + "' , dantoc ='"+dt+"' , quequan ='"+address+"',chucvu ='"+chucvu+"' where macb =" + id + "";
        sta.executeUpdate(sql1);
        sta.executeUpdate(sql2);
    }
    public void StudentInsert(int id, String name, String classID, int gender, String date, String dt, String address, String chucvu) throws SQLException {
        Statement sta = this.conn.createStatement();
        String sql1 = "Insert canbo values(" + id + ",'" + name + "','" + classID + "', "+gender+", '"+date+"', '"+dt+"', '"+address+"' ,'"+chucvu+"')";
        sta.executeUpdate(sql1);
    }
    
    public void ClassUpdate(String id, String name) throws SQLException {
        Statement sta = this.conn.createStatement();
        String sql1 = "UPDATE phongban SET tenphongban = '"+name+"' WHERE mapb ='" + id + "'";
        sta.executeUpdate(sql1);
    }
    public void ClassInsert(String id, String name) throws SQLException {
        Statement sta = this.conn.createStatement();
        String sql1 = "Insert phongban values('" + id + "','" + name + "')";
        sta.executeUpdate(sql1);
    }
    
    public void Delete(String id, String TableName, String primarykey) throws SQLException {
        Statement sta = this.conn.createStatement();
        String sql = "DELETE FROM " + TableName +" where "+primarykey+" = " + id + "";
        sta.executeUpdate(sql);
    }
  public void Phongbandelete(String id, String TableName) throws SQLException {
        Statement sta = this.conn.createStatement();
        String sql = "DELETE FROM " + TableName +" where mapb = '" + id + "'";
        sta.executeUpdate(sql);
    }
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
       connect conn = new connect();
    ResultSet rs = conn.getData("canbo");
    while(rs.next())
     {
         System.out.print(rs.getString(1)+ " - ");
         System.out.print(rs.getString(2)+ " - ");
          System.out.print(rs.getString(3)+ " - ");
           System.out.print(rs.getString(4)+ " - ");
            System.out.print(rs.getString(5)+ " - ");
             System.out.print(rs.getString(6)+ " - ");
              System.out.print(rs.getString(7)+ " - ");
         System.out.print(rs.getString(8));
         System.out.println("");
     }
    }
    }
    

