DROP TABLE IF EXISTS `Buyer`;

CREATE TABLE `Buyer` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `Name` varchar(255) default NULL,
  `PhoneNumber` varchar(100) default NULL,
  `City` varchar(255),
  `PostalCode` varchar(10) default NULL,
  `Country` varchar(100) default NULL,
  `CreditCard` varchar(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `Buyer` (`Name`,`PhoneNumber`,`City`,`PostalCode`,`Country`,`CreditCard`) VALUES ("Judah Gregory","75356079880","Dumfries","ZI7R 2BO","United Kingdom","5380035693993755"),("Marcia Ruiz","62706341362","Meppel","6251 RM","Netherlands","5431146329090103"),("Yvonne Galloway","08847503082","Trinità d'Agultu e Vignola","79250","Italy","5393039190826315"),("Thaddeus Martin","68498819978","Hastings","R18 2CY","United Kingdom","5440699551222157"),("Lenore Welch","15333841392","Challand-Saint-Victor","56736","Italy","5432603871262729"),("Gillian Copeland","73889949533","Zeist","1396 UD","Netherlands","5569004860209091"),("Riley Phelps","37765601692","Amsterdam","7759 QQ","Netherlands","5516258490805173"),("Hayes Holcomb","38476478201","Almere","7549 RO","Netherlands","5584473534230489"),("Gillian Dodson","00154269712","Scunthorpe","H9R 1LP","United Kingdom","5326079104629506"),("Anthony Cortez","32044894318","Leicester","N4K 2YX","United Kingdom","5401938832352681");
INSERT INTO `Buyer` (`Name`,`PhoneNumber`,`City`,`PostalCode`,`Country`,`CreditCard`) VALUES ("Amos Faulkner","01234362391","San Clemente","52592","Italy","5323075284155000"),("Bertha Massey","63711589787","Milford Haven","N6A 8TS","United Kingdom","5253481641637488"),("Elijah Dominguez","06866150394","Bionaz","42591","Italy","5112594128630080"),("Cathleen Garza","87812936909","Acquasanta Terme","11189","Italy","5315291653941033"),("Zephania Hartman","53297237197","Hengelo","6917 GW","Netherlands","5476637852729360"),("Dale Harvey","58374961003","Meeuwen","7833 EI","Netherlands","5229862651734656"),("Bree Hardin","42976782088","Napoli","89825","Italy","5131943845862707"),("Barry Rasmussen","40578244557","Anzi","09771","Italy","5269886620861192"),("Hashim Cotton","21418349847","Brechin","U4H 8NF","United Kingdom","5397362545126793"),("Yoko Pollard","29769706384","Halesowen","PM7S 4LX","United Kingdom","5264600131583293");
