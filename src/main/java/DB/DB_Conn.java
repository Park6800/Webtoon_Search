package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DataClass.CountData;
import DataClass.UserData;
import DataClass.WebtoonData;

public class DB_Conn {

	public String _sql;

	Connection conn = null;

	public DB_Conn() {
		Connection();
	}

	public DB_Conn(String _sql) {
		Connection();
		this._sql = _sql;
	}

	void Connection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://localhost/book?characterEncoding=UTF-8&serverTimezone=UTC";
			String id = "root";
			String pwd = "1234"; // mysql 접속 비번
			conn = DriverManager.getConnection(url, id, pwd);
			System.out.println("db접속 성공");
		} catch (Exception e) {

			System.out.println("db접속 실패");
			e.printStackTrace();
		}

	}
	public void serach_webtoon(HttpServletRequest request, HttpServletResponse response, WebtoonData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;
		List<WebtoonData> toonlist = new ArrayList<WebtoonData>();

		try {
			stmt = conn.createStatement();
//			정보에맞는 차량 모두 조회 
			
			
			if(_Data.TITLE != null) {
			String sql = "select _TITLE , _DAY, _STORY_AUTHOR , _ART_AUTHOR , _URL from webtoon_info where _TITLE LIKE '%"
					+ _Data.TITLE + "%'";
			
			res = stmt.executeQuery(sql);
				while (res.next()) {
					WebtoonData Webtoon = new WebtoonData();
					Webtoon.TITLE = res.getString("_TITLE");
					Webtoon.DAY = res.getString("_DAY");
					Webtoon.STORY_AUTHOR = res.getString("_STORY_AUTHOR");
					Webtoon.ART_AUTHOR = res.getString("_ART_AUTHOR");
					Webtoon.URL = res.getString("_URL");
//		        조회한 결과 객체에담고 리스트에 추가 
					toonlist.add(Webtoon);

				}
				HttpSession session = request.getSession();
				
				session.setAttribute("toon_list", toonlist);
				response.sendRedirect("SerachPage.jsp");
			}
			else if (_Data.STORY_AUTHOR != null) {
				String sql = "select _TITLE , _DAY, _STORY_AUTHOR , _ART_AUTHOR , _URL from webtoon_info where _STORY_AUTHOR LIKE '%"
						+ _Data.STORY_AUTHOR + "%'";
				
				res = stmt.executeQuery(sql);
					while (res.next()) {
						WebtoonData Webtoon = new WebtoonData();
						Webtoon.TITLE = res.getString("_TITLE");
						Webtoon.DAY = res.getString("_DAY");
						Webtoon.STORY_AUTHOR = res.getString("_STORY_AUTHOR");
						Webtoon.ART_AUTHOR = res.getString("_ART_AUTHOR");
						Webtoon.URL = res.getString("_URL");
//			        조회한 결과 객체에담고 리스트에 추가 
						toonlist.add(Webtoon);

					}
					HttpSession session = request.getSession();
					
					session.setAttribute("toon_list", toonlist);
					response.sendRedirect("SerachPage.jsp");
			}
			else if (_Data.ART_AUTHOR != null) {
				String sql = "select _TITLE , _DAY, _STORY_AUTHOR , _ART_AUTHOR , _URL from webtoon_info where _ART_AUTHOR LIKE '%"
						+ _Data.ART_AUTHOR + "%'";
				
				res = stmt.executeQuery(sql);
					while (res.next()) {
						WebtoonData Webtoon = new WebtoonData();
						Webtoon.TITLE = res.getString("_TITLE");
						Webtoon.DAY = res.getString("_DAY");
						Webtoon.STORY_AUTHOR = res.getString("_STORY_AUTHOR");
						Webtoon.ART_AUTHOR = res.getString("_ART_AUTHOR");
						Webtoon.URL = res.getString("_URL");
//			        조회한 결과 객체에담고 리스트에 추가 
						toonlist.add(Webtoon);

					}
					HttpSession session = request.getSession();
					
					session.setAttribute("toon_list", toonlist);
					response.sendRedirect("SerachPage.jsp");
			}
	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void find_webtoon(HttpServletRequest request, HttpServletResponse response, WebtoonData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;
		List<WebtoonData> toonlist = new ArrayList<WebtoonData>();

		try {
			stmt = conn.createStatement();
//			정보에맞는 차량 모두 조회 
			String sql = "select _TITLE , _DAY, _STORY_AUTHOR , _ART_AUTHOR , _URL from webtoon_info where _GENRE ='"
					+ _Data.GENRE + "' AND _DAY ='" + _Data.DAY +  "'";
			res = stmt.executeQuery(sql);
				while (res.next()) {
					WebtoonData Webtoon = new WebtoonData();
					Webtoon.TITLE = res.getString("_TITLE");
					Webtoon.DAY = res.getString("_DAY");
					Webtoon.STORY_AUTHOR = res.getString("_STORY_AUTHOR");
					Webtoon.ART_AUTHOR = res.getString("_ART_AUTHOR");
					Webtoon.URL = res.getString("_URL");
//		        조회한 결과 객체에담고 리스트에 추가 
					toonlist.add(Webtoon);

				}
				HttpSession session = request.getSession();
				
				session.setAttribute("toon_list", toonlist);
				response.sendRedirect("GenrePage.jsp");
	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void login_service(HttpServletRequest request, HttpServletResponse response, UserData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;

		try {
			stmt = conn.createStatement();
//			정보에맞는 차량 모두 조회 
			String sql = "select _USER_ID , _ADMIN from user_info where _USER_ID ='"
					+ _Data.ID + "' AND _USER_PW ='" + _Data.PW +  "'";
			res = stmt.executeQuery(sql);
				while (res.next()) {
					UserData Data_ = new UserData();
					String ID = res.getString("_USER_ID");
					int ADMIN = res.getInt("_ADMIN");
				
					System.out.println(ID);
				HttpSession session = request.getSession();
				
				session.setAttribute("user_id", ID);
				session.setAttribute("admin", ADMIN);
				response.sendRedirect("Home.jsp");
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void liked_count(HttpServletRequest request, HttpServletResponse response, CountData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;

		try {
			stmt = conn.createStatement();
//			정보에맞는 차량 모두 조회 
			String sql = "update count_info set _LIKE = _LIKE + 1 WHERE _USER_ID ='" +_Data.ID+ "' AND _TITLE ='" + _Data.TITLE + "' AND liked =" + _Data.LIKED + "";
			res = stmt.executeQuery(sql);
				while (res.next()) {
					UserData Data_ = new UserData();
					String ID = res.getString("_USER_ID");
					int ADMIN = res.getInt("_ADMIN");
				
					System.out.println(ID);
					
					
				HttpSession session = request.getSession();
				
				session.setAttribute("user_id", ID);
				session.setAttribute("admin", ADMIN);
				response.sendRedirect("Home.jsp");
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

}