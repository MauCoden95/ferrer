CREATE TABLE usuarios(
    id int(255) auto_increment not null,
    username varchar(255) not null,
    rol varchar(255) default "Usuario Comun" not null,
    password varchar(255) not null,
    constraint pk_usuarios primary key(id),
    constraint uq_username UNIQUE(username)
)Engine=InnoDB;