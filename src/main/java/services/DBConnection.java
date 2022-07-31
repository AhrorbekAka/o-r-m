package services;

import java.sql.*;

public class DBConnection {
	private final String dbUrl = "jdbc:postgresql://localhost/orm";
	private final String dbUser = "postgres";
	private final String dbPassword = "postgres";

	public ResultSet execute(String query) {
		try {
			Class.forName("org.postgresql.Driver");

			Connection con = DriverManager.getConnection(this.dbUrl, this.dbUser, this.dbPassword);
			Statement statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			con.close();
			return resultSet;
		} catch (SQLException e) {
			System.out.println(e.getErrorCode());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}




	public ResultSet get(String table, String field, String key) {
		try {
			String query = "SELECT * FROM " + table + " WHERE " + field + " = " + key;
			System.out.println("Query executed");
			Connection con = DriverManager.getConnection(this.dbUrl, this.dbUser, this.dbPassword);
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
			Connection con = DriverManager.getConnection(this.dbUrl, this.dbUser, this.dbPassword);
			Statement statement = con.createStatement();
			statement.executeUpdate("INSERT INTO " + tableName + " (" + fields + ") VALUES (" + values + ");");
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
