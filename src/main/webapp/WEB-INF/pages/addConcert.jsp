<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page session="true"%>
<!DOCTYPE html>

<html>
       <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="_csrf" content="${_csrf.token}"/>
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
        <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/resources/css/my.css'/>" type="text/css">
        <title>Concert Information</title>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                       <span class="sr-only">Toggle navigation</span>
                       <span class="icon-bar"></span>
                       <c:choose>
                           <c:when test="${pageContext.request.userPrincipal.name != null}">
                               <span class="icon-bar"></span>
                               <span class="icon-bar"></span>
                               <span class="icon-bar"></span>
                               <span class="icon-bar"></span>
                           </c:when>
                           <c:otherwise>
                               <span class="icon-bar"></span>
                           </c:otherwise>
                       </c:choose>
                       <span class="icon-bar"></span>
                       <span class="icon-bar"></span>
                   </button>
                   <a class="navbar-brand" href='<spring:url value="/index" ></spring:url>'>Home</a>
               </div>
            
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                       
                       <c:choose>
                           <c:when test="${pageContext.request.userPrincipal.name != null}">
                               <sec:authorize access="hasRole('ROLE_ADMIN')">
                                    <ul class="nav navbar-nav">
                                        <li><a href='<spring:url value="/addConcert" ></spring:url>'>Add Concert</a></li>
                                    </ul>
                               </sec:authorize>
                   
                               <ul class="nav navbar-nav navbar-right">
                                   <li><a href= "" >Hi, <c:out value="${pageContext.request.userPrincipal.name}"/></a></li>
                                   <li><a href='<spring:url value="/logout" ></spring:url>'>Logout</a></li>
                               </ul>
                           </c:when>
                           <c:otherwise>
                               <ul class="nav navbar-nav navbar-right">
                                   <li><a href='<spring:url value="/signIn" ></spring:url>'>Sign In</a></li>
                                   <li><a href='<spring:url value="/registration" ></spring:url>' >Sign Up</a></li>
                               </ul>
                           </c:otherwise>
                       </c:choose>
                    </ul>   
               </div>
            
        </div>        
    </nav>
                                   <br><br><br>
                                   
    <div class="container">
        <form:form method="POST" modelAttribute="props">
            <table>
                <tr>
                    <td>name of concert :</td>
                    <td><form:input path="name" /></td>
                    <td><form:errors path="name" cssClass="error"></form:errors></td>
                </tr>
                <tr>
                    <td>price of ticket :</td>
                    <td><form:input path="ticketPrice"/></td>
                    <td><form:errors path="ticketPrice" cssClass="error"></form:errors></td>
                </tr>
                <tr>
                    <td>number of songs in concert :</td>
                    <td><form:input path = "numberOfSongs"/></td>
                    <td><form:errors path="numberOfSongs" cssClass="error"></form:errors></td>
                </tr>
                <tr>
                    <td>number of songs available to choose :</td>
                    <td><form:input path="numberOfSongsToChoose"/></td>
                    <td><form:errors path="numberOfSongsToChoose" cssClass="error"></form:errors></td>
                </tr>
                <tr>
                    <td>number of tickets :</td>
                    <td><form:input path = "numberOfTickets"/></td>
                    <td><form:errors path="numberOfTickets" cssClass="error"></form:errors></td>
                </tr>
                <tr>
                    <td>duration of voting:</td>
                    <td>hours :<form:input path = "hours" width="20px"/></td>
                    <td><form:errors path="hours" cssClass="error"></form:errors></td>
                </tr>
                <tr>
                    <td></td>
                    <td>minutes :<form:input type = "text" path = "minutes" width="20px"/></td>
                    <td><form:errors path="minutes" cssClass="error"></form:errors></td>
                </tr>
                
                <tr>
                    <td><button class="btn btn-primary" type = "submit"/>Next</td>
                </tr>
            </table>
        </form:form>
    </div>  
                                   
    <tr>                               
        <div class="footer">
            <div class="container">
                <small><p class="text-muted">Created by Yauheni Shablouski</p></small>
            </div>
        </div> 
        
              
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    </body>
</html>
