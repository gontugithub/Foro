
# CREACION BASE DE DATOS "bd_foro"
	create schema bd_foro;
	use bd_foro;

# TABLA USUARIOS
	create table usuarios (
		usu_id int unsigned not null auto_increment,
        usu_nombre varchar(50) not null,
        usu_alias varchar(50) not null,
        usu_password varchar(50) not null,
        usu_email varchar(50) not null,
        usu_foto varchar(50) not null,
        usu_admin boolean not null,
        primary key (usu_id)
    );

# TABLA TEMA
	create table temas (
		tema_id int unsigned not null auto_increment,
        tema_nombre varchar(50) not null,
        tema_descripcion mediumtext,
        tema_fchacrea timestamp not null,
        primary key (tema_id)
    );
    
# TABLA MENSAJE
	create table mensaje (
		men_id int unsigned not null auto_increment,
        men_mensaje mediumtext not null,
        men_fecha timestamp not null,
        men_like int unsigned not null,
        men_usu_id int unsigned not null,
        men_tema_id int unsigned not null,
        primary key (men_id),
        foreign key (men_usu_id) references usuarios(usu_id),
		foreign key (men_tema_id) references temas(tema_id)
    );
    
# CREAR USUARIO
	DELIMITER $$
	create procedure `crear_usuario`(IN _nombre varchar(50), IN _alias varchar(50), IN _password varchar(50), IN _email varchar(50), _foto varchar(50))
	insert into usuarios values (null, _nombre, _alias, md5(_password), _email, _foto, 0)$$
	DELIMITER ;
    
    
# INSERTAR FORO
	DELIMITER $$
	create procedure `crear_tema`(IN _nombre varchar(50), IN _descripcion mediumtext)
	insert into temas values (null, _nombre, _descripcion, current_timestamp())$$
	DELIMITER ;

    
# SACAR TODOS LOS FOROS 
	DELIMITER $$
	create procedure `mostrar_temas`()
	select * from temas$$
	DELIMITER ;
    
# NUEVO MENSAJE 
	DELIMITER $$
	create procedure `nuevo_mensaje`(IN _mensaje mediumtext, _creador int, _tema int )
	insert into mensaje values (null, _mensaje, current_timestamp, 0, _creador , _tema)$$
	DELIMITER ;

# MOSTRAR LOS MENSAJES DE CADA TEMA
    
	DELIMITER $$
	create procedure `mostar_mensaje_tema`(IN _tema int)
	select men_mensaje, men_fecha, men_like, usu_nombre from mensaje, temas, usuarios where men_tema_id = tema_id AND men_usu_id = usu_id AND tema_id = _tema$$
	DELIMITER ;
    
    
   

   



