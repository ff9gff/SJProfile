<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body {
		background-image: url('images/apple.jpg');
	}
</style>
</head>

<body>
	
	<%
		String userid = (String) session.getAttribute("mem_id");

		if (userid == null) {
	%>
	<a href="loginIndex1.do">로그인</a>
	<a href="member/registerform.do">회원가입</a>
	<!-- <a href="chat/chatajaxform.jsp">채팅</a> -->
	<a href="game/game1/game1.do">축구</a>
	<a href="game/game2/game2.do">50</a>
	<a href="board/board.do">게시판</a>

	<br>
	
	<%
		} else if (userid.equals("admin")) {
	%>
	<label>${mem_id}님 환영합니다.</label>
	<br>
	<a href="logout.do">로그아웃</a>
	<!-- <a href="chat/chatajaxform.jsp">채팅</a> -->
	<a href="game/game1/game1.do">축구</a>
	<a href="game/game2/game2.do">50</a>
	<a href="board/board.do">게시판</a>
	<a href="member/listmember.do">회원관리</a>
	<br>
	<%	
		} else {
	%>
	<label><%=userid%>님 환영합니다.</label>
	<br>
	<a href="logout.do">로그아웃</a>
	<!-- <a href="chat/chatajaxform.jsp">채팅</a> -->
	<a href="game/game1/game1.do">축구</a>
	<a href="game/game2/game2.do">50</a>
	<a href="board/board.do">게시판</a>
	<br>
	<%
		}
	%>

	<!-- img src="images/bvb.png" width="20%" height="20%">	 -->



</body>
</html> --%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>W3.CSS Template</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body {
	font-family: "Lato", sans-serif
}

.mySlides {
	display: none
}
</style>

</head>
<body>
	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-black w3-card">
			<c:choose>
				<c:when test="${empty mem_id}">
					<a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
					<a href="#" class="w3-bar-item w3-button w3-padding-large">HOME</a> 
					<a href="#login" class="w3-bar-item w3-button w3-padding-large w3-hide-small">로그인</a>
					<a href="member/registerform.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">회원가입</a>
					<!-- <a href="chat/chatajaxform.jsp">채팅</a> -->
					<a href="board/board.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">게시판</a>
				</c:when>
				
				<c:when test="${mem_id eq 'admin'}">
				<a href="#" class="w3-bar-item w3-button w3-padding-large">HOME</a> 
					<a class="w3-bar-item w3-button w3-padding-large w3-hide-small"	>${mem_id}님 환영합니다.</a> 
					<a href="logout.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">로그아웃</a>
					<a href="member/listmember.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">회원관리</a>
					<a href="board/board.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">게시판</a> 
					<!-- <a href="chat/chatajaxform.jsp">채팅</a> -->
				</c:when>
				
				<c:otherwise>
					<a href="#" class="w3-bar-item w3-button w3-padding-large">HOME</a> 
					<a class="w3-bar-item w3-button w3-padding-large w3-hide-small"	>${mem_id}님 환영합니다.</a> 
					<a href="logout.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">로그아웃</a>
					<a href="board/board.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">게시판</a> 
				</c:otherwise>
			</c:choose>
			
			<div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-padding-large w3-button" title="Game"> 
					GAME <i class="fa fa-caret-down"></i>
				</button>
				<div class="w3-dropdown-content w3-bar-block w3-card-4">
					<a href="game/game1/game1.do" class="w3-bar-item w3-button">축구</a> 
					<a href="game/game2/game2.do" class="w3-bar-item w3-button">50</a>
				</div>
			</div>
			<a href="javascript:void(0)"
				class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i
				class="fa fa-search"></i></a>
		</div>
	</div>

	
	<!-- <!-- Navbar on small screens -->
	<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top: 46px">
		<a href="#band" class="w3-bar-item w3-button w3-padding-large">BAND</a>
		<a href="#tour" class="w3-bar-item w3-button w3-padding-large">TOUR</a>
		<a href="#contact" class="w3-bar-item w3-button w3-padding-large">CONTACT</a>
		<a href="#" class="w3-bar-item w3-button w3-padding-large">MERCH</a>
	</div> -->

	<!-- Page content -->
	<div class="w3-content" style="max-width: 2000px; margin-top: 46px">

		<!-- Automatic Slideshow Images -->
		<div class="mySlides w3-display-container w3-center">
			<img src="images/black.png" style="width: 100%; height: 10%">
			<div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
				<h3>Los Angeles</h3>
				<p> <b>We had the best time playing at Venice Beach!</b> </p>
			</div>
		</div>
		<div class="mySlides w3-display-container w3-center">
			<img src="images/black.png" style="width: 100%; height: 50%">
			<div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
				<h3>New York</h3>
				<p> <b>The atmosphere in New York is lorem ipsum.</b> </p>
			</div>
		</div>
		<div class="mySlides w3-display-container w3-center">
			<img src="images/black.png" style="width: 100%; height: 50%">
			<div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
				<h3>Chicago</h3>
				<p> <b>Thank you, Chicago - A night we won't forget.</b> </p>
			</div>
		</div>

		<!-- The Band Section -->
		<div class="w3-container w3-content w3-center w3-padding-64" style="max-width: 800px" id="band">
			<h2 class="w3-wide">THE BAND</h2>
			<p class="w3-opacity"> <i>We love music</i> </p>
			<p class="w3-justify">We have created a fictional band website.
				
			</p>
			<div class="w3-row w3-padding-32">
				<div class="w3-third">
					<p>Name</p>
					<img src="/w3images/bandmember.jpg" class="w3-round w3-margin-bottom" alt="Random Name" style="width: 60%">
				</div>
				<div class="w3-third">
					<p>Name</p>
					<img src="/w3images/bandmember.jpg" class="w3-round w3-margin-bottom" alt="Random Name" style="width: 60%">
				</div>
				<div class="w3-third">
					<p>Name</p>
					<img src="/w3images/bandmember.jpg" class="w3-round" alt="Random Name" style="width: 60%">
				</div>
			</div>
		</div>

		<!-- The Tour Section -->
		<div class="w3-black" id="tour">
			<div class="w3-container w3-content w3-padding-64" style="max-width: 800px">
				<h2 class="w3-wide w3-center">TOUR DATES</h2>
				<p class="w3-opacity w3-center"> <i>Remember to book your tickets!</i> </p>
				<br>

				<ul class="w3-ul w3-border w3-white w3-text-grey">
					<li class="w3-padding">September <span
						class="w3-tag w3-red w3-margin-left">Sold out</span></li>
					<li class="w3-padding">October <span
						class="w3-tag w3-red w3-margin-left">Sold out</span></li>
					<li class="w3-padding">November <span
						class="w3-badge w3-right w3-margin-right">3</span></li>
				</ul>

				<div class="w3-row-padding w3-padding-32" style="margin: 0 -16px">
					<div class="w3-third w3-margin-bottom">
						<img src="/w3images/newyork.jpg" alt="New York"
							style="width: 100%" class="w3-hover-opacity">
						<div class="w3-container w3-white">
							<p>
								<b>New York</b>
							</p>
							<p class="w3-opacity">Fri 27 Nov 2016</p>
							<p>Praesent tincidunt sed tellus ut rutrum sed vitae justo.</p>
							<button class="w3-button w3-black w3-margin-bottom"
								onclick="document.getElementById('ticketModal').style.display='block'">Buy
								Tickets</button>
						</div>
					</div>
					<div class="w3-third w3-margin-bottom">
						<img src="/w3images/paris.jpg" alt="Paris" style="width: 100%"
							class="w3-hover-opacity">
						<div class="w3-container w3-white">
							<p>
								<b>Paris</b>
							</p>
							<p class="w3-opacity">Sat 28 Nov 2016</p>
							<p>Praesent tincidunt sed tellus ut rutrum sed vitae justo.</p>
							<button class="w3-button w3-black w3-margin-bottom"
								onclick="document.getElementById('ticketModal').style.display='block'">Buy
								Tickets</button>
						</div>
					</div>
					<div class="w3-third w3-margin-bottom">
						<img src="/w3images/sanfran.jpg" alt="San Francisco"
							style="width: 100%" class="w3-hover-opacity">
						<div class="w3-container w3-white">
							<p>
								<b>San Francisco</b>
							</p>
							<p class="w3-opacity">Sun 29 Nov 2016</p>
							<p>Praesent tincidunt sed tellus ut rutrum sed vitae justo.</p>
							<button class="w3-button w3-black w3-margin-bottom"
								onclick="document.getElementById('ticketModal').style.display='block'">Buy
								Tickets</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Ticket Modal -->
		<div id="ticketModal" class="w3-modal">
			<div class="w3-modal-content w3-animate-top w3-card-4">
				<header class="w3-container w3-teal w3-center w3-padding-32">
				<span
					onclick="document.getElementById('ticketModal').style.display='none'"
					class="w3-button w3-teal w3-xlarge w3-display-topright">×</span>
				<h2 class="w3-wide">
					<i class="fa fa-suitcase w3-margin-right"></i>Tickets
				</h2>
				</header>
				<div class="w3-container">
					<p>
						<label><i class="fa fa-shopping-cart"></i> Tickets, $15
							per person</label>
					</p>
					<input class="w3-input w3-border" type="text"
						placeholder="How many?">
					<p>
						<label><i class="fa fa-user"></i> Send To</label>
					</p>
					<input class="w3-input w3-border" type="text"
						placeholder="Enter email">
					<button
						class="w3-button w3-block w3-teal w3-padding-16 w3-section w3-right">
						PAY <i class="fa fa-check"></i>
					</button>
					<button class="w3-button w3-red w3-section"
						onclick="document.getElementById('ticketModal').style.display='none'">
						Close <i class="fa fa-remove"></i>
					</button>
					<p class="w3-right">
						Need <a href="#" class="w3-text-blue">help?</a>
					</p>
				</div>
			</div>
		</div>

		<!-- The Contact Section -->
		<%
			String userid2 = (String) session.getAttribute("mem_id");

			if (userid2 == null) {
		%>
		<div class="w3-container w3-content w3-padding-64"
			style="max-width: 800px" id="login">
			<h2 class="w3-wide w3-center">Login</h2>
			<p class="w3-opacity w3-center">
				<i>Fan? Drop a note!</i>
			</p>
			<div class="w3-row w3-padding-32">
				<div class="w3-col m6">
					<form action="login.do" method="post">
						<div class="w3-row-padding" style="margin: 0 -16px 8px -16px">
							<input class="w3-input w3-border" type="text" id='mem_id' name='mem_id'> 
							<input class="w3-input w3-border" type="password" id='mem_pwd' name='mem_pwd' required>
							<input type="hidden" name="code" value="index1">
							<input class="w3-button w3-black w3-section w3-right" type="submit" value="login">
						</div>
					</form>
				</div>
			</div>
		</div>
		<%
			}
		%>
		<!-- End Page Content -->
	</div>
	<!-- Add Google Maps -->
	<div id="googleMap" style="height: 400px;" class="w3-grayscale-max"></div>
	<script>
		function myMap() {
			myCenter = new google.maps.LatLng(41.878114, -87.629798);
			var mapOptions = {
				center : myCenter,
				zoom : 12,
				scrollwheel : false,
				draggable : false,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById("googleMap"),
					mapOptions);

			var marker = new google.maps.Marker({
				position : myCenter,
			});
			marker.setMap(map);
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&callback=myMap"></script>
	<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

	<!-- Footer -->
	<footer
		class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge">
	<i class="fa fa-facebook-official w3-hover-opacity"></i> <i
		class="fa fa-instagram w3-hover-opacity"></i> <i
		class="fa fa-snapchat w3-hover-opacity"></i> <i
		class="fa fa-pinterest-p w3-hover-opacity"></i> <i
		class="fa fa-twitter w3-hover-opacity"></i> <i
		class="fa fa-linkedin w3-hover-opacity"></i>
	<p class="w3-medium">
		Powered by <a href="https://www.w3schools.com/w3css/default.asp"
			target="_blank">w3.css</a>
	</p>
	</footer>

	<script>
		// Automatic Slideshow - change image every 4 seconds
		var myIndex = 0;
		carousel();

		function carousel() {
			var i;
			var x = document.getElementsByClassName("mySlides");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			myIndex++;
			if (myIndex > x.length) {
				myIndex = 1
			}
			x[myIndex - 1].style.display = "block";
			setTimeout(carousel, 4000);
		}

		// Used to toggle the menu on small screens when clicking on the menu button
		function myFunction() {
			var x = document.getElementById("navDemo");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}

		// When the user clicks anywhere outside of the modal, close it
		var modal = document.getElementById('ticketModal');
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>

</body>
</html>
