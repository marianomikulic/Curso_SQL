create database retail;
create schema if not exists retail_project;

create table retail_project.clientes(
clientes_id SERIAL primary key,
nombre VARCHAR(100) not null,
apellido VARCHAR(100) not null,
dni VARCHAR(100) not null unique,
email VARCHAR(100) not null unique,
edad NUMERIC (10,0) check (edad >= 1) not null,
fecha_registro DATE default current_date
);

create table retail_project.productos(
productos_id SERIAL primary key,
nombre VARCHAR(100) not null,
precio NUMERIC (10,2) check (precio > 0) not null,
stock INT not null check (stock >= 0)
);

create table retail_project.ventas(
ventas_id SERIAL primary key,
clientes_id INT not null,
productos_id INT not null,
cantidad_venta INT not null check (cantidad_venta > 0),
estado BOOLEAN default true,

constraint fk_clientes foreign key (clientes_id) references retail_project.clientes (clientes_id),
constraint fk_productos foreign key (productos_id) references retail_project.productos (productos_id)
);

begin;

insert into retail_project.clientes(nombre,apellido,dni,email,edad) values
('juan','perez','123','juan.perez@gmail.com',20),
('jose','perez','321','jose.perez@gmail.com',30),
('juan','garcia','111','juan.garcia@gmail.com',25),
('javier','lopez','222','javier.lopez@gmail.com',40),
('eduardo','fernandez','333','eduardo.fernandez@gmail.com',34);

insert into retail_project.productos(nombre,precio,stock) values
('libro',10,100),
('lapiz',2,200),
('marcador',4,300),
('regla',3,200),
('hoja',1,1000);

insert into retail_project.ventas(clientes_id,productos_id,cantidad_venta) values
(1,1,2),
(2,2,4),
(3,3,6),
(4,1,5),
(5,3,10);

commit;

begin;

update retail_project.productos
set precio = precio * 1.25
where productos_id = 5;

begin;

delete retail_project.ventas
where ventas = 4;

end;



