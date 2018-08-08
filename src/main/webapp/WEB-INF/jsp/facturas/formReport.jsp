<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />

<form action="fechas">
  <div class="form-row align-items-center">
    <div class="col-auto">
      <label class="sr-only" for="inlineFormInputGroup">2018/01/01</label>
      <div class="input-group mb-2">
        <div class="input-group-prepend">
          <div class="input-group-text">2018-01-01</div>
        </div>
        <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="2018-01-01" name="fecha1">
      </div>
    </div>
    <div class="col-auto">
      <label class="sr-only" for="inlineFormInputGroup">2018-01-31</label>
      <div class="input-group mb-2">
        <div class="input-group-prepend">
          <div class="input-group-text">2018-12-31</div>
        </div>
        <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="2018-12-31" name="fecha2">
      </div>
    </div>  
    <div class="col-auto">
      <button type="submit" class="btn btn-primary mb-2">Generar</button>
    </div>
  </div>
</form>

<form action="mes" >
  <div class="form-row align-items-center">
      <select class="custom-select" name="mes">
        <option value="1">Enero</option>
        <option value="2">Febrero</option>
        <option value="3">Marzo</option>
        <option value="4">Abril</option>
        <option value="5">Mayo</option>
        <option value="6">Junio</option>
        <option value="7">Julio</option>
        <option value="8">Agosto</option>
        <option value="9">Septiembre</option>
        <option value="10">Octubre</option>
        <option value="11">Noviembre</option>
        <option value="12">Diciembre</option>
      </select>
      <div class="col-auto">
      <button type="submit" class="btn btn-primary mb-2">Generar</button>
    </div>
  </div>
</form>

<jsp:include page="../footer.jsp" />