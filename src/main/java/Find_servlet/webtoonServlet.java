package Find_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB_Conn;
import DataClass.WebtoonData;

/**
 * Servlet implementation class webtoon
 */
@WebServlet("/webtoonServlet")
public class webtoonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public webtoonServlet() {
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
			String day = request.getParameter("Day");
			String genre = request.getParameter("Genre");

			WebtoonData _Data = new WebtoonData();

			_Data.DAY = day;
			_Data.GENRE = genre;
			
			
			System.out.println(_Data.GENRE);
			System.out.println(_Data.DAY);
//				차량 조회 함수 호출
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
