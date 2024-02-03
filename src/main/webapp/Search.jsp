<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="xamp.dayOfWeek"%>
<%
String result = (String) request.getAttribute("errorMessage");
String input = request.getParameter("ten"); // Lấy giá trị nhập liệu từ người dùng
boolean check = input != null && input.contains("曜日");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
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

.button-63 {
	align-items: center;
	background-image: linear-gradient(144deg, #AF40FF, #5B42F3 50%, #00DDEB);
	border: 0;
	border-radius: 8px;
	box-shadow: rgba(151, 65, 252, 0.2) 0 15px 30px -5px;
	box-sizing: border-box;
	color: #FFFFFF;
	display: flex;
	font-family: Phantomsans, sans-serif;
	font-size: 20px;
	justify-content: center;
	line-height: 1em;
	max-width: 100%;
	min-width: 140px;
	padding: 19px 24px;
	text-decoration: none;
	touch-action: manipulation;
	white-space: nowrap;
	cursor: pointer;
}

.button-63:active, .button-63:hover {
	outline: 0;
}

@media ( min-width : 768px) {
	.button-63 {
		font-size: 24px;
		min-width: 196px;
	}
}
</style>
<script>
	function showGreeting() {
		document.getElementById('greeting').style.display = 'block';
	}

	function hideGreeting() {
		document.getElementById('greeting').style.display = 'none';
	}
</script>
</head>
<body>

	<section style="display: flex;">
		<form action="/project/Check" method="POST">
			<div
				style="flex: 1; padding-top: 70px; font-size: 40px; padding: 20px; border-radius: 10px;">
				<h1>何曜日を入力してね!</h1>
				<input type="text" name="ten" style="height: 40px; width: 400px"><br>
				<br> <input type="submit" value="検索" class="button-63">
				<%
				if (request.getMethod().equals("POST") && !check) {
				%>
				<p style="color: red; font-size: 20px">エール。もう一回入力してください。</p>
				<%
				}
				%>
			</div>
		</form>
		<div style="flex: 1;">
			<div style="width: 100%" onmouseover="showGreeting()" onmouseout="hideGreeting()">
				<img src="https://i.imgur.com/jJ4OA1Y.png"
					style="width: 70%; margin-left: 40px; margin-top: 40px">
				<form action="/project/DaySelectionServlet" method="POST">
					<div id="greeting"
						style="display: none; position: absolute; top: 50%; right: 150px; transform: translateY(-50%); color: white; font-size: 50px; font-weight: 700; line-height: 100px;">
						<span onclick="selectDay('日')"
							style="display: block; transform: rotate(-100deg); transform-origin: -30% 150%;">日</span>
						<span onclick="selectDay('月'); "
							style="display: block; transform: rotate(-60deg); transform-origin: 50% 150%;">月</span>
						<span onclick="selectDay('火')"
							style="display: block; transform: rotate(-30deg); transform-origin: 100% 100%;">火</span>
						<span onclick="selectDay('水')" style="display: block;">水</span> <span
							onclick="selectDay('木')"
							style="display: block; transform: rotate(30deg); transform-origin: 0 0;">木</span>
						<span onclick="selectDay('金')"
							style="display: block; transform: rotate(70deg); transform-origin: 0 0;">金</span>
						<span onclick="selectDay('土')"
							style="display: block; transform: rotate(120deg); transform-origin: -50% -20%;">土</span>
					</div>
					<input type="hidden" name="selectedDay" id="selectedDay" value="">
					<input type="hidden" name="action" value="firstQuestion">
				</form>
				<script>
					function selectDay(day) {
						document.getElementById('selectedDay').value = day;
						document.forms[1].submit();
					}
				</script>
			</div>
		</div>
	</section>

</body>
</html>
