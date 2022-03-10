<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>KLOG • ${userInfo.title }</title>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/main.css"
	rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top"
		id="sideNav">
		<a class="navbar-brand js-scroll-trigger" href="#page-top"> <span
			class="d-block d-lg-none">${userInfo.m_name }</span> <span
			class="d-none d-lg-block"><img
				class="img-fluid img-profile rounded-circle mx-auto mb-2"
				src="${pageContext.request.contextPath}/resources/assets/img/${userInfo.m_pic}"
				alt="..." /></span>
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#profile">Profile</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#education">Education</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#letter">letter</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#neighbor">neighbor</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					id="nav_notice">Notice</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					id="nav_setting">Setting</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					id="nav_logout">Logout</a></li>
			</ul>
		</div>
	</nav>
	<!-- Page Content-->
	<div class="container-fluid p-0">
		<div class="container_none">
			<!-- About-->
			<section class="resume-section" id="profile">
				<div class="resume-section-content">
					<h1 class="mb-0" id="custom_title">${userInfo.title }</h1>
					<div class="subheading mb-5">
						${userInfo.m_name} <a href="mailto:name@email.com">${userInfo.email }</a>
					</div>
					<p class="lead mb-5">${userInfo.bio }${userInfo }${social }</p>
					<div class="social-icons">
						<a class="social-icon" id="social_in" href="${social.insta}"><i
							class="fab fa-linkedin-in"></i></a> <a class="social-icon"
							id="social_git" href="${social.git}"><i class="fab fa-github"></i></a>
						<a class="social-icon" id="social_twi" href="${social.twitter}"><i
							class="fab fa-twitter"></i></a> <a class="social-icon" id="social_fb"
							href="${social.facebook}"><i class="fab fa-facebook-f"></i></a>
					</div>
				</div>
			</section>
			<hr class="m-0" />
			<!-- Experience-->
			<section class="resume-section" id="education">
				<div class="resume-section-content">
					<h2 class="mb-5">Experience</h2>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">Senior Web Developer</h3>
							<div class="subheading mb-3">Intelitec Solutions</div>
							<p>Bring to the table win-win survival strategies to ensure
								proactive domination. At the end of the day, going forward, a
								new normal that has evolved from generation X is on the runway
								heading towards a streamlined cloud solution. User generated
								content in real-time will have multiple touchpoints for
								offshoring.</p>
						</div>
						<div class="flex-shrink-0">
							<span class="text-primary">March 2013 - Present</span>
						</div>
					</div>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">Web Developer</h3>
							<div class="subheading mb-3">Intelitec Solutions</div>
							<p>Capitalize on low hanging fruit to identify a ballpark
								value added activity to beta test. Override the digital divide
								with additional clickthroughs from DevOps. Nanotechnology
								immersion along the information highway will close the loop on
								focusing solely on the bottom line.</p>
						</div>
						<div class="flex-shrink-0">
							<span class="text-primary">December 2011 - March 2013</span>
						</div>
					</div>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">Junior Web Designer</h3>
							<div class="subheading mb-3">Shout! Media Productions</div>
							<p>Podcasting operational change management inside of
								workflows to establish a framework. Taking seamless key
								performance indicators offline to maximise the long tail.
								Keeping your eye on the ball while performing a deep dive on the
								start-up mentality to derive convergence on cross-platform
								integration.</p>
						</div>
						<div class="flex-shrink-0">
							<span class="text-primary">July 2010 - December 2011</span>
						</div>
					</div>
					<div class="d-flex flex-column flex-md-row justify-content-between">
						<div class="flex-grow-1">
							<h3 class="mb-0">Web Design Intern</h3>
							<div class="subheading mb-3">Shout! Media Productions</div>
							<p>Collaboratively administrate empowered markets via
								plug-and-play networks. Dynamically procrastinate B2C users
								after installed base benefits. Dramatically visualize customer
								directed convergence without revolutionary ROI.</p>
						</div>
						<div class="flex-shrink-0">
							<span class="text-primary">September 2008 - June 2010</span>
						</div>
					</div>
				</div>
			</section>
			<hr class="m-0" />
			<!-- Education-->
			<section class="resume-section" id="letter">
				<div class="resume-section-content">
					<h2 class="mb-5">Education</h2>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">University of Colorado Boulder</h3>
							<div class="subheading mb-3">Bachelor of Science</div>
							<div>Computer Science - Web Development Track</div>
							<p>GPA: 3.23</p>
						</div>
						<div class="flex-shrink-0">
							<span class="text-primary">August 2006 - May 2010</span>
						</div>
					</div>
					<div class="d-flex flex-column flex-md-row justify-content-between">
						<div class="flex-grow-1">
							<h3 class="mb-0">James Buchanan High School</h3>
							<div class="subheading mb-3">Technology Magnet Program</div>
							<p>GPA: 3.56</p>
						</div>
						<div class="flex-shrink-0">
							<span class="text-primary">August 2002 - May 2006</span>
						</div>
					</div>
				</div>
			</section>
			<hr class="m-0" />
			<!-- Skills-->
			<section class="resume-section" id="neighbor">
				<div class="resume-section-content">
					<h2 class="mb-5">Skills</h2>
					<div class="subheading mb-3">Programming Languages & Tools</div>
					<ul class="list-inline dev-icons">
						<li class="list-inline-item"><i class="fab fa-html5"></i></li>
						<li class="list-inline-item"><i class="fab fa-css3-alt"></i></li>
						<li class="list-inline-item"><i class="fab fa-js-square"></i></li>
						<li class="list-inline-item"><i class="fab fa-angular"></i></li>
						<li class="list-inline-item"><i class="fab fa-react"></i></li>
						<li class="list-inline-item"><i class="fab fa-node-js"></i></li>
						<li class="list-inline-item"><i class="fab fa-sass"></i></li>
						<li class="list-inline-item"><i class="fab fa-less"></i></li>
						<li class="list-inline-item"><i class="fab fa-wordpress"></i></li>
						<li class="list-inline-item"><i class="fab fa-gulp"></i></li>
						<li class="list-inline-item"><i class="fab fa-grunt"></i></li>
						<li class="list-inline-item"><i class="fab fa-npm"></i></li>
					</ul>
					<div class="subheading mb-3">Workflow</div>
					<ul class="fa-ul mb-0">
						<li><span class="fa-li"><i class="fas fa-check"></i></span>
							Mobile-First, Responsive Design</li>
						<li><span class="fa-li"><i class="fas fa-check"></i></span>
							Cross Browser Testing & Debugging</li>
						<li><span class="fa-li"><i class="fas fa-check"></i></span>
							Cross Functional Teams</li>
						<li><span class="fa-li"><i class="fas fa-check"></i></span>
							Agile Development & Scrum</li>
					</ul>
				</div>
			</section>
			<hr class="m-0" />
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>


	<script type="text/javascript">
		
	</script>

</body>
</html>
