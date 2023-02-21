CREATE DATABASE dbPedidosEncargos
GO
Use dbPedidosEncargos
GO

---------------------------------------------------------------------------------------------
---------------------------------------tbUsuarios--------------------------------------------
---------------------------------------------------------------------------------------------

CREATE TABLE tbUsuarios(
	usu_Id					INT IDENTITY(1,1),
	usu_Usuario				NVARCHAR(100) NOT NULL UNIQUE,
	usu_Contrasenia			NVARCHAR(MAX) NOT NULL,
	emp_Id					INT not null,
	usu_UsuarioCreacion		INT not null,
	usu_FechaCreacion		DATETIME not null,
	usu_UsuarioModificacion INT ,
	usu_FechaModificacion	DATETIME,
	usu_Estado				BIT NOT NULL,
	CONSTRAINT PK_dbo_tbUsuarios_usu_Id PRIMARY KEY(usu_Id)
);

---------------------------------------------------------------------------------------------
---------------------------------------tbEstadosCiviles--------------------------------------
---------------------------------------------------------------------------------------------

CREATE TABLE tbEstadosCiviles(
	estciv_Id					CHAR(1) NOT NULL,
	estciv_Nombre				NVARCHAR(200) not null,
	estciv_FechaCreacion		DATETIME not null,
	estciv_UsuarioCreacion		INT not null,
	estciv_FechaModificacion	DATETIME,
	estciv_UsuarioModificacion  INT,
	estciv_Estado				BIT not null, 
	CONSTRAINT PK_dbo_tbEstadosCiviles_estciv_Id PRIMARY KEY(estciv_Id),
	CONSTRAINT FK_dbo_tbEstadosCiviles_dbo_tbUsuarios_estciv_UsuarioCreacion_usu_Id FOREIGN KEY(estciv_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbEstadosCiviles_dbo_tbUsuarios_estciv_UsuarioModificacion_usu_Id FOREIGN KEY(estciv_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);


---------------------------------------------------------------------------------------------
---------------------------------------tbDepartamentos---------------------------------------
---------------------------------------------------------------------------------------------
--Departamentos
CREATE TABLE tbDepartamentos(
	dep_Id					CHAR(2) NOT NULL,
	dep_Nombre				NVARCHAR(200) NOT NULL,
	dep_FechaCreacion		DATETIME not null,
	dep_UsuarioCreacion		INT not null,
	dep_FechaModificacion	DATETIME,
	dep_UsuarioModificacion INT,
	dep_Estado				BIT not null,
	CONSTRAINT PK_dbo_tbDepartamentos_dep_Id PRIMARY KEY(dep_Id),
	CONSTRAINT FK_dbo_tbDepartamentos_dbo_tbUsuarios_dep_UsuarioCreacion_usu_Id FOREIGN KEY(dep_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbDepartamentos_dbo_tbUsuarios_dep_UsuarioModificacion_usu_Id FOREIGN KEY(dep_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);

---------------------------------------------------------------------------------------------
---------------------------------------tbMunicipios------------------------------------------
---------------------------------------------------------------------------------------------

CREATE TABLE tbMunicipios(
	mun_Id					CHAR(4) NOT NULL,
	dep_Id					CHAR(2) NOT NULL,
	mun_Nombre				NVARCHAR(200) NOT NULL,
	mun_FechaCreacion		DATETIME not null,
	mun_UsuarioCreacion		INT not null,
	mun_FechaModificacion	DATETIME,
	mun_UsuarioModificacion INT,
	mun_Estado				BIT not null,
	CONSTRAINT PK_dbo_tbMunicipios_mun_Id PRIMARY KEY(mun_Id),
	CONSTRAINT FK_tbMunicipios_tbDepartamentos_dep_Id FOREIGN KEY(dep_Id) REFERENCES tbDepartamentos(dep_Id),
	CONSTRAINT FK_dbo_tbMunicipios_dbo_tbUsuarios_mun_UsuarioCreacion_usu_Id FOREIGN KEY(mun_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbMunicipios_dbo_tbUsuarios_mun_UsuarioModificacion_usu_Id FOREIGN KEY(mun_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);



--------------------------------------------------------------------
--------------------------------------------------------------------
--Cargos
CREATE TABLE tbCargos(
	car_Id					INT IDENTITY(1,1) NOT NULL,
	car_Nombre				NVARCHAR(90) NOT NULL,
	car_FechaCreacion		DATETIME not null,
	car_UsuarioCreacion		INT not null,
	car_FechaModificacion	DATETIME,
	car_UsuarioModificacion INT,
	car_Estado				BIT not null,
	CONSTRAINT PK_dbo_tbCargos_car_Id PRIMARY KEY(car_Id),
	CONSTRAINT FK_dbo_tbCargos_dbo_tbUsuarios_car_UsuarioCreacion_usu_Id FOREIGN KEY(car_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbCargos_dbo_tbUsuarios_car_UsuarioModificacion_usu_Id FOREIGN KEY(car_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--Empleados
CREATE TABLE tbEmpleados(
emp_Id                              INT IDENTITY (1,1),
emp_Nombre							NVARCHAR(100) NOT NULL,
emp_Apellido						NVARCHAR(100) NOT NULL,
emp_Sexo							CHAR(1) NOT NULL,
mun_Id								CHAR(04) NOT NULL,
emp_DireccionExacta					NVARCHAR(500) NOT NULL,
estciv_Id							CHAR(1) NOT NULL,
emp_Telefono						NVARCHAR(20) NOT NULL,
emp_CorreoElectronico				NVARCHAR(100) NOT NULL,
emp_FechaNacimiento					Date NOT NULL,
emp_FechaContratacion				Date NOT NULL,
car_Id								INT NOT NULL,
emp_FechaCreacion					DATETIME not null,
emp_UsuarioCreacion					INT not null,
emp_FechaModificacion				DATETIME,
emp_UsuarioModificacion				INT,
emp_Estado							BIT not null,

CONSTRAINT PK_dbo_tbEmpleados_emp_Id PRIMARY KEY(emp_Id),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbMunicipios_mun_Id FOREIGN KEY(mun_Id) REFERENCES tbMunicipios(mun_Id),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbEstadosCiviles_estciv_Id FOREIGN KEY(estciv_Id) REFERENCES tbEstadosCiviles(estciv_Id),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbCargos_car_Id FOREIGN KEY(car_Id) REFERENCES tbCargos(car_Id),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbUsuarios_emp_UsuarioCreacion_usu_Id FOREIGN KEY(emp_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbUsuarios_emp_UsuarioModificacion_usu_Id FOREIGN KEY(emp_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);

--Categorias
CREATE TABLE tbCategoria(
cat_Id                              INT IDENTITY(1,1),
cat_Descripcion                     NVARCHAR (150) NOT NULL,
cat_FechaCreacion		            DATETIME not null,
cat_UsuarioCreacion		            INT not null,
cat_FechaModificacion	            DATETIME,
cat_UsuarioModificacion             INT,
cat_Estado				            BIT not null,
CONSTRAINT PK_dbo_tbCategoria_cat_Id PRIMARY KEY(cat_Id),
CONSTRAINT FK_dbo_tbCategoria_dbo_tbUsuarios_cat_UsuarioCreacion_usu_Id FOREIGN KEY(cat_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbCategoria_dbo_tbUsuarios_cat_UsuarioModificacion_usu_Id FOREIGN KEY(cat_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);


CREATE TABLE tbFrabicas(

    fra_id                              INT IDENTITY(1,1),
    fra_Nombre                          NVARCHAR (150) NOT NULL,
    mun_Id                              Char(4) NOT NULL,
    fra_ArticulosProvistos              INT,
    fra_Telefono                        NVARCHAR (20) NOT NULL,
    fra_FechaCreacion		            DATETIME NOT null,
    fra_UsuarioCreacion		            INT NOT null,
    fra_FechaModificacion	            DATETIME,
    fra_UsuarioModificacion             INT,
    fra_Estado                          BIT NOT null,
    CONSTRAINT PK_dbo_tbFrabicas_fra_Id PRIMARY KEY(fra_Id),
    CONSTRAINT FK_dbo_tbFabrica_tbMunicipio_mun_id FOREIGN key(mun_id) REFERENCES tbMunicipios(mun_id)

);



--Articulos
CREATE TABLE tbArticulos(
art_Id			                    INT IDENTITY(1,1),
art_Nombre		                    NVARCHAR (200) NOT NULL,
art_Precio		                    DECIMAL (18,2) NOT NULL,
cat_Id			                    INT not null,
art_Stock		                    INT not null,
art_FechaCreacion					DATETIME not null,
art_UsuarioCreacion					INT not null,
art_FechaModificacion				DATETIME,
art_UsuarioModificacion				INT,
art_Estado							BIT not null,

CONSTRAINT PK_dbo_tbArticulos_art_Id PRIMARY KEY(art_Id),
CONSTRAINT FK_dbo_tbArticulos_tbCategoria_cat_Id FOREIGN KEY (cat_Id) REFERENCES tbCategoria (cat_Id),
CONSTRAINT FK_dbo_tbArticulos_dbo_tbUsuarios_art_UsuarioCreacion_usu_Id FOREIGN KEY(art_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbArticulos_dbo_tbUsuarios_art_UsuarioModificacion_usu_Id FOREIGN KEY(art_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);




CREATE TABLE tbArticulosFabricas(
arfa_Id                             INT IDENTITY(1,1) NOT NULL,
art_Id			                    INT NOT NULL,
fra_Id                              INT NOT NULL,
arfa_FechaCreacion					DATETIME not null,
arfa_UsuarioCreacion				INT not null,
arfa_FechaModificacion				DATETIME,
arfa_UsuarioModificacion		    INT,
arfa_Estado							BIT not null,

CONSTRAINT PK_dbo_tbArticulosFabricas_arfa_Id PRIMARY Key (arfa_Id),
CONSTRAINT FK_dbo_tbArticulosFabricas_tbFabrica_fra_id FOREIGN KEY(fra_id) REFERENCES tbFrabicas(fra_id),
CONSTRAINT FK_dbo_tbArticulosFabricas_tbArticulos_art_id FOREIGN KEY(art_id) REFERENCES tbArticulos(art_id)
);



--Clientes
CREATE TABLE tbClientes(
cli_Id                              INT IDENTITY (1,1),
cli_Nombre							NVARCHAR(100) NOT NULL,
cli_Apellido						NVARCHAR(100) NOT NULL,
--mun_Id								CHAR(04) NOT NULL,
--cli_DireccionExacta					NVARCHAR(500) NOT NULL,
cli_Telefono						NVARCHAR(20) NOT NULL,
cli_CorreoElectronico				NVARCHAR(100) NOT NULL,
cli_saldo                           DECIMAL(16,2) NOT NULL,
cli_LimiteCredito                   DECIMAL(16,2) NOT NULL,
cli_Descuento                       DECIMAL(16,2) NOT NULL, 
cli_FechaCreacion					DATETIME not null,
cli_UsuarioCreacion					INT not null,
cli_FechaModificacion				DATETIME,
cli_UsuarioModificacion				INT,
cli_Estado							BIT not null,

CONSTRAINT PK_dbo_tbClientes_cli_Id PRIMARY KEY(cli_id),
CONSTRAINT FK_dbo_tbClientes_dbo_tbMunicipios_mun_Id FOREIGN KEY(mun_Id) REFERENCES tbMunicipios(mun_Id),
CONSTRAINT FK_dbo_tbClientes_dbo_tbUsuarios_cli_UsuarioCreacion_usu_Id FOREIGN KEY(cli_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbClientes_dbo_tbUsuarios_cli_UsuarioModificacion_usu_Id FOREIGN KEY(cli_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);


CREATE TABLE tbDirecciones(
dire_ID                                 INT IDENTITY(1,1),
dire_Calle                              NVARCHAR(500) NOT NULL,
dire_Comuna                             NVARCHAR(500) NOT NULL,
mun_Id                                  CHAR(4) NOT NULL,
cli_Id                                  INT,
dire_FechaCreacion					    DATETIME NOT null,
dire_UsuarioCreacion					INT NOT null,
dire_FechaModificacion				    DATETIME,
dire_UsuarioModificacion				INT,
dire_Estado                             BIT NOT null

CONSTRAINT Pk_dbo_tbDirecciones_dire_ID PRIMARY  KEY(dire_ID)
CONSTRAINT PK_dbo_tbDirecciones_tbClientes_cli_Id FOREIGN KEY(cli_Id) REFERENCES tbDirecciones (cli_Id)
CONSTRAINT PK_dbo_tbDirecciones_tbMunicipio_mun_id FOREIGN key (mun_id) REFERENCES tbMunicipios (mun_id)
CONSTRAINT PK_dbo_tbDirecciones_tbUsuario_dire_dire_UsuarioCreacion FOREIGN key (dire_UsuarioCreacion) REFERENCES tbUsuarios (usu_Id)
CONSTRAINT PK_dbo_tbDirecciones_tbUsuario_dire_UsuarioModificacion FOREIGN key (UsuarioModificacion) REFERENCES tbUsuarios (usu_Id)
);


CREATE TABLE tbMetodoPago(
    metpago_Id                      Char(1) not null,
    metpago_Descripcion             NVARCHAR (100) NOT NULL,
	metpago_FechaCreacion		    DATETIME not null,
	metpago_UsuarioCreacion		    INT not null,
	metpago_FechaModificacion	    DATETIME,
	metpago_UsuarioModificacion     INT,
	metpago_Estado				    BIT not null,
	
	CONSTRAINT PK_dbo_tbMetodoPagos_metpago_Id PRIMARY KEY(metpago_Id),
	CONSTRAINT FK_dbo_tbMetodoPago_dbo_tbUsuarios_metpago_UsuarioCreacion_usu_Id FOREIGN KEY(metpago_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbMetodoPago_dbo_tbUsuarios_metpago_UsuarioModificacion_usu_Id FOREIGN KEY(metpago_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);


CREATE TABLE tbPedidios(
    ped_Id                              INT IDENTITY(1,1),
    cli_Id                              INT not null,
    ped_Fecha							Datetime NOT NULL,
    dire_id                             INT,
    emp_id								INT not null,
    metpago_Id							CHAR(1) not null,
    ped_FechaCreacion					DATETIME not null,
    ped_UsuarioCreacion					INT not null,
    ped_FechaModificacion				DATETIME,
    ped_UsuarioModificacion				INT,
    ped_Estado							BIT not null,

    CONSTRAINT PK_dbo_tbPedidios_ped_Id PRIMARY KEY(ped_Id),
    CONSTRAINT FK_dbo_tbPedidios_tbClientes_clidire_id_id FOREIGN KEY(cli_Id) REFERENCES tbClientes(cli_Id),  
    CONSTRAINT FK_dbo_Pedidios_tbDirecciones_dire_id FOREIGN key (dire_id) REFERENCES tbDirecciones (dire_id),
    CONSTRAINT FK_dbo_tbPedidios_tbMetodoPago_metpago_id FOREIGN KEY(metpago_Id) REFERENCES tbMetodoPago(metpago_Id),
    CONSTRAINT FK_dbo_tbPedidios_dbo_tbEmpleados_emp_Id FOREIGN KEY(emp_Id) REFERENCES tbEmpleados(emp_Id),
    CONSTRAINT FK_dbo_tbPedidios_dbo_tbUsuarios_ped_UsuarioCreacion_usu_Id FOREIGN KEY(ped_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
    CONSTRAINT FK_dbo_tbPedidios_dbo_tbUsuarios_ped_UsuarioModificacion_usu_Id FOREIGN KEY(ped_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);


CREATE TABLE tbPedidiosDetalles (
pede_Id                             INT IDENTITY(1,1),
ped_Id                              INT not null,
art_Id                              INT not null,
pede_catidad						INT NOT NULL,
pede_Precio							DECIMAL (18,2) NOT NULL,
pede_FechaCreacion					DATETIME not null,
pede_UsuarioCreacion				INT not null,
pede_FechaModificacion				DATETIME,
pede_UsuarioModificacion			INT,
pede_Estado							BIT not null,
CONSTRAINT PK_dbo_tbPedidiosDetalles_pede_Id PRIMARY KEY(pede_Id),
CONSTRAINT FK_dbo_tbPedidiosDetalles_tbPedidios_ped_id FOREIGN KEY(ped_Id) REFERENCES tbpedtura(ped_Id),
CONSTRAINT FK_dbo_tbPedidiosDetalles_tbArticulos_art_id FOREIGN KEY(art_Id) REFERENCES tbArticulos(art_Id),
CONSTRAINT FK_dbo_tbPedidiosDetalles_dbo_tbUsuarios_pede_UsuarioCreacion_usu_Id FOREIGN KEY(pede_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbPedidiosDetalles_dbo_tbUsuarios_pede_UsuarioModificacion_usu_Id FOREIGN KEY(pede_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);





-------------------------------------------------------------------------------------
---------------------------------------Insert----------------------------------------
-------------------------------------------------------------------------------------



INSERT INTO [dbo].[tbUsuarios]
           ([usu_Usuario]
           ,[usu_Contrasenia]
           ,[emp_Id]
           ,[usu_UsuarioCreacion]
           ,[usu_FechaCreacion]
           ,[usu_UsuarioModificacion]
           ,[usu_FechaModificacion]
           ,[usu_Estado])
     VALUES
           ('admin',HASHBYTES('SHA2_512','admin'),1,1,GETDATE(),null,null,1)
GO


INSERT INTO [dbo].[tbDepartamentos]
VALUES ('01', 'Atl�ntida', GETDATE(), 1,null,null,1),
	   ('02', 'Col�n', GETDATE(), 1,null,null,1),
	   ('03', 'Comayagua', GETDATE(), 1,null,null,1),
	   ('04', 'Cop�n', GETDATE(), 1,null,null,1),
	   ('05', 'Cort�s', GETDATE(), 1,null,null,1),
	   ('06', 'Choluteca', GETDATE(), 1,null,null,1),
	   ('07', 'El Para�so', GETDATE(), 1,null,null,1),
	   ('08', 'Francisco Moraz�n', GETDATE(), 1,null,null,1),
	   ('09', 'Gracias a Dios', GETDATE(), 1,null,null,1),
	   ('10', 'Intibuc�', GETDATE(), 1,null,null,1),
	   ('11', 'Islas de la Bah�a', GETDATE(), 1,null,null,1),
	   ('12', 'La Paz', GETDATE(), 1,null,null,1),
	   ('13', 'Lempira', GETDATE(), 1,null,null,1),
	   ('14', 'Ocotepeque', GETDATE(), 1,null,null,1),
	   ('15', 'Olancho', GETDATE(), 1,null,null,1),
	   ('16', 'Santa B�rbara', GETDATE(), 1,null,null,1),
	   ('17', 'Valle', GETDATE(), 1,null,null,1),
	   ('18', 'Yoro', GETDATE(), 1,null,null,1)

INSERT INTO [dbo].[tbMunicipios]([mun_Id], [mun_Nombre], [dep_Id], [mun_UsuarioCreacion], [mun_FechaCreacion],[mun_Estado])
VALUES('0101','La Ceiba ','01', 1, GETDATE(), 1),
      ('0102','El Porvenir','01', 1, GETDATE(), 1), 
	  ('0103','Jutiapa','01', 1, GETDATE(), 1),
	  ('0104','Jutiapa','01', 1, GETDATE(), 1),
	  ('0105','La Masica','01', 1, GETDATE(), 1),
	  ('0201','Trujillo','02', 1, GETDATE(), 1),
	  ('0202','Balfate','02', 1, GETDATE(), 1),
	  ('0203','Iriona','02', 1, GETDATE(), 1),
	  ('0204','Limón','02', 1, GETDATE(), 1),
	  ('0205','Sabá','02', 1, GETDATE(), 1),
	  ('0301','Comayagua','03', 1, GETDATE(), 1),
	  ('0302','Ajuterique','03', 1, GETDATE(), 1),
      ('0303','El Rosario','03', 1, GETDATE(), 1),
	  ('0304','Esquías','03', 1, GETDATE(), 1),
      ('0305','Humuya','03',1, GETDATE(), 1),
	  ('0401','Santa Rosa de Copán','04', 1, GETDATE(), 1),
	  ('0402','Cabañas','04', 1, GETDATE(), 1),
      ('0403','Concepción','04', 1, GETDATE(), 1),
	  ('0404','Copán Ruinas','04', 1, GETDATE(), 1),
      ('0405','Corquín','04', 1, GETDATE(), 1),
	  ('0501','San Pedro Sula ','05', 1, GETDATE(), 1),
      ('0502','Choloma ','05', 1, GETDATE(), 1),
      ('0503','Omoa','05', 1, GETDATE(), 1),
      ('0504','Pimienta','05', 1, GETDATE(), 1),
	  ('0505','Potrerillos','05', 1, GETDATE(), 1),
	  ('0601','Choluteca','06', 1, GETDATE(), 1),
      ('0602','Apacilagua','06', 1, GETDATE(), 1),
      ('0603','Concepción de María','06', 1, GETDATE(), 1),
      ('0604','Duyure','06', 1, GETDATE(), 1),
	  ('0605','El Corpus','07', 1, GETDATE(), 1),
	  ('0701','Yuscarán','07', 1, GETDATE(), 1),
      ('0702','Alauca','07', 1, GETDATE(), 1),
      ('0703','Danlí','07', 1, GETDATE(), 1),
	  ('0704','El Paraíso','07', 1, GETDATE(), 1),
      ('0705','Güinope','07', 1, GETDATE(), 1),
	  ('0801','Distrito Central (Comayagüela y Tegucigalpa)','08', 1, GETDATE(), 1),
      ('0802','Alubarén','08', 1, GETDATE(), 1),
      ('0803','Cedros','08', 1, GETDATE(), 1),
      ('0804','Curarén','08', 1, GETDATE(), 1),
	  ('0805','El Porvenir','08', 1, GETDATE(), 1),
	  ('0901','Puerto Lempira','09', 1, GETDATE(), 1),
      ('0902','Brus Laguna','09', 1, GETDATE(), 1),
      ('0903','Ahuas','09', 1, GETDATE(), 1),
	  ('0904','Juan Francisco Bulnes','09', 1, GETDATE(), 1),
      ('0905','Villeda Morales','09', 1, GETDATE(), 1),
	  ('1001','La Esperanza','10', 1, GETDATE(), 1),
      ('1002','Camasca','10', 1, GETDATE(), 1),
      ('1003','Colomoncagua','10', 1, GETDATE(), 1),
	  ('1004','Concepción','10', 1, GETDATE(), 1),
      ('1005','Dolores','10', 1, GETDATE(), 1),
	  ('1101','Roatán','11', 1, GETDATE(), 1),
      ('1102','Guanaja','11', 1, GETDATE(), 1),
      ('1103','José Santos Guardiola','11', 1, GETDATE(), 1),
	  ('1104','Utila','11', 1, GETDATE(), 1),
	  ('1201','La Paz','12', 1, GETDATE(), 1),
      ('1202','Aguanqueterique','12', 1, GETDATE(), 1),
      ('1203','Cabañas','12', 1, GETDATE(), 1),
	  ('1204','Cane','12', 1, GETDATE(), 1),
      ('1205','Chinacla','12', 1, GETDATE(), 1),
	  ('1301','Gracias','13', 1, GETDATE(), 1),
      ('1302','Belén','13', 1, GETDATE(), 1),
      ('1303','Candelaria','13', 1, GETDATE(), 1),
	  ('1304','Cololaca','13', 1, GETDATE(), 1),
      ('1305','Erandique','13', 1, GETDATE(), 1),
	  ('1401','Ocotepeque','14', 1, GETDATE(), 1),
      ('1402','Belén Gualcho','14', 1, GETDATE(), 1),
      ('1403','Concepción','14', 1, GETDATE(), 1),
	  ('1404','Dolores Merendón','14', 1, GETDATE(), 1),
      ('1405','Fraternidad','14', 1, GETDATE(), 1),
	  ('1501','Juticalpa','15', 1, GETDATE(), 1),
      ('1502','Campamento','15', 1, GETDATE(), 1),
      ('1503','Catacamas','15', 1, GETDATE(), 1),
	  ('1504','Concordia','15', 1, GETDATE(), 1),
      ('1505','Dulce Nombre de Culmí','15', 1, GETDATE(), 1),
	  ('1601','Santa Bárbara','12', 1, GETDATE(), 1),
      ('1602','Arada','12', 1, GETDATE(), 1),
      ('1603','Atima','12', 1, GETDATE(), 1),
	  ('1604','Azacualpa','12', 1, GETDATE(), 1),
      ('1605','Ceguaca','12', 1, GETDATE(), 1),
	  ('1701','Nacaome','12', 1, GETDATE(), 1),
      ('1702','Alianza','12', 1, GETDATE(), 1),
      ('1703','Amapala','12', 1, GETDATE(), 1),
	  ('1704','Aramecina','12', 1, GETDATE(), 1),
      ('1705','Caridad','12', 1, GETDATE(), 1),
	  ('1801','Yoro','12', 1, GETDATE(), 1),
      ('1802','Arenal','12', 1, GETDATE(), 1),
      ('1803','El Negrito','12', 1, GETDATE(), 1),
	  ('1804','El artgreso','12', 1, GETDATE(), 1),
      ('1805','Jocón','12', 1, GETDATE(), 1)



	   INSERT INTO [dbo].[tbEstadosCiviles]
VALUES ('C', 'Casado(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ('S', 'Soltero(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ('D', 'Divorciado(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ('V', 'Viudo(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ('U', 'Union libre',  GETDATE(), 1, NULL, NULL, 1)


	   Insert INTO [dbo].[tbCargos]
	   Values   ('Jefe',GetDate(),1,null,null,1),
                ('Gerente',GetDate(),1,null,null,1),
                ('Repartidor',GetDate(),1,null,null,1),
                ('Recepcionista',GetDate(),1,null,null,1)

INSERT INTO [dbo].[tbEmpleados]
           ([emp_Nombre]
           ,[emp_Apellido]
           ,[emp_Sexo]
           ,[mun_Id]
           ,[emp_DireccionExacta]
           ,[estciv_Id]
           ,[emp_Telefono]
           ,[emp_CorreoElectronico]
           ,[emp_FechaNacimiento]
           ,[emp_FechaContratacion]
           ,[car_Id]
           ,[emp_FechaCreacion]
           ,[emp_UsuarioCreacion]
           ,[emp_FechaModificacion]
           ,[emp_UsuarioModificacion]
           ,[emp_Estado])
     VALUES
           ('Daniel','Espinoza' ,'M','0501' ,'Col. Municipal','S' ,'87756952' ,'daniele09099@gmail.com','02-04-2005' ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1)
GO



ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbUsuarios_usu_UsuarioCreacion_usu_Id FOREIGN KEY([usu_UsuarioCreacion]) REFERENCES tbUsuarios(usu_Id);

GO

ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbUsuarios_usu_UsuarioModificacion_usu_Id FOREIGN KEY([usu_UsuarioModificacion]) REFERENCES tbUsuarios(usu_Id);

GO

ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbEmpleados_emp_Id FOREIGN KEY([emp_Id]) REFERENCES tbEmpleados([emp_Id]);




-------------------------------------------------------------------------------------
---------------------------------------Updates---------------------------------------
-------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------
---------------------------------------Deletes---------------------------------------
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
---------------------------------------Select---------------------------------------
-------------------------------------------------------------------------------------