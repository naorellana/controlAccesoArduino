<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp" />
        <div class="container">
            <ol class="breadcrumb">
                <li><a href="<c:url value="/home" />">Listado de productos</a></li>
                <li class="add">Agregar</li>
            </ol>
            <div class="panel panel-primary">
                <div class="panel-heading">Formulario</div>
                <div class="panel-body">
                <div><form class="col s12" action="/${action}" method="">
      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">phone</i>
          <input value="${usuarios.id }" id="id" name="id" type="tel" class="validate">
          <label for="icon_telephone">id</label>
        </div>
          <div class="input-field col s6">
          <i class="material-icons prefix">nombre</i>
          <input value="${usuarios.nombre }" id="nombre" name="nombre"type="text" class="validate">
          <label for="icon_prefix">First Name</label>
        </div>
          <div class="input-field col s6">
          <i class="material-icons prefix">account_circle</i>
          <input value="${usuarios.correo }" id="correo" name="correo" placeholder="correo" type="text" class="validate">
          <label for="icon_prefix">correo</label>
        </div>
          <div class="input-field col s6">
          <i class="material-icons prefix">today</i>
          <input type="tel" class="-datepicker" class="form-control" value="${usuarios.telefono }" id="telefono" name="telefono">
          <label for="icon_prefix">telefono</label>
        </div>
          <button class="btn waves-effect waves-light" type="submit" name="action">Submit
    <i class="material-icons right">send</i>
  </button>
      </div>
    </form></div>   
                        
                </div>
            </div>
        </div>
<jsp:include page="footer.jsp" />