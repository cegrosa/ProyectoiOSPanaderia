CREATE DATABASE bakery;
use bakery;

CREATE TABLE `member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(40) NOT NULL,
  `password` varchar(250) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE(login)
);

CREATE TABLE `client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `surname` varchar(60) NOT NULL,
  `tin` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `postalcode` varchar(5) NOT NULL,
  `province` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE(name, surname, tin)
);

CREATE TABLE `ticket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `idmember` bigint(20) NULL,
  `idclient` bigint(20) NOT NULL,
  `Tprice` decimal(10,2) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (idmember, idclient),
   FOREIGN KEY (idmember) REFERENCES member(id),
   FOREIGN KEY (idclient) REFERENCES client(id)
);

CREATE TABLE `family` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `family` varchar(100) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE(family)
);

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idfamily` bigint(20) NOT NULL,
  `product` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
   PRIMARY KEY (id),
   UNIQUE(idfamily, product),
   FOREIGN KEY (idfamily) REFERENCES family(id)
);

CREATE TABLE `ticketdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idticket` bigint(20) NOT NULL,
  `idproduct` bigint(20) NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `price` decimal(10,2) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE(idticket, idproduct),
   FOREIGN KEY (idticket) REFERENCES ticket(id),
   FOREIGN KEY (idproduct) REFERENCES product(id)
);

INSERT INTO `family`(`family`) VALUES ('Pan');
INSERT INTO `family`(`family`) VALUES ('Bolleria');
INSERT INTO `family`(`family`) VALUES ('Croissant');
INSERT INTO `family`(`family`) VALUES ('Navidad');

INSERT INTO `product` (`idfamily`, `product`, `price`, `description`) VALUES
(1, 'Baguette', '1.00', 'Se caracteriza por emplear harina de trigo, por ser mucho mas largo que ancho y por su corteza crujiente. Es ideal para la elaboracion de bocadillos.'),
(1, 'Bollo', '0.70', 'Se hacen con diversos tipos de masas de harina y pueden tener relleno o no. Algunos se asemejan a panecillos dulces, similares a los panecillos alemanes.'),
(1, 'Chapata', '1.20', 'Contiene levadura, sal, agua y aceite de oliva originalmente, a veces reemplazado por aceites vegetales.'),
(2, 'Palmera', '1.00', 'Es una pieza de bollería, de masa de hojaldre de unos dos a cuatro centímetros de grosor y con una peculiar forma acorazonada con los vertices deformados.'),
(2, 'Napolitana', '0.90', 'Se trata de un relleno de crema envuelto en una masa de hojaldre, lo que le da su forma rectangular y aplastada.'),
(2, 'Rosquilla', '0.70', 'Dulce frito u horneado hecho con distintos tipos de masa, desde una masa más o menos esponjosa hasta masa hojaldradas. Tiene forma toroide, es decir, forma de rosca, de ahí su nombre.'),
(3, 'Croissant con mermelada', '1.00', 'Pieza de bolleria hojaldrada de origen austriaco, hecha con masa de hojaldre, levadura, mantequilla o grasa vacuna relleno de mermelada.'),
(3, 'Croissant con chocolate', '1.00', 'Pieza de bollería hojaldrada de origen austriaco, hecha con masa de hojaldre, levadura, mantequilla o grasa vacuna relleno de chocolate.'),
(3, 'Croissant con nata', '1.00', 'Pieza de bolleria hojaldrada de origen austriaco, hecha con masa de hojaldre, levadura, mantequilla o grasa vacuna relleno de nata.'),
(4, 'Roscon de reyes', '3.00', 'Bollo elaborado con una masa dulce con forma de toroide adornado con rodajas de fruta cristalizada (escarchada) o confitada de colores variados.'),
(4, 'Mantecados', '2.00', 'Amasado con manteca de cerdo'),
(4, 'Roscos de vino', '2.00', 'Se denominan asi por participar en la masa una cierta cantidad de vino.');
