package sevlet;

import xamp.dayOfWeek;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/MemoServlet")
public class MemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public MemoServlet() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("/memo.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// Lấy dữ liệu từ form ghi chú
		String memo = request.getParameter("memo");

		// Lưu ghi chú vào session với key là "memo"
		HttpSession session = request.getSession();
		session.setAttribute("memo", memo);

		// Lấy giá trị day từ request.getParameter("day")
		String day = request.getParameter("day");

		// Lưu giá trị day vào session với key là "dayOfWeek"
		HttpSession session1 = request.getSession();
		session1.setAttribute("dayOfWeek", day);

		// Chuyển hướng về trang display.jsp
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/display.jsp");

		// Set the "name" attribute with the dayOfWeek object
		dayOfWeek dayObject = new dayOfWeek();
		dayObject.setName((String) session1.getAttribute("dayOfWeek"));
		request.setAttribute("name", dayObject);

		dispatcher.forward(request, response);

	}
}