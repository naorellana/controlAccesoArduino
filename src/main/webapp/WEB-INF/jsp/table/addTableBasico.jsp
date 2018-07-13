<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header.jsp" />


<script>
	$(document).ready(function() {
    var max_fields      = 10; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
    
    var x = 0; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            $(wrapper).append('<div><div class="row">       <div class="col-sm">            <label for="campo">Campo</label>            <input type="text" class="form-control" id="campo" placeholder="texto" name="\${registro['+x+'].campo}" >        </div>        <div class="col-sm">          <div class="form-group">            <label for="">Tipo</label> <br>  <select class="form-control" name="\${registro['+x+'].tipoVar}">              <option>CHAR</option>              <option>REAL</option>              <option>FLOAT</option>              <option>DECIMAL</option>              <option>SMALLINT</option>              <option>VARCHAR2</option>              <option>DATE</option>              <option>INT</option>              <option>NUMERIC</option>              <option>INTEGER</option>              <option>VARCHAR2</option>            </select>          </div>        </div>        <div class="col-sm">            <label for="">Constraint</label> <br>          <div class="form-check form-check-inline">              <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="primary" name="\${registro['+x+'].checkPrimary}">              <label class="form-check-label" for="inlineCheckbox1">Primary Key</label>            </div>            <div class="form-check form-check-inline">              <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="null" name="\${registro['+x+'].checkNull}">              <label class="form-check-label" for="inlineCheckbox2">Null</label>            </div>            <div class="form-check form-check-inline">              <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="unique" name="\${registro['+x+'].checkUnique}" >              <label class="form-check-label" for="inlineCheckbox3">Unique </label>   </div>        </div>        </div> <a href="#" class="remove_field  btn  btn-danger btn-sm">Borrar</a> <br></div>'); //add input box
        }
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
});
</script>

<div>
    <form action="recibeTabla">
  <div class="form-group">
    <label for="nombreTabla">CrearNueva Tabla</label>
    <input type="text" class="form-control" id="nombreTabla"  name="nombreTabla" 
           placeholder="Nombre De La Tabla" value=""> 
  </div>
  <button class="add_field_button btn btn-primary btn-lg btn-block">Agregar Registro</button>
  <div class="input_fields_wrap">
    
</div>

  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
<p> <!-- Se recorre todo el array porque no se puede especificar una posicion del vector-->
    ${registro.toString()}

  
  
  <a href="<c:url value="recibeTabla?registro=${registro}" />"><button  type="button" class="btn btn-danger">Danger</button></a>
                                    


<jsp:include page="../footer.jsp" />