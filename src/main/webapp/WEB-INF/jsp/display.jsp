<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="xamp.dayOfWeek"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<%
dayOfWeek name = (dayOfWeek) request.getAttribute("name");

// Khai báo danh sách để lưu trữ thông tin
List<String> subjects = new ArrayList<>();
List<String> teachers = new ArrayList<>();
List<String> noiDungs = new ArrayList<>();

try {
	// Kết nối đến cơ sở dữ liệu
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/docotsubu", "root", "");

	// Thực hiện truy vấn SELECT
	String sql = "SELECT DOW, Name, Teacher, Naiyo FROM schedule WHERE DOW = ?";
	PreparedStatement pStmt = conn.prepareStatement(sql);

	// Check if name is not null before setting parameter
	if (name != null) {
		pStmt.setString(1, name.getName());
		ResultSet rs = pStmt.executeQuery();

		// Lưu trữ thông tin vào danh sách
		while (rs.next()) {
	subjects.add(rs.getString("Name"));
	teachers.add(rs.getString("Teacher"));
	noiDungs.add(rs.getString("Naiyo"));
		}

		// Đóng kết nối
		rs.close();
	}

	pStmt.close();
	conn.close();

} catch (SQLException | ClassNotFoundException e) {
	e.printStackTrace();
}
%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<html>
<head>
<title>スケジュール</title>
</head>
<style>
body {
	background-image: url(https://i.imgur.com/JskQ9tO.png);
	background-size: cover;
	background-position: center;
	margin: 0;
	display: flex;
}

.container {
	margin-left: 105px;
	margin-top: 130px;
	width: 385px;
	height: 290px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.monHoc {
	margin-left: 130px;
	margin-top: 155px;
	font-size: 30px;
	color: #F3D04F;
	width: 320px;
	height: 125px;
}

.content {
	margin-left: 100px;
	margin-top: 55px;
	font-size: 30px;
	color: #F3D04F;
}

.giaoVien {
	margin-left: 50px;
	font-size: 30px;
	color: #F3D04F;
	position: absolute;
	top: 150px;
	width: 275px;
	height: 69px;
	display: flex;
	align-items: center;
	justify-content: space-evenly;
}

.imgSubject {
	width: 180px;
}
.fa-home {
	font-size: 50px;
	margin-left: 360px;
}
</style>
<body>
	<%
	String imageFileName = "";
	String additionalText = "";
	String dayName = (name != null) ? name.getName() : "";
	session.setAttribute("dayOfWeek", dayName);
	
	String dayOfWeek = (String) session.getAttribute("dayOfWeek");
	if ("月曜日".equals(dayName)) {
		imageFileName = "https://i.imgur.com/Y8op6gJ.png";
		additionalText = "般若心経";
	} else if ("火曜日".equals(dayName)) {
		imageFileName = "https://i.imgur.com/xMMrwxq.png";
	} else if ("水曜日".equals(dayName)) {
		imageFileName = "https://i.imgur.com/KUlxXf4.png";
	} else if ("木曜日".equals(dayName)) {
		imageFileName = "https://i.imgur.com/z5lRlK9.png";
	} else if ("金曜日".equals(dayName)) {
		imageFileName = "https://i.imgur.com/KUlxXf4.png";
	} else if ("土曜日".equals(dayName)) {
		imageFileName = "https://i.imgur.com/VklzOXq.png";
	}
	%>
	<div style="display: flex; flex-direction: column;">
		<div class="container">
			<img src="<%=imageFileName%>" alt="Day Image" class="imgSubject">
		</div>
		<div
			style='width: 385px; height: 175px; margin-left: 105px; margin-top: 35px; position: relative; color: #2258A9;'>
			<p style='margin-left: 20px'><%=additionalText%></p>
			<p style='margin-left: 20px; white-space: pre-line;'>
			<%
			// Lấy giá trị memo từ HttpSession
			String memo = (String) session.getAttribute("memo");
			
			if (memo != null && !memo.isEmpty()) {
			%>
			<%=memo%>
			<%
			} else {
			%>
				<!-- Default message when no memo is available -->
				Nhập ghi chú ở trang memo
			<%
			}
			%>
			</p>
			<div
				style="position: absolute; top: 125px; left: 270px; font-weight: 700; font-size: 20px; cursor: pointer;">
				<a style='text-decoration: none; color: #F3D04F;' href='./memo.jsp'>メモする</a>
			</div>
		</div>
	</div>
	<div>
		<section class='monHoc'>
			<div style="margin-left: 90px;">科目</div>
			<%
			for (String subject : subjects) {
			%>
			<div
				style='color: black; font-size: 20px; margin-top: 15px; margin-left: -50px'>
				<%=subject%>
			</div>
			<%
			}
			%>
		</section>
		<section class='content'>
			<div style="margin-left: 110px;">内容</div>
			<%
			for (String noiDung : noiDungs) {
			%>
			<div class='naiyo'
				style='color: black; font-size: 20px; margin-top: 20px;'>
				<%=noiDung%>
			</div>
			<hr style="width: 300px">
			<%
			}
			%>
		</section>
	</div>
	<div>
		<a style='text-decoration: none; color: blue;' href='./Search.jsp'><i class="fa fa-home"></i></a>
		<div class='giaoVien'>
			<%
			for (String teacher : teachers) {
			%>
			<div><%=teacher%></div>
			<%
			}
			%>
		</div>
		<div
			style='width: 280px; height: 70px; margin-top: 540px; margin-left: 50px; position: relative;'>
			<div style="position: absolute; top: -30px; left: 40px; color: #F3D04F; font-weight: 700; font-size: 20px; cursor: pointer;">
				<a style='text-decoration: none; color: #F3D04F;'
					href='https://mail.google.com/mail/u/0/#inbox'>メールをチェックする</a>
			</div>
		</div>
	</div>
</body>
</html>