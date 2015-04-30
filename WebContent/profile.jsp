<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.dao.*, edu.neu.cs5200.models.*, java.net.URLEncoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Login Successful</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<style type="text/css">
body {
    background-image: url('http://crunchify.com/bg.png');
}

</style>
</head>
    <div class="container">
    
    
    <%
    ChampionDAO championDAO = new ChampionDAO();
    UserDAO userdao=new UserDAO();
    String username=(String)session.getAttribute( "username" ) ;
    %>
    <div>
    <h1>User Information</h1>
    Username:<%=username %>
    
    </div>
   <div> 
   <h2>Liked Champion</h2>
    <form action="profile.jsp">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Name</th>
               
            </tr>
        </thead>
        <tbody>
  <%  
  User users=userdao.readUserByUsername(username);
  Champion championid=users.getChampionid();
  Integer chid=championid.getId();
  Champion champions = championDAO.readChampionById(chid);
        %>
            <tr>
                <td><%=champions.getId()%></td>
                <td><%=champions.getTitle() %></td>
                <td><%=champions.getName() %></a></td>      
               
            </tr>
   
        </tbody>
    </table>
    </form>
    </div>
</body>
</html>