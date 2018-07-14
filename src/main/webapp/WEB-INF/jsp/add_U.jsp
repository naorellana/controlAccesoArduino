<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp" />


<div class="creaUsuario">
	<form action="${action}">
	<div class="form-group">
            <label for="id">ID</label>
    <input type="number" class="form-control" name="id"  placeholder="Enter ID" value="${usuarios.id}">
    </div>
		<div class="form-group">
    <label for="nombre">nombre</label>
    <input type="text" class="form-control" name="nombre"  placeholder="Enter user" value="${usuarios.nombre}">
    </div>
  <div class="form-group">
    <label for="correo">Email address</label>
    <input type="email" class="form-control" name="correo" aria-describedby="emailHelp" placeholder="Enter email" value="${usuarios.correo }">
    <small name="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="telefono">telefono</label>
    <input type="number" class="form-control" name="telefono" placeholder="telefono" value="${usuarios.telefono}">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>




<jsp:include page="footer.jsp" />
