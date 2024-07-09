<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Donars</title>
<link rel="icon" href="logo.png">
<link rel="stylesheet" href="styles.css">
</head>
<body>
<jsp:useBean id="obj" class="app.DBcontrol"></jsp:useBean>
<%@page import="java.util.*" %>
<%@page import="app.UsersData" %>
<header>
<a href="login.jsp">Donar Login</a>
</header>
<main id="imgslide">
<form onsubmit="return viewval()" method="post">
<table cellspacing="10">
<tr>
<td><label for="city">Choose Your City:</label></td>
<td>
<select name="city" id="city">
    <option value="">--Select--</option>
    <option value="Ariyalur">Ariyalur</option>
    <option value="Chengalpattu">Chengalpattu</option>
    <option value="Chennai">Chennai</option>
    <option value="Coimbatore">Coimbatore</option>
    <option value="Cuddalore">Cuddalore</option>
    <option value="Dharmapuri">Dharmapuri</option>
    <option value="Dindigul">Dindigul</option>
    <option value="Erode">Erode</option>
    <option value="Kallakurichi">Kallakurichi</option>
    <option value="Kanchipuram">Kanchipuram</option>
    <option value="Kanyakumari">Kanyakumari</option>
    <option value="Karur">Karur</option>
    <option value="Krishnagiri">Krishnagiri</option>
    <option value="Madurai">Madurai</option>
    <option value="Nagapattinam">Nagapattinam</option>
    <option value="Namakkal">Namakkal</option>
    <option value="Nilgiris">Nilgiris</option>
    <option value="Perambalur">Perambalur</option>
    <option value="Pudukkottai">Pudukkottai</option>
    <option value="Ramanathapuram">Ramanathapuram</option>
    <option value="Ranipet">Ranipet</option>
    <option value="Salem">Salem</option>
    <option value="Sivaganga">Sivaganga</option>
    <option value="Tenkasi">Tenkasi</option>
    <option value="Thanjavur">Thanjavur</option>
    <option value="Theni">Theni</option>
    <option value="Tuticorin">Tuticorin</option>
    <option value="Tiruchirappalli">Tiruchirappalli</option>
    <option value="Tirunelveli">Tirunelveli</option>
    <option value="Tirupathur">Tirupathur</option>
    <option value="Tiruppur">Tiruppur</option>
    <option value="Tiruvallur">Tiruvallur</option>
    <option value="Tiruvannamalai">Tiruvannamalai</option>
    <option value="Tiruvarur">Tiruvarur</option>
    <option value="Vellore">Vellore</option>
    <option value="Viluppuram">Viluppuram</option>
    <option value="Virudhunagar">Virudhunagar</option>
</select>
</td>
</tr>
<tr>
<td align="center" colspan="2"><span id="err1"></span></td>
</tr>
<tr>
<td><label for="bg">Choose Your BloodGroup:</label></td>
<td>
<select name="bg" id="bg">
    <option value="">--Select--</option>
    <option value="A+">A+</option>
    <option value="A-">A-</option>
    <option value="B+">B+</option>
    <option value="B-">B-</option>
    <option value="O+">O+</option>
    <option value="O-">O-</option>
    <option value="AB+">AB+</option>
    <option value="AB-">AB-</option>
</select>
</td>
</tr>
<tr>
<td align="center" colspan="2"><span id="err2"></span></td>
</tr>
<tr>
<td align="center" colspan="2"><input type="submit" name="btn" value="Search"/></td>
</tr>
</table>
</form>

<% 
String btn=request.getParameter("btn");
if(btn!=null &&btn.equals("Search")){
	String city=request.getParameter("city");
	String bg=request.getParameter("bg");
	ArrayList<UsersData> donars=obj.GetDonars(bg, city); 
%>
<table cellspacing="10" id="donarslisttbl">
<tr>
<th>Donar Name</th><th>Donar Number</th><th>Donar City</th><th>Donar BloodGroup</th>
</tr>
<% 
	if(donars.size()>0){
		for(UsersData u:donars){
%>
			<tr>
			    <td><%= u.getName() %></td>
			    <td><%= u.getNumber() %></td>
			    <td><%= u.getCity() %></td>
			    <td><%= u.getBg() %></td>
			</tr>
<% 
		}
	}else{
%>
<tr><td colspan="4" align="center"><h3>Sorry No Donars Available!!!</h3></td></tr>
<% 		
	}
}
%>
</table>
</main>
</body>
<script>
function viewval() {
    var city = document.getElementById("city");
    var re1 = document.getElementById("err1");
    var st1 = city.selectedIndex;
    if (st1 == 0) {
        re1.innerHTML = "Please Choose City";
        return false;
    } else {
        re1.innerHTML = "";
    }
    var bloodgroup = document.getElementById("bg");
    var re2 = document.getElementById("err2");
    var st2 = bloodgroup.selectedIndex;
    if (st2 == 0) {
        re2.innerHTML = "Please Choose Bloodgroup";
        return false;
    } else {
        re2.innerHTML = "";
    }
    
    return true; 
}
</script>
</html>