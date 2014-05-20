<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Member ${name}</title>
</head>
<body>
<a href="/member">List</a>
<form:form commandName="member" action="/member/${seq}"  method="PUT">
<div>
        <label>아이디</label>
        <form:input path="id" size="50"/>
        <form:errors path="id" cssClass="error"/> <br />

        <label>비밀번호</label>
        <form:input path="password" size="50"/>
        <form:errors path="password" cssClass="error"/> <br />
        
        <label>이름</label>
        <form:input path="name" size="50"/>
        <form:errors path="name" cssClass="error"/> <br />

        <label>생년월일</label>
        <form:input path="birthday" size="50" data-role="date"/>
        <form:errors path="birthday" cssClass="error"/> <br />

        <label>이메일</label>
        <form:input path="email" size="50"/>
        <form:errors path="email" cssClass="error"/> <br />

        <label>핸드폰_1</label>
        <form:input path="mobilephone_1" size="50"/>
        <form:errors path="mobilephone_1" cssClass="error"/> <br />

        <label>핸드폰_2</label>
        <form:input path="mobilephone_2" size="50"/>
        <form:errors path="mobilephone_2" cssClass="error"/> <br />

        <label>핸드폰_3</label>
        <form:input path="mobilephone_3" size="50"/>
        <form:errors path="mobilephone_3" cssClass="error"/> <br />

        <label>성별</label>
        <form:input path="sex" size="50"/>
        <form:errors path="sex" cssClass="error"/> <br />

        <label>사용여부</label>
        <form:input path="enabled" size="50"/>
        <form:errors path="enabled" cssClass="error"/> <br />
    <input type="submit" value="저장"/> 
</div> 
</form:form>
</body>
</html>