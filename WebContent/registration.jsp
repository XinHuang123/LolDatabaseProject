<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, edu.neu.cs5200.dao.*, edu.neu.cs5200.models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Registration</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
    <h1>Registration</h1>
    
    <%
    UserDAO userDAO = new UserDAO();
    
    String action = request.getParameter("action");
    
    String comment  = request.getParameter("comment");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String role=request.getParameter("role");
    String firstname=request.getParameter("firstname");
    String lastname=request.getParameter("lastname");
    String dateofbirth=request.getParameter("dateofbirth");
    
    if("create".equals(action))
    {
    	User user = new User();
    	
    	user.setUsername(username);
    	user.setPassword(password);
    	user.setRole(role);
    	user.setFirstname(firstname);
    	user.setLastname(lastname);
    	user.setDateofbirth(dateofbirth);
    	userDAO.createUser(user);
    }
    else if("delete".equals(action))
    {
        
        userDAO.deleteUser(username);   
    }
    else if("update".equals(action))
    {
        
        User user = new User();
        
    	user.setUsername(username);
    	user.setPassword(password);
    	user.setRole(role);
    	user.setFirstname(firstname);
    	user.setLastname(lastname);
    	user.setDateofbirth(dateofbirth);
        userDAO.UpdateUser(user);
    }
    
    
    List<User> users = userDAO.readAllUsers();
    %>
    
    <form action="registration.jsp">
    <table class="table table-striped">
        <thead>
            <tr>
                               
                <th>Username</th>
                <th>Password</th>
                <th>Role</th>
                <th>Firstname</th>
                <th>Lastname</th>    
                <th>Dateofbirth</th>            
            </tr>
            <tr>
                          
                <th><input class="form-control" name="username" placeholder="username" value="<%=username%>"/></th>
                <th><input class="form-control" name="password" placeholder="password" value="<%=password%>"/></th>
                <th><input class="form-control" name="role" placeholder="role" value="<%=role%>"/></th>
                <th><input class="form-control" name="firstname" placeholder="firstname" value="<%=firstname%>"/></th>
                <th><input class="form-control" name="lastname" placeholder="lastname" value="<%=lastname%>"/></th>
                <th><input class="form-control" name="dateofbirth" placeholder="dateofbirth" value="<%=dateofbirth%>"/></th>
                
           
                 
                <th>
                    <button class="btn btn-success" name="action" value="create">Add</button>
                    <button class="btn btn-primary" name="action" value="update">Update</button>
                </th>
            </tr>
        </thead>
        <tbody>
    <%
    for(User user : users)
    {
        %>
            <tr>
                
                <td><a href="login.html"><%=user.getUsername() %></td>
                <td><%=user.getPassword() %></td>
                <td><%=user.getRole() %></td>
                <td>
                    <a class="btn btn-danger" href="registration.jsp?action=delete&username=<%=user.getUsername() %>">Delete</a>
                    <a class="btn btn-warning" href="registration.jsp?action=select&username=<%=user.getUsername()%>&password=<%=user.getPassword()%>&role=<%=user.getRole()%>&firstname=<%=user.getFirstname()%>&lastname=<%=user.getLastname()%>&dateodbirth=<%=user.getDateofbirth()%>">Select</a>
                </td>
                 <td>
				<a href="login.html" class="btn btn-danger">Back</a>
				
				</td>
            </tr>
        <%
    }
    %>
        </tbody>
    </table>
    </form>
    </div>
</body>
</html>