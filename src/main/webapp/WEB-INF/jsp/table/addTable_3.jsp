<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header.jsp" />
<script type="text/javascript">
  $(document).ready(function() {
    $('select').material_select();
  });
</script>
<div class="row">
<form action="/testTable" id="myForm">
  <div class="input-field col s12">
          <input placeholder="Tabla" id="tabla" type="text" class="validate">
          <label for="tabla">Nombre De La Tabla</label>
        </div>
<div id="input1" class="clonedInput input-field row">
  <div class="input-field col s4">
    Campo: <input id="name1" type="text" name="name1">
  </div >
  <div class="input-field col s4">
  <div class="input-field ">
    <select>
      <option value="" disabled selected>Tipo De Dato</option>
       <option value="Integer">Integer</option>
  <option value="Date">Date</option>
  <option value="Varchar2">Varchar2</option>
  <option value="Float">Float</option>
    </select>
    <label>Tipo</label>
  </div>
</div >
<div class="input-field col s2">
  <div class="input-field ">
    <select class="">
      <option value="" disabled selected>Seleccione</option>
      <option value="Si">Si</option>
  <option value="No">No</option>
    </select>
    <label>Llave Primaria</label>
  </div>
</div >
<div class="input-field col s2">
  <div class="input-field ">
    <select>
      <option value="" disabled selected>Seleccione</option>
  <option value="Si">Si</option>
  <option value="No">No</option>
    </select>
    <label>Null</label>
  </div>
</div >
</div>


<div class="input-field col s12"><input id="btnAdd" type="button" value="add another name" onclick="sel();"><br>
<input id="btnDel" type="button" value="remove name" disabled="disabled"></div>
<button class="btn waves-effect waves-light" type="submit" name="action">Submit
    <i class="material-icons right">send</i>
  </button>
</form>
</div>

<script type="text/javascript">
  jQuery( function ( $ ) {
  $( '#btnAdd' ).click( function() {
    //$('select').material_select();
    var num = $( '.clonedInput' ).length;   // how many "duplicatable" input fields we currently have
    var newNum  = new Number( num + 1 );    // the numeric ID of the new input field being added
    var newElem = $( '#input' + num ).clone().attr( 'id', 'input' + newNum );
    $(document).ready(function() {
    $('select').material_select();
  });
    
    newElem.children( ':first' ).attr( 'id', 'name' + newNum ).attr( 'name', 'name' + newNum );
    $( '#input' + num ).after( newElem );
    $( '#btnDel' ).attr( 'disabled', false );
    if ( newNum == 5 )
      $( '#btnAdd' ).attr( 'disabled', 'disabled' );
    $(document).ready(function() {
    $('select').material_select();
  });
  });
  
  $( '#btnDel' ).click( function() {
    var num = $( '.clonedInput' ).length;   // how many "duplicatable" input fields we currently have
    $( '#input' + num ).remove();       // remove the last element
    $( '#btnAdd' ).attr( 'disabled', false ); // enable the "add" button
    
    // if only one element remains, disable the "remove" button
    if ( num-1 == 1 )
      $( '#btnDel' ).attr( 'disabled', 'disabled' );
  });
      
  $( '#btnDel' ).attr( 'disabled', 'disabled' );
});
</script>
<jsp:include page="../footer.jsp" />