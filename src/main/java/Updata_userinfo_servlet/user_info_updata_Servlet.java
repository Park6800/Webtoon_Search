package Updata_userinfo_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB_Conn;
import DataClass.CountData;
import DataClass.UserData;

/**
 * Servlet implementation class user_info_updata_Servlet
 */
@WebServlet("/user_info_updata_Servlet")
public class user_info_updata_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_info_updata_Servlet() {
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
		try {
			DB_Conn _Db = new DB_Conn();
//			입력정보 변수에 저장
			String id = request.getParameter("user_id");
			String name = request.getParameter("user_name");
			String birth = request.getParameter("user_birth");
			String gender = request.getParameter("user_gender");

			UserData _Data = new UserData();
			_Data.setID(id);
			_Data.setNAME(name);
			_Data.setBIRTH(birth);
			_Data.setGENDER(gender);
			
			_Db.User_Info_Updata(request, response, _Data);
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
