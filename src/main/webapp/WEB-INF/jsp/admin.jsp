<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="jumbotron">
  <h1 class="display-4">Bienvenido!</h1>
  <p class="lead">Sistema De  Control Del Ingreso De Usuarios</p>
  <hr class="my-4">
  <p>Sistema Para Control De Acceso, utilizando metodos de seguridad biometricos</p>
  <form action="cliente">
  <div class="form-group" >
    <label for="id">Código De Usuario</label>
    <input type="number" class="form-control" id="id" name="id" placeholder="Código De Usuario">
  </div>
  <button type="submit" class="btn btn-primary btn-lg">Ingresar</button>
</form>
</div>

<div class="card text-center">
  <div class="card-header">
    Usuarios
  </div>
  <div class="card-body">
    <h5 class="card-title">Control De Usurios</h5>
    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
    <a href="#" class="btn btn-primary">Go Users</a>
  </div>
  <div class="card-footer text-muted">
    2 days ago
  </div>
</div>
<br>

<div class="card text-center">
  <div class="card-header">
    Reportes
  </div>
  <div class="card-body">
    <h5 class="card-title">Control De Reportes</h5>
    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
    <a href="#" class="btn btn-primary">Go Reports  </a>
  </div>
  <div class="card-footer text-muted">
    2 days ago
  </div>
</div>