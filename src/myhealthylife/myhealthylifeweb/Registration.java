package myhealthylife.myhealthylifeweb;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import myhealthylife.dataservice.model.entities.Person;

/**
 * Servlet implementation class Registration
 */
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        // Get the parameters in the sign up form
        String username = request.getParameter("usernameNew");
        String password = request.getParameter("passwordNew");
        
        // Check of some parameters
        if(username!=null && !username.equals("") && password!=null && !password.equals("")) {
            
        	Person p = new Person();
    		p.setUsername(username);
    		p.setPassword(password);
    		//p.setFirstname(name);
    		/*try {
    			p.setBirthdate(format.parse(birthdate));
    		} catch (ParseException e) {
    			p.setBirthdate(null);
    		}
    		p.setSex(sex);*/
    		
    		Response resp= ServicesLocator.getCentric1Connection().path("user/register").request().accept(MediaType.APPLICATION_JSON).post(Entity.entity(p, MediaType.APPLICATION_JSON));
    		
        	
    		if(resp.getStatus()!=Response.Status.OK.getStatusCode()){
    			
    			// Forward to the main page
                request.setAttribute("errorMessage", "An error has occured in the server!");
                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                rd.forward(request, response);
    			return;
    		}
    		else {
	        
		        // Forward to the main page
		        request.setAttribute("genericMessage", "Your account has been created! Please log in using the standard form");
		        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		        rd.forward(request, response);
	    		
    		}
            
        }
        
        // Else the inputs are not valid
        else {
            
            // Forward to the main page
            request.setAttribute("errorMessage", "Please insert valid user data");
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);

        }
        
    }


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    processRequest(request, response);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    processRequest(request, response);
	}

}
