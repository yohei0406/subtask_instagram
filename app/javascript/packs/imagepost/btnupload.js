function selectFile() {
    if (document.getElementById("elmFile").value === ""){
        document.getElementById("btnUpload").disabled = true;
    }
    else {
        document.getElementById("btnUpload").disabled = false;
    }
}

function(){
	$('input:file').change(
		function(){
			if ($(this).val()) {
				$('button:submit').attr('disabled',false);
			}
		});
}