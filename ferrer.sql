CREATE TABLE usuarios(
    id int(255) auto_increment not null,
    username varchar(255) not null,
    rol varchar(255) default "Usuario Comun" not null,
    password varchar(255) not null,
    image VARCHAR(255),
    constraint pk_usuarios primary key(id),
    constraint uq_username UNIQUE(username)
)Engine=InnoDB;



CREATE TABLE productos(
    id int(255) auto_increment not null,
    categoria_id int(255) not null,
    descripcion varchar(255) not null,
    precio int(100) not null,
    stock int(200) not null,
    stock_reposicion int(200),
    imagen varchar(255),
    constraint pk_productos primary key(id),
    constraint fk_producto_categorias FOREIGN KEY(categoria_id) REFERENCES categorias(id)
)Engine=InnoDB;



CREATE TABLE categorias(
    id int(255) auto_increment not null,
    nombre VARCHAR(255) not null,
    constraint pk_categorias PRIMARY KEY(id)
)Engine=InnoDB;


INSERT INTO categorias VALUES(null,"Herramienta Manual");