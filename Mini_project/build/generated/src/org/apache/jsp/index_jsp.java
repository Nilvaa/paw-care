package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Chelsea+Market&display=swap\" rel=\"stylesheet\">\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Homemade+Apple&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<style>\n");
      out.write("  .main_section {\n");
      out.write("    display: flex;\n");
      out.write("    height: calc(100vh - 70px); /* Adjust based on your header height */\n");
      out.write("    width: 100%;\n");
      out.write("   font-family: \"Chelsea Market\", system-ui;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  .left_content {\n");
      out.write("    flex: 1;\n");
      out.write("    background-color: #fff6f0;\n");
      out.write("    display: flex;\n");
      out.write("    flex-direction: column;\n");
      out.write("    justify-content: center;\n");
      out.write("    align-items: flex-start;\n");
      out.write("    padding: 60px;\n");
      out.write("    color: #333;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  .left_content h1 {\n");
      out.write("    font-size: 4rem;\n");
      out.write("    margin-bottom: 20px;\n");
      out.write("    color: #ff8800;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  .left_content h2 {\n");
      out.write("    font-family: 'Homemade Apple', cursive;\n");
      out.write("    font-size: 1.4rem;\n");
      out.write("    max-width: 600px;\n");
      out.write("    color: #555;\n");
      out.write("    line-height: 1.5;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  .right_image {\n");
      out.write("    flex: 1;\n");
      out.write("    display: flex;\n");
      out.write("    align-items: center;\n");
      out.write("    justify-content: center;\n");
      out.write("    background-color: #fff;\n");
      out.write("    overflow: hidden;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  .right_image img {\n");
      out.write("    width: 100%;\n");
      out.write("    height: 100%;\n");
      out.write("    object-fit: cover;\n");
      out.write("    border-radius: 0;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  @media (max-width: 768px) {\n");
      out.write("    .main_section {\n");
      out.write("      flex-direction: column;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .left_content, .right_image {\n");
      out.write("      width: 100%;\n");
      out.write("      height: 50vh;\n");
      out.write("      padding: 30px;\n");
      out.write("      text-align: center;\n");
      out.write("      align-items: center;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .left_content h1 {\n");
      out.write("      font-size: 2.5rem;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .left_content h2 {\n");
      out.write("      font-size: 1.2rem;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .right_image img {\n");
      out.write("      height: 100%;\n");
      out.write("      width: 100%;\n");
      out.write("      object-fit: cover;\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("  h4{\n");
      out.write("     font-family: \"Chelsea Market\", system-ui; \n");
      out.write("  }\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("<div class=\"main_section\">\n");
      out.write("  <div class=\"left_content\">\n");
      out.write("    <h1>PAW CARE</h1>\n");
      out.write("    <h2>They may not speak our language, but they speak to our hearts.  \n");
      out.write("    Here, every paw, feather, and whisker is cared for with love.</h2>\n");
      out.write("    <p>Please Register/Login to Continue</p>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"right_image\">\n");
      out.write("    <img src=\"./images/main.jpg\" alt=\"Pet Care Banner\">\n");
      out.write("  </div>\n");
      out.write("</div>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
