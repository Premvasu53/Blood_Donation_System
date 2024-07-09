<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Donar Profile</title>
<link rel="icon" href="logo.png">
<link rel="stylesheet" href="styles.css">
</head>
<body>
<jsp:useBean id="obj" class="app.DBcontrol"/>
<%@page import="app.UsersData" %>
<%
String mobile=request.getParameter("mobile");
UsersData user=obj.getIndividualUser(mobile);
%>
<main id="statimg2">
<form onsubmit="return updval()" method="post">
<table cellspacing="10">
<tr>
<td><label for="name">Enter Your Name:</label></td>
<td><input type="text" name="name" id="name" autocomplete="off" value=<%=user.getName()  %>></td>
</tr>
<tr>
<td align="center" colspan="2"><span id="err1"></span></td>
</tr>
<tr>
<td><label for="mobile">Enter Your Mobile.No:</label></td>
<td><input type="text" name="mobile" id="mobile" disabled value=<%=user.getNumber()  %>></td>
</tr>
<tr>
<td><label for="city">Choose Your City:</label></td>
<td>
<select name="city" id="city">
    <option value="">--Select--</option>
    <option value="Ariyalur" <%= "Ariyalur".equals(user.getCity()) ? "selected" : "" %>>Ariyalur</option>
    <option value="Chengalpattu" <%= "Chengalpattu".equals(user.getCity()) ? "selected" : "" %>>Chengalpattu</option>
    <option value="Chennai" <%= "Chennai".equals(user.getCity()) ? "selected" : "" %>>Chennai</option>
    <option value="Coimbatore" <%= "Coimbatore".equals(user.getCity()) ? "selected" : "" %>>Coimbatore</option>
    <option value="Cuddalore" <%= "Cuddalore".equals(user.getCity()) ? "selected" : "" %>>Cuddalore</option>
    <option value="Dharmapuri" <%= "Dharmapuri".equals(user.getCity()) ? "selected" : "" %>>Dharmapuri</option>
    <option value="Dindigul" <%= "Dindigul".equals(user.getCity()) ? "selected" : "" %>>Dindigul</option>
    <option value="Erode" <%= "Erode".equals(user.getCity()) ? "selected" : "" %>>Erode</option>
    <option value="Kallakurichi" <%= "Kallakurichi".equals(user.getCity()) ? "selected" : "" %>>Kallakurichi</option>
    <option value="Kanchipuram" <%= "Kanchipuram".equals(user.getCity()) ? "selected" : "" %>>Kanchipuram</option>
    <option value="Kanyakumari" <%= "Kanyakumari".equals(user.getCity()) ? "selected" : "" %>>Kanyakumari</option>
    <option value="Karur" <%= "Karur".equals(user.getCity()) ? "selected" : "" %>>Karur</option>
    <option value="Krishnagiri" <%= "Krishnagiri".equals(user.getCity()) ? "selected" : "" %>>Krishnagiri</option>
    <option value="Madurai" <%= "Madurai".equals(user.getCity()) ? "selected" : "" %>>Madurai</option>
    <option value="Nagapattinam" <%= "Nagapattinam".equals(user.getCity()) ? "selected" : "" %>>Nagapattinam</option>
    <option value="Namakkal" <%= "Namakkal".equals(user.getCity()) ? "selected" : "" %>>Namakkal</option>
    <option value="Nilgiris" <%= "Nilgiris".equals(user.getCity()) ? "selected" : "" %>>Nilgiris</option>
    <option value="Perambalur" <%= "Perambalur".equals(user.getCity()) ? "selected" : "" %>>Perambalur</option>
    <option value="Pudukkottai" <%= "Pudukkottai".equals(user.getCity()) ? "selected" : "" %>>Pudukkottai</option>
    <option value="Ramanathapuram" <%= "Ramanathapuram".equals(user.getCity()) ? "selected" : "" %>>Ramanathapuram</option>
    <option value="Ranipet" <%= "Ranipet".equals(user.getCity()) ? "selected" : "" %>>Ranipet</option>
    <option value="Salem" <%= "Salem".equals(user.getCity()) ? "selected" : "" %>>Salem</option>
    <option value="Sivaganga" <%= "Sivaganga".equals(user.getCity()) ? "selected" : "" %>>Sivaganga</option>
    <option value="Tenkasi" <%= "Tenkasi".equals(user.getCity()) ? "selected" : "" %>>Tenkasi</option>
    <option value="Thanjavur" <%= "Thanjavur".equals(user.getCity()) ? "selected" : "" %>>Thanjavur</option>
    <option value="Theni" <%= "Theni".equals(user.getCity()) ? "selected" : "" %>>Theni</option>
    <option value="Tuticorin" <%= "Tuticorin".equals(user.getCity()) ? "selected" : "" %>>Tuticorin</option>
    <option value="Tiruchirappalli" <%= "Tiruchirappalli".equals(user.getCity()) ? "selected" : "" %>>Tiruchirappalli</option>
    <option value="Tirunelveli" <%= "Tirunelveli".equals(user.getCity()) ? "selected" : "" %>>Tirunelveli</option>
    <option value="Tirupathur" <%= "Tirupathur".equals(user.getCity()) ? "selected" : "" %>>Tirupathur</option>
    <option value="Tiruppur" <%= "Tiruppur".equals(user.getCity()) ? "selected" : "" %>>Tiruppur</option>
    <option value="Tiruvallur" <%= "Tiruvallur".equals(user.getCity()) ? "selected" : "" %>>Tiruvallur</option>
    <option value="Tiruvannamalai" <%= "Tiruvannamalai".equals(user.getCity()) ? "selected" : "" %>>Tiruvannamalai</option>
    <option value="Tiruvarur" <%= "Tiruvarur".equals(user.getCity()) ? "selected" : "" %>>Tiruvarur</option>
    <option value="Vellore" <%= "Vellore".equals(user.getCity()) ? "selected" : "" %>>Vellore</option>
    <option value="Viluppuram" <%= "Viluppuram".equals(user.getCity()) ? "selected" : "" %>>Viluppuram</option>
    <option value="Virudhunagar" <%= "Virudhunagar".equals(user.getCity()) ? "selected" : "" %>>Virudhunagar</option>
</select>
</td>
</tr>
<tr>
<td align="center" colspan="2"><span id="err2"></span></td>
</tr>
<tr>
<td><label for="bg">Choose Your BloodGroup:</label></td>
<td>
<select name="bg" id="bg" disabled>
    <option value="">--Select--</option>
    <option value="A+" <%= "A+".equals(user.getBg()) ? "selected" : "" %>>A+</option>
    <option value="A-" <%= "A-".equals(user.getBg()) ? "selected" : "" %>>A-</option>
    <option value="B+" <%= "B+".equals(user.getBg()) ? "selected" : "" %>>B+</option>
    <option value="B-" <%= "B-".equals(user.getBg()) ? "selected" : "" %>>B-</option>
    <option value="O+" <%= "O+".equals(user.getBg()) ? "selected" : "" %>>O+</option>
    <option value="O-" <%= "O-".equals(user.getBg()) ? "selected" : "" %>>O-</option>
    <option value="AB+" <%= "AB+".equals(user.getBg()) ? "selected" : "" %>>AB+</option>
    <option value="AB-" <%= "AB-".equals(user.getBg()) ? "selected" : "" %>>AB-</option>
</select>
</td>
</tr>
<tr>
<td><label for="RtD">Able to Donate:</label></td>
<td>
    <input type="radio" name="RtD" value="Yes" id="RtD_yes" <%= "Yes".equals(user.getRtD()) ? "checked" : "" %>> 
    <label for="RtD_yes">Yes</label>
	&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="radio" name="RtD" value="No" id="RtD_no" <%= "No".equals(user.getRtD()) ? "checked" : "" %>> 
    <label for="RtD_no">No</label>
</td>
<tr>
<td align="center" colspan="2"><span id="err3"></span></td>
</tr>
</tr>
<tr>
<td align="center" colspan="2"><input type="submit" name="btn" value="Update"/></td>
</tr>
</table>
</form>
<a href="index.jsp" class="ancTobtn">Search Donars</a>
</main>
<% 
String btn=request.getParameter("btn");
if(btn!=null && btn.equals("Update")){
    String name=request.getParameter("name");
    String city=request.getParameter("city");
    String RtD=request.getParameter("RtD");
    int r=obj.UpdateUser(mobile, name, city, RtD);
    if(r>0){
%>
    <script>
    	window.location.href = "index.jsp";
    </script>
<%
    }
}
%>
</body>
<script>
function updval() {
    var un = document.getElementById("name");
    var re1 = document.getElementById("err1");
    var rexp1 = /^[A-Za-z]{3,15}$/;
    if (un.value == "") {
        re1.innerHTML = "Please Enter UserName";
        un.focus();
        return false;
    } else if (!rexp1.test(un.value)) {
        re1.innerHTML = "Please valid Enter UserName";
        un.focus();
        return false;
    } else {
        re1.innerHTML = "";
    }
    var city = document.getElementById("city");
    var re2 = document.getElementById("err2");
    var st = city.selectedIndex;
    if (st == 0) {
        re2.innerHTML = "Please Choose City";
        return false;
    } else {
        re2.innerHTML = "";
    }
    
    var ableToDonate = document.getElementsByName("RtD");
    var re3 = document.getElementById("err3");
    var checked = false;
    for (var i = 0; i < ableToDonate.length; i++) {
        if (ableToDonate[i].checked) {
            checked = true;
            break;
        }
    }
    if (!checked) {
        re3.innerHTML = "Please Choose if Able to Donate";
        return false;
    } else {
        re3.innerHTML = "";
    }
    return true; 
}
</script>
</html>