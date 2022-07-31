package services;

import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.ServletContextEvent;

import javax.script.ScriptEngine;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebListener
public class DeployListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent event) {
	  String query="Select * from data";

			if (!get(query)) {createDBTables();
				System.out.println("yasadi");}


	}

	public boolean get (String query)  {
		ResultSet rs=null;
		boolean t=false;
		try {
			DBCon db = new DBCon();
			Connection con = db.connect_data_base();
			Statement statement = con.createStatement();
			rs=statement.executeQuery(query);
			rs.next(); t=true;
		}
		catch (Exception e)
		{
			System.out.println(e);
		}

		return t;
	}


	private void createDBTables() {
		List<String> sqlQueries = new ArrayList<>();

		sqlQueries.add("CREATE TABLE data ("

				+"exist boolean );");



				sqlQueries.add("CREATE TABLE _user_ (" +
				"ID int GENERATED ALWAYS AS IDENTITY, " +
				"First_Name varchar(255), " +
				"Last_Name varchar(255), " +
				"Age int, " +
				"Male boolean, " +
				"Role varchar(255), " +
				"E_Mail varchar(255), " +
				"Phone_Number varchar(255), " +
				"Password varchar(255), " +
				"PRIMARY KEY (ID) );");

		sqlQueries.add("CREATE TABLE meal (" +
				"ID int GENERATED ALWAYS AS IDENTITY, " +
				"Name varchar(255), " +
				"Price double precision, " +
				"Type varchar(255), " +
				"Preparation_Time varchar(255), " +
				"Available boolean, " +
				"Description varchar(255), " +
				"PRIMARY KEY (ID) );");

		sqlQueries.add("CREATE TABLE _table_ (" +
				"ID int GENERATED ALWAYS AS IDENTITY, " +
				"Number int, " +
				"Facilities varchar(255), " +
				"Type varchar(255), " +
				"Special_Price double precision, " +
				"Available boolean, " +
				"PRIMARY KEY (ID) );");

		sqlQueries.add("CREATE TABLE _order_ (" +
				"ID int GENERATED ALWAYS AS IDENTITY, " +
				"Table_Id int, " +
				"Time varchar(255), " +
				"Price double precision, " +
				"Paid boolean DEFAULT false, " +
				"Description varchar(255), " +"Up_number varchar(255), "+
				"PRIMARY KEY (ID), " +
				"CONSTRAINT fk_table " +
				"   FOREIGN KEY(Table_Id) " +
				"   REFERENCES _table_(id) " +
				"   ON DELETE SET NULL);");

		sqlQueries.add("CREATE TABLE order_meal (" +
				"Order_Id int NOT NULL, " +
				"Meal_Id int NOT NULL, " +
				"CONSTRAINT fk_order " +
				"   FOREIGN KEY(Order_Id) " +
				"   REFERENCES _order_(id) " +
				"   ON DELETE SET NULL, " +
				"CONSTRAINT fk_meal " +
				"   FOREIGN KEY(Meal_Id) " +
				"   REFERENCES meal(id) " +
				"   ON DELETE SET NULL );");

		sqlQueries.add("CREATE TABLE message (" +
				"ID int GENERATED ALWAYS AS IDENTITY, " +
				"Text varchar(255), " +
				"Up_number varchar(255), "
				+ "PRIMARY KEY (ID) );" );


		DBConnection dbConnection = new DBConnection();

		for (String sqlQuery : sqlQueries) {
			dbConnection.execute(sqlQuery);
		}

		dbConnection.insert("data","exist","true");

		 dbConnection.insert("_user_", "first_name, last_name, age, male, role, e_mail, phone_number, password",
				"'Ahror', 'Nematov', 25, true, 'MANAGER', 'john.w@gmail.com', '+998995219568', '123'");



		dbConnection.insert(
				"_user_",
				"first_name, last_name, age, male, role, e_mail, phone_number, password",
				"'Abbosali', 'Boymirzayev', 26, true, 'CUSTOMER', '', '+998996059496', '123'"
		);

		dbConnection.insert(
				"_user_",
				"first_name, last_name, age, male, role, e_mail, phone_number, password",
				"'John', 'Watson', 20 , true, 'STAFF', '', '+998941789608', '123'"
		);

		dbConnection.insert(
				"_user_",
				"first_name, last_name, age, male, role, e_mail, phone_number, password",
				"'Tom', 'Cruise', 24, true, 'CUSTOMER', '', '+998944040497', '123'"
		);




		dbConnection.insert("_table_",
				"number,facilities,type,special_price,available",
				"'4','in','BUSINESS','10','true'"
		);

		  dbConnection.insert("_table_",
				"number,facilities,type,special_price,available",
				"'4','out','BUSINESS','15','true'"
		);

		  dbConnection.insert("_table_",
				"number,facilities,type,special_price,available",
				"'6','in','FAST','15','false'"
		);

		  dbConnection.insert("_table_",
				"Number,Facilities,Type,Special_Price,Available",
				"'2','near the window','COMFORT','10','false'"
		);
		dbConnection.insert("_table_",
				"Number,Facilities,Type,Special_Price,Available",
				"'8','near the fountain','FAMILY','25','true'"
		);
		dbConnection.insert("_table_",
				"Number,Facilities,Type,Special_Price,Available",
				"'3','in','BUSINESS','10','true'"
		);
//mealdagi taomlar
		dbConnection.insert(   "meal",
				"Name,Price,Type,Preparation_Time,Available,Description",

				"'Apple pie','1','DESERT','20 min','true','A pie crust, whether all round or only on top, with a filling of sweetened apple'"
		);


		dbConnection.insert(   "meal",
				"Name,Price,Type,Preparation_Time,Available,Description",

				"'Bakewell tart','2','DESERT','25 min','true','Pastry shell filled with almond-flavoured sponge cake on a thin layer of jam. Developed from 1826 Bakewell'    "

		);
		dbConnection.insert(   "meal",
				"Name,Price,Type,Preparation_Time,Available,Description",

				"'Banoffee pie','1.2','DESERT','20 min','true','Pastry shell filled with bananas, cream and toffee'    "

		);
		dbConnection.insert(   "meal",
				"Name,Price,Type,Preparation_Time,Available,Description",

				"'Eccles cake','2.3','DESERT','30 min','true','Flaky pastry with butter and currants' "

		);
		dbConnection.insert(   "meal",
				"Name,Price,Type,Preparation_Time,Available,Description",

				"' Fish and Chips','3.2','FIRST','25 min','true','it contains chips and fish with some souce'    "

		);
		dbConnection.insert(   "meal",
				"Name,Price,Type,Preparation_Time,Available,Description",

				"'Bangers and Mash','4','SECOND','20 min','true','Also known as sausages and mash, this traditional dish consists of sausages and mashed potato, and is often accompanied with peas and gravy.' "

		);
		dbConnection.insert(   "meal",
				"Name,Price,Type,Preparation_Time,Available,Description",

				"'Full English Breakfast','3.2','SECOND','20 min','false','This breakfast usually includes: bacon, sausages, eggs, baked beans, toast, mushrooms, tomatoes, hash browns and black puddings'    "

		) ;
		dbConnection.insert(   "meal",
				"Name,Price,Type,Preparation_Time,Available,Description",

				"'Mince pie','3','DESERT','15 min','false','Usually small pastry shells filled with sweet mincemeat; since Early Modern times actual meat omitted'    "

		);
		dbConnection.insert(   "meal",
				"Name,Price,Type,Preparation_Time,Available,Description",

				"'Sunday Roast','5','SECOND','20 min','true','This dish is made up of: roasted meat (beef, chicken, lamb or pork), roast potato, Yorkshire pudding, stuffing, vegetable'  "

		);

		dbConnection.insert(   "meal",
				"Name,Price,Type,Preparation_Time,Available,Description",

				"'Seafood','6','FIRST','20 min','true','They might be light, creamy, savory, or spicy, but I promise you that they are irresistibly delectable' "

		);  dbConnection.insert(   "meal",
				"Name,Price,Type,Preparation_Time,Available,Description",

				"'Terrific Jamaican Appetizers','7','FIRST','25 min','false','As part of a well-known cuisine, Jamaican appetizers are very nutritious and culturally rich ' "

		); dbConnection.insert(   "meal",
				"Name,Price,Type,Preparation_Time,Available,Description",

				"'Stunning Cuban','10','FIRST','30 min','true', 'Cuba is also the birthplace of many attractive and unique dishes, including Cuban appetizers'"

		);
		dbConnection.insert(   "meal",
				"Name,Price,Type,Preparation_Time,Available,Description",

				"'Grilled Salmon','12','SECOND','25 min','true','A simple soy sauce and brown sugar marinade, with hints of lemon and garlic'    ");


	      }
	public void contextDestroyed(ServletContextEvent event)
	{

	}
}
