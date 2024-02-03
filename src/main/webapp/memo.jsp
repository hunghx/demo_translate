<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
String dayOfWeek = (String) session.getAttribute("dayOfWeek");
%>
<html>
<head>
    <title>メモ</title>
    <style>
        body {
            background-image: url(https://i.imgur.com/RyaVxul.png);
            background-size: cover;
            background-position: center;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .memo-container {
            text-align: center;
        }
        .memo-textarea {
            width: 700px;
            height: 400px;
            padding: 10px;
            margin-bottom: 20px;
            margin-top: 250px;
        }
        .memo-button {
            background-color: #F3D04F;
            color: #000;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border: none;
        }
    </style>
</head>
<body>
    <div class="memo-container">
    <% String memo = (String) session.getAttribute("memo"); %>
        <form action="/project/MemoServlet" method="post" accept-charset="UTF-8" onsubmit="return confirm('Bạn có chắc muốn lưu ghi chú không?');">
            <input type="hidden" name="day" value="<%= dayOfWeek %>">
            <textarea name="memo" class="memo-textarea" placeholder="入力してください。"></textarea>
            <br>
            <button type="submit" class="memo-button">保存</button>
        </form>
    </div>
</body>
</html>