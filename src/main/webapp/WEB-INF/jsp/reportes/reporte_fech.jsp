<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
        <div class="container">
                <h1>Reporte De Ingresos</h1>
                <table class="table table-bordered table-striped table-hover table-responsive">
                    <thead>
                        <tr>
                            <th>Registro</th>
                            <th>ID USUAAIO</th>
                            <th>FFECHA</th>
                            <th>HORA</th>
                            <th>ENTRDA(1)|SLIDA(0)</th>
                            <th>NOTAS</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${datos}" var="dato">
                            <c:if test = "${dato.observacion =='si'}">
                                <c:set var="getReactive" value="${'bg-danger'}"  />
                                <c:set var="add" value="${'Entrada Sospechosa: '}"  />
                             </c:if>
                            <c:if test = "${dato.observacion !='si'}">
                                <c:set var="getReactive" value="${'bg-success'}"  />
                                <c:set var="add" value="${''}"  />
                             </c:if>
                            <tr class=" <c:out value="${getReactive}"/> text-white">
                                <td ><c:out value="${dato.id}" /></td>
                                <td  ><c:out value="${dato.nombre}" /></td>
                                <td ><c:out value="${dato.fecha  }" /></td>
                                <td><c:out value="${dato.hora  }" /></td>
                                <td><c:out value="${dato.hora  }" /></td>
                                <td><c:out value="${add}"/><c:out value="${dato.observacion}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
        </div>
<jsp:include page="../footer.jsp" />