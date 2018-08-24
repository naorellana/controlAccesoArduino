<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header_usr.jsp" />
        <div class="container-fluid">
            <div class="row"> <br>
                        <c:forEach items="${datos}" var="dato">
                            <span>
                                <c:if test = "${dato.estado ==0}">
                                    <c:set var="clase" value="${'text-danger'}"  />
                                    <c:set var="clase1" value="${'invisible '}"  />
                                    <c:set var="texto" value="${'No has efectuado el Pago Del Mes Actual :('}"  />
                                </c:if>
                                <c:if test = "${dato.estado ==1}">
                                    <c:set var="clase" value="${'text-success'}"  />
                                    <c:set var="clase1" value="${'visible'}"  />
                                    <c:set var="texto" value="${'Gracias Por Mantener Tus Pagos Al Día :)'}"  />
                                 </c:if>
                            </span>
                            <div class="card text-center col-12">
                                <div class="card-header">
                                  Bienvenido
                                </div>
                                <div class="card-body">
                                  <h5 class="card-title"><c:out value="${dato.nombre}" /></h5>
                                  <p class="card-text <c:out value="${clase}"/>"><c:out value="${texto}"/></p>
                                  <div>
                                        <a href="<c:url value="clienteData?id=${dato.id}" />">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span><button  type="button" class="btn btn-primary btn-sm" onclick="myFunctionRepo()">Reporte</button></a>
                                        <a href="<c:url value="beta?codigo=3,${dato.id}" />">
                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span><button  type="button" class="btn btn-success btn-sm <c:out value="${clase1}"/>" onclick="myFunctionEntrar()">Entrar</button></a>
                                    </div>
                                </div>
                                <div class="card-footer text-muted">
                                  2 days ago
                                </div>
                              </div>
                        </c:forEach>
                
            </div>
                    
<script>
function myFunction() {
    alert("Hello\nHow are you?");
}

function myFunctionEli() {
    alert("Procesando Solicitud De Borrado");
}

function myFunctionEntrar() {
    alert("Cuando El Lector de Huellas Digitales Encienda La Luz De Forma Intermitente \n Coloque Su Dedo Con La Huella Registrada");
}
function myFunctionHuella() {
    alert("INSTRUCCIONES: \n1- El Usuario Debe Colocar La Huella Cuando El Sensor Encienda La Luz\n Una Vez Colocada,\n 2- Retirar El Dedo Del Sensor \n 3-Colocar La huella Nuevamente Para Confirmar");
}
function myFunctionFact() {
    alert("Se Generará El Forulario Para La Factura Correspondiente");
}
function myFunctionRepo() {
    alert("Se Generará El Reporte Solicitado");
}
</script>
<jsp:include page="footer.jsp" />