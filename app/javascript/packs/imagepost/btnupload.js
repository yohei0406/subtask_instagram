function selectFile() {
    if (document.getElementById("imageFile").value === ""){
        document.getElementById("btnUPload").disabled = true;
    }
    else {
        document.getElementById("btnUPload").disabled = false;
    }
}