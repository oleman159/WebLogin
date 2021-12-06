//IDE: NetBeans IDE 8.2
//Java Platform: JDK 1.8
//Server Type : GlassFish Server 5
//Java files location: WebLogin\src\java\Login
//JSP files location: WebLogin\web
//war file location: WebLogin\dist

//The username and password for login:
Username: Awjj01
Password: Hey1234!

Username: Mabf02
Password: Sup1234@

//Details for the database:
Netbeans MySQL Server at localhost:3306
Database URL: jdbc:mysql://localhost:3306/dxctech?zeroDateTimeBehavior=convertToNull
Driver class: com.mysql.jdbc.Driver

Database name: dxctech

create table `dxctech`.users
(
	username VARCHAR(255) not null primary key,
	password VARCHAR(255) not null,
	name VARCHAR(255) not null,
	role VARCHAR(255) not null,
	salt VARCHAR(255) not null
)


INSERT INTO `dxctech`.`users` (`username`, `password`, `name`, `role`, `salt`) VALUES 
('Awjj01', '1AAC6030027E3597601BF190054AE5B169B29F38F13ACC84F64110D6D7BA6C45C48CD165C6168DD12144E0AAAFA251DC61C94C732ED12EADEB0A2FE3323F3E71', 
'Alex Wong Jia Jun', 'Manager', 'bf96424496f94f9eb2dac337cc8e47d188788fecae25cfd50fddf4531bca8974');

INSERT INTO `dxctech`.`users` (`username`, `password`, `name`, `role`, `salt`) VALUES 
('Mabf02', '7F622375D5BA91864019337BFF2579120E4F66F7894657979672EC956C283A537BD2DF70F4FE137857D375D7783F6D6EEA26723B38952210FDFAA4F653B3EBBA', 
'Muhammad Ali Bin Farid', 'User', 'bf96424496f94f9eb2dac337cc8e47d188788fecae25cfd50fddf4531bca8974');


