package myhealthylife.myhealthylifeweb.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {

	public final static String USERNAME="USERNAME";
	
    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse resp=(HttpServletResponse) response;
		HttpSession session;
		
		System.out.println("Filtering... "+req.getRequestURI());//TODO no filtering for static resources
		
		String loginUri=req.getContextPath()+"/login.jsp";
		String loginValidatorURI=req.getContextPath()+"/LoginValidator";
		String subPath=req.getRequestURI().substring(req.getContextPath().length());
		
		if(subPath.startsWith("/static")){
			chain.doFilter(request, response);
			return;
		}			
		
		if(req.getRequestURI().equals(loginUri) || req.getRequestURI().equals(loginValidatorURI)){
			chain.doFilter(request, response);
			return;
		}
		
		session=req.getSession();
		
		if(session==null)
			resp.sendRedirect("login.jsp");
		
		if(session.getAttribute(USERNAME)==null)
			resp.sendRedirect("login.jsp");
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
