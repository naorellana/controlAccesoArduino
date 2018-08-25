<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
        <div class="container">
                <h1>Reporte De Ingresos</h1>
                <table id="testTable" class="table table-bordered table-striped table-hover table-responsive">
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
                                <c:set var="getReactive" value="${'text-danger'}"  />
                                <c:set var="add" value="${'Entrada Sospechosa: '}"  />
                             </c:if>
                            <c:if test = "${dato.observacion !='si'}">
                                <c:set var="getReactive" value="${'text-success'}"  />
                                <c:set var="add" value="${'Ingreso Desde APP: '}"  />
                             </c:if>
                            <tr class=" <c:out value="${getReactive}"/> ">
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
<input type="button" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Export to Excel">
<jsp:include page="../footer.jsp" />