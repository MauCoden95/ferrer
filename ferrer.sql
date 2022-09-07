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

CREATE TABLE proveedores(
    id int(255) auto_increment not null,
    razon_social VARCHAR(255) not null,
    direccion VARCHAR(255) not null,
    ciudad VARCHAR(255) not null,
    codigo_postal int(100) not null,
    telefono int(255) not null,
    constraint pk_proveedores PRIMARY KEY(id)
)Engine=InnoDB;


INSERT INTO proveedores VALUES(null,"Black & Decker SRL","Carlos Pinto 8900","Berazategui",4378,46376737,27936190621);
INSERT INTO proveedores VALUES(null,"Herramientas Lugo SA","Av. La Plata 120","CABA",3456,46376737,27694888823);
INSERT INTO proveedores VALUES(null,"Equipamientos Liniers","Av. Rivadavia 7000","CABA",2333,14415535,27620535570);

INSERT INTO proveedores VALUES(null,"Grupo Biwan","Olleros 1775","CABA",1236,32443324,30547830640,30503163221);
INSERT INTO proveedores VALUES(null,"Herramientas Once SRL","Pueyrredon 350","CABA",1116,11116737,20260085000);
INSERT INTO proveedores VALUES(null,"Luisito y CIA.","Montevideo 666","CABA",9990,14888535,27213460922);


INSERT INTO proveedores VALUES(null,"LLaves y Herrajes SRL","Zabala 1925","CABA",3655,43745086,30461515947);
INSERT INTO proveedores VALUES(null,"Herramientas Recoleta","Av Estado de Israel 4230","CABA",4450,13333737,30263102769);
INSERT INTO proveedores VALUES(null,"Lussay SRL","Av Pueyrredon 146","Avellaneda",9999,14882387,24783954679);
INSERT INTO proveedores VALUES(null,"Miraflor Herramientas","Jorge Luis Borges 2076","Lanus",0023,48990514,24619323447);


ALTER TABLE proveedores ADD cuit varchar(100)not null;