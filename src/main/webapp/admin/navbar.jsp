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
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Admin
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="index.jsp">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>