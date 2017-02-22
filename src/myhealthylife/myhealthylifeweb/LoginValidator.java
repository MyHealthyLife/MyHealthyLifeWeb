package myhealthylife.myhealthylifeweb;

import java.io.IOException;
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
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		Response resp= ServicesLocator.getCentric1Connection().path("/user/data/"+username).request().accept(MediaType.APPLICATION_JSON).get();
		
		if(resp.getStatus()!=Response.Status.OK.getStatusCode()){
			throwError(response);
			return;
		}
		
		Person p=resp.readEntity(Person.class);
		
		if(p==null){
			throwError(response);
			return;
		}
		
		if(p.getPassword()==null){
			throwError(response);
			return;
		}
		
		if(!password.equals(p.getPassword())){
			throwError(response);
			return;
		}
		
		HttpSession session=request.getSession(true);
		
		session.setAttribute(LoginFilter.USERNAME, username);
		
		response.sendRedirect(request.getContextPath());
		
		
		
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
