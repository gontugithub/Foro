
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
        men_mensaje varchar(50) not null,
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
    
    call crear_usuario ("Gonzalo", "gontu", "gontu", "gs.alvarez8@gmail.com", "gonzalo.png");
    
	select * from usuarios
    


