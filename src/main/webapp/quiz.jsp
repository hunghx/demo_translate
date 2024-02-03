<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz</title>
    <style>
        body {
            background-image: url('https://i.imgur.com/nV5VrWj.jpeg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }
        .quiz-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .question {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .answer {
            font-size: 20px;
            margin-bottom: 10px;
            cursor: pointer;
        }
        .correct-answer {
            color: green;
            font-weight: bold;
        }
        .selected-answer {
            color: red;
            font-weight: bold;
        }
        #nextButton {
            display: none;
            font-size: 20px;
            padding: 10px;
            cursor: pointer;
        }
    </style>
    <script>
        var timer;

        function startTimer() {
            timer = setTimeout(nextQuestion, 5000);
        }

        function selectAnswer(answerElement) {
            var answers = document.getElementsByClassName('answer');
            for (var i = 0; i < answers.length; i++) {
                answers[i].classList.remove('selected-answer');
            }
            answerElement.classList.add('selected-answer');
            document.getElementById('nextButton').style.display = 'block';
            clearTimeout(timer);
        }

        function nextQuestion() {
            document.getElementById('quizForm').submit();
        }
    </script>
</head>
<body>
    <div class="quiz-container">
        <form id="quizForm" action="/project/Quiz" method="POST">
            <div class="question">
                ${question}
            </div>
            <div class="answer" onclick="selectAnswer(this)">
                ${answer1}
            </div>
            <div class="answer" onclick="selectAnswer(this)">
                ${answer2}
            </div>
            <div class="answer" onclick="selectAnswer(this)">
                ${answer3}
            </div>
            <div class="answer" onclick="selectAnswer(this)">
                ${answer4}
            </div>
            <button id="nextButton" onclick="nextQuestion()">Next Question</button>
        </form>
    </div>
    <script>
        startTimer();
    </script>
</body>
</html>
