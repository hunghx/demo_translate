package xamp;

import java.sql.*;

public class database {
	  public static void main(String[] args) {
	    // データベースに接続
	    try (Connection conn = DriverManager.getConnection(
	        "jdbc:mysql://localhost:3306/docotsubu", "root", "")) {
	      // SELECT文を準備
	      String sql = "SELECT ID,NAME,MSG FROM mutter";
	      PreparedStatement pStmt = conn.prepareStatement(sql);
	      // SELECTを実行し、結果表（ResultSet）を取得
	      ResultSet rs = pStmt.executeQuery();
	      // 結果表に格納されたレコードの内容を表示
	      while (rs.next()) {
	        String id = rs.getString("ID");
	        String name = rs.getString("NAME");
	        String msg  = rs.getString("MSG");
	        // 取得したデータを出力
	        System.out.println("ID:" + id);
	        System.out.println("名前:" + name);
	        System.out.println("メッセージ:" + msg + "\n");
	      }
	    } catch (SQLException e) {
	      e.printStackTrace();
	    }
	  }
}