<%@ page import="javax.servlet.http.HttpSession" %>

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #24D1F3;">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Course Management System</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminlogin.jsp">Admin</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="teacherlogin.jsp">teacher</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">student</a>
        </li>
        
        <% 
          HttpSession sessions = request.getSession(false);
          if (sessions != null && sessions.getAttribute("userObj") != null) {
            // User is logged in, show the logout link
        %>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-30px" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <% String reg = (String) session.getAttribute("user_reg"); %>
            <%= reg %>
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="userLogout">Logout</a></li>
          </ul>
        </li>
        <% 
          } // end if
        %>
        
<!--         <li class="nav-item dropdown"> -->
<!--           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> -->
<!--             Dropdown -->
<!--           </a> -->
<!--           <ul class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
<!--             <li><a class="dropdown-item" href="#">Action</a></li> -->
<!--             <li><a class="dropdown-item" href="#">Another action</a></li> -->
<!--             <li><hr class="dropdown-divider"></li> -->
<!--             <li><a class="dropdown-item" href="#">Something else here</a></li> -->
<!--           </ul> -->
<!--         </li> -->
      </ul>
    </div>
  </div>
</nav>