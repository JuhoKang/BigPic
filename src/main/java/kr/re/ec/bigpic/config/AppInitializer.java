package kr.re.ec.bigpic.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

public class AppInitializer implements WebApplicationInitializer {

  public void onStartup(ServletContext container) throws ServletException {

    System.out.println("on startup");

    AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
    ctx.register(AppConfig.class);
    ctx.register(SecurityConfig.class);
    ctx.register(WebMvcConfig.class);
    ctx.setServletContext(container);
    CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
    characterEncodingFilter.setEncoding("UTF-8");
    characterEncodingFilter.setForceEncoding(true);

    container.addFilter("encoding-filter", characterEncodingFilter).addMappingForUrlPatterns(null,
        false, "/*");

    ServletRegistration.Dynamic servlet =
        container.addServlet("dispatcher", new DispatcherServlet(ctx));

    servlet.setLoadOnStartup(1);
    servlet.addMapping("/");

  }

}
