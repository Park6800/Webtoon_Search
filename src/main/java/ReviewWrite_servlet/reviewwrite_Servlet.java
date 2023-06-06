package ReviewWrite_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB_Conn;
import DataClass.ReviewData;
import DataClass.WebtoonData;

/**
 * Servlet implementation class reviewwrite_Servlet
 */
@WebServlet("/reviewwrite_Servlet")
public class reviewwrite_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reviewwrite_Servlet() {
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
			String user_id = request.getParameter("User_id");
			String title = request.getParameter("Title");
			String comment_title = request.getParameter("Commnet_title");
			String comment = request.getParameter("Comment");
			int grade = Integer.parseInt(request.getParameter("Grade"));
			
			ReviewData _Data = new ReviewData();

			_Data.setUSER_ID(user_id);
			_Data.setTITLE(title);
			_Data.setCOMMENT_TITLE(comment_title);
			_Data.setCOMMENT(comment);
			_Data.setGRADE(grade);
			
			
			_Db.Review_Write(request, response, _Data);
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
