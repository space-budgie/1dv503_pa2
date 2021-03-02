DROP TABLE `AuctionHouseTable`;

CREATE TABLE `AuctionHouseTable` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `Name` varchar(255),
  `PhoneNumber` varchar(100) default NULL,
  `City` varchar(255),
  `PostalCode` varchar(10) default NULL,
  `Country` varchar(100) default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `AuctionHouseTable` (`Name`,`PhoneNumber`,`City`,`PostalCode`,`Country`) VALUES ("Aliquam Auctor Velit Company","54989343438","Dover","D6 9CW","United Kingdom"),("Tempus Scelerisque Lorem LLC","40802325375","Rezzoaglio","86444","Italy"),("Ut Nec Urna Incorporated","01439682272","Knighton","P1 8AN","United Kingdom"),("Vel Mauris Integer Associates","22813771565","Utrecht","8037 XX","Netherlands"),("Feugiat Nec PC","34148112765","Sannazzaro de' Burgondi","38665","Italy"),("Amet Industries","54824973061","Perinaldo","47847","Italy"),("Phasellus LLC","99392234105","Colledimacine","11913","Italy"),("Proin Dolor Company","14895704616","Macerata","70575","Italy"),("Eleifend Company","58107604115","Newcastle-upon-Tyne","I43 0FR","United Kingdom"),("Aliquam Eu Accumsan Institute","65969107592","Heusden","8733 CY","Netherlands");
