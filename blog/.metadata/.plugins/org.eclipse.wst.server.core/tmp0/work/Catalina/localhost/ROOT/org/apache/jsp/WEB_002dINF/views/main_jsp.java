/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.61
 * Generated at: 2022-03-05 07:09:09 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views;

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
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
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
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"utf-8\" />\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\" />\r\n");
      out.write("        <meta name=\"description\" content=\"\" />\r\n");
      out.write("        <meta name=\"author\" content=\"\" />\r\n");
      out.write("        <title>Resume - Start Bootstrap Theme</title>\r\n");
      out.write("        <link rel=\"icon\" type=\"image/x-icon\" href=\"resources/assets/img/favicon.ico\" />\r\n");
      out.write("        <!-- Font Awesome icons (free version)-->\r\n");
      out.write("        <script src=\"https://use.fontawesome.com/releases/v5.15.4/js/all.js\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("        <!-- Google fonts-->\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("        <!-- Core theme CSS (includes Bootstrap)-->\r\n");
      out.write("        <link href=\"resources/css/styles.css\" rel=\"stylesheet\" />\r\n");
      out.write("    </head>\r\n");
      out.write("    <body id=\"page-top\">\r\n");
      out.write("        <!-- Navigation-->\r\n");
      out.write("        <nav class=\"navbar navbar-expand-lg navbar-dark bg-primary fixed-top\" id=\"sideNav\">\r\n");
      out.write("            <a class=\"navbar-brand js-scroll-trigger\" href=\"#page-top\">\r\n");
      out.write("                <span class=\"d-block d-lg-none\">Clarence Taylor</span>\r\n");
      out.write("                <span class=\"d-none d-lg-block\"><img class=\"img-fluid img-profile rounded-circle mx-auto mb-2\" src=\"resources/assets/img/k_profile.jpg\" alt=\"...\" /></span>\r\n");
      out.write("            </a>\r\n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarResponsive\" aria-controls=\"navbarResponsive\" aria-expanded=\"false\" aria-label=\"Toggle navigation\"><span class=\"navbar-toggler-icon\"></span></button>\r\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarResponsive\">\r\n");
      out.write("                <ul class=\"navbar-nav\">\r\n");
      out.write("                    <li class=\"nav-item\"><a class=\"nav-link js-scroll-trigger\" href=\"#about\">About</a></li>\r\n");
      out.write("                    <li class=\"nav-item\"><a class=\"nav-link js-scroll-trigger\" href=\"#experience\">Experience</a></li>\r\n");
      out.write("                    <li class=\"nav-item\"><a class=\"nav-link js-scroll-trigger\" href=\"#education\">Education</a></li>\r\n");
      out.write("                    <li class=\"nav-item\"><a class=\"nav-link js-scroll-trigger\" href=\"#skills\">Skills</a></li>\r\n");
      out.write("                    <li class=\"nav-item\"><a class=\"nav-link js-scroll-trigger\" href=\"#interests\">Interests</a></li>\r\n");
      out.write("                    <li class=\"nav-item\"><a class=\"nav-link js-scroll-trigger\" href=\"#awards\">Awards</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("        <!-- Page Content-->\r\n");
      out.write("        <div class=\"container-fluid p-0\">\r\n");
      out.write("            <!-- About-->\r\n");
      out.write("            <section class=\"resume-section\" id=\"about\">\r\n");
      out.write("                <div class=\"resume-section-content\">\r\n");
      out.write("                    <h1 class=\"mb-0\">\r\n");
      out.write("                        Clarence\r\n");
      out.write("                        <span class=\"text-primary\">Taylor</span>\r\n");
      out.write("                    </h1>\r\n");
      out.write("                    <div class=\"subheading mb-5\">\r\n");
      out.write("                        3542 Berry Street · Cheyenne Wells, CO 80810 · (317) 585-8468 ·\r\n");
      out.write("                        <a href=\"mailto:name@email.com\">name@email.com</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <p class=\"lead mb-5\">I am experienced in leveraging agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition.</p>\r\n");
      out.write("                    <div class=\"social-icons\">\r\n");
      out.write("                        <a class=\"social-icon\" href=\"#!\"><i class=\"fab fa-linkedin-in\"></i></a>\r\n");
      out.write("                        <a class=\"social-icon\" href=\"#!\"><i class=\"fab fa-github\"></i></a>\r\n");
      out.write("                        <a class=\"social-icon\" href=\"#!\"><i class=\"fab fa-twitter\"></i></a>\r\n");
      out.write("                        <a class=\"social-icon\" href=\"#!\"><i class=\"fab fa-facebook-f\"></i></a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </section>\r\n");
      out.write("            <hr class=\"m-0\" />\r\n");
      out.write("            <!-- Experience-->\r\n");
      out.write("            <section class=\"resume-section\" id=\"experience\">\r\n");
      out.write("                <div class=\"resume-section-content\">\r\n");
      out.write("                    <h2 class=\"mb-5\">Experience</h2>\r\n");
      out.write("                    <div class=\"d-flex flex-column flex-md-row justify-content-between mb-5\">\r\n");
      out.write("                        <div class=\"flex-grow-1\">\r\n");
      out.write("                            <h3 class=\"mb-0\">Senior Web Developer</h3>\r\n");
      out.write("                            <div class=\"subheading mb-3\">Intelitec Solutions</div>\r\n");
      out.write("                            <p>Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring.</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"flex-shrink-0\"><span class=\"text-primary\">March 2013 - Present</span></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"d-flex flex-column flex-md-row justify-content-between mb-5\">\r\n");
      out.write("                        <div class=\"flex-grow-1\">\r\n");
      out.write("                            <h3 class=\"mb-0\">Web Developer</h3>\r\n");
      out.write("                            <div class=\"subheading mb-3\">Intelitec Solutions</div>\r\n");
      out.write("                            <p>Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop on focusing solely on the bottom line.</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"flex-shrink-0\"><span class=\"text-primary\">December 2011 - March 2013</span></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"d-flex flex-column flex-md-row justify-content-between mb-5\">\r\n");
      out.write("                        <div class=\"flex-grow-1\">\r\n");
      out.write("                            <h3 class=\"mb-0\">Junior Web Designer</h3>\r\n");
      out.write("                            <div class=\"subheading mb-3\">Shout! Media Productions</div>\r\n");
      out.write("                            <p>Podcasting operational change management inside of workflows to establish a framework. Taking seamless key performance indicators offline to maximise the long tail. Keeping your eye on the ball while performing a deep dive on the start-up mentality to derive convergence on cross-platform integration.</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"flex-shrink-0\"><span class=\"text-primary\">July 2010 - December 2011</span></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"d-flex flex-column flex-md-row justify-content-between\">\r\n");
      out.write("                        <div class=\"flex-grow-1\">\r\n");
      out.write("                            <h3 class=\"mb-0\">Web Design Intern</h3>\r\n");
      out.write("                            <div class=\"subheading mb-3\">Shout! Media Productions</div>\r\n");
      out.write("                            <p>Collaboratively administrate empowered markets via plug-and-play networks. Dynamically procrastinate B2C users after installed base benefits. Dramatically visualize customer directed convergence without revolutionary ROI.</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"flex-shrink-0\"><span class=\"text-primary\">September 2008 - June 2010</span></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </section>\r\n");
      out.write("            <hr class=\"m-0\" />\r\n");
      out.write("            <!-- Education-->\r\n");
      out.write("            <section class=\"resume-section\" id=\"education\">\r\n");
      out.write("                <div class=\"resume-section-content\">\r\n");
      out.write("                    <h2 class=\"mb-5\">Education</h2>\r\n");
      out.write("                    <div class=\"d-flex flex-column flex-md-row justify-content-between mb-5\">\r\n");
      out.write("                        <div class=\"flex-grow-1\">\r\n");
      out.write("                            <h3 class=\"mb-0\">University of Colorado Boulder</h3>\r\n");
      out.write("                            <div class=\"subheading mb-3\">Bachelor of Science</div>\r\n");
      out.write("                            <div>Computer Science - Web Development Track</div>\r\n");
      out.write("                            <p>GPA: 3.23</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"flex-shrink-0\"><span class=\"text-primary\">August 2006 - May 2010</span></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"d-flex flex-column flex-md-row justify-content-between\">\r\n");
      out.write("                        <div class=\"flex-grow-1\">\r\n");
      out.write("                            <h3 class=\"mb-0\">James Buchanan High School</h3>\r\n");
      out.write("                            <div class=\"subheading mb-3\">Technology Magnet Program</div>\r\n");
      out.write("                            <p>GPA: 3.56</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"flex-shrink-0\"><span class=\"text-primary\">August 2002 - May 2006</span></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </section>\r\n");
      out.write("            <hr class=\"m-0\" />\r\n");
      out.write("            <!-- Skills-->\r\n");
      out.write("            <section class=\"resume-section\" id=\"skills\">\r\n");
      out.write("                <div class=\"resume-section-content\">\r\n");
      out.write("                    <h2 class=\"mb-5\">Skills</h2>\r\n");
      out.write("                    <div class=\"subheading mb-3\">Programming Languages & Tools</div>\r\n");
      out.write("                    <ul class=\"list-inline dev-icons\">\r\n");
      out.write("                        <li class=\"list-inline-item\"><i class=\"fab fa-html5\"></i></li>\r\n");
      out.write("                        <li class=\"list-inline-item\"><i class=\"fab fa-css3-alt\"></i></li>\r\n");
      out.write("                        <li class=\"list-inline-item\"><i class=\"fab fa-js-square\"></i></li>\r\n");
      out.write("                        <li class=\"list-inline-item\"><i class=\"fab fa-angular\"></i></li>\r\n");
      out.write("                        <li class=\"list-inline-item\"><i class=\"fab fa-react\"></i></li>\r\n");
      out.write("                        <li class=\"list-inline-item\"><i class=\"fab fa-node-js\"></i></li>\r\n");
      out.write("                        <li class=\"list-inline-item\"><i class=\"fab fa-sass\"></i></li>\r\n");
      out.write("                        <li class=\"list-inline-item\"><i class=\"fab fa-less\"></i></li>\r\n");
      out.write("                        <li class=\"list-inline-item\"><i class=\"fab fa-wordpress\"></i></li>\r\n");
      out.write("                        <li class=\"list-inline-item\"><i class=\"fab fa-gulp\"></i></li>\r\n");
      out.write("                        <li class=\"list-inline-item\"><i class=\"fab fa-grunt\"></i></li>\r\n");
      out.write("                        <li class=\"list-inline-item\"><i class=\"fab fa-npm\"></i></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                    <div class=\"subheading mb-3\">Workflow</div>\r\n");
      out.write("                    <ul class=\"fa-ul mb-0\">\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <span class=\"fa-li\"><i class=\"fas fa-check\"></i></span>\r\n");
      out.write("                            Mobile-First, Responsive Design\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <span class=\"fa-li\"><i class=\"fas fa-check\"></i></span>\r\n");
      out.write("                            Cross Browser Testing & Debugging\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <span class=\"fa-li\"><i class=\"fas fa-check\"></i></span>\r\n");
      out.write("                            Cross Functional Teams\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <span class=\"fa-li\"><i class=\"fas fa-check\"></i></span>\r\n");
      out.write("                            Agile Development & Scrum\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </section>\r\n");
      out.write("            <hr class=\"m-0\" />\r\n");
      out.write("            <!-- Interests-->\r\n");
      out.write("            <section class=\"resume-section\" id=\"interests\">\r\n");
      out.write("                <div class=\"resume-section-content\">\r\n");
      out.write("                    <h2 class=\"mb-5\">Interests</h2>\r\n");
      out.write("                    <p>Apart from being a web developer, I enjoy most of my time being outdoors. In the winter, I am an avid skier and novice ice climber. During the warmer months here in Colorado, I enjoy mountain biking, free climbing, and kayaking.</p>\r\n");
      out.write("                    <p class=\"mb-0\">When forced indoors, I follow a number of sci-fi and fantasy genre movies and television shows, I am an aspiring chef, and I spend a large amount of my free time exploring the latest technology advancements in the front-end web development world.</p>\r\n");
      out.write("                </div>\r\n");
      out.write("            </section>\r\n");
      out.write("            <hr class=\"m-0\" />\r\n");
      out.write("            <!-- Awards-->\r\n");
      out.write("            <section class=\"resume-section\" id=\"awards\">\r\n");
      out.write("                <div class=\"resume-section-content\">\r\n");
      out.write("                    <h2 class=\"mb-5\">Awards & Certifications</h2>\r\n");
      out.write("                    <ul class=\"fa-ul mb-0\">\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <span class=\"fa-li\"><i class=\"fas fa-trophy text-warning\"></i></span>\r\n");
      out.write("                            Google Analytics Certified Developer\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <span class=\"fa-li\"><i class=\"fas fa-trophy text-warning\"></i></span>\r\n");
      out.write("                            Mobile Web Specialist - Google Certification\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <span class=\"fa-li\"><i class=\"fas fa-trophy text-warning\"></i></span>\r\n");
      out.write("                            1\r\n");
      out.write("                            <sup>st</sup>\r\n");
      out.write("                            Place - University of Colorado Boulder - Emerging Tech Competition 2009\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <span class=\"fa-li\"><i class=\"fas fa-trophy text-warning\"></i></span>\r\n");
      out.write("                            1\r\n");
      out.write("                            <sup>st</sup>\r\n");
      out.write("                            Place - University of Colorado Boulder - Adobe Creative Jam 2008 (UI Design Category)\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <span class=\"fa-li\"><i class=\"fas fa-trophy text-warning\"></i></span>\r\n");
      out.write("                            2\r\n");
      out.write("                            <sup>nd</sup>\r\n");
      out.write("                            Place - University of Colorado Boulder - Emerging Tech Competition 2008\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <span class=\"fa-li\"><i class=\"fas fa-trophy text-warning\"></i></span>\r\n");
      out.write("                            1\r\n");
      out.write("                            <sup>st</sup>\r\n");
      out.write("                            Place - James Buchanan High School - Hackathon 2006\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <span class=\"fa-li\"><i class=\"fas fa-trophy text-warning\"></i></span>\r\n");
      out.write("                            3\r\n");
      out.write("                            <sup>rd</sup>\r\n");
      out.write("                            Place - James Buchanan High School - Hackathon 2005\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </section>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- Bootstrap core JS-->\r\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("        <!-- Core theme JS-->\r\n");
      out.write("        <script src=\"resources/js/scripts.js\"></script>\r\n");
      out.write("    </body>\r\n");
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
