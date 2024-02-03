<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*" %>
<%@ page import="xamp.VocabularyItem" %>
<%@ page import="xamp.Answer" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vocabulary Quiz</title>
    <script>
        function submitAnswer(selectedAnswer, correctAnswer, question) {
            document.getElementById("answer").value = selectedAnswer;
            document.getElementById("question").value = question;

            if (selectedAnswer === correctAnswer) {
                alert("Correct!");
            } else {
                alert("Incorrect. The correct answer is: " + correctAnswer);
            }
            setTimeout(function() {
                document.getElementById("quizForm").submit();
            }, 1000);
        }

        function updateQuiz() {
            document.getElementById("quizForm").submit();
        }
    </script>
</head>
<body>
<h2>Vocabulary Quiz</h2>

<form id="quizForm" action="DaySelectionServlet" method="post">
    <ul>
        <%
            List<VocabularyItem> vocabularyList = (List<VocabularyItem>)request.getAttribute("vocabularyList");

            if (!vocabularyList.isEmpty()) {
                Random random = new Random();
                Map<String, Answer> result = (Map<String, Answer>) session.getAttribute("result");
                if (result==null){
                    result= new HashMap<>();
                }
                VocabularyItem quizItem = null;
                while (true) {
                   quizItem= vocabularyList.get(random.nextInt(vocabularyList.size()));
                   if (!result.containsKey(quizItem.getTerm()) || result.size()==vocabularyList.size()){
                       break;
                   }
                }

                // Lấy danh sách đáp án (bao gồm cả đáp án đúng và 3 đáp án sai)
                List<String> answerOptions = new ArrayList<>();
                answerOptions.add(quizItem.getDefinition());
                while (answerOptions.size() < 4) {
                    VocabularyItem randomOption = vocabularyList.get(random.nextInt(vocabularyList.size()));
                    if (!answerOptions.contains(randomOption.getDefinition())) {
                        answerOptions.add(randomOption.getDefinition());
                    }
                }

                // Trộn ngẫu nhiên danh sách đáp án
                Collections.shuffle(answerOptions);

                // Hiển thị câu hỏi và đáp án
        %>
        <li>
            <strong><%= quizItem.getTerm() %></strong>: <br>
            <% for (int i = 0; i < answerOptions.size(); i++) { %>
            <label>
                <input type="radio" name="selectedAnswer" value="<%= answerOptions.get(i) %>"
                       onclick="submitAnswer(this.value, '<%= quizItem.getDefinition() %>', '<%= quizItem.getTerm() %>')">
                <%= answerOptions.get(i) %>
            </label>
            <br>
            <% } %>
        </li>
    </ul>
    <input type="hidden" name="question" value="" id="question">
    <input type="hidden" name="answer" value="" id="answer">
    <input type="hidden" name="action" value="nextQuestion">

    <% } else { %>
    <p>No vocabulary items available.</p>
    <% } %>
</form>

<!-- Add quiz functionality or other features as needed -->
</body>
</html>
