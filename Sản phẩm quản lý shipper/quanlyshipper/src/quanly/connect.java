/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package quanly;

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
        String url="jdbc:mysql://localhost:3306/qlshipper";//Đường dẫn vào Data Base
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
        String sql1 = "Insert user values(" + id + ",'" + name + "', '"+passwd+"','" + isAdmin + "', '" +isOpen+ "')";
        sta.executeUpdate(sql1);
    }
    
     public void shipperUpdate(int id, String name, String classID, int gender, String date, String dt, String address) throws SQLException {
        Statement sta = this.conn.createStatement();
        String sql1 = "Update shipper set hoten='" + name + "' , madh='"+ classID +"' , gioitinh ="+gender+" where mashipper =" + id + "";
        String sql2 = "Update shipper set ngaysinh='" + date + "' , dantoc ='"+dt+"' , quequan ='"+address+"' where mashipper =" + id + "";
        sta.executeUpdate(sql1);
        sta.executeUpdate(sql2);
    }
    public void shipperInsert(int id, String name, String classID, int gender, String date, String dt, String address) throws SQLException {
        Statement sta = this.conn.createStatement();
        String sql1 = "Insert shipper values(" + id + ",'" + name + "','" + classID + "', "+gender+", '"+date+"', '"+dt+"', '"+address+"' )";
        sta.executeUpdate(sql1);
    }
    
   
    
    public void Delete(String id, String TableName, String primarykey) throws SQLException {
        Statement sta = this.conn.createStatement();
        String sql = "DELETE FROM " + TableName +" where "+primarykey+" = " + id + "";
        sta.executeUpdate(sql);
    }
     public void DonhangUpdate(String id, String name, String dongia) throws SQLException {
        Statement sta = this.conn.createStatement();
        String sql1 = "UPDATE donhang SET tendh= '"+name+"',dongia= '"+dongia+"' WHERE madh='" + id + "'";
        sta.executeUpdate(sql1);
    }
    public void DonhangInsert(String id, String name,String dongia) throws SQLException {
        Statement sta = this.conn.createStatement();
        String sql1 = "Insert donhang values('" + id + "','" + name + "','" + dongia + "')";
        sta.executeUpdate(sql1);
    }
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
       connect conn = new connect();
    ResultSet rs = conn.getData("user");
    while(rs.next())
     {
         System.out.print(rs.getString(1)+ " - ");
         System.out.print(rs.getString(2)+ " - ");
          System.out.print(rs.getString(3)+ " - ");
           System.out.print(rs.getString(4)+ " - ");
            System.out.print(rs.getString(5)+ " - ");
          //   System.out.print(rs.getString(6)+ " - ");
          //    System.out.print(rs.getString(7)+ " - ");
      //   System.out.print(rs.getString(8));
         System.out.println("");
     }
    }
    }
