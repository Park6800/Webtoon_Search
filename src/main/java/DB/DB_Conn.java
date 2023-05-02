package DB;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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

	private String _sql2;

	public DB_Conn() {
		Connection();
	}

	public DB_Conn(String _sql, String _sql2) {
		Connection();
		this._sql = _sql;
		this._sql2 =_sql2;
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
	
	public void Signup (HttpServletRequest request, HttpServletResponse response, UserData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;
			
			PreparedStatement pstmt = null;
			try {
//				정보에맞는 차량 모두 조회 
				String sql = "insert into User_Info(_USER_ID, _USER_PW, _USER_NAME, _USER_BIRTH, _USER_GENDER)" + "values(?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, _Data.ID);
				pstmt.setString(2, _Data.PW);
				pstmt.setString(3, _Data.NAME);
				pstmt.setString(4, _Data.BIRTH);
				pstmt.setString(5, _Data.GENDER);
				pstmt.executeUpdate();
				
				HttpSession session = request.getSession();
				
				response.sendRedirect("Home.jsp");
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
	
	public void serach_webtoon(HttpServletRequest request, HttpServletResponse response, WebtoonData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;
		List<WebtoonData> toonlist = new ArrayList<WebtoonData>();

		try {
			stmt = conn.createStatement();
			
			
			if(_Data.getTITLE() != null) {
			String sql = "select _TITLE , _DAY, _STORY_AUTHOR , _ART_AUTHOR , _URL from webtoon_info where _TITLE LIKE '%"
					+ _Data.getTITLE() + "%'";
			
			res = stmt.executeQuery(sql);
				while (res.next()) {
					WebtoonData Webtoon = new WebtoonData();
					Webtoon.setTITLE(res.getString(1));
					Webtoon.setDAY(res.getString(2));
					Webtoon.setSTORY_AUTHOR(res.getString(3));
					Webtoon.setART_AUTHOR(res.getString(4));
					Webtoon.setURL(res.getString(5));
//		        조회한 결과 객체에담고 리스트에 추가 
					toonlist.add(Webtoon);

				}
				HttpSession session = request.getSession();
				
				session.setAttribute("toon_list", toonlist);
				response.sendRedirect("SerachPage.jsp");
			}
			else if (_Data.getSTORY_AUTHOR() != null) {
				String sql = "select _TITLE , _DAY, _STORY_AUTHOR , _ART_AUTHOR , _URL from webtoon_info where _STORY_AUTHOR LIKE '%"
						+ _Data.getSTORY_AUTHOR() + "%'";
				
				res = stmt.executeQuery(sql);
					while (res.next()) {
						WebtoonData Webtoon = new WebtoonData();
						Webtoon.setTITLE(res.getString(1));
						Webtoon.setDAY(res.getString(2));
						Webtoon.setSTORY_AUTHOR(res.getString(3));
						Webtoon.setART_AUTHOR(res.getString(4));
						Webtoon.setURL(res.getString(5));
//			        조회한 결과 객체에담고 리스트에 추가 
						toonlist.add(Webtoon);

					}
					HttpSession session = request.getSession();
					
					session.setAttribute("toon_list", toonlist);
					response.sendRedirect("SerachPage.jsp");
			}
			else if (_Data.getART_AUTHOR() != null) {
				String sql = "select _TITLE , _DAY, _STORY_AUTHOR , _ART_AUTHOR , _URL from webtoon_info where _ART_AUTHOR LIKE '%"
						+ _Data.getART_AUTHOR() + "%'";
				
				res = stmt.executeQuery(sql);
					while (res.next()) {
						WebtoonData Webtoon = new WebtoonData();
						Webtoon.setTITLE(res.getString(1));
						Webtoon.setDAY(res.getString(2));
						Webtoon.setSTORY_AUTHOR(res.getString(3));
						Webtoon.setART_AUTHOR(res.getString(4));
						Webtoon.setURL(res.getString(5));
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
			String sql = "select _TITLE , _DAY, _STORY_AUTHOR , _ART_AUTHOR , _URL , _LIKE, _GENRE from webtoon_info where _GENRE ='"
					+ _Data.getGENRE() + "' AND _DAY ='" + _Data.getDAY() +  "'";
			res = stmt.executeQuery(sql);
				while (res.next()) {
					WebtoonData Webtoon = new WebtoonData();
					Webtoon.setTITLE(res.getString(1));
					Webtoon.setDAY(res.getString(2));
					Webtoon.setSTORY_AUTHOR(res.getString(3));
					Webtoon.setART_AUTHOR(res.getString(4));
					Webtoon.setURL(res.getString(5));
					Webtoon.setLIKE(res.getString(6));
					Webtoon.setGENRE(res.getString(7));
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
	
	public void find_webtoon_viewed(HttpServletRequest request, HttpServletResponse response, WebtoonData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;
		List<WebtoonData> toonlist = new ArrayList<WebtoonData>();

		try {
			stmt = conn.createStatement();
			String sql = "select _TITLE , _DAY, _STORY_AUTHOR , _ART_AUTHOR , _URL , _LIKE from webtoon_info where _GENRE ='"
					+ _Data.getGENRE() + "' AND _DAY ='" + _Data.getDAY() +  "' order by _LIKE DESC";
			res = stmt.executeQuery(sql);
				while (res.next()) {
					WebtoonData Webtoon = new WebtoonData();
					Webtoon.setTITLE(res.getString(1));
					Webtoon.setDAY(res.getString(2));
					Webtoon.setSTORY_AUTHOR(res.getString(3));
					Webtoon.setART_AUTHOR(res.getString(4));
					Webtoon.setURL(res.getString(5));
					Webtoon.setLIKE(res.getString(6));
					System.out.println(res.getString("_LIKE"));
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
	
	public CountData conut_Data (String ID_value , String title_) {
		ResultSet res = null;
		try {
			String sql = "select count(_TITLE) from count_info where _TITLE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title_);
			res = pstmt.executeQuery();
			
			if (res.next()) {
//				조회 차량 정보 객체에 담아서 리턴 
				CountData dt = new CountData();
				dt.setCOUNT(res.getInt(1));
				return dt;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void liked_count(HttpServletRequest request, HttpServletResponse response, CountData _Data) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		try {
//			정보에맞는 차량 모두 조회 
			String sql = "insert into count_info(_USER_ID, _TITLE, _LIKE, _CLICK)" + "values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, _Data.getID());
			pstmt.setString(2, _Data.getTITLE());
			pstmt.setString(3, _Data.getLIKE());
			pstmt.setInt(4, _Data.getCLICK());
			pstmt.executeUpdate();
			
			HttpSession session = request.getSession();
			
			session.setAttribute("user_id", _Data.getID());
			session.setAttribute("title", _Data.getTITLE());
			String encodedTitle = URLEncoder.encode(_Data.getTITLE(), "UTF-8");
			response.sendRedirect("Detail.jsp?title=" + encodedTitle);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
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
	
	
	public CountData liked_(String ID_value , String title_) {
		ResultSet res = null;
		try {
			String sql = "select _LIKE from count_info where _USER_ID = ? and _TITLE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID_value);
			pstmt.setString(2, title_);
			res = pstmt.executeQuery();
			
			if (res.next()) {
//				조회 차량 정보 객체에 담아서 리턴 
				CountData dt = new CountData();
				dt.setLIKE(res.getString(1));
				return dt;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public WebtoonData liked_img (String ID_value , String title_) {
		ResultSet res = null;
		try {
			String sql = "select _DAY, _GENRE, _STORY_AUTHOR, _ART_AUTHOR, _COMPANY, _URL from webtoon_info where _TITLE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title_);
			res = pstmt.executeQuery();
			
			if (res.next()) {
//				조회 차량 정보 객체에 담아서 리턴 
				WebtoonData dt = new WebtoonData();
				dt.setDAY(res.getString(1));
				dt.setGENRE(res.getString(2));
				dt.setSTORY_AUTHOR(res.getString(3));
				dt.setART_AUTHOR(res.getString(4));
				dt.setCOMPANY(res.getString(5));
				dt.setURL(res.getString(6));
				return dt;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	public void liked_hate(HttpServletRequest request, HttpServletResponse response, CountData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;
		try {
			PreparedStatement pstmt = null;
//			정보에맞는 차량 모두 조회 
			String sql = "delete from Count_info where _USER_ID = '" + _Data.getID() + "' AND _TITLE = '" + _Data.getTITLE() + "'";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			HttpSession session = request.getSession();
			
			session.setAttribute("user_id", _Data.getID());
			session.setAttribute("title", _Data.getTITLE());
			String encodedTitle = URLEncoder.encode(_Data.getTITLE(), "UTF-8");
			response.sendRedirect("Detail.jsp?title=" + encodedTitle);
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
	
	public void updata_count(HttpServletRequest request, HttpServletResponse response, CountData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;
		try {
			PreparedStatement pstmt = null;
//			정보에맞는 차량 모두 조회 
			String sql = "UPDATE Webtoon_info SET _LIKE = _LIKE + 1 WHERE _TITLE = '" + _Data.getTITLE() + "'";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			HttpSession session = request.getSession();
			
			session.setAttribute("user_id", _Data.getID());
			session.setAttribute("title", _Data.getTITLE());
			String encodedTitle = URLEncoder.encode(_Data.getTITLE(), "UTF-8");
			response.sendRedirect("Detail.jsp?title=" + encodedTitle);
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