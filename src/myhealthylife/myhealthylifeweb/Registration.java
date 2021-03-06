package myhealthylife.myhealthylifeweb;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
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
        String passConfirm = request.getParameter("passwordConfirmNew");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String sex = request.getParameter("sex");
        String birthdate = request.getParameter("birthdate");
        
        // Check of some parameters
        if(username!=null && !username.equals("") && password!=null && !password.equals("") && password.equals(passConfirm)) {
            
        	// Date utility formatter
        	DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ITALY);
        	
        	// Sets the attributes of the person
        	Person p = new Person();
    		p.setUsername(username);
    		p.setPassword(password);
    		p.setFirstname(firstname);
    		p.setLastname(lastname);
    		p.setSex(sex);
    		try {
    			Date dateTemp = format.parse(birthdate);
    			dateTemp.setTime(dateTemp.getTime() + 60 * 60 * 24 * 1000);
				p.setBirthdate(dateTemp);
			} catch (ParseException e) {
				p.setBirthdate(new Date());
			}
    		/*try {
    			p.setBirthdate(format.parse(birthdate));
    		} catch (ParseException e) {
    			p.setBirthdate(null);
    		}*/
    		
    		Response resp= ServicesLocator.getCentric1Connection().path("user/register").request().accept(MediaType.APPLICATION_JSON).post(Entity.entity(p, MediaType.APPLICATION_JSON));
    		
        	
    		if(resp.getStatus()==Response.Status.OK.getStatusCode()) {
    			
    			// Forward to the main page
		        request.setAttribute("genericMessage", "Your account has been created! Please log in using the standard form");
		        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		        rd.forward(request, response);
	    		return;
    		}
    		else {

    			// Forward to the main page
                request.setAttribute("errorMessage", "An error has occured in the server!");
                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                rd.forward(request, response);
                return;
		        
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
