<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<div class="row">

 <div class="col-6 text-center text-white">
    <div class="card">
      <div class="card-body bg-dark">
        <h5 class="card-title">Control De Motor 1</h5>
        <img class="card-img-top img-thumbnail bg-warning" src="https://png.icons8.com/metro/1600/engine.png" alt="Card image cap">
    <p class="card-text">Hombro</p>
    <a href="<c:url value="control?motor=1F" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>    <button type="button" class="btn btn-success btn-lg btn-block">ADELANTE</button></a>
<a href="<c:url value="control?motor=1R" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span><button type="button" class="btn btn-danger btn-lg btn-block">ATRAS</button></a>
      </div>
    </div>
  </div>

 <div class="col-6 text-center text-white">
    <div class="card">
      <div class="card-body bg-dark">
        <h5 class="card-title">Control De Motor 2</h5>
        <img class="card-img-top img-thumbnail bg-warning" src="https://png.icons8.com/metro/1600/engine.png" alt="Card image cap">
    <p class="card-text">Pinza No. 2</p>
    <a href="<c:url value="control?motor=2F" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>    <button type="button" class="btn btn-success btn-lg btn-block">ABRIR</button></a>
<a href="<c:url value="control?motor=2R" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span><button type="button" class="btn btn-danger btn-lg btn-block" href="<c:url value="control?motor=2F" />">CERRAR</button></a>
      </div>
    </div>
  </div>

</div>
<br>

<div class="row">


  <div class="col-6 text-center text-white">
    <div class="card">
      <div class="card-body bg-dark">
        <h5 class="card-title">Control De Motor 3</h5>
        <img class="card-img-top img-thumbnail bg-warning" src="https://png.icons8.com/metro/1600/engine.png" alt="Card image cap">
    <p class="card-text">Codo</p>
    <a href="<c:url value="control?motor=3F" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>    <button type="button" class="btn btn-success btn-lg btn-block">ARRIBA</button></a>
<a href="<c:url value="control?motor=3R" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span><button type="button" class="btn btn-danger btn-lg btn-block" >ABAJO</button></a>
      </div>
    </div>
  </div>

 <div class="col-6 text-center text-white">
    <div class="card">
      <div class="card-body bg-dark">
        <h5 class="card-title">Control De Motor 4</h5>
        <img class="card-img-top img-thumbnail bg-warning" src="https://png.icons8.com/metro/1600/engine.png" alt="Card image cap">
    <p class="card-text">MUÑECA </p>
    <a href="<c:url value="control?motor=4F" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>    <button type="button" class="btn btn-success btn-lg btn-block">SUBIR</button></a>
<a href="<c:url value="control?motor=4R" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span><button type="button" class="btn btn-danger btn-lg btn-block">BAJAR</button></a>
      </div>
    </div>
  </div>

</div>