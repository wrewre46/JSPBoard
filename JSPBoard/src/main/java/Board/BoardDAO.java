package Board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	private Connection conn;
	
	private ResultSet rs;
	
	public BoardDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/board";
			String dbID = "root";
			String dbPassword = "0000";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL = "SELECT boardID FROM board ORDER BY boardID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int write(String boardTitle, String userID, String boardContent) {
		String SQL = "INSERT INTO board VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext());
			pstmt.setString(2,  boardTitle);
			pstmt.setString(3,  userID);
			pstmt.setString(4,  getDate());
			pstmt.setString(5,  boardContent);
			pstmt.setInt(6,  1);
			//rs = pstmt.executeQuery();
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList<Board> getList(int pageNumber){
		String SQL = "SELECT * FROM board WHERE boardAvailable = 1 ORDER BY boardID DESC LIMIT 10 OFFSET ?";
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, (pageNumber -1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
				list.add(board);
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}	

	public Board getBoard(int BoardID) {
		String SQL = "SELECT * FROM board WHERE boardID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, BoardID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Board board = new Board();
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
				return board;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int update(int BoardID, String BoardTitle, String BoardContent) {
		String SQL ="UPDATE Board SET boardTitle = ?, boardContent = ? WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  BoardTitle);
			pstmt.setString(2,  BoardContent);
			pstmt.setInt(3,  BoardID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int findBoardNumber(int BoardID) {
		BoardDAO boardDAO=new BoardDAO();
		ArrayList<Board> arr= boardDAO.getTotalAvailableList();  
		int k = 0;
		int num=0;
		while(true) {
			if(k>=arr.size()) break;
			if(arr.get(k).getBoardID()==BoardID) {
				num=k+1;
				break;
			}
			k++;
		}
		return num;		
	}
	public ArrayList<Board> getTotalAvailableList(){
			String SQL = "SELECT * FROM board WHERE boardAvailable = 1";
			ArrayList<Board> list = new ArrayList<Board>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Board board = new Board();
					board.setBoardID(rs.getInt(1));
					board.setBoardTitle(rs.getString(2));
					board.setUserID(rs.getString(3));
					board.setBoardDate(rs.getString(4));
					board.setBoardContent(rs.getString(5));
					board.setBoardAvailable(rs.getInt(6));
					list.add(board);
				}
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	public int delete(int BoardID) {
		String SQL ="UPDATE Board SET boardAvailable=0 WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, BoardID);
			
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}