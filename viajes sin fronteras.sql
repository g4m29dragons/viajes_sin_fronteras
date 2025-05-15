/*--------------------------------------------------- Data Description Language DDL ------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/

-- Dseigna la base de datos
use viajes_sin_fronteras;

-- Tabla creacion de cliente
create table cliente (
id_cliente int primary key,
nombre varchar(50) not null,
apellido varchar(50) not null,
telefono int,
email varchar(60) not null,
direccion varchar(60),
ciudad varchar(50) not null,
pais varchar(50) not null
) Engine = InnoDB;


-- Tabla creacion de la reserva
create table reserva (
id_reserva int primary key,
id_cliente int,
id_viaje int,
fecha_reserva date not null,
estado_reserva varchar(50),
Valor_reserva varchar(45) not null
) Engine = InnoDB;


-- Tabla detalle de la reserva
create table detalle_reserva (
id_detalle_reserva int primary key,
id_reserva int,
id_habitacion int,
cantidad int,
precio_venta decimal(10,2) not null
) Engine = InnoDB;


-- Tabla pago de reserva
create table pago (
id_pago int primary key,
id_reserva int,
fecha_pago date,
metodo_pago varchar(50),
monto decimal(10,2)
) Engine = InnoDB;


-- Tabla reserva de servicio
create table reserva_servicio (
id_reserva_servicio int primary key,
id_reserva int,
id_servicio int,
cantidad int not null,
precio_venta decimal(10,2)
) Engine = InnoDB;


-- Tabla servicio
create table servicio (
id_servicio int primary key,
nombre varchar(50) not null,
descripcion text(100)
) Engine = InnoDB;


-- Tabla destino
create table destino (
id_destino int primary key,
nombre varchar(50) not null,
descripcion text(100),
pais varchar(50) not null,
ciudad varchar(50) not null,
clima varchar(50),
atracciones text(100)
) Engine = InnoDB;


-- Tabla viaje
create table viaje (
id_viaje int primary key,
id_destino int,
fecha_salida date not null,
fecha_regreso  date not null,
precio decimal(10,2) not null,
descripcion text(100)
)  Engine = InnoDB;


-- Tabla habitacion
create table habitacion (
id_habitacion int primary key,
id_hotel int,
tipo_habitacion varchar(50) not null,
capacidad int not null,
precio decimal(10,2) not null,
descripcion text(100)
)  Engine = InnoDB;


-- Tabla  hotel
create table hotel (
id_hotel int primary key,
nombre varchar(50) not null,
estrellas int not null,
direccion varchar(60) not null,
ciudad varchar(50) not null,
pais varchar(50),
descripcion text(100)
)  Engine = InnoDB;


                                   /*------------------- Creacion de llaves foraneas --------------------*/

-- Tabla reserva
ALTER TABLE reserva
ADD CONSTRAINT fk_reserva_cliente
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT fk_reserva_viaje
FOREIGN KEY (id_viaje) REFERENCES viaje(id_viaje)
ON DELETE CASCADE ON UPDATE CASCADE;


-- Tabla detalle_reserva
ALTER TABLE detalle_reserva
ADD CONSTRAINT fk_detalle_reserva_reserva
FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva)
ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT fk_detalle_reserva_habitacion
FOREIGN KEY (id_habitacion) REFERENCES habitacion(id_habitacion)
ON DELETE CASCADE ON UPDATE CASCADE;


-- Tabla pago
ALTER TABLE pago
ADD CONSTRAINT fk_pago_reserva
FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva)
ON DELETE CASCADE ON UPDATE CASCADE;


-- Tabla reserva_servicio
ALTER TABLE reserva_servicio
ADD CONSTRAINT fk_reserva_servicio_reserva
FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva)
ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT fk_reserva_servicio_servicio
FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio)
ON DELETE CASCADE ON UPDATE CASCADE;


-- Tabla viaje
ALTER TABLE viaje
ADD CONSTRAINT fk_viaje_destino
FOREIGN KEY (id_destino) REFERENCES destino(id_destino)
ON DELETE CASCADE ON UPDATE CASCADE;


-- Tabla habitacion
ALTER TABLE habitacion
ADD CONSTRAINT fk_habitacion_hotel
FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel)
ON DELETE CASCADE ON UPDATE CASCADE;


/*---------------------------------------------------- Data Manipulation Language DML ----------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/


                                          /*------------ datos de los clientes -----------*/
-- 1 cliente adriana parra
TRUNCATE TABLE cliente;
INSERT INTO cliente(id_cliente, nombre, apellido, telefono, email, direccion, ciudad, pais)
VALUES ('1084','adriana del pilar','parra altahona','4214551','adparraal@unadvirtual.edu.co','ciudad equidad','santa marta', 'colombia');

-- 2 cliente stefania roa
TRUNCATE TABLE cliente;
INSERT INTO cliente(id_cliente, nombre, apellido, telefono, email, direccion, ciudad, pais)
VALUES ('1085','stefania','salcedo roa','4342134','stesalcedo@unadvirtual.edu.co','Barrio La Paz','santa marta', 'colombia');

-- 3 cliente joiner javier
TRUNCATE TABLE cliente;
INSERT INTO cliente(id_cliente, nombre, apellido, telefono, email, direccion, ciudad, pais)
VALUES ('1086','joiner javier','jimenez ariza','4541212','joinerjavierjiemenezariza@gmail.com','los almendros','santa marta', 'colombia');

-- 4 cliente andres felipe
TRUNCATE TABLE cliente;
INSERT INTO cliente(id_cliente, nombre, apellido, telefono, email, direccion, ciudad, pais)
VALUES ('1087','andres felipe','gutierrez gomez','4706078','andygutierrez0117@gmail.com','los almendros','santa marta', 'colombia');

-- 5 cliente jesus chacon
TRUNCATE TABLE cliente;
INSERT INTO cliente(id_cliente, nombre, apellido, telefono, email, direccion, ciudad, pais)
VALUES ('1088','jesus augusto','chacon corredor','4457612','jeauchco1@gmail.com','la concepcion','santa marta', 'colombia');



                                        /*------------ destino de los clientes -----------*/

-- 1 cliente adriana parra
TRUNCATE TABLE destino;
INSERT INTO destino(id_destino, nombre, descripcion, pais, ciudad, clima, atracciones)
VALUES ('1','palla baja','playas rodedas de montañas','venezuela', 'maracaibo', 'calido','bañarse en la playa');

-- 2 cliente stefania roa
TRUNCATE TABLE destino;
INSERT INTO destino(id_destino, nombre, descripcion, pais, ciudad, clima, atracciones)
VALUES ('2','palla perdida','playas rodedas de tiburones','el congo', 'perdicion', 'caliente muy caliente','ver tiburones');

-- 3 cliente joiner javier
TRUNCATE TABLE destino;
INSERT INTO destino(id_destino, nombre, descripcion, pais, ciudad, clima, atracciones)
VALUES ('3','caminos llanos','paseo por zonas rocosas','colombia', 'santander', 'templado','disfrutar de la naturaleza');

-- 4 cliente andres felipe
TRUNCATE TABLE destino;
INSERT INTO destino(id_destino, nombre, descripcion, pais, ciudad, clima, atracciones)
VALUES ('4','playa media','parque tayrona','colombia', 'santa marta', 'templado','disfrutar de la naturaleza y las bellas playas');

-- 5 cliente jesus chacon
TRUNCATE TABLE destino;
INSERT INTO destino(id_destino, nombre, descripcion, pais, ciudad, clima, atracciones)
VALUES ('5','playa alta','conteño beach','colombia', 'guajira', 'templado','hermosa playa cerca al rio');



									     /*------------ viajes de los clientes -----------*/

-- 1 cliente adriana parra
TRUNCATE TABLE viaje;
INSERT INTO viaje(id_viaje, id_destino, fecha_salida, fecha_regreso, precio, descripcion)
VALUES ('1001','1','2025-07-01','2025-07-03','400000.00', 'viaje en carro de mula');

-- 2 cliente stefania roa
TRUNCATE TABLE viaje;
INSERT INTO viaje(id_viaje, id_destino, fecha_salida, fecha_regreso, precio, descripcion)
VALUES ('1002','2','2025-05-22','2025-05-23','100000.00', 'se desplzara a pie');

-- 3 cliente joiner javier
TRUNCATE TABLE viaje;
INSERT INTO viaje(id_viaje, id_destino, fecha_salida, fecha_regreso, precio, descripcion)
VALUES ('1003','3','2025-12-08','2025-12-22','3000000.00', 'viaje en avion');

-- 4 cliente andres felipe
TRUNCATE TABLE viaje;
INSERT INTO viaje(id_viaje, id_destino, fecha_salida, fecha_regreso, precio, descripcion)
VALUES ('1004','4','2025-08-22','2026-01-01','6000000.00', 'viaje en avion');

-- 5 cliente jesus chacon
TRUNCATE TABLE viaje;
INSERT INTO viaje(id_viaje, id_destino, fecha_salida, fecha_regreso, precio, descripcion)
VALUES ('1005','5','2025-09-15','2025-01-15','9000000.00', 'viaje en avion en primera fila');



									  /*------------ hotel de los clientes -----------*/

-- 1 cliente adriana parra
TRUNCATE TABLE hotel;
INSERT INTO hotel(id_hotel, nombre, estrellas, direccion, ciudad, pais, descripcion)
VALUES ('11','la posada','1','maracaibo', 'calle 21 carrea 1', 'venezuela','hotel economico');

-- 2 cliente stefania roa
TRUNCATE TABLE hotel;
INSERT INTO hotel(id_hotel, nombre, estrellas, direccion, ciudad, pais, descripcion)
VALUES ('12','el hueco','1','calle del cartucho', 'perdicion', 'el congo','hotel economico');

-- 3 cliente joiner javier
TRUNCATE TABLE hotel;
INSERT INTO hotel(id_hotel, nombre, estrellas, direccion, ciudad, pais, descripcion)
VALUES ('13','campestre barichara','3','40 km de parque nacional', 'santander', 'colombia','hotel todo incluido');

-- 4 cliente andres felipe
TRUNCATE TABLE hotel;
INSERT INTO hotel(id_hotel, nombre, estrellas, direccion, ciudad, pais, descripcion)
VALUES ('14','mercuri','4','carrera 1 con calle 22', 'santa marta', 'colombia','hotel de lujo');

-- 5 cliente jesus chacon
TRUNCATE TABLE hotel;
INSERT INTO hotel(id_hotel, nombre, estrellas, direccion, ciudad, pais, descripcion)
VALUES ('15','zuana resort','5','Carrera 2 # 6-80', 'santa marta', 'colombia','hotel super deluxe');



									  /*------------ habitaciones de los clientes -----------*/

-- 1 cliente adriana parra
TRUNCATE TABLE habitacion;
INSERT INTO habitacion(id_habitacion, id_hotel, tipo_habitacion, capacidad, precio, descripcion)
VALUES ('301','11','angosta','1', '35000.00', 'habitacion compartida');

-- 2 cliente stefania roa
TRUNCATE TABLE habitacion;
INSERT INTO habitacion(id_habitacion, id_hotel, tipo_habitacion, capacidad, precio, descripcion)
VALUES ('302','12','hamaca','1', '20000.00', 'duerme en la interperie');

-- 3 cliente joiner javier
TRUNCATE TABLE habitacion;
INSERT INTO habitacion(id_habitacion, id_hotel, tipo_habitacion, capacidad, precio, descripcion)
VALUES ('303','13','cama de 1 cuerpo','2', '150000.00', 'cuarto como para descansar');

-- 4 cliente andres felipe
TRUNCATE TABLE habitacion;
INSERT INTO habitacion(id_habitacion, id_hotel, tipo_habitacion, capacidad, precio, descripcion)
VALUES ('304','14','lujosa','3', '300000.00', 'cuarto full equipado con servicios');

-- 5 cliente jesus chacon
TRUNCATE TABLE habitacion;
INSERT INTO habitacion(id_habitacion, id_hotel, tipo_habitacion, capacidad, precio, descripcion)
VALUES ('305','15','deluxe suit','6', '580000.00', 'habitacion suit con todos lo servicoos incluidos y atencion de xpress');



									  /*------------ servicios de los clientes -----------*/

-- 1 cliente adriana parra
TRUNCATE TABLE servicio;
INSERT INTO servicio(id_servicio, nombre, descripcion)
VALUES ('21','sin mensero','no pidio atencion en la mesa');

-- 2 cliente stefania roa
TRUNCATE TABLE servicio;
INSERT INTO servicio(id_servicio, nombre, descripcion)
VALUES ('22','sin mesero','no pidio atencion en la mesa');

-- 3 cliente joiner javier
TRUNCATE TABLE servicio;
INSERT INTO servicio(id_servicio, nombre, descripcion)
VALUES ('23','atencion media','1 mesero a disposicion');

-- 4 cliente andres felipe
TRUNCATE TABLE servicio;
INSERT INTO servicio(id_servicio, nombre, descripcion)
VALUES ('24','atencion de lujo','2 meseros a disposicion');

-- 5 cliente jesus chacon
TRUNCATE TABLE servicio;
INSERT INTO servicio(id_servicio, nombre, descripcion)
VALUES ('25','buffete deluxe','atencion total');



      									/*------------ reserva de los clientes -----------*/

-- 1 cliente adriana parra
TRUNCATE TABLE reserva;
INSERT INTO reserva(id_reserva, id_cliente, id_viaje, fecha_reserva, estado_reserva, Valor_reserva)
VALUES ('81','1084','1001', '2025-07-01', 'activo', '10000.00');

-- 2 cliente stefania roa
TRUNCATE TABLE reserva;
INSERT INTO reserva(id_reserva, id_cliente, id_viaje, fecha_reserva, estado_reserva, Valor_reserva)
VALUES ('82','1085','1002', '2025-05-22', 'activo', '0.00');

-- 3 cliente joiner javier
TRUNCATE TABLE reserva;
INSERT INTO reserva(id_reserva, id_cliente, id_viaje, fecha_reserva, estado_reserva, Valor_reserva)
VALUES ('83','1086','1003', '2025-12-08', 'activo', '50000.00');

-- 4 cliente andres felipe
TRUNCATE TABLE reserva;
INSERT INTO reserva(id_reserva, id_cliente, id_viaje, fecha_reserva, estado_reserva, Valor_reserva)
VALUES ('84','1087','1004', '2025-08-22', 'activo', '100000.00');

-- 5 cliente jesus chacon
TRUNCATE TABLE reserva;
INSERT INTO reserva(id_reserva, id_cliente, id_viaje, fecha_reserva, estado_reserva, Valor_reserva)
VALUES ('85','1088','1005', '2025-09-15', 'activo', '200000.00');



									/*------------ reserva de servicios de los clientes -----------*/

-- 1 cliente adriana parra
TRUNCATE TABLE reserva_servicio;
INSERT INTO reserva_servicio(id_reserva_servicio, id_reserva, id_servicio, cantidad, precio_venta)
VALUES ('101','81','21','1','30000.00');

-- 2 cliente stefania roa
TRUNCATE TABLE _reserva_servicio;
INSERT INTO reserva_servicio(id_reserva_servicio, id_reserva, id_servicio, cantidad, precio_venta)
VALUES ('102','82','22','1','15000.00');

-- 3 cliente joiner javier
TRUNCATE TABLE _reserva_servicio;
INSERT INTO reserva_servicio(id_reserva_servicio, id_reserva, id_servicio, cantidad, precio_venta)
VALUES ('103','83','23','2','70000.00');

-- 4 cliente andres felipe
TRUNCATE TABLE _reserva_servicio;
INSERT INTO reserva_servicio(id_reserva_servicio, id_reserva, id_servicio, cantidad, precio_venta)
VALUES ('104','84','24','3','120000.00');

-- 5 cliente jesus chacon
TRUNCATE TABLE _reserva_servicio;
INSERT INTO reserva_servicio(id_reserva_servicio, id_reserva, id_servicio, cantidad, precio_venta)
VALUES ('105', '85', '25', '5', '250000.00');



								/*------------ detalles de las reservas de los clientes -----------*/

-- 1 cliente adriana parra
TRUNCATE TABLE detalle_reserva;
INSERT INTO detalle_reserva(id_detalle_reserva, id_reserva, id_habitacion, cantidad, precio_venta)
VALUES ('401','81','301','1','30000.00');

-- 2 cliente stefania roa
TRUNCATE TABLE detalle_reserva;
INSERT INTO detalle_reserva(id_detalle_reserva, id_reserva, id_habitacion, cantidad, precio_venta)
VALUES ('402','82','302','1','15000.00');

-- 3 cliente joiner javier
TRUNCATE TABLE detalle_reserva;
INSERT INTO detalle_reserva(id_detalle_reserva, id_reserva, id_habitacion, cantidad, precio_venta)
VALUES ('403','83','303','2','70000.00');

-- 4 cliente andres felipe
TRUNCATE TABLE detalle_reserva;
INSERT INTO detalle_reserva(id_detalle_reserva, id_reserva, id_habitacion, cantidad, precio_venta)
VALUES ('404', '84', '304', '3','120000.00');

-- 5 cliente jesus chacon
TRUNCATE TABLE detalle_reserva;
INSERT INTO detalle_reserva(id_detalle_reserva, id_reserva, id_habitacion, cantidad, precio_venta)
VALUES ('405', '85', '305', '5', '250000.00');



				     				/*------------ pagos en reservas de los clientes -----------*/

-- 1 cliente adriana parra
TRUNCATE TABLE pago;
INSERT INTO pago(id_pago, id_reserva, fecha_pago, metodo_pago, monto)
VALUES ('001','81','2025-07-01','transferencia','30000.00');

-- 2 cliente stefania roa
TRUNCATE TABLE pago;
INSERT INTO pago(id_pago, id_reserva, fecha_pago, metodo_pago, monto)
VALUES ('002','82','2025-05-22','por efecty','15000.00');

-- 3 cliente joiner javier
TRUNCATE TABLE pago;
INSERT INTO pago(id_pago, id_reserva, fecha_pago, metodo_pago, monto)
VALUES ('003','83','2025-12-08','transferencia','70000.00');

-- 4 cliente andres felipe
TRUNCATE TABLE pago;
INSERT INTO pago(id_pago, id_reserva, fecha_pago, metodo_pago, monto)
VALUES ('004','84','2025-08-22','tarjeta credito','120000.00');

-- 5 cliente jesus chacon
TRUNCATE TABLE pago;
INSERT INTO pago(id_pago, id_reserva, fecha_pago, metodo_pago, monto)
VALUES ('005','85','2025-09-15','tarjeta debito','250000.00');



/*------------------------------------------------------ CONSULTAS EN LA BASE DE DATOS ---------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/

SELECT * FROM cliente;
SELECT * FROM destino;
SELECT * FROM viaje;
SELECT * FROM reserva;
SELECT * FROM detalle_reserva;
SELECT * FROM habitacion;
SELECT * FROM hotel;
SELECT * FROM servicio;
SELECT * FROM reserva_servicio;
SELECT * FROM pago;


-- a) Clientes de una ciudad específica (Santa Marta)
SELECT 
    c.nombre, 
    c.apellido, 
    r.fecha_reserva
FROM 
    cliente c
JOIN 
    reserva r ON c.id_cliente = r.id_cliente
WHERE 
    c.ciudad = 'Santa Marta';


-- b) Viajes a destinos con cierto clima (Cálido)
SELECT 
    d.nombre  AS destino, 
    d.ciudad, 
    d.pais,
    d.descripcion,
    v.fecha_salida, 
    v.fecha_regreso
FROM 
    viaje v
JOIN 
    destino d ON v.id_destino = d.id_destino
WHERE 
    d.clima = 'Cálido';
    

-- c) Hoteles con cierta cantidad de estrellas (estrellas)
SELECT 
    h.nombre, 
    h.direccion, 
    h.pais, 
    hab.precio, 
    hab.capacidad
FROM 
    hotel h
JOIN 
    habitacion hab ON h.id_hotel = hab.id_hotel
WHERE 
    h.estrellas = 1;


-- d) Clientes y sus destinos para un método de pago (cualquier metodo de pago)
SELECT DISTINCT metodo_pago FROM pago;
SELECT 
    c.nombre AS cliente, 
    d.nombre AS destino, 
    p.metodo_pago
FROM 
    cliente c
JOIN 
    reserva r ON c.id_cliente = r.id_cliente
JOIN 
    pago p ON r.id_reserva = p.id_reserva
JOIN 
    viaje v ON r.id_viaje = v.id_viaje
JOIN 
    destino d ON v.id_destino = d.id_destino;


-- e) Cantidad de clientes que tienen reserva para un destino específico (palla baja)
SELECT 
    d.nombre AS destino, 
    COUNT(DISTINCT r.id_cliente) AS cantidad_clientes
FROM 
    reserva r
JOIN 
    viaje v ON r.id_viaje = v.id_viaje
JOIN 
    destino d ON v.id_destino = d.id_destino
WHERE 
    d.nombre = 'palla baja'
GROUP BY 
    d.nombre;


-- f) Destino más económico (precio mínimo) para un país específico (Venezuela)
SELECT 
    d.nombre, 
    d.ciudad
FROM 
    destino d
JOIN 
    viaje v ON d.id_destino = v.id_destino
WHERE 
    d.pais = 'venezuela'
ORDER BY 
    v.precio ASC
LIMIT 1;



/*--------------------------------------------------------- CREACION DE VISTAS -----------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/

-- a) Vista: destinos del país Venezuela
CREATE VIEW vista_destinos_venezuela AS
SELECT *
FROM destino
WHERE pais = 'Venezuela';

-- b) Vista: hoteles del país Venezuela
CREATE VIEW vista_hoteles_venezuela AS
SELECT *
FROM hotel
WHERE pais = 'Venezuela';

-- c) Vista: clientes que viajan a un destino de la ciudad santa marta
CREATE VIEW vista_clientes_destino_santa_marta AS
SELECT c.nombre, c.apellido, d.nombre AS destino, d.ciudad
FROM cliente c
JOIN reserva r ON c.id_cliente = r.id_cliente
JOIN viaje v ON r.id_viaje = v.id_viaje
JOIN destino d ON v.id_destino = d.id_destino
WHERE d.ciudad = 'santa marta';

-- d) Vista: hoteles y habitaciones para la ciudad santander
CREATE VIEW vista_hoteles_habitaciones_santander AS
SELECT 
    h.nombre AS hotel, 
    h.direccion, 
    ha.id_habitacion, 
    ha.tipo_habitacion,
    ha.precio, 
    ha.capacidad
FROM 
    hotel h
JOIN 
    habitacion ha ON h.id_hotel = ha.id_hotel
WHERE 
    h.ciudad = 'santander';


-- e) Vista: clientes y hoteles para destinos del país colombia
CREATE VIEW vista_clientes_y_hoteles_colombia AS
SELECT 
    c.nombre, 
    c.apellido, 
    h.nombre AS hotel, 
    d.nombre AS destino, 
    d.pais
FROM 
    cliente c
JOIN 
    reserva r ON c.id_cliente = r.id_cliente
JOIN 
    viaje v ON r.id_viaje = v.id_viaje
JOIN 
    destino d ON v.id_destino = d.id_destino
JOIN 
    hotel h ON d.ciudad = h.ciudad
WHERE 
    d.pais = 'colombia';




/*-------------------------------------------------------- CREACION DE TRIGGERS ----------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/

							/*------------ TABLA PARA VISUALIZAR LOS EFECTOS DE LOS TRIGGERS -----------*/

CREATE TABLE log_eventos (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(50),
    tabla_afectada VARCHAR(50),
    fecha_evento DATETIME DEFAULT CURRENT_TIMESTAMP
);



					                		/*------------ CREACION DE LOS TRIGGERS -----------*/

-- a) Trigger para inserción de clientes
CREATE TRIGGER trg_insert_cliente
AFTER INSERT ON cliente
FOR EACH ROW
INSERT INTO log_eventos (accion, tabla_afectada)
VALUES ('Inserción', 'cliente');


-- b) Trigger para modificación de viajes
CREATE TRIGGER trg_update_viaje
AFTER UPDATE ON viaje
FOR EACH ROW
INSERT INTO log_eventos (accion, tabla_afectada)
VALUES ('Modificación', 'viaje');


-- c) Trigger para eliminación de detalle_reserva
CREATE TRIGGER trg_delete_detalle_reserva
AFTER DELETE ON detalle_reserva
FOR EACH ROW
INSERT INTO log_eventos (accion, tabla_afectada)
VALUES ('Eliminación', 'detalle_reserva');


-- d) Trigger para inserción de reservas
CREATE TRIGGER trg_insert_reserva
AFTER INSERT ON reserva
FOR EACH ROW
INSERT INTO log_eventos (accion, tabla_afectada)
VALUES ('Inserción', 'reserva');


-- e) Trigger para eliminación de habitaciones
CREATE TRIGGER trg_delete_habitacion
AFTER DELETE ON habitacion
FOR EACH ROW
INSERT INTO log_eventos (accion, tabla_afectada)
VALUES ('Eliminación', 'habitacion');


-- f) Trigger para inserción de servicios
CREATE TRIGGER trg_insert_servicio
AFTER INSERT ON servicio
FOR EACH ROW
INSERT INTO log_eventos (accion, tabla_afectada)
VALUES ('Inserción', 'servicio');


-- g) Trigger para modificación de destinos
CREATE TRIGGER trg_update_destino
AFTER UPDATE ON destino
FOR EACH ROW
INSERT INTO log_eventos (accion, tabla_afectada)
VALUES ('Modificación', 'destino');


-- h) Trigger para eliminación de hoteles
CREATE TRIGGER trg_delete_hotel
AFTER DELETE ON hotel
FOR EACH ROW
INSERT INTO log_eventos (accion, tabla_afectada)
VALUES ('Eliminación', 'hotel');



/*----------------------------------------------------- CREACION DE PROCEDIMIENTOS -------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/

-- a) LISTAR CLIENTES POR PAIS
DELIMITER $$

CREATE PROCEDURE listar_clientes_por_pais(IN pais_cliente VARCHAR(50))
BEGIN
    SELECT * FROM cliente
    WHERE pais = pais_cliente;
END $$

DELIMITER ;


-- b) AGREGAR UN HOTEL
DELIMITER $$

CREATE PROCEDURE agregar_hotel(
    IN nombre_hotel VARCHAR(100),
    IN direccion_hotel VARCHAR(150),
    IN ciudad_hotel VARCHAR(50),
    IN pais_hotel VARCHAR(50),
    IN estrellas INT,
    IN id_destino_hotel INT
)
BEGIN
    INSERT INTO hotel(nombre, direccion, ciudad, pais, estrellas, id_destino)
    VALUES (nombre_hotel, direccion_hotel, ciudad_hotel, pais_hotel, estrellas, id_destino_hotel);
END $$

DELIMITER;


-- c) ACTUALIZAR FECHA DE SALIDA Y REGRESO DE UN VIAJE
DELIMITER $$

CREATE PROCEDURE actualizar_fechas_viaje(
    IN id_viaje_sel INT,
    IN nueva_salida DATE,
    IN nueva_regreso DATE
)
BEGIN
    UPDATE viaje
    SET fecha_salida = nueva_salida,
        fecha_regreso = nueva_regreso
    WHERE id_viaje = id_viaje_sel;
END $$

DELIMITER;


-- d) ELIMINAR UNA HABITACION DE UN HOTEL SELECCIONADO
DELIMITER $$

CREATE PROCEDURE eliminar_habitaciones_hotel(IN id_hotel_sel INT)
BEGIN
    DELETE FROM habitacion
    WHERE id_hotel = id_hotel_sel;
END $$

DELIMITER;


-- e) PROMEDIO DEL VALOR DE UN VIAJE AL DESTINO DE UN PAIS
DELIMITER $$

CREATE PROCEDURE promedio_valor_viajes_por_pais(IN pais_destino VARCHAR(50))
BEGIN
    SELECT AVG(v.precio) AS promedio_valor
    FROM viaje v
    JOIN destino d ON v.id_destino = d.id_destino
    WHERE d.pais = pais_destino;
END $$

DELIMITER;


-- f) HOTELES CON HABITACIONES DE CIERTA CAPACIDAD (CON MENSAJE DE SI HAY O NO CUPO)
DELIMITER $$

CREATE PROCEDURE hoteles_por_capacidad(IN capacidad_busqueda INT)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM hotel h
        JOIN habitacion ha ON h.id_hotel = ha.id_hotel
        WHERE ha.capacidad = capacidad_busqueda
    ) THEN
        SELECT DISTINCT h.nombre, h.direccion, h.ciudad, h.pais
        FROM hotel h
        JOIN habitacion ha ON h.id_hotel = ha.id_hotel
        WHERE ha.capacidad = capacidad_busqueda;
    ELSE
        SELECT 'No existen hoteles con habitaciones de esa capacidad.' AS mensaje;
    END IF;
END $$

DELIMITER ;



/*-------------------------------------- CREACION DE TRANSACCIONES CON COMMIT, ROLLBACK, SAVEPOINT. --------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/

					                		/*------------ TRANSACCIONES CON INSERT -----------*/

-- 1. Inserta un cliente y confirma:
START TRANSACTION;

INSERT INTO cliente(nombre, apellido, ciudad, pais)
VALUES ('Carlos', 'Ramírez', 'Medellín', 'Colombia');

COMMIT;


-- 2. Inserta un hotel pero revierte si hay error
START TRANSACTION;

INSERT INTO hotel(nombre, direccion, ciudad, pais, estrellas, id_destino)
VALUES ('Hotel Luna', 'Calle 123', 'Bogotá', 'Colombia', 4, 1);

-- Algo salió mal o queremos cancelar
ROLLBACK;



					                		/*------------ TRANSACCIONES CON UPDATE -----------*/

-- 1. Actualiza fechas de un viaje y confirma
START TRANSACTION;

UPDATE viaje
SET fecha_salida = '2025-06-01', fecha_regreso = '2025-06-15'
WHERE id_viaje = 1;

COMMIT;


-- 2. Actualiza estrella del hotel, usa SAVEPOINT y revierte parcial
START TRANSACTION;

UPDATE hotel
SET estrellas = 3
WHERE id_hotel = 1;

SAVEPOINT antes_de_cambiar_direccion;

UPDATE hotel
SET direccion = 'Carrera 45 #67-89'
WHERE id_hotel = 1;

-- Nos arrepentimos de cambiar la dirección
ROLLBACK TO antes_de_cambiar_direccion;

COMMIT;



					                		/*------------ TRANSACCIONES CON DELETE -----------*/

-- 1. Elimina una habitación y confirma
START TRANSACTION;

DELETE FROM habitacion
WHERE id_habitacion = 10;

COMMIT;


-- 2. Elimina cliente y reserva, pero revierte parcial
START TRANSACTION;

DELETE FROM reserva
WHERE id_reserva = 5;

SAVEPOINT despues_de_borrar_reserva;

DELETE FROM cliente
WHERE id_cliente = 3;

-- Ups, no queríamos borrar el cliente
ROLLBACK TO despues_de_borrar_reserva;

COMMIT;



/*------------------------------------------------------ EJECUCION DE LAS VISTAS. --------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/

-- Ver los destinos del país Venezuela
SELECT * FROM vista_destinos_venezuela;

-- Ver los hoteles del país Venezuela
SELECT * FROM vista_hoteles_venezuela;

-- Ver clientes que viajan a un destino en la ciudad Santa Marta
SELECT * FROM vista_clientes_destino_santa_marta;

-- Ver hoteles y habitaciones en la ciudad Santander
SELECT * FROM vista_hoteles_habitaciones_santander;

-- Ver clientes y hoteles para destinos del país Colombia
SELECT * FROM vista_clientes_y_hoteles_colombia;





