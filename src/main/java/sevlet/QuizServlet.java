package sevlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@WebServlet("/Quiz")
public class QuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Danh sách từ vựng cho mỗi ngày trong tuần
        List<String> vocabList = new ArrayList<>();
        // TODO: Thêm từ vựng cho mỗi ngày vào vocabList

        // Trộn ngẫu nhiên danh sách từ vựng
        Collections.shuffle(vocabList);

        // Lấy câu hỏi và đáp án cho câu hỏi tiếp theo từ danh sách từ vựng
        String currentVocab = vocabList.get(0);
        String[] vocabArray = currentVocab.split("：");
        String question = vocabArray[1] + " の意味は？";
        String correctAnswer = vocabArray[0];
        List<String> allAnswers = Arrays.asList(correctAnswer, "Answer2", "Answer3", "Answer4");

        // Trộn ngẫu nhiên các đáp án
        Collections.shuffle(allAnswers);

        // Gửi các thông tin câu hỏi và đáp án đến trang quiz.jsp
        request.setAttribute("question", question);
        request.setAttribute("answer1", allAnswers.get(0));
        request.setAttribute("answer2", allAnswers.get(1));
        request.setAttribute("answer3", allAnswers.get(2));
        request.setAttribute("answer4", allAnswers.get(3));

        request.getRequestDispatcher("./quiz.jsp").forward(request, response);
    }
}
