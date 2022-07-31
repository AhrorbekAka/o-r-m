package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.DBCon;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/staff")
public class Staff extends HttpServlet {

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
           {
        int  id=Integer.parseInt(request.getParameter("id"));
        String query ="update _order_ set paid=true where id="+id;
       update(query);
       query="select table_id from _order_ where id="+id;


               String table_id=null;
               try {
                   table_id=get(query);
               } catch (Exception e) {
                   e.printStackTrace();

               }
         query="update _table_ set available = true where id="+table_id;
               update(query);

               response.sendRedirect("staff.jsp");


   //    query="delete from order_meal where order_id="+id;

     //  update(query);

           }
    public void update(String query) {
        try {
            DBCon db = new DBCon();
            Connection con = db.connect_data_base();
            Statement statement = con.createStatement();

            statement.executeUpdate(query);
            System.out.println(" Qo'shish bajarildi ");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }


    public String get (String query) throws Exception,SQLException {
        ResultSet rs=null;
        try {
            DBCon db = new DBCon();
            Connection con = db.connect_data_base();
            Statement statement = con.createStatement();
            rs=statement.executeQuery(query);
            rs.next();
            System.out.println("topilgan id==> "+rs.getString("table_id"));
        }
        catch (Exception e)
        {
            System.out.println("berilgan kishini topa olmadim");
        }

        return rs.getString("table_id");
    }



}
