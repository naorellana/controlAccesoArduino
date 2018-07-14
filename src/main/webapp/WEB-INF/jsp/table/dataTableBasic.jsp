<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<jsp:include page="../header.jsp" />
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="dataTableBasic">
  <div class="container">
            <div class="row">
                <h1>Gestor De Tablas</h1>
                <p>
                    <a href="<c:url value="tablaBasicNew" />" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Agregar</a>
                </p>
                <table class="table table-bordered table-striped table-hover table-responsive">
                    <thead>
                        <tr>
                            <th>table_name</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${datos}" var="dato">
                            <tr>
                                <td><c:out value="${dato.table_name}" /></td>
                                <td>
                                    <!--<a  href="<c:url value="editTableBasic?table_name=${dato.table_name}" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span><button  type="button" class="btn btn-warning">Editar</button></a>-->
                                    <a href="<c:url value="deleteTableBasic?table_name=${dato.table_name}" />"><button  type="button" class="btn btn-danger">Eliminar</button></a>
                                                                        
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
        </div>
</div>

<jsp:include page="../footer.jsp" />
