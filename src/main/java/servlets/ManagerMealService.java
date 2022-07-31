package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.DBCon;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/ManagerMeal")
public class ManagerMealService extends HttpServlet {



    @Override// it uses for updating
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {


        String id=request.getParameter("action");

        String name=request.getParameter("name");
        System.out.println("name0000000  "+ name);
        String price=request.getParameter("price");
        String type=request.getParameter("type");
        //String type=request.getParameter("type");
        String preparation_time=request.getParameter("preparation_time");
        String available=request.getParameter("available");
        String description=request.getParameter("description");
        boolean t=false;
        String s="update meal set ";
        String v="";
        if (name!="") {s=s+"name='"+name+"'"; t=true; v=","; }
        if (price!="") {s=s+v+"price="+price; t=true; v=","; }
         if (type!="") {s=s+v+"type='"+type+"'"; t=true;  v=",";  }
        if (preparation_time!="") {s=s+v+"preparation_time='"+preparation_time+"'"; t=true; v=",";}
        if (available!="") {s=s+v+"available="+available; t=true; v=",";}
        if (description!="") {s=s+v+"description='"+description+"'"; t=true; v=",";}

        s=s+" where id="+id;
        System.out.println(s);
        if (t)   {       update(s);   }
        RequestDispatcher rd=request.getRequestDispatcher("Man_mealmenu.jsp");
        rd.forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String name=request.getParameter("name");
        String price=request.getParameter("price");
        String type=request.getParameter("type");
        String preparation_time=request.getParameter("preparation_time");
        String available=request.getParameter("available");
        String description=request.getParameter("description");

        String s=String.format("insert  into meal (name,price,type,preparation_time,available,description) values ('%s','%s','%s','%s','%s','%s')"
                ,name,price,type,preparation_time,available,description);

        System.out.println(s);
        post(s);


        RequestDispatcher rd=request.getRequestDispatcher("Man_mealmenu.jsp");
        rd.forward(request,response);


    }

    public void update( String query) {
        try {
            DBCon db = new DBCon();
            Connection con = db.connect_data_base();
            Statement statement = con.createStatement();

            statement.executeUpdate(query);
            System.out.println("topshiriq bajarildi");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void post ( String query) {
        try {
            DBCon db = new DBCon();
            Connection con = db.connect_data_base();
            Statement statement = con.createStatement();

            statement.executeQuery(query);
            System.out.println(" Qo'shish bajarildi ");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
