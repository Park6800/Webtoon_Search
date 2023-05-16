package DB;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DataClass.CountData;
import DataClass.ReviewData;
import DataClass.UserData;
import DataClass.WebtoonData;

public class DB_Conn {

	public String _sql;

	Connection conn = null;

	public DB_Conn() {
		Connection();
	}

	public DB_Conn(String _sql, String _sql2) {
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

	public void Signup(HttpServletRequest request, HttpServletResponse response, UserData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		
			PreparedStatement pstmt = null;
			try {
				String sql = "insert into User_Info(_USER_ID, _USER_PW, _USER_NAME, _USER_BIRTH, _USER_GENDER)" + "values(?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, _Data.ID);
				pstmt.setString(2, _Data.PW);
				pstmt.setString(3, _Data.NAME);
				pstmt.setString(4, _Data.BIRTH);
				pstmt.setString(5, _Data.GENDER);
				pstmt.executeUpdate();
				

				
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
	
	public void User_Info_Updata(HttpServletRequest request, HttpServletResponse response, UserData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		try {
			PreparedStatement pstmt = null;
			String sql = "UPDATE user_info SET _USER_NAME = ? , _USER_BIRTH = ? , _USER_GENDER = ? WHERE _USER_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, _Data.NAME);
			pstmt.setString(2, _Data.BIRTH);
			pstmt.setString(3, _Data.GENDER);
			pstmt.setString(4, _Data.ID);
			pstmt.executeUpdate();

			HttpSession session = request.getSession();
			
			session.setAttribute("user_id", _Data.ID);
			session.setAttribute("user_name", _Data.NAME);
			session.setAttribute("user_birth", _Data.BIRTH);
			session.setAttribute("user_gender", _Data.GENDER);
			
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
	// 아이디 찾기
	public void findid_UserData(HttpServletRequest request, HttpServletResponse response, UserData _Data)
			throws IOException {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;

		try {
			stmt = conn.createStatement();
//			이름과 성별, 생년월일로 정보찾는 쿼리 
			String sql = "select _USER_ID from User_Info where _USER_NAME = '" + _Data.NAME + "' AND _USER_BIRTH = '" + _Data.BIRTH
					+ "'";

			res = stmt.executeQuery(sql);
			while (res.next()) {
				String ID_ = res.getString("_USER_ID");
//				세션객체 사용해서 저장 
				HttpSession session = request.getSession();
				session.setAttribute("user_id", ID_);

				response.sendRedirect("Find_id.jsp");
			}
			// 해당 쿼리 결과가 없을 경우 페이지 리로딩
			response.sendRedirect("Find_id.jsp");
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
	
	// 비밀번호 찾기
		public void findpw_UserData(HttpServletRequest request, HttpServletResponse response, UserData _Data) {
			// TODO Auto-generated method stub
			Statement stmt = null;
			ResultSet res = null;

			try {
				stmt = conn.createStatement();
//				아이디,이름,생년월일,성별로 정보찾는 쿼리
				String sql = "select _USER_PW from User_Info where _USER_ID = '" + _Data.ID + "' AND _USER_NAME = '" + _Data.NAME
						+ "' AND _USER_BIRTH = '" + _Data.BIRTH + "'";

				res = stmt.executeQuery(sql);
				while (res.next()) {
					String PW_ = res.getString("_USER_PW");

//					세션객체 사용해서 저장 
					HttpSession session = request.getSession();
					session.setAttribute("user_pw", PW_);
//	  			pw찾기 성공시 (찾은 정보를 가지고 )리다이렉션 
					response.sendRedirect("Find_pw.jsp");
				}
				// 해당 쿼리 결과가 없을 경우 페이지 리로딩
				response.sendRedirect("Find_pw.jsp");
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

	// 윕툰 검색 ( 제목 , 글 , 그림 작가 별 검색 기능 )
	public void serach_webtoon(HttpServletRequest request, HttpServletResponse response, WebtoonData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;
		List<WebtoonData> toonlist = new ArrayList<WebtoonData>();

		try {
			stmt = conn.createStatement();

			if (_Data.getTITLE() != null) {
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
					HttpSession session = request.getSession();

					session.setAttribute("toon_list", toonlist);
					response.sendRedirect("SerachPage.jsp");
				}
			} else if (_Data.getSTORY_AUTHOR() != null) {
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
					HttpSession session = request.getSession();

					session.setAttribute("toon_list", toonlist);
					response.sendRedirect("SerachPage.jsp");
				}
			} else if (_Data.getART_AUTHOR() != null) {
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
					HttpSession session = request.getSession();

					session.setAttribute("toon_list", toonlist);
					response.sendRedirect("SerachPage.jsp");

				}
			}
			// 일치하는 조건이 없을때 Serach_chk 라는 세션을 가지고 홈 페이지에서 오류를 뛰워주고 사라짐           
			HttpSession session = request.getSession();

			session.setAttribute("Serach_chk", "1");
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

	// 웹툰 찾기 버튼 요일, 장르
	public void find_webtoon(HttpServletRequest request, HttpServletResponse response, WebtoonData _Data) {
	    Statement stmt = null;
	    ResultSet res = null;
	    List<WebtoonData> toonlist = new ArrayList<WebtoonData>();

	    try {
	        stmt = conn.createStatement();
	        String sql = "SELECT _TITLE, _DAY, _STORY_AUTHOR, _ART_AUTHOR, _URL, _LIKE, _GENRE FROM webtoon_info WHERE _GENRE = '"
	                + _Data.getGENRE() + "' AND _DAY = '" + _Data.getDAY() + "' ORDER BY _TITLE DESC";
	        res = stmt.executeQuery(sql);
	        while (res.next()) {
	            WebtoonData Webtoon = new WebtoonData();
	            Webtoon.setTITLE(res.getString("_TITLE"));
	            Webtoon.setDAY(res.getString("_DAY"));
	            Webtoon.setSTORY_AUTHOR(res.getString("_STORY_AUTHOR"));
	            Webtoon.setART_AUTHOR(res.getString("_ART_AUTHOR"));
	            Webtoon.setURL(res.getString("_URL"));
	            Webtoon.setLIKE(res.getString("_LIKE"));
	            Webtoon.setGENRE(res.getString("_GENRE"));
	            // 조회한 결과 객체에 담고 리스트에 추가 
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

	// 조회순 웹툰 찾기
	public void find_webtoon_viewed(HttpServletRequest request, HttpServletResponse response, WebtoonData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;
		List<WebtoonData> toonlist = new ArrayList<WebtoonData>();

		try {
			stmt = conn.createStatement();
			String sql = "select _TITLE , _DAY, _STORY_AUTHOR , _ART_AUTHOR , _URL , _LIKE, _Genre from webtoon_info where _GENRE ='"
					+ _Data.getGENRE() + "' AND _DAY ='" + _Data.getDAY() + "' order by _LIKE DESC";
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

	public void find_webtoon_liked(HttpServletRequest request, HttpServletResponse response, WebtoonData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;
		List<WebtoonData> toonlist = new ArrayList<WebtoonData>();

		try {
			stmt = conn.createStatement();
			String sql = "select count(B._CLICK) as title_count, A._TITLE , A._DAY, A._STORY_AUTHOR, A._ART_AUTHOR, A._URL, A._LIKE, A._GENRE FROM webtoon_info AS A LEFT JOIN count_info AS B ON A._TITLE = B._TITLE WHERE A._GENRE ='"
					+ _Data.getGENRE() + "' AND A._DAY = '" + _Data.getDAY()
					+ "' GROUP BY A._TITLE, A._DAY, A._STORY_AUTHOR, A._ART_AUTHOR, A._URL, A._LIKE, A._GENRE ORDER BY title_count DESC";
			res = stmt.executeQuery(sql);
			while (res.next()) {
				WebtoonData Webtoon = new WebtoonData();
				Webtoon.setTITLE(res.getString(2));
				Webtoon.setDAY(res.getString(3));
				Webtoon.setSTORY_AUTHOR(res.getString(4));
				Webtoon.setART_AUTHOR(res.getString(5));
				Webtoon.setURL(res.getString(6));
				Webtoon.setLIKE(res.getString(7));
				Webtoon.setGENRE(res.getString(8));
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

	// 로그인
	public void login_service(HttpServletRequest request, HttpServletResponse response, UserData _Data) throws IOException {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;

		try {
			stmt = conn.createStatement();

			String sql = "select _USER_ID ,_USER_PW, _USER_NAME, _USER_BIRTH, _USER_GENDER, _ADMIN from user_info where _USER_ID ='" + _Data.ID + "'"; 
			res = stmt.executeQuery(sql);
			boolean idExist = false;
			while (res.next()) {
				String ID_ = res.getString("_USER_ID");
				String PW_ = res.getString("_USER_PW");
				String NAME_ = res.getString("_USER_NAME");
				String BIRTH_ = res.getString("_USER_BIRTH");
				String GENDER_ = res.getString("_USER_GENDER");
				int ADMIN_ = res.getInt("_ADMIN");

				if (_Data.ID.equals(ID_)) {
					idExist = true;
					if (PW_.equals(_Data.PW)) {
//							세션객체 사용해서 저장 
						HttpSession session = request.getSession();
						session.setAttribute("user_id", _Data.ID);
						session.setAttribute("user_name", NAME_);
						session.setAttribute("user_birth", BIRTH_);
						session.setAttribute("user_gender", GENDER_);
						
						session.setAttribute("admin", ADMIN_);
						response.sendRedirect("Home.jsp");
					} else {
//							비밀번호 불일치로 실패시 로그인화면으로 다시 리로딩
						HttpSession session = request.getSession();
						session.setAttribute("chk", "2");
						response.sendRedirect("Login.jsp");
					}
					
				}
			}
			if (!idExist) {
				HttpSession session = request.getSession();
				session.setAttribute("chk", "1");
				response.sendRedirect("Login.jsp");
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
	
	public void delete_userdata(HttpServletRequest request, HttpServletResponse response, UserData _Data) throws IOException {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;


		try {
			PreparedStatement pstmt = null; // SQL실행객체

			String sql = "delete from user_nfo where _USER_ID = '" + _Data.ID + "' AND _USER_PW = '" + _Data.PW + "'";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			response.sendRedirect("Logout.jsp");
	
		} catch (Exception e) {
			e.printStackTrace();
			HttpSession session = request.getSession();
			session.setAttribute("error", "4");
			response.sendRedirect("Delete.jsp");
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

	//
	public CountData conut_Data(String ID_value, String title_) {
		ResultSet res = null;
		try {
			String sql = "select count(_TITLE) from count_info where _TITLE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title_);
			res = pstmt.executeQuery();

			if (res.next()) {
				CountData dt = new CountData();
				dt.setCOUNT(res.getInt(1));
				return dt;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 좋아요 기능
	public void liked_count(HttpServletRequest request, HttpServletResponse response, CountData _Data) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		try {
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

	// 좋아요
	public CountData liked_(String ID_value, String title_) {
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

	//
	public WebtoonData liked_img(String ID_value, String title_) {
		ResultSet res = null;
		try {
			String sql = "select _DAY, _GENRE, _STORY_AUTHOR, _ART_AUTHOR, _COMPANY, _URL from webtoon_info where _TITLE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title_);
			res = pstmt.executeQuery();

			if (res.next()) {
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

	// 좋아요 해제 기능
	public void liked_hate(HttpServletRequest request, HttpServletResponse response, CountData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		try {
			PreparedStatement pstmt = null;
			String sql = "delete from Count_info where _USER_ID = '" + _Data.getID() + "' AND _TITLE = '"
					+ _Data.getTITLE() + "'";
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

	// 조회수 기능
	public void updata_count(HttpServletRequest request, HttpServletResponse response, CountData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		try {
			PreparedStatement pstmt = null;
			String sql = "UPDATE Webtoon_info SET _LIKE = _LIKE + 1 WHERE _TITLE = '" + _Data.getTITLE() + "'";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			HttpSession session = request.getSession();

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

	// 홈 페이지 선호 작품 view
	public List<CountData> getLikedWebtoons(String userID) {
		List<CountData> likedWebtoons = new ArrayList<>();
		try {
			String sql = "SELECT A._TITLE, A._Day, A._STORY_AUTHOR, A._ART_AUTHOR, A._URL FROM webtoon_info as A LEFT JOIN count_info as B on A._TITLE = B._TITLE WHERE _User_ID = ? ORDER BY _DATE DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				CountData data = new CountData();
				data.setTITLE(rs.getString(1));
				data.setDAY(rs.getString(2));
				data.setSTORY_AUTHOR(rs.getString(3));
				data.setART_AUTHOR(rs.getString(4));
				data.setURL(rs.getString(5));
				likedWebtoons.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return likedWebtoons;
	}

	// 리뷰 작성	
	public void Review_Write (HttpServletRequest request, HttpServletResponse response, ReviewData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
			
			PreparedStatement pstmt = null;
			try {
				String sql = "insert into comment(_USER_ID, _TITLE, _MENT_TITLE, _MENT)" + "values(?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, _Data.getUSER_ID());
				pstmt.setString(2, _Data.getTITLE());
				pstmt.setString(3, _Data.getCOMMENT_TITLE());
				pstmt.setString(4, _Data.getCOMMENT());
				System.out.println(_Data.getUSER_ID());
				pstmt.executeUpdate();
				
				
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

	// 작품명만 받아서 해당 작품에 관한 리뷰들을 조회 출력
	public List<ReviewData> Review_comment(String title_) {
		ResultSet res = null;
		List<ReviewData> Review_List = new ArrayList<>();
		try {
			String sql = "select _USER_ID, _MENT_TITLE, _MENT, _DATA from comment where _TITLE = ? ORDER BY _DATA DESC LIMIT 5";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title_);
			res = pstmt.executeQuery();
			while (res.next()) {
				ReviewData data_ = new ReviewData();
				data_.setUSER_ID(res.getString(1));
				data_.setCOMMENT_TITLE(res.getString(2));
				data_.setCOMMENT(res.getString(3));
				data_.setDATA(res.getString(4));
				Review_List.add(data_);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Review_List;
	}

	
	// 아이디와 제목을 받아 해당 유저가 해당 작품의 리뷰 작성한 것을 DB에서 호출
	public List<ReviewData> Review_comment (String ID_value , String title_) {
		ResultSet res = null;
		List<ReviewData> Review_List = new ArrayList<>();
		try {
			String sql = "select _USER_ID, _MENT_TITLE, _MENT, _DATA from comment where _USER_ID = ? AND _TITLE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID_value);
			pstmt.setString(2, title_);
			res = pstmt.executeQuery();

			while (res.next()) {
				ReviewData data_ = new ReviewData();
				data_.setUSER_ID(res.getString(1));
				data_.setCOMMENT_TITLE(res.getString(2));
				data_.setCOMMENT(res.getString(3));
				data_.setDATA(res.getString(4));
				Review_List.add(data_);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Review_List;
	}

	public ReviewData Review_comment_Write(String comment) {
		ResultSet res = null;
		try {
			String sql = "select _USER_ID, _MENT_TITLE, _MENT, _DATA from comment where _MENT_TITLE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comment);
			res = pstmt.executeQuery();

			if (res.next()) {
				ReviewData Data__ = new ReviewData();
				Data__.setUSER_ID(res.getString(1));
				Data__.setCOMMENT_TITLE(res.getString(2));
				Data__.setCOMMENT(res.getString(3));
				Data__.setDATA(res.getString(4));
				return Data__;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 아이디 값 하나만 받아서 해당 아이디가 작성한 리뷰를 조회 출력	
	public List<ReviewData> Review_comment_ (String ID_value) {
		ResultSet res = null;
		List<ReviewData> Write_Review_List = new ArrayList<>();
		try {
			
			// 이부분 질문 할게 여기서 리미트 걸어서 페이지 단에 뿌려서 애초에 갯수를 제한할지
			// 아니면 이부분 리미트 없이 jsp 단에서 css로 view단을 구성할지
			// 전자의 경우 내부 리뷰 더보기에 들어가면 다시 메서드를 하나더 만들어서 비슷한 구조의 리미트 없는 구조를 만들어야함
			String sql = "select _SEQ _USER_ID, _MENT_TITLE, _MENT, _DATA from comment where _USER_ID = ? order by _SEQ DESC LIMIT 5";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID_value);
			res = pstmt.executeQuery();
			
			while (res.next()) {
				ReviewData data_ = new ReviewData();
				data_.setUSER_ID(res.getString(1));
				data_.setCOMMENT_TITLE(res.getString(2));
				data_.setCOMMENT(res.getString(3));
				data_.setDATA(res.getString(4));
				Write_Review_List.add(data_);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Write_Review_List;
	}
	
	public List<ReviewData> Review_comment_20 (String ID_value ,int Number) {
		ResultSet res = null;
		List<ReviewData> Write_Review_List = new ArrayList<>();
		try {
			
			// 이부분 질문 할게 여기서 리미트 걸어서 페이지 단에 뿌려서 애초에 갯수를 제한할지
			// 아니면 이부분 리미트 없이 jsp 단에서 css로 view단을 구성할지
			// 전자의 경우 내부 리뷰 더보기에 들어가면 다시 메서드를 하나더 만들어서 비슷한 구조의 리미트 없는 구조를 만들어야함
			String sql = "select _SEQ _USER_ID, _MENT_TITLE, _MENT, _DATA from comment where _USER_ID = ? order by _SEQ DESC LIMIT ?,10";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID_value);
			pstmt.setInt(2, (Number - 1) * 10);
			res = pstmt.executeQuery();
			
			while (res.next()) {
				ReviewData data_ = new ReviewData();
				data_.setUSER_ID(res.getString(1));
				data_.setCOMMENT_TITLE(res.getString(2));
				data_.setCOMMENT(res.getString(3));
				data_.setDATA(res.getString(4));
				Write_Review_List.add(data_);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Write_Review_List;
	}

	public List<WebtoonData> likedWebtoons_list(String ID_value, int Number) {
		List<WebtoonData> like_webtoon_list = new ArrayList<>();
		try {
			String sql = "SELECT A.* FROM webtoon_info as A LEFT JOIN count_info as B on A._TITLE = B._TITLE WHERE _User_ID = ? ORDER BY _SEQ LIMIT ?,9";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID_value);
			pstmt.setInt(2, (Number - 1) * 9);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				WebtoonData data = new WebtoonData();
				data.setSEQ(rs.getInt(1));
				data.setTITLE(rs.getString(2));
				data.setDAY(rs.getString(3));
				data.setSTORY_AUTHOR(rs.getString(5));
				data.setART_AUTHOR(rs.getString(6));
				data.setURL(rs.getString(8));
				like_webtoon_list.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
//		저장된 list 반환
		return like_webtoon_list;
	}

	public int like_list(String ID_value) {
		ResultSet res = null;
		String sql = "SELECT COUNT(*) FROM count_info WHERE _USER_ID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID_value);
			res = pstmt.executeQuery();
			if (res.next()) {
				return res.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 1;
	}
	
	// commnet 테이블에 해당 유저가 작성한 리뷰수를 카운트
	public int review_list(String ID_value) {
		ResultSet res = null;
		String sql = "SELECT COUNT(*) FROM comment WHERE _USER_ID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID_value);
			res = pstmt.executeQuery();
			if (res.next()) {
				return res.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 1;
	}

//	페이지 카운팅
	public int pageCount(int dataCount) {
		if (dataCount % 9 != 0) {
			return dataCount / 9 + 1;
		} else {
			return dataCount;
		}

	}
	
// 금일의 랜덤 픽 (DB에서 랜덤으로 가져옴) {
	public List<WebtoonData> Random_pick(String ID_value) { 
	ResultSet res = null;
	List<WebtoonData> Random_webtoon_list = new ArrayList<>();
	try {
	String sql = "SELECT * FROM webtoon_info ORDER BY RAND() LIMIT 0, 4";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	res = pstmt.executeQuery();
	
	while (res.next()) {
		WebtoonData data = new WebtoonData();
		data.setSEQ(res.getInt(1));
		data.setTITLE(res.getString(2));
		data.setDAY(res.getString(3));
		data.setGENRE(res.getString(4));
		data.setSTORY_AUTHOR(res.getString(5));
		data.setART_AUTHOR(res.getString(6));
		data.setURL(res.getString(8));
		Random_webtoon_list.add(data);
	}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return Random_webtoon_list;
	}

}