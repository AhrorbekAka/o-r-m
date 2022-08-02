package services;

import java.sql.*;

public class DBConnection {
	private final String dbUrl = "jdbc:postgresql://localhost/orm";
	private final String dbUser = "postgres";
	private final String dbPassword = "0123";

	public Connection connect_data_base() {
		Connection conn=null;
		try {
			Class.forName("org.postgresql.Driver");

			conn = DriverManager.getConnection(this.dbUrl, this.dbUser, this.dbPassword);
			if (conn!=null)
				System.out.println("connection was  established");
			else System.out.println("connection Failed ");}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return conn;
	}
	public ResultSet execute(String query) {
		try {
			Connection con = connect_data_base();
			Statement statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			con.close();
			return resultSet;
		} catch (SQLException e) {
			System.out.println(e.getErrorCode());
		}
		return null;
	}
	public void update(String query) {
		try {
			Connection con = connect_data_base();
			Statement statement = con.createStatement();
			statement.executeUpdate(query);

			statement.close();
			con.close();
		} catch (SQLException e) {
			System.out.println(e.getErrorCode());
		}
	}

	public ResultSet get(String table, String field, String key) {
		try {
			String query = "SELECT * FROM " + table + " WHERE " + field + " = " + key;

			System.out.println("Query executed");

			Connection con = connect_data_base();
			Statement statement = con.createStatement();

			System.out.println("bajarildi");
//			Statement statement = this.connection.createStatement();
			ResultSet result = statement.executeQuery(query);

			con.close();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public void insert(String tableName, String fields, String values) {
		try {
			Connection con = connect_data_base();
			Statement statement = con.createStatement();
			statement.executeUpdate("INSERT INTO " + tableName + " (" + fields + ") VALUES (" + values + ");");
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
