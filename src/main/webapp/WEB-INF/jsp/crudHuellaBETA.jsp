<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>





<jsp:include page="header.jsp" />

<div class="jumbotron">
  <h1 class="display-4">Bienvenido!</h1>
  <p class="lead">Sistema De  Control Del Ingreso De Usuarios</p>
  <hr class="my-4">
  <p>Sistema Para Control De Acceso, utilizando métodos de seguridad biométricos</p>
  <a class="btn btn-primary btn-lg" href="<c:url value="beta?codigo=1,1" />" role="button">Abrir Puerta</a>
  <a class="btn btn-success btn-lg" href="<c:url value="beta?codigo=2,1" />" role="button">Nueva Huella</a>
  <a class="btn btn-primary btn-lg" href="<c:url value="beta?codigo=3,1" />" role="button">Lee Huella</a>
  <a class="btn btn-warning btn-lg" href="<c:url value="beta?codigo=4,1" />" role="button">Borra Huella</a>
  <a class="btn btn-danger btn-lg" href="<c:url value="beta?codigo=5,1005" />" role="button">Borrar TODO</a>
  <br>
  <img src="https://ak3.picdn.net/shutterstock/videos/22232143/thumb/7.jpg" 
       alt="Imagen Huella Digital" class="img-fluid img-thumbnail"></img>
  <br>
</div>

<jsp:include page="footer.jsp" />