<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="act" class="model.Activity" scope="session"/>
<jsp:useBean id="us" class="model.User" scope="session"/>
<jsp:useBean id="cm" class="model.Comment" scope="session"/>
<!DOCTYPE HTML>
<html>
<head>
<title>FavoUni</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<style>
    strong{color:#3eb08f}
</style>
</head>
