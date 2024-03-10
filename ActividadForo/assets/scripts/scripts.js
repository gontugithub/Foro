
function fCerrarModalLogin(){
    document.querySelector("#modal_login").style.display = "none";
    document.querySelector("#body_index").style.overflow = "scroll";
}

function fAbrirModalLogin(){
    document.querySelector("#modal_login").style.display = "flex";
    document.querySelector("#body_index").style.overflow = "hidden";
}

function fCerrarModalRegistro(){
    document.querySelector("#modal_registro").style.display = "none";
}

function fAbrirModalRegistro(){
    document.querySelector("#modal_registro").style.display = "flex";
}