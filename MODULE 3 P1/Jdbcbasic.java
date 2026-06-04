import java.sql.*;
public class Jdbcbasic {
	public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/school",
                    "root",
                    "root123"
            );
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT*FROM students");
            while(rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");

                System.out.println(id + " " +name);
            }
            con.close();
        } catch(Exception e) {
            System.out.println(e);
        }
    }
}
