<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manager Home Page</title>

    <style type="text/css">
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #e3f2fd; /* Light blue background */
    }

    header {
        background-color: #2196F3; /* Blue header */
        color: white;
        padding: 20px;
        text-align: center;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .user-info {
        text-align: left;
        color: black; /* Black color for user info */
    }

    .user-info h1 {
        margin: 0;
        font-size: 24px;
    }

    .user-info p {
        margin: 0;
        font-size: 18px;
    }

    .dashboard {
        background-color: #ffffff; /* White dashboard */
        padding: 20px;
        margin: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .dashboard h2 {
        color: #333;
        margin-bottom: 20px;
        border-bottom: 2px solid #2196F3; /* Blue border */
        padding-bottom: 10px;
    }

    .dashboard ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
        display: flex;
    }

    .dashboard li {
        margin-right: 10px;
    }

    .dashboard a {
        text-decoration: none;
        color: #2196F3; /* Blue text */
        padding: 10px;
        text-align: center;
        border: 2px solid #2196F3; /* Blue border */
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .dashboard a:hover {
        background-color: #2196F3; /* Blue hover background */
        color: white;
    }

    .logout-button {
        background-color: #1565C0; /* Dark blue color for logout button */
        color: white;
        padding: 10px 20px;
        text-align: center;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s;
    }

    .logout-button:hover {
        background-color: #0D47A1; /* Darker blue hover background */
    }

    footer {
        background-color: #1565C0; /* Dark blue footer */
        color: white;
        text-align: center;
        padding: 10px;
        position: fixed;
        bottom: 0;
        width: 100%;
    }
</style>

</head>
<body>
    <header>
       <div class="user-info">
            <h1>Welcome, Manager</h1>
            <p>Hello, <%= session.getAttribute("uname") %></p>
        
        </div>
    </header>

    <div class="dashboard">
        <h2>Dashboard</h2>
        <ul>
            <li><a href="#">Manage Employees</a></li>
            <li><a href="#">Generate Reports</a></li>
        </ul>
    </div>

    <footer>
        <p>&copy; 2023 Your Company</p>
    </footer>
</body>
</html>
