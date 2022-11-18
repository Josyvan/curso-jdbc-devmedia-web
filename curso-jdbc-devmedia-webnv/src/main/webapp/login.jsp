<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tela de login</title>
</head>
<body>
	<form action="login" method="post">
		<fieldset style="width: 300px; margin: 0 auto; padding: 30px">
			<legend>login</legend>
			<%
				String msg = (String) request.getAttribute("msg");
			%>
			<%=msg != null ? msg : ""%>
			<br> </br> <label>login: </label> 
			<input type="text" name="login" />
			</br> 
			<label>senha:</label> 
			<input type="password" name="senha" /> </br> <input
				type="submit" value="logar" />
		</fieldset>
	</form>

</body>
</html>