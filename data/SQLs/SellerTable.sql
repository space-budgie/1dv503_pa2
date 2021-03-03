DROP TABLE IF EXISTS `Seller`;

CREATE TABLE `Seller` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `Name` varchar(255) default NULL,
  `PhoneNumber` varchar(100) default NULL,
  `City` varchar(255),
  `PostalCode` varchar(10) default NULL,
  `Country` varchar(100) default NULL,
  `BankAccount` varchar(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `Seller` (`Name`,`PhoneNumber`,`City`,`PostalCode`,`Country`,`BankAccount`) VALUES ("Gareth Porter","33087283415","Bonvicino","33423","Italy","5452089674066613"),("Matthew Conner","49698566788","Pomarolo","59680","Italy","5149089407843527"),("Ezekiel Cunningham","43364708915","Harlingen","1311 LS","Netherlands","5549374821457872"),("Karleigh Price","33089163063","Nuneaton","MB1C 0VY","United Kingdom","5194125538622549"),("Aileen Mann","03242227399","Maltignano","22319","Italy","5514702754315694"),("Porter Collier","13263750690","Woerden","7185 YK","Netherlands","5153070509030208"),("Kiona Fowler","71639868446","Solesino","30903","Italy","5281668561562789"),("Whitney Townsend","11379539720","Acquasparta","96512","Italy","5495227157386160"),("Fredericka Nguyen","17518634146","Sorgà","34433","Italy","5119917354796841"),("Vance Guerrero","87891151655","Altamura","52753","Italy","5532437967886243");
INSERT INTO `Seller` (`Name`,`PhoneNumber`,`City`,`PostalCode`,`Country`,`BankAccount`) VALUES ("Quentin Donaldson","41109870250","Nijmegen","9034 QM","Netherlands","5232695081631653"),("Colleen Beasley","44528345632","Durham","OG99 5HW","United Kingdom","5253704180892812"),("Plato Dejesus","35944002858","Ammanford","O67 5MM","United Kingdom","5173130912451882"),("Shannon Crane","88944393075","Horsham","U6H 0QE","United Kingdom","5423153620926522"),("Kiara Barber","83294798634","Tufo","41043","Italy","5387761556721792"),("Linda Bennett","15688682764","Helmond","9027 ZI","Netherlands","5438937611822788"),("Knox Kline","01911767574","Milton Keynes","Z9V 0EZ","United Kingdom","5370108109589277"),("Barclay Carpenter","88383697963","Helmond","6738 JV","Netherlands","5559509741837490"),("Kareem Paul","42245508839","Portofino","71240","Italy","5502544796121183"),("Petra Browning","27046804517","Montese","57379","Italy","5356059943555727");
