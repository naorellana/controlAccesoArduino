jQuery( function ( $ ) {
	$( '#btnAdd' ).click( function() {
		var num = $( '.clonedInput' ).length;		// how many "duplicatable" input fields we currently have
		var newNum	= new Number( num + 1 );		// the numeric ID of the new input field being added
		var newElem = $( '#input' + num ).clone().attr( 'id', 'input' + newNum );
		
		newElem.children( ':first' ).attr( 'id', 'name' + newNum ).attr( 'name', 'name' + newNum );
		$( '#input' + num ).after( newElem );
		$( '#btnDel' ).attr( 'disabled', false );
		if ( newNum == 5 )
			$( '#btnAdd' ).attr( 'disabled', 'disabled' );
	});
	
	$( '#btnDel' ).click( function() {
		var num = $( '.clonedInput' ).length;		// how many "duplicatable" input fields we currently have
		$( '#input' + num ).remove();				// remove the last element
		$( '#btnAdd' ).attr( 'disabled', false );	// enable the "add" button
		
		// if only one element remains, disable the "remove" button
		if ( num-1 == 1 )
			$( '#btnDel' ).attr( 'disabled', 'disabled' );
	});
			
	$( '#btnDel' ).attr( 'disabled', 'disabled' );
});