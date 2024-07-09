<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Blood Donar Registeration</title>
<link rel="icon" href="logo.png">
<link rel="stylesheet" href="styles.css">
</head>
<body>
<jsp:useBean id="obj" class="app.DBcontrol"></jsp:useBean>
<main id="statimg1">
<form onsubmit="return regval()" method="post">
<table cellspacing="10">
<tr>
<td><label for="name">Enter Your Name:</label></td>
<td><input type="text" name="name" id="name" autocomplete="off"/></td>
</tr>
<tr>
<td align="center" colspan="2"><span id="err1"></span></td>
</tr>
<tr>
<td><label for="mobile">Enter Your Mobile.No:</label></td>
<td><input type="text" name="mobile" id="mobile" autocomplete="off"/></td>
</tr>
<tr>
<td align="center" colspan="2"><span id="err2"></span></td>
</tr>
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
<td align="center" colspan="2"><span id="err3"></span></td>
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
<td align="center" colspan="2"><span id="err4"></span></td>
</tr>
<tr>
<td><label for="pass">Set PassWord:</label></td>
<td><input type="password" name="pass" id="pass"/></td>
</tr>
<tr>
<td align="center" colspan="2"><span id="err5"></span></td>
</tr>
<tr>
<td><label>Able to Donate:</label></td>
<td>
<input type="radio" name="RtD" value="Yes" id="RtD_yes"/>
<label for="RtD_yes">Yes</label>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="RtD" value="NO" id="RtD_no"/>
<label for="RtD_no">No</label>
</td>
</tr>
<tr>
<td align="center" colspan="2"><span id="err6"></span></td>
</tr>
<tr>
<td align="center" colspan="2"><input type="submit" name="btn" value="Register"/></td>
</tr>
</table>
</form>
<a href="login.jsp" class="ancTobtn">Back</a>
</main>
<% 
String btn=request.getParameter("btn");
if(btn!=null &&btn.equals("Register")){
	String name=request.getParameter("name");
	String mobile=request.getParameter("mobile");
	String city=request.getParameter("city");
	String bg=request.getParameter("bg");
	String pass=request.getParameter("pass");
	String RtD=request.getParameter("RtD");
	int r=obj.AddDonars(name,mobile,city,bg,pass,RtD);
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
function regval() {
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

    var rpn = document.getElementById("mobile");
    var re2 = document.getElementById("err2");
    var rexp2 = /^[6-9]{1}[0-9]{9}$/;
    if (rpn.value == "") {
        re2.innerHTML = "Please Enter Mobile Number";
        rpn.focus();
        return false;
    } else if (!rexp2.test(rpn.value)) {
        re2.innerHTML = "Please Enter Valid Mobile Number";
        rpn.focus();
        return false;
    } else {
        re2.innerHTML = "";
    }

    var city = document.getElementById("city");
    var re3 = document.getElementById("err3");
    var st = city.selectedIndex;
    if (st == 0) {
        re3.innerHTML = "Please Choose City";
        return false;
    } else {
        re3.innerHTML = "";
    }

    var bloodgroup = document.getElementById("bg");
    var re4 = document.getElementById("err4");
    var st2 = bloodgroup.selectedIndex;
    if (st2 == 0) {
        re4.innerHTML = "Please Choose Bloodgroup";
        return false;
    } else {
        re4.innerHTML = "";
    }

    var rpw = document.getElementById("pass");
    var re5 = document.getElementById("err5");
    var rexp3 = /^(?=.*[A-Z])(?=.*\d).{8,12}$/;
    if (rpw.value == "") {
        re5.innerHTML = "Please Enter Password";
        rpw.focus();
        return false;
    } else if (!rexp3.test(rpw.value)) {
        re5.innerHTML = "Password must be 8-12 characters long and contain at least one uppercase letter and one number";
        rpw.focus();
        return false;
    } else {
        re5.innerHTML = "";
    }

    var ableToDonate = document.getElementsByName("RtD");
    var re6 = document.getElementById("err6");
    var checked = false;
    for (var i = 0; i < ableToDonate.length; i++) {
        if (ableToDonate[i].checked) {
            checked = true;
            break;
        }
    }
    if (!checked) {
        re6.innerHTML = "Please Choose if Able to Donate";
        return false;
    } else {
        re6.innerHTML = "";
    }
    return true; 
}
</script>

</html>