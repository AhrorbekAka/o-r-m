package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.dbCon;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet()
public class ManagerMealService extends HttpServlet {
    @Override// it uses for updating
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        String id=request.getParameter("action");

        String name=request.getParameter("name");
        String price=request.getParameter("price");
        //String type=request.getParameter("type");
        String preparation_time=request.getParameter("preparation_time");
        String available=request.getParameter("available");
        String description=request.getParameter("description");
        boolean t=false;
        String s="update meal set ";
        if (name!="") {s=s+"name="+name; t=true; }
        if (price!="") {s=s+",price="+price; t=true;}
        // if (type!="") {s=s+",type="+type; t=true;}
        if (preparation_time!="") {s=s+",preparation_time"+preparation_time; t=true;}
        if (available!="") {s=s+",available="+available; t=true;}
        if (description!="") {s=s+",description="+description; t=true;}

        s=s+" where id="+id;

        if (t)   {       update(s);   }
        RequestDispatcher rd=request.getRequestDispatcher("manager/mealmenu.jsp");
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

        String s=String.format("insert  into _table_ (name,price,type,preparation_time,available,description) values ('%s','%s','%s','%s','%s','%s')"
                ,name,price,type,preparation_time,available,description);

        System.out.println(s);
        post(s);


        RequestDispatcher rd=request.getRequestDispatcher("manager/mealmenu.jsp");
        rd.forward(request,response);


    }

    public void update( String query) {
        try {
            dbCon db = new dbCon();
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
            dbCon db = new dbCon();
            Connection con = db.connect_data_base();
            Statement statement = con.createStatement();

            statement.executeQuery(query);
            System.out.println(" Qo'shish bajarildi ");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
