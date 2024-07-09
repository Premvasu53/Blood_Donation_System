<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Donar Login</title>
<link rel="icon" href="logo.png">
<link rel="stylesheet" href="styles.css">
</head>
<body>
<jsp:useBean id="obj" class="app.DBcontrol"/>
<main id="statimg1">
<form onsubmit="return logval()" method="post">
    <table cellspacing="10">
        <tr>
            <td><label for="mobile">Enter Your Mobile No:</label></td>
            <td><input type="text" name="mobile" id="mobile" autocomplete="off"/></td>
        </tr>
        <tr>
            <td align="center" colspan="2"><span id="err1"></span></td>
        </tr>
        <tr>
            <td><label for="pass">Set Password:</label></td>
            <td><input type="password" name="pass" id="pass"/></td>
        </tr>
        <tr>
            <td align="center" colspan="2"><span id="err2"></span></td>
        </tr>
        <tr>
            <td align="center" colspan="2"><input type="submit" name="btn" value="login"/></td>
        </tr>
        <tr>
            <td align="center" colspan="2"><a href="register.jsp">Don't have a Account?</a></td>
        </tr>
    </table>
</form>
<a href="index.jsp" class="ancTobtn">Search Donars</a>
<%
String btn = request.getParameter("btn");
if (btn != null && btn.equals("login")) {
    String number = request.getParameter("mobile");
    String pass = request.getParameter("pass");
    if (obj.checkUser(number, pass)) {
%>
        <script>
            window.location.href = "Updateuser.jsp?mobile=<%= number %>";
        </script>
<%
    } else {
%>
<h3>Invalid User Details!!!</h3>
<% 
    }
}
%>
</main>
</body>
<script>
function logval() {
    var rpn = document.getElementById("mobile");
    var re1 = document.getElementById("err1");
    var rexp1 = /^[6-9]{1}[0-9]{9}$/;
    
    if (rpn.value == "") {
        re1.innerHTML = "Please Enter Mobile Number";
        rpn.focus();
        return false;
    } else if (!rexp1.test(rpn.value)) {
        re1.innerHTML = "Please Enter Valid Mobile Number";
        rpn.focus();
        return false;
    } else {
        re1.innerHTML = "";
    }

    var rpw = document.getElementById("pass");
    var re2 = document.getElementById("err2");
    var rexp2 = /^(?=.*[A-Z])(?=.*\d).{8,12}$/;
    
    if (rpw.value == "") {
        re2.innerHTML = "Please Enter Password";
        rpw.focus();
        return false;
    } else if (!rexp2.test(rpw.value)) {
        re2.innerHTML = "Password must be 8-12 characters long and contain at least one uppercase letter and one number";
        rpw.focus();
        return false;
    } else {
        re2.innerHTML = "";
    }
}
</script>
</html>
