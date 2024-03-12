let registrado;
let tema;

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

    tema = tema_id;

    const URL = "assets/php/servidor.php?peticion=mostrar_mensajes&temaid= " + tema_id;
        fetch(URL)
        .then((response) => response.json()) 
        .then((data) => {

            console.log(data);

            let html = "";

            for(i = 0; i< data.datos.length; i++){

                if(registrado == data.datos[i].usu_id){
                   html += `<div class="mensaje">
                   <div class="div_datos_mensaje">
                   <div class="datos_mensaje">
                   <div class="div_foto_mensaje">
                   <div class="foto_mensaje">
                   <img src="assets/img/u01.gif" class="img_foto_mensaje"></div></div>
                   <div class="nombre_usu_mensaje">${data.datos[i].usu_alias}</div></div>
                   <div class="funcionalidad_mensaje">
                   <div class="hora">${data.datos[i].men_fecha}</div>
                   <div class="eliminar_mensaje" onclick="fEliminarMensaje(${data.datos[i].men_id})">X</div></div></div>
                   <div class="div_texto_mensaje">${data.datos[i].men_mensaje}</div></div>`;
                } else{
                    html += `<div class="mensaje">
                    <div class="div_datos_mensaje">
                    <div class="datos_mensaje">
                    <div class="div_foto_mensaje">
                    <div class="foto_mensaje">
                    <img src="assets/img/u01.gif" class="img_foto_mensaje"></div></div>
                    <div class="nombre_usu_mensaje">${data.datos[i].usu_alias}</div></div>
                    <div class="funcionalidad_mensaje">
                    <div class="hora">${data.datos[i].men_fecha}</div>   </div></div>
                    <div class="div_texto_mensaje">${data.datos[i].men_mensaje}</div></div>`;
                }
                console.log(html)

                document.querySelector("section").innerHTML = html;

            }

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
    URL += "&password=" + document.querySelector("#input_password_login").value;

    fetch(URL)
    .then((response) => response.json()) 
    .then((data) => {

        console.log(data);

        registrado = data.datos[0].usu_id;

        console.log(registrado)

        if (data.datos.length == 0){
            document.querySelector("#mensaje_error").style.display = "flex";
        } else{

            let mensajelog = "BIENVENIDO " + data.datos[0].usu_nombre;

            document.querySelector("#mensaje_error").style.display = "flex";
            document.querySelector("#mensaje_error").innerHTML = mensajelog.toUpperCase();
            setTimeout(fCerrarModalLogin, 2000)
            document.querySelector("#alias_login_header").style.display = "flex";
            document.querySelector("#alias_login_header").innerHTML = data.datos[0].usu_alias;
            document.querySelector("#boton_login_header").style.display = "none";
            document.querySelector("#div_escribir_mensaje").style.display = "flex";
        }

    })

}

function fEnviarMensaje(){

    let URL = "assets/php/servidor.php?peticion=enviar_mensaje";

    URL += "&mensaje=" + document.querySelector("#input_div_escribir").value;
    URL += "&id=" + registrado;
    URL += "&tema=" + tema;

    fetch(URL)
    .then((response) => response.json()) 
    .then((data) => {

        console.log(data);

        fMostrarMensajesTema(tema)
        document.querySelector("#input_div_escribir").value = ""

    })


}

function fEliminarMensaje(men_id){

    let URL = "assets/php/servidor.php?peticion=borrar_mensaje";

    URL += "&mensaje=" + document.querySelector("#input_div_escribir").value;
    URL += "&id=" + registrado;
    URL += "&tema=" + tema;

    fetch(URL)
    .then((response) => response.json()) 
    .then((data) => {

        console.log(data);

        fMostrarMensajesTema(tema)
        document.querySelector("#input_div_escribir").value = ""

    })



}



