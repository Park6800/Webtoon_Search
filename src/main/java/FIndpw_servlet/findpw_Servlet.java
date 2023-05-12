package FIndpw_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB_Conn;
import DataClass.UserData;

/**
 * Servlet implementation class findpw_Servlet
 */
@WebServlet("/findpw_Servlet")
public class findpw_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findpw_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		// TODO Auto-generated method stub
		try {
			DB_Conn _Db = new DB_Conn();
			String user_id = request.getParameter("user_id");
			String user_Name = request.getParameter("user_name");
			String user_Birth = request.getParameter("user_birth");

			UserData _Data = new UserData();
//	               유저 DTO 에 값 저장 
			_Data.ID = user_id;
			_Data.NAME = user_Name;
			_Data.BIRTH = user_Birth;

//	            아이디 찾기 함수 호출
			_Db.findpw_UserData(request, response, _Data);
		} catch (Exception e) {

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
