
function fCerrarModalLogin(){
    document.querySelector("#modal_login").style.display = "none";
    document.querySelector("#body_index").style.overflow = "scroll";
}

function fAbrirModalLogin(){
    document.querySelector("#modal_login").style.display = "flex";
    document.querySelector("#body_index").style.overflow = "hidden";
    console.log("funciona")
}

function fCerrarModalRegistro(){
    document.querySelector("#modal_registro").style.display = "none";
}

function fAbrirModalRegistro(){
    document.querySelector("#modal_registro").style.display = "flex";
}

function fMostrarTemas(){

    const URL = "assets/php/servidor.php?peticion=mostrar_temas";
        fetch(URL)
        .then((response) => response.json()) 
        .then((data) => {

            console.log(data);

            let html = "";

            for(i = 0; i< data.datos.length; i++){
                html += `<div class="div_foros" onclick="fMostrarMensajesTema(${data.datos[i].tema_id})">${data.datos[i].tema_nombre}</div>`
            }

            console.log(html);
            document.querySelector("#div_foros_nav").innerHTML = html;
        })
}

function fMostrarMensajesTema(tema_id) {

    const URL = "assets/php/servidor.php?peticion=mostrar_mensajes&temaid= " + tema_id;
        fetch(URL)
        .then((response) => response.json()) 
        .then((data) => {

            console.log(data);
        })
}


function fNuevoUsuario(){

    if (document.querySelector("#password_registro").value != document.querySelector("#repeat_password_registro").value){

        document.querySelector("#mensaje_error_registro").style.display = "flex";

    } else{
        console.log("Acceso exitoso");
        document.querySelector("#mensaje_error_registro").style.display = "none";

    let URL = "assets/php/servidor.php?peticion=nuevo_user";

    URL += "&name=" + document.querySelector("#name_registro").value;
    URL += "&alias=" + document.querySelector("#alias_registro").value;
    URL += "&email=" + document.querySelector("#email_registro").value;
    URL += "&password=" + document.querySelector("#password_registro").value;
    URL += "&foto";

    fetch(URL)
    .then((response) => response.json()) 
    .then((data) => {

        console.log(data);

        if (data.datos == 0){
            document.querySelector("#mensaje_error_registro").style.display = "flex"
            document.querySelector("#mensaje_error_registro").innerHTML = "REGISTRO REALIZADO CON EXITO"
            setTimeout(fCerrarModalRegistro, 2000)

        }
    })

    }
}

function fLogin(){

    let URL = "assets/php/servidor.php?peticion=login";

    URL += "&alias=" + document.querySelector("#input_alias_login").value;
    URL += "$password=" + document.querySelector("#input_password_login").value;

    fetch(URL)
    .then((response) => response.json()) 
    .then((data) => {

        console.log(data);

    
    })

}



