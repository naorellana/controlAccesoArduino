<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header.jsp" />

<script type="text/javascript" src="camposDinamicos.js"></script>
<div>
<form id="myForm">
<div id="input1" class="clonedInput" style="margin-bottom: 4px;">Name: <input id="name1" type="text" name="name1"></div>
<div><input id="btnAdd" type="button" value="add another name"><br>
<input id="btnDel" type="button" value="remove name" disabled="disabled"></div>
</form>
</div>
<script type="text/javascript">
  jQuery( function ( $ ) {
  $( '#btnAdd' ).click( function() {
    var num = $( '.clonedInput' ).length;   // how many "duplicatable" input fields we currently have
    var newNum  = new Number( num + 1 );    // the numeric ID of the new input field being added
    var newElem = $( '#input' + num ).clone().attr( 'id', 'input' + newNum );
    
    newElem.children( ':first' ).attr( 'id', 'name' + newNum ).attr( 'name', 'name' + newNum );
    $( '#input' + num ).after( newElem );
    $( '#btnDel' ).attr( 'disabled', false );
    if ( newNum == 5 )
      $( '#btnAdd' ).attr( 'disabled', 'disabled' );
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
<script type="text/javascript" src="camposDinamicos.js"></script>
<jsp:include page="../footer.jsp" />