package sevlet;

import xamp.checkLogic;
import xamp.dayOfWeek;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class FormSampleServlet
 */
@WebServlet("/Check")
public class Check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Check() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Search.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    String ten = request.getParameter("ten");
	    dayOfWeek name = new dayOfWeek();
	    name.setName(ten);
	    checkLogic nameCheckLogic = new checkLogic();

	    String result = nameCheckLogic.execute(name);
	    if ("success".equals(result)) {
	        request.setAttribute("name", name);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/display.jsp");
	        dispatcher.forward(request, response);
	    } else {
	        request.setAttribute("errorMessage", result);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/Search.jsp");
	        dispatcher.forward(request, response);
	    }
	}


}
