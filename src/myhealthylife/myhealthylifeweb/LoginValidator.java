package myhealthylife.myhealthylifeweb;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import myhealthylife.dataservice.model.entities.Person;
import myhealthylife.myhealthylifeweb.filters.LoginFilter;

/**
 * Servlet implementation class LoginValidator
 */
public class LoginValidator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginValidator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Get the request parameters
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		// Query to check if the user exists
		Response resp= ServicesLocator.getCentric1Connection().path("/user/data/"+username).request().accept(MediaType.APPLICATION_JSON).get();
		
		if(resp.getStatus()!=Response.Status.OK.getStatusCode()){
			
			// Forward to the main page
            request.setAttribute("errorMessage", "An error has occured in the server!");
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
			return;
		}
		
		Person p=resp.readEntity(Person.class);
		
		if(p==null){
			
			// Forward to the main page
            request.setAttribute("errorMessage", "An error has occured!");
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
			return;
		}
		
		if(p.getPassword()==null){
			
			// Forward to the main page
            request.setAttribute("errorMessage", "An error has occured!");
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
			return;
		}
		
		if(!password.equals(p.getPassword())){
			
			// Forward to the main page
            request.setAttribute("genericMessage", "The password is not correct!");
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
			return;
		}
		
		HttpSession session=request.getSession(true);
		
		session.setAttribute(LoginFilter.USERNAME, username);
		
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		
		
		
	}

	private void throwError(HttpServletResponse response) throws IOException {
		response.getWriter().append("Login failed");
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}
