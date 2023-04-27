package Search_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB_Conn;
import DataClass.WebtoonData;

/**
 * Servlet implementation class search_input
 */
@WebServlet("/search_input")
public class search_input extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public search_input() {
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
			String title = request.getParameter("Title");
			String story = request.getParameter("Story");
			String art = request.getParameter("Art");

			WebtoonData _Data = new WebtoonData();

			_Data.TITLE = title;
			_Data.STORY_AUTHOR = story;
			_Data.ART_AUTHOR = art;
			
			
			_Db.serach_webtoon(request, response, _Data);
		} catch (Exception e) {

		}
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
	}

}
