/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.61
 * Generated at: 2022-03-10 14:17:26 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class main_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP?????? ?????? GET, POST ?????? HEAD ??????????????? ???????????????. Jasper??? OPTIONS ????????? ?????? ???????????????.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\" />\r\n");
      out.write("<meta name=\"viewport\"\r\n");
      out.write("\tcontent=\"width=device-width, initial-scale=1, shrink-to-fit=no\" />\r\n");
      out.write("<meta name=\"description\" content=\"\" />\r\n");
      out.write("<meta name=\"author\" content=\"\" />\r\n");
      out.write("<title>KLOG ??? ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userInfo.title }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</title>\r\n");
      out.write("<link rel=\"icon\" type=\"image/x-icon\"\r\n");
      out.write("\thref=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/assets/img/favicon.ico\" />\r\n");
      out.write("<!-- Font Awesome icons (free version)-->\r\n");
      out.write("<script src=\"https://use.fontawesome.com/releases/v5.15.4/js/all.js\"\r\n");
      out.write("\tcrossorigin=\"anonymous\"></script>\r\n");
      out.write("<!-- Google fonts-->\r\n");
      out.write("<link\r\n");
      out.write("\thref=\"https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700\"\r\n");
      out.write("\trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link\r\n");
      out.write("\thref=\"https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i\"\r\n");
      out.write("\trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<!-- Core theme CSS (includes Bootstrap)-->\r\n");
      out.write("<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/css/styles.css\"\r\n");
      out.write("\trel=\"stylesheet\" />\r\n");
      out.write("<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/css/main.css\"\r\n");
      out.write("\trel=\"stylesheet\" />\r\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Jua&display=swap\"\r\n");
      out.write("\trel=\"stylesheet\">\r\n");
      out.write("</head>\r\n");
      out.write("<body id=\"page-top\">\r\n");
      out.write("\t<!-- Navigation-->\r\n");
      out.write("\t<nav class=\"navbar navbar-expand-lg navbar-dark bg-primary fixed-top\"\r\n");
      out.write("\t\tid=\"sideNav\">\r\n");
      out.write("\t\t<a class=\"navbar-brand js-scroll-trigger\" href=\"#page-top\"> <span\r\n");
      out.write("\t\t\tclass=\"d-block d-lg-none\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userInfo.m_name }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</span> <span\r\n");
      out.write("\t\t\tclass=\"d-none d-lg-block\"><img\r\n");
      out.write("\t\t\t\tclass=\"img-fluid img-profile rounded-circle mx-auto mb-2\"\r\n");
      out.write("\t\t\t\tsrc=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/assets/img/");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userInfo.m_pic}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\"\r\n");
      out.write("\t\t\t\talt=\"...\" /></span>\r\n");
      out.write("\t\t</a>\r\n");
      out.write("\t\t<button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\"\r\n");
      out.write("\t\t\tdata-bs-target=\"#navbarResponsive\" aria-controls=\"navbarResponsive\"\r\n");
      out.write("\t\t\taria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n");
      out.write("\t\t\t<span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("\t\t</button>\r\n");
      out.write("\t\t<div class=\"collapse navbar-collapse\" id=\"navbarResponsive\">\r\n");
      out.write("\t\t\t<ul class=\"navbar-nav\">\r\n");
      out.write("\t\t\t\t<li class=\"nav-item\"><a class=\"nav-link js-scroll-trigger\"\r\n");
      out.write("\t\t\t\t\thref=\"#profile\">Profile</a></li>\r\n");
      out.write("\t\t\t\t<li class=\"nav-item\"><a class=\"nav-link js-scroll-trigger\"\r\n");
      out.write("\t\t\t\t\thref=\"#education\">Education</a></li>\r\n");
      out.write("\t\t\t\t<li class=\"nav-item\"><a class=\"nav-link js-scroll-trigger\"\r\n");
      out.write("\t\t\t\t\thref=\"#letter\">letter</a></li>\r\n");
      out.write("\t\t\t\t<li class=\"nav-item\"><a class=\"nav-link js-scroll-trigger\"\r\n");
      out.write("\t\t\t\t\thref=\"#neighbor\">neighbor</a></li>\r\n");
      out.write("\t\t\t\t<li class=\"nav-item\"><a class=\"nav-link js-scroll-trigger\"\r\n");
      out.write("\t\t\t\t\tid=\"nav_notice\">Notice</a></li>\r\n");
      out.write("\t\t\t\t<li class=\"nav-item\"><a class=\"nav-link js-scroll-trigger\"\r\n");
      out.write("\t\t\t\t\tid=\"nav_setting\">Setting</a></li>\r\n");
      out.write("\t\t\t\t<li class=\"nav-item\"><a class=\"nav-link js-scroll-trigger\"\r\n");
      out.write("\t\t\t\t\tid=\"nav_logout\">Logout</a></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</nav>\r\n");
      out.write("\t<!-- Page Content-->\r\n");
      out.write("\t<div class=\"container-fluid p-0\">\r\n");
      out.write("\t\t<div class=\"container_none\">\r\n");
      out.write("\t\t\t<!-- About-->\r\n");
      out.write("\t\t\t<section class=\"resume-section\" id=\"profile\">\r\n");
      out.write("\t\t\t\t<div class=\"resume-section-content\">\r\n");
      out.write("\t\t\t\t\t<h1 class=\"mb-0\" id=\"custom_title\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userInfo.title }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h1>\r\n");
      out.write("\t\t\t\t\t<div class=\"subheading mb-5\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userInfo.m_name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write(" <a href=\"mailto:name@email.com\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userInfo.email }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</a>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<p class=\"lead mb-5\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userInfo.bio }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userInfo }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${social }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</p>\r\n");
      out.write("\t\t\t\t\t<div class=\"social-icons\">\r\n");
      out.write("\t\t\t\t\t\t<a class=\"social-icon\" id=\"social_in\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${social.insta}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\"><i\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"fab fa-linkedin-in\"></i></a> <a class=\"social-icon\"\r\n");
      out.write("\t\t\t\t\t\t\tid=\"social_git\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${social.git}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\"><i class=\"fab fa-github\"></i></a>\r\n");
      out.write("\t\t\t\t\t\t<a class=\"social-icon\" id=\"social_twi\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${social.twitter}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\"><i\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"fab fa-twitter\"></i></a> <a class=\"social-icon\" id=\"social_fb\"\r\n");
      out.write("\t\t\t\t\t\t\thref=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${social.facebook}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\"><i class=\"fab fa-facebook-f\"></i></a>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</section>\r\n");
      out.write("\t\t\t<hr class=\"m-0\" />\r\n");
      out.write("\t\t\t<!-- Experience-->\r\n");
      out.write("\t\t\t<section class=\"resume-section\" id=\"education\">\r\n");
      out.write("\t\t\t\t<div class=\"resume-section-content\">\r\n");
      out.write("\t\t\t\t\t<h2 class=\"mb-5\">Experience</h2>\r\n");
      out.write("\t\t\t\t\t<div\r\n");
      out.write("\t\t\t\t\t\tclass=\"d-flex flex-column flex-md-row justify-content-between mb-5\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"flex-grow-1\">\r\n");
      out.write("\t\t\t\t\t\t\t<h3 class=\"mb-0\">Senior Web Developer</h3>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"subheading mb-3\">Intelitec Solutions</div>\r\n");
      out.write("\t\t\t\t\t\t\t<p>Bring to the table win-win survival strategies to ensure\r\n");
      out.write("\t\t\t\t\t\t\t\tproactive domination. At the end of the day, going forward, a\r\n");
      out.write("\t\t\t\t\t\t\t\tnew normal that has evolved from generation X is on the runway\r\n");
      out.write("\t\t\t\t\t\t\t\theading towards a streamlined cloud solution. User generated\r\n");
      out.write("\t\t\t\t\t\t\t\tcontent in real-time will have multiple touchpoints for\r\n");
      out.write("\t\t\t\t\t\t\t\toffshoring.</p>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"flex-shrink-0\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"text-primary\">March 2013 - Present</span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div\r\n");
      out.write("\t\t\t\t\t\tclass=\"d-flex flex-column flex-md-row justify-content-between mb-5\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"flex-grow-1\">\r\n");
      out.write("\t\t\t\t\t\t\t<h3 class=\"mb-0\">Web Developer</h3>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"subheading mb-3\">Intelitec Solutions</div>\r\n");
      out.write("\t\t\t\t\t\t\t<p>Capitalize on low hanging fruit to identify a ballpark\r\n");
      out.write("\t\t\t\t\t\t\t\tvalue added activity to beta test. Override the digital divide\r\n");
      out.write("\t\t\t\t\t\t\t\twith additional clickthroughs from DevOps. Nanotechnology\r\n");
      out.write("\t\t\t\t\t\t\t\timmersion along the information highway will close the loop on\r\n");
      out.write("\t\t\t\t\t\t\t\tfocusing solely on the bottom line.</p>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"flex-shrink-0\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"text-primary\">December 2011 - March 2013</span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div\r\n");
      out.write("\t\t\t\t\t\tclass=\"d-flex flex-column flex-md-row justify-content-between mb-5\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"flex-grow-1\">\r\n");
      out.write("\t\t\t\t\t\t\t<h3 class=\"mb-0\">Junior Web Designer</h3>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"subheading mb-3\">Shout! Media Productions</div>\r\n");
      out.write("\t\t\t\t\t\t\t<p>Podcasting operational change management inside of\r\n");
      out.write("\t\t\t\t\t\t\t\tworkflows to establish a framework. Taking seamless key\r\n");
      out.write("\t\t\t\t\t\t\t\tperformance indicators offline to maximise the long tail.\r\n");
      out.write("\t\t\t\t\t\t\t\tKeeping your eye on the ball while performing a deep dive on the\r\n");
      out.write("\t\t\t\t\t\t\t\tstart-up mentality to derive convergence on cross-platform\r\n");
      out.write("\t\t\t\t\t\t\t\tintegration.</p>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"flex-shrink-0\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"text-primary\">July 2010 - December 2011</span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"d-flex flex-column flex-md-row justify-content-between\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"flex-grow-1\">\r\n");
      out.write("\t\t\t\t\t\t\t<h3 class=\"mb-0\">Web Design Intern</h3>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"subheading mb-3\">Shout! Media Productions</div>\r\n");
      out.write("\t\t\t\t\t\t\t<p>Collaboratively administrate empowered markets via\r\n");
      out.write("\t\t\t\t\t\t\t\tplug-and-play networks. Dynamically procrastinate B2C users\r\n");
      out.write("\t\t\t\t\t\t\t\tafter installed base benefits. Dramatically visualize customer\r\n");
      out.write("\t\t\t\t\t\t\t\tdirected convergence without revolutionary ROI.</p>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"flex-shrink-0\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"text-primary\">September 2008 - June 2010</span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</section>\r\n");
      out.write("\t\t\t<hr class=\"m-0\" />\r\n");
      out.write("\t\t\t<!-- Education-->\r\n");
      out.write("\t\t\t<section class=\"resume-section\" id=\"letter\">\r\n");
      out.write("\t\t\t\t<div class=\"resume-section-content\">\r\n");
      out.write("\t\t\t\t\t<h2 class=\"mb-5\">Education</h2>\r\n");
      out.write("\t\t\t\t\t<div\r\n");
      out.write("\t\t\t\t\t\tclass=\"d-flex flex-column flex-md-row justify-content-between mb-5\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"flex-grow-1\">\r\n");
      out.write("\t\t\t\t\t\t\t<h3 class=\"mb-0\">University of Colorado Boulder</h3>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"subheading mb-3\">Bachelor of Science</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div>Computer Science - Web Development Track</div>\r\n");
      out.write("\t\t\t\t\t\t\t<p>GPA: 3.23</p>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"flex-shrink-0\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"text-primary\">August 2006 - May 2010</span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"d-flex flex-column flex-md-row justify-content-between\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"flex-grow-1\">\r\n");
      out.write("\t\t\t\t\t\t\t<h3 class=\"mb-0\">James Buchanan High School</h3>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"subheading mb-3\">Technology Magnet Program</div>\r\n");
      out.write("\t\t\t\t\t\t\t<p>GPA: 3.56</p>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"flex-shrink-0\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"text-primary\">August 2002 - May 2006</span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</section>\r\n");
      out.write("\t\t\t<hr class=\"m-0\" />\r\n");
      out.write("\t\t\t<!-- Skills-->\r\n");
      out.write("\t\t\t<section class=\"resume-section\" id=\"neighbor\">\r\n");
      out.write("\t\t\t\t<div class=\"resume-section-content\">\r\n");
      out.write("\t\t\t\t\t<h2 class=\"mb-5\">Skills</h2>\r\n");
      out.write("\t\t\t\t\t<div class=\"subheading mb-3\">Programming Languages & Tools</div>\r\n");
      out.write("\t\t\t\t\t<ul class=\"list-inline dev-icons\">\r\n");
      out.write("\t\t\t\t\t\t<li class=\"list-inline-item\"><i class=\"fab fa-html5\"></i></li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"list-inline-item\"><i class=\"fab fa-css3-alt\"></i></li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"list-inline-item\"><i class=\"fab fa-js-square\"></i></li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"list-inline-item\"><i class=\"fab fa-angular\"></i></li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"list-inline-item\"><i class=\"fab fa-react\"></i></li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"list-inline-item\"><i class=\"fab fa-node-js\"></i></li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"list-inline-item\"><i class=\"fab fa-sass\"></i></li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"list-inline-item\"><i class=\"fab fa-less\"></i></li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"list-inline-item\"><i class=\"fab fa-wordpress\"></i></li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"list-inline-item\"><i class=\"fab fa-gulp\"></i></li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"list-inline-item\"><i class=\"fab fa-grunt\"></i></li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"list-inline-item\"><i class=\"fab fa-npm\"></i></li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t<div class=\"subheading mb-3\">Workflow</div>\r\n");
      out.write("\t\t\t\t\t<ul class=\"fa-ul mb-0\">\r\n");
      out.write("\t\t\t\t\t\t<li><span class=\"fa-li\"><i class=\"fas fa-check\"></i></span>\r\n");
      out.write("\t\t\t\t\t\t\tMobile-First, Responsive Design</li>\r\n");
      out.write("\t\t\t\t\t\t<li><span class=\"fa-li\"><i class=\"fas fa-check\"></i></span>\r\n");
      out.write("\t\t\t\t\t\t\tCross Browser Testing & Debugging</li>\r\n");
      out.write("\t\t\t\t\t\t<li><span class=\"fa-li\"><i class=\"fas fa-check\"></i></span>\r\n");
      out.write("\t\t\t\t\t\t\tCross Functional Teams</li>\r\n");
      out.write("\t\t\t\t\t\t<li><span class=\"fa-li\"><i class=\"fas fa-check\"></i></span>\r\n");
      out.write("\t\t\t\t\t\t\tAgile Development & Scrum</li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</section>\r\n");
      out.write("\t\t\t<hr class=\"m-0\" />\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<script src=\"https://code.jquery.com/jquery-3.6.0.js\"></script>\r\n");
      out.write("\t<!-- Bootstrap core JS-->\r\n");
      out.write("\t<script\r\n");
      out.write("\t\tsrc=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("\t<!-- Core theme JS-->\r\n");
      out.write("\t<script\r\n");
      out.write("\t\tsrc=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/js/scripts.js\"></script>\r\n");
      out.write("\t<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/js/main.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t</script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
