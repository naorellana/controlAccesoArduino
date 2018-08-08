<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
        <div class="container">
                <h1>Modelo De Factura</h1>
               
                        <c:forEach items="${datos}" var="dato">
                        
        <form>
  
    <div class="form-row">
    <div class="form-group col-md-9">
      <label for="inputEmail4">Factura GYM SPORT S.A.</label>
      <input type="nombre" class="form-control" id="inputEmail4" placeholder="Email" value="Factura GYM SPORT S.A.">
    </div>
    <div class="form-group col-md-3">
      <label for="inputPassword4">Recibo NO.</label>
      <input type="text" class="form-control" id="inputPassword4" placeholder="NIT" value="AF 001" >
    </div>
  </div>
            <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Cliente:</label>
      <input type="nombre" class="form-control" id="inputEmail4" placeholder="Email" value="${dato.nombre}, (${dato.correo})">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">NIT:</label>
      <input type="text" class="form-control" id="inputPassword4" placeholder="NIT" value="C/F" >
    </div>
  </div>
  <div class="form-group">
    <label for="inputAddress2">Direccion Cliente: </label>
    <input type="text" class="form-control" id="inputAddress2" placeholder="Dirección" value="Guatemala, Ciudad">
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">Descripcion: </label>
      <input type="text" class="form-control" id="inputCity" value="Pago Mensualidad">
    </div>
    <div class="form-group col-md-4">
      <label for="inputState">Mes</label>
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
  </div>
    </div>
    <div class="form-group col-md-2">
      <label for="inputZip">Precio</label>
      <input type="text" class="form-control" id="inputZip" placeholder="Q." value="300">
    </div>
  </div>

            
  <button type="submit" class="btn btn-primary">Facturar</button>
</form>
    
                            </div>
                        </c:forEach>
                    </tbody>
                </table>
        
<jsp:include page="../footer.jsp" />