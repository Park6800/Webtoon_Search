package Sign_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB_Conn;
import DataClass.UserData;
import DataClass.WebtoonData;

/**
 * Servlet implementation class signServlet
 */
@WebServlet("/signServlet")
public class signServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signServlet() {
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
			String id = request.getParameter("Id_value");
			String pw = request.getParameter("Pw_value");
			String name = request.getParameter("Name_value");
			String birth = request.getParameter("Birth_value");
			String gender = request.getParameter("Gender_value");

			UserData _Data = new UserData();

			_Data.ID = id;
			_Data.PW = pw;
			_Data.NAME = name;
			_Data.BIRTH = birth;
			_Data.GENDER = gender;
			
			
			_Db.Signup(request, response, _Data);
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
