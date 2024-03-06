let Usuario_Logueado = null;
let lista = null;
let posicion_lista = 0;

function fInicio() {
    fMostrar('form_login');
    // Así se acomoda al section
    document.querySelector("#div_modal").style.height = document.querySelector("section").clientHeight + "px";
}

function fMostrar(que) {

    //Se ocultan todos los formularios
    let todos = document.querySelectorAll("#div_modal > div");
    // console.log("Todos" , todos);

    for (i = 0; i < todos.length; i++) {
        todos[i].style.display = 'none';
    }

    //Mostrar el que me han dicho
    document.querySelector("#" + que).style.display = "block";
    // Mostrar la modal
    document.querySelector("#div_modal").style.display = "flex";

}
function fOcultarModal() {
    document.querySelector("#div_modal").style.display = "none";
}
// ----------------------------------------------------------------------

function fMostrarLogin() {
    //Mostrar el formulario del login

    document.querySelector("#div_modal").style.display = 'flex';
}

function fLogin() {
    //Leer el alias
    let alias = document.querySelector('#alias').value;
    //Leer el password
    let password = document.querySelector('#password').value;

    //Enviar estos datos al servidor php
    let URL = "Assets/php/servidor.php?peticion=Login";
    URL += "&alias=" + alias;
    URL += "&password=" + password;
    console.log(URL)
    //Debemos de pedirsela al servidor

    fetch(URL)
        .then((response) => response.json())
        .then((data) => {
            //Para asegurarme de que funciona, imprimo los datos en la consola
            console.log(data);
            if (data.datos.length == 0) {
                document.querySelector("#div_error").innerHTML = "Acceso denegado";
                return;
            }

            // Desde aquí el login es correcto

            // Guardar los datos del usuario
            Usuario_Logueado = data.datos[0];
            console.log(Usuario_Logueado)

            // Cambiar foto
            let ruta = "Assets/img/";
            let foto = data.datos[0].usu_foto;
            document.querySelector("#div_foto > img").src = ruta + foto;
            fOcultarModal();


        })


}
function fRegistro() {
    let nombre = document.querySelector("#rnombre").value;
    let alias = document.querySelector("#ralias").value;
    let password = document.querySelector("#rpassword").value;
    let rpassword = document.querySelector("#rrpassword").value;

    if (password != rpassword) {
        document.querySelector("#div_error_registro").innerHTML = "Las contraseñas no coinciden"
        return;
    }

    // A partir de aquí los password coinciden
    let URL = "Assets/php/servidor.php?peticion=Registro";
    URL += "&nombre=" + nombre;
    URL += "&alias=" + alias;
    URL += "&password=" + password;
    console.log(URL)
    //Debemos de pedirsela al servidor

    fetch(URL)
        .then((response) => response.json())
        .then((data) => {
            //Para asegurarme de que funciona, imprimo los datos en la consola
            console.log(data);
            if (data.datos.length == 0) {
                document.querySelector("#div_error").innerHTML = "Acceso denegado";
                return;
            }

            fMostrar('form_login')

        })
}

function fAnterior(){
    if(posicion_lista > 0){
        posicion_lista = posicion_lista -1;
    }
    fLista_Deportes(posicion_lista);

}

function fSiguiente(){
    if(posicion_lista < lista.length -1){
        posicion_lista = posicion_lista +1 ;
    }
    fLista_Deportes(posicion_lista);

}

function fVacio(){
    document.querySelector("#dte_id").value = "";
    document.querySelector("#dte_nombre").value = ""
    fLista_Deportes(posicion_lista);

}

function fLista_Deportes(posicion){
    fMostrar('form_deportes');
    document.querySelector("#dte_id").value = lista[posicion].dte_id;
    document.querySelector("#dte_nombre").value = lista[posicion].dte_nombre;

}

function fCargarDeportes() {
    let URL = "Assets/php/servidor.php?peticion=Deportes";
    fetch(URL)
        .then((response) => response.json())
        .then((data) => {
            //Para asegurarme de que funciona, imprimo los datos en la consola
            console.log(data);
            //Guardo la lista como global
            lista = data.datos;
            // Guardo la lista como global
            let html = `<input type="button" value="CRUD deportes" onclick="fLista_Deportes(0)"`;
            posicion_lista = 0;
            for (i = 0; i < data.datos.length; i++) {
                html += `<div>${data.datos[i].dte_nombre}</div>`
            }
            document.querySelector("nav").innerHTML = html;
        })
}
function fCargarDeportistas() {
    let URL = "Assets/php/servidor.php?peticion=Deportistas";
    fetch(URL)
        .then((response) => response.json())
        .then((data) => {
            //Para asegurarme de que funciona, imprimo los datos en la consola
            console.log(data);
            let html = "";
            for (i = 0; i < data.datos.length; i++) {
                html += `<div>${data.datos[i].dta_nombre}</div>`
            }
            document.querySelector("nav").innerHTML = html;
        })
}