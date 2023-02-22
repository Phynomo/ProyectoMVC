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
	rol_id					INT NOT NULL,
	usu_UsuarioCreacion		INT not null,
	usu_FechaCreacion		DATETIME not null,
	usu_UsuarioModificacion INT ,
	usu_FechaModificacion	DATETIME,
	usu_Estado				BIT NOT NULL,

	CONSTRAINT PK_dbo_tbUsuarios_usu_Id PRIMARY KEY(usu_Id)
);


---------------------------------------------------------------------------------------------
---------------------------------------tbPantallas-------------------------------------------
---------------------------------------------------------------------------------------------

CREATE TABLE tbPantallas(
	pan_id						INT IDENTITY(1,1),
	pan_Nombre					NVARCHAR(150) NOT NULL,
	pan_UsuarioCreacion			INT not null,
	pan_FechaCreacion			DATETIME not null,
	pan_UsuarioModificacion 	INT ,
	pan_FechaModificacion		DATETIME,
	pan_Estado					BIT NOT NULL,

	CONSTRAINT PK_dbo_tbPantallas_pan_id PRIMARY KEY (pan_id),
	CONSTRAINT FK_dbo_tbPantallas__pan_UsuarioCreacion FOREIGN KEY (pan_UsuarioCreacion) REFERENCES tbUsuarios (usu_Id),
	CONSTRAINT FK_dbo_tbPantallas__pan_UsuarioModificacion FOREIGN KEY (pan_UsuarioModificacion) REFERENCES tbUsuarios (usu_Id)

);

---------------------------------------------------------------------------------------------
---------------------------------------tbRoles-----------------------------------------------
---------------------------------------------------------------------------------------------

CREATE TABLE tbRoles(
	
	rol_id						INT IDENTITY(1,1),
	rol_Nombre					NVARCHAR(150) NOT NULL,
	rol_UsuarioCreacion			INT not null,
	pan_id						INT NOT NULL,
	rol_FechaCreacion			DATETIME not null,
	rol_UsuarioModificacion 	INT ,
	rol_FechaModificacion		DATETIME,
	rol_Estado					BIT NOT NULL,

	CONSTRAINT PK_dbo_tbRoles_rol_id PRIMARY KEY (rol_id),
	CONSTRAINT FK_dbo_tbRoles_rol_rol_UsuarioCreacion FOREIGN KEY (rol_UsuarioCreacion) REFERENCES tbUsuarios (usu_Id),
	CONSTRAINT FK_dbo_tbRoles_rol_UsuarioModificacion FOREIGN KEY (rol_UsuarioModificacion) REFERENCES tbUsuarios (usu_Id)

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
clic_id                                   INT
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

--Clientes
CREATE TABLE tbClientes(
cli_Id                              INT IDENTITY (1,1),
cli_Nombre							NVARCHAR(100) NOT NULL,
cli_Apellido						NVARCHAR(100) NOT NULL,
mun_Id								CHAR(04) NOT NULL,
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
CONSTRAINT PK_dbo_tbDirecciones_tbClientes_cli_Id FOREIGN KEY(cli_Id) REFERENCES tbClientes (cli_Id),
CONSTRAINT PK_dbo_tbDirecciones_tbMunicipio_mun_id FOREIGN key (mun_id) REFERENCES tbMunicipios (mun_id),
CONSTRAINT PK_dbo_tbDirecciones_tbUsuario_dire_dire_UsuarioCreacion FOREIGN key (dire_UsuarioCreacion) REFERENCES tbUsuarios (usu_Id),
CONSTRAINT PK_dbo_tbDirecciones_tbUsuario_dire_UsuarioModificacion FOREIGN key (dire_UsuarioModificacion) REFERENCES tbUsuarios (usu_Id)
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
CONSTRAINT FK_dbo_tbPedidiosDetalles_tbPedidios_ped_id FOREIGN KEY(ped_Id) REFERENCES tbPedidios(ped_Id),
CONSTRAINT FK_dbo_tbPedidiosDetalles_tbArticulos_art_id FOREIGN KEY(art_Id) REFERENCES tbArticulos(art_Id),
CONSTRAINT FK_dbo_tbPedidiosDetalles_dbo_tbUsuarios_pede_UsuarioCreacion_usu_Id FOREIGN KEY(pede_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbPedidiosDetalles_dbo_tbUsuarios_pede_UsuarioModificacion_usu_Id FOREIGN KEY(pede_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);

-------------------------------------------------------------------------------------
-------------------------Procedimientos Almacenados----------------------------------
-------------------------------------------------------------------------------------

GO
CREATE OR ALTER PROCEDURE UDP_tbDirecciones_Select
AS
BEGIN
	SET NOCOUNT ON;

	select	[dire_ID], 
                  [dire_Calle], 
                  [dire_Comuna], 
                  dir.[mun_Id], 
                  mun.mun_Nombre

                  [cli_Id],
                  cli.cli_Nombre + + cli.cli_Apellido,
                  [dire_FechaCreacion], 
                  [dire_UsuarioCreacion],
                  [dire_FechaModificacion], 
                  [dire_UsuarioModificacion], 
                  [dire_Estado] 
	 from tbDirecciones dir INNER JOIN tbMunicipios mun
	 ON dir.mun_Id = mun.mun_Id INNER JOIN tbClientes cli
	 ON dir.cli_Id = cli.cli_Id
	 WHERE dir.dire_Estado = 0 


END
GO


GO
CREATE OR ALTER PROCEDURE UDP_tbDirecciones_Insert (@dire_Calle  NVARCHAR(250), @dire_Comuna 	NVARCHAR(250), @mun_Id	INT, @cli_Id INT, @dire_UsuarioCreacion INT)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @FechaCreacion  		DATETIME = GETDATE();
	DECLARE @dire_Estado 				BIT = 1;

    -- Insert statements for procedure here
	INSERT INTO tbDirecciones ([dire_Calle], [dire_Comuna], [mun_Id], [cli_Id], [dire_FechaCreacion], [dire_UsuarioCreacion], [dire_FechaModificacion], [dire_UsuarioModificacion], [dire_Estado])
	VALUES (@dire_Calle, @dire_Comuna, @mun_Id, @cli_Id, @dire_FechaCreacion, @dire_UsuarioCreacion, null,null @dire_Estado)
END
GO


GO
CREATE OR ALTER PROCEDURE UDP_tbDirecciones_Update (@dire_ID INT , @dire_Calle  NVARCHAR(250), @dire_Comuna 	NVARCHAR(250), @mun_Id	INT, @cli_Id INT, @dire_UsuarioModificacion INT)
AS
begin


UPDATE [dbo].[tbDirecciones]
   SET [dire_Calle] = @dire_Calle
      ,[dire_Comuna] = @dire_Comuna 
      ,[mun_Id] = @mun_Id
      ,[cli_Id] = @cli_Id 
      ,[dire_FechaModificacion] = GETDATE()
      ,[dire_UsuarioModificacion] =  @dire_UsuarioModificacion
 WHERE dire_ID = @dire_ID 


END
GO

GO
CREATE OR ALTER PROCEDURE UDP_tbDirecciones_Delete (@dire_id INT)
AS
BEGIN
	SET NOCOUNT ON;

UPDATE [dbo].[tbDirecciones]
   SET [dire_Estado] = 0
 WHERE dire_ID = @dire_id
	
END
GO

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

-- Procedimiento de Insertat Cargos
CREATE OR ALTER PROCEDURE UDP_tbCargos_Insert
	@car_Nombre Nvarchar(150),
	@car_UsuarioCreacion int

AS
BEGIN

INSERT INTO [dbo].[tbCargos]
           ([car_Nombre]
           ,[car_FechaCreacion]
           ,[car_UsuarioCreacion]
           ,[car_FechaModificacion]
           ,[car_UsuarioModificacion]
           ,[car_Estado])
     VALUES
           (@car_Nombre
           ,GETDATE()
           ,@car_UsuarioCreacion
           ,null
           ,null
           ,1)


END
GO

-- Procedimiento de Select / Index Cargos
CREATE OR ALTER PROCEDURE UDP_tbCargos_Select

AS
BEGIN

SELECT [car_Id]
      ,[car_Nombre]
      ,[car_FechaCreacion]
      ,[car_UsuarioCreacion]
      ,[car_FechaModificacion]
      ,[car_UsuarioModificacion]
      ,[car_Estado]
  FROM [dbo].[tbCargos]
	WHERE car_Estado = 1

END
GO


-- Procedimiento de Update Cargos
CREATE OR ALTER PROCEDURE UDP_tbCargo_Update
	@car_Id INT,
	@car_Nombre Nvarchar(200),
	@car_UsuarioModificacion int
AS
BEGIN

UPDATE [dbo].[tbCargos]
   SET [car_Nombre] = @car_Nombre
      ,[car_FechaModificacion] = GETDATE()
      ,[car_UsuarioModificacion] = @car_UsuarioModificacion
 WHERE car_Id = @car_Id


END
GO


-- Procedimiento de Delete Cargos
CREATE OR ALTER PROCEDURE UDP_tbCargo_Delete
	@car_Id INT
AS
BEGIN


UPDATE [dbo].[tbCargos]
   SET [car_Estado] = 0
 WHERE car_Id = @car_Id


END
GO


-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

-- Procedimiento de Select / Index tbEmpleado
GO
CREATE OR ALTER PROCEDURE UDP_tbEmpleados_Select
AS
BEGIN


SELECT [emp_Id]
      ,[emp_Nombre]
      ,[emp_Apellido]
	  ,emp_Nombre +' '+ emp_Apellido AS Nombre
      ,[emp_Sexo]
	  ,CASE
			WHEN emp_Sexo='M' THEN 'Masculino'
			WHEN emp_Sexo='F' THEN 'Femenino'
			ELSE 'Otro'
		END as Sexo
      ,t1.[mun_Id]
	  ,t4.mun_Nombre + ', ' + t5.dep_Nombre as Ciudad
      ,[emp_DireccionExacta]
      ,t1.[estciv_Id]
	  ,t2.estciv_Nombre
      ,[emp_Telefono]
      ,[emp_CorreoElectronico]
      ,[emp_FechaNacimiento]
	  ,DATEDIFF(YEAR, emp_FechaNacimiento,GetDate()) as Edad
      ,[emp_FechaContratacion]
      ,t1.[car_Id]
	  ,t3.car_Nombre
      ,[emp_FechaCreacion]
      ,[emp_UsuarioCreacion]
      ,[emp_FechaModificacion]
      ,[emp_UsuarioModificacion]
      ,[emp_Estado]
  FROM [dbo].[tbEmpleados] T1 INNER JOIN [dbo].[tbEstadosCiviles] T2
  ON T1.estciv_Id = T2.estciv_Id Inner JOIN [dbo].[tbCargos] T3
  ON t3.car_Id = t1.car_Id INNER JOIN [dbo].[tbMunicipios] T4
  ON t4.mun_Id = t1.mun_Id INNER JOIN [dbo].[tbDepartamentos] T5
  ON t4.dep_Id = t5.dep_Id
  WHERE emp_Estado = 1



END
GO


-- Procedimiento de Insertar Empleados

CREATE OR ALTER PROCEDURE UDP_tbEmpleados_Insert
	@emp_Nombre Nvarchar(150),
	@emp_Apellido Nvarchar(150),
	@emp_Sexo char(1),
	@mun_Id Nvarchar(10),
	@emp_DireccionExacta Nvarchar(500),
	@estciv_Id char(1),
	@emp_Telefono Nvarchar(20),
	@emp_CorreoElectronico Nvarchar(100),
	@emp_FechaNacimiento Nvarchar(100),
	@emp_FechaContratacion Nvarchar(100),
	@car_Id Nvarchar(20),
	@emp_FechaCreacion int
AS
BEGIN

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
           (@emp_Nombre
           ,@emp_Apellido
           ,@emp_Sexo
           ,@mun_Id
           ,@emp_DireccionExacta
           ,@estciv_Id
           ,@emp_Telefono
           ,@emp_CorreoElectronico
           ,@emp_FechaNacimiento
           ,@emp_FechaContratacion
           ,@car_Id
           ,GETDATE()
           ,@emp_FechaCreacion
           ,null
           ,null
           ,1)



END
GO





-- Procedimiento de Update Empleados
CREATE OR ALTER PROCEDURE UDP_tbEmpleados_Update
	@emp_Id INT,
	@emp_Nombre Nvarchar(150),
	@emp_Apellido Nvarchar(150),
	@emp_Sexo char(1),
	@mun_Id Nvarchar(10),
	@emp_DireccionExacta Nvarchar(500),
	@estciv_Id char(1),
	@emp_Telefono Nvarchar(20),
	@emp_CorreoElectronico Nvarchar(100),
	@emp_FechaNacimiento Nvarchar(100),
	@emp_FechaContratacion Nvarchar(100),
	@car_Id Nvarchar(20),
	@emp_UsuarioModificacion int
AS
BEGIN

UPDATE [dbo].[tbEmpleados]
   SET [emp_Nombre] = @emp_Nombre
      ,[emp_Apellido] = @emp_Apellido
      ,[emp_Sexo] = @emp_Sexo
      ,[mun_Id] = @mun_Id
      ,[emp_DireccionExacta] = @emp_DireccionExacta
      ,[estciv_Id] = @estciv_Id
      ,[emp_Telefono] = @emp_Telefono
      ,[emp_CorreoElectronico] = @emp_CorreoElectronico
      ,[emp_FechaNacimiento] = @emp_FechaNacimiento
      ,[emp_FechaContratacion] = @emp_FechaContratacion
      ,[car_Id] = @car_Id
      ,[emp_FechaModificacion] = GETDATE()
      ,[emp_UsuarioModificacion] = @emp_UsuarioModificacion
 WHERE emp_Id = @emp_Id



END
GO



-- Procedimiento de Delete Empleado
CREATE OR ALTER PROCEDURE UDP_tbEmpleados_Delete
	@emp_Id INT
AS
BEGIN

UPDATE [dbo].[tbEmpleados]
   SET emp_Estado = 0
 WHERE emp_Id = @emp_Id



END
GO


-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------



-- Procedimiento de Insertar Categorias
CREATE OR ALTER PROCEDURE UDP_tbCategorias_Insert
	@cat_Descripcion Nvarchar(150),
	@cat_UsuarioCreacion int

AS
BEGIN

INSERT INTO [dbo].[tbCategoria]
           ([cat_Descripcion]
           ,[cat_FechaCreacion]
           ,[cat_UsuarioCreacion]
           ,[cat_FechaModificacion]
           ,[cat_UsuarioModificacion]
           ,[cat_Estado])
     VALUES
           (@cat_Descripcion
           ,GETDATE()
           ,@cat_UsuarioCreacion
           ,null
           ,null
           ,1)


END
GO

-- Procedimiento de Select / Index Categorias

CREATE OR ALTER PROCEDURE UDP_tbCategorias_Select

AS
BEGIN

SELECT [cat_Id]
      ,[cat_Descripcion]
      ,[cat_FechaCreacion]
      ,[cat_UsuarioCreacion]
      ,[cat_FechaModificacion]
      ,[cat_UsuarioModificacion]
      ,[cat_Estado]
  FROM [dbo].[tbCategoria]
WHERE cat_Estado = 1

END
GO


-- Procedimiento de Update Categorias

CREATE OR ALTER PROCEDURE UDP_tbCategorias_Update
	@cat_Id INT,
	@cat_Descripcion Nvarchar(200),
	@cat_UsuarioModificacion int
AS
BEGIN

UPDATE [dbo].[tbCategoria]
   SET [cat_Descripcion] = @cat_Descripcion
      ,[cat_FechaModificacion] = GETDATE()
      ,[cat_UsuarioModificacion] = @cat_UsuarioModificacion
 WHERE cat_Id = @cat_Id


END
GO


-- Procedimiento de Delete Categorias

CREATE OR ALTER PROCEDURE UDP_tbCaTegorias_Delete
	@cat_Id INT
AS
BEGIN


UPDATE [dbo].[tbCategoria]
   SET [cat_Estado] = 0
 WHERE cat_Id = @cat_Id


END
GO

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-- Procedimiento de Select / Index Fabrica
CREATE PROCEDURE UDP_tbfrabrica_Select
AS
BEGIN
    SELECT fra_id, fra_Nombre, mun_Id, fra_ArticulosProvistos, fra_Telefono, fra_FechaCreacion, fra_UsuarioCreacion, fra_FechaModificacion, fra_UsuarioModificacion, fra_Estado
    FROM tbFrabicas
    WHERE fra_Estado = 1;
END


-- Procedimiento de Insertar Fabrica

GO
CREATE PROCEDURE UDP_tbFabrica_Insert
    @fra_Nombre NVARCHAR(150),
    @mun_Id CHAR(4),
    @fra_ArticulosProvistos INT,
    @fra_Telefono NVARCHAR(20),
    @usuario INT
AS
BEGIN
    INSERT INTO tbFrabicas ([fra_id], [fra_Nombre], [mun_Id], [fra_ArticulosProvistos], [fra_Telefono], [fra_FechaCreacion], [fra_UsuarioCreacion], [fra_FechaModificacion], [fra_UsuarioModificacion], [fra_Estado])
    VALUES (@fra_Nombre, @mun_Id, @fra_ArticulosProvistos, @fra_Telefono, GETDATE(), NULL, NULL,  @usuario, 1);
END


-- Procedimiento de Update Fabrica
CREATE PROCEDURE UDP_tbFrabrica_Update
    @fra_id INT,
    @fra_Nombre NVARCHAR(150),
    @mun_Id CHAR(4),
    @fra_ArticulosProvistos INT,
    @fra_Telefono NVARCHAR(20),
    @usuario INT
AS
BEGIN
    UPDATE tbFrabicas
    SET fra_Nombre = @nombre,
        mun_Id = @municipio,
        fra_ArticulosProvistos = @articulos,
        fra_Telefono = @telefono,
        fra_FechaModificacion = GETDATE(),
        fra_UsuarioModificacion = @usuario
    WHERE fra_Id = @fra_id;
END

CREATE PROCEDURE UDP_tbFrabica_Delete (
    @fra_Id INT, @fra_UsuarioModificacion INT
)
AS
BEGIN
    UPDATE tbFrabicas
    SET fra_Estado = 0,
        fra_FechaModificacion = GETDATE(),
        fra_UsuarioModificacion = @fra_UsuarioModificacion 
    WHERE fra_Id = @fra_Id
END


-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
--Procedimiento almacenado Select / Index tbArticulos
CREATE PROCEDURE UDP_tbArticulos_Select
AS
BEGIN
    SELECT art_Id, art_Nombre, art_Precio, cat_Id, clic_id,  art_Stock, art_FechaCreacion, art_UsuarioCreacion, art_FechaModificacion, art_UsuarioModificacion, art_Estado
    FROM tbArticulos
    WHERE art_Estado = 1;
END

--Procedimiento almacenado Insert tbArticulos
CREATE PROCEDURE UDP_tbArticulos_Insert
    @art_Nombre NVARCHAR(200),
    @art_Precio DECIMAL(18, 2),
    @cat_Id INT,
    @cli_id INT,
    @art_Stock INT,
    @art_UsuarioCreacion INT

AS
BEGIN
    INSERT INTO tbArticulos ([art_Nombre], [art_Precio], [cat_Id],  clic_id, [art_Stock], [art_FechaCreacion], [art_UsuarioCreacion], [art_FechaModificacion], [art_UsuarioModificacion], [art_Estado] )
    VALUES (@art_Nombre, @art_Precio, @cat_Id, @cli_id,  @art_Stock, GETDATE(), @art_UsuarioCreacion, NULL, NULL, @art_Estado);
END

--Procedimiento almacenado Update tbArticulos
CREATE PROCEDURE UDP_tbArticulo_Update
    @art_Id INT,
    @art_Nombre NVARCHAR(150),
    @art_Precio DECIMAL(18,2),
    @cat_Id       INT,
    @cli_id      INT,
    @art_Stock    INT,
    @art_UsuarioCreacion INT
AS
BEGIN
    UPDATE tbArticulos
    SET art_Nombre = @art_Nombre,
        art_Precio = @art_Precio,
        cat_Id    = @cat_id,
        cli_id   = @cli_id,
        art_Stock = @art_Stock,
        art_FechaModificacion = GETDATE(),
        art_UsuarioModificacion =  @art_UsuarioCreacion 
    WHERE art_Id = @art_Id
END

--Procedimiento almacenado Delete tbArticulos
CREATE PROCEDURE UDP_tbArticulos_Delete (
    @art_Id INT, @art_UsuarioModificacion INT
)
AS
BEGIN
    UPDATE tbArticulos
    SET art_Estado = 0,
        art_FechaModificacion = GETDATE(),
        art_UsuarioModificacion = @art_UsuarioModificacion 
    WHERE art_Id = @art_Id
END


------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--Procedimiento almacenado Insert tbClientes
CREATE PROCEDURE UDP_tbClientes_Insert
    @Nombre NVARCHAR(100),
    @Apellido NVARCHAR(100),
    @Municipio CHAR(4),
    @Telefono NVARCHAR(20),
    @CorreoElectronico NVARCHAR(100),
    @Saldo DECIMAL(16,2),
    @LimiteCredito DECIMAL(16,2),
    @Descuento DECIMAL(16,2),
    @UsuarioCreacion INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO tbClientes([cli_Nombre], [cli_Apellido], [mun_Id], [cli_Telefono], [cli_CorreoElectronico], [cli_saldo], [cli_LimiteCredito], [cli_Descuento], [cli_FechaCreacion], [cli_UsuarioCreacion], [cli_FechaModificacion], [cli_UsuarioModificacion], [cli_Estado])
    VALUES (@Nombre, @Apellido, @Municipio, @Telefono, @CorreoElectronico, @Saldo, @LimiteCredito, @Descuento, GETDATE(), NULL, NULL,  @UsuarioCreacion, 1)
END

--Procedimiento almacenado Update tbClientes

CREATE PROCEDURE UDP_tbClientes_Update
    @cli_Id INT,
    @cli_Nombre NVARCHAR(100),
    @cli_Apellido NVARCHAR(100),
    @mun_Id CHAR(4),
    @cli_Telefono NVARCHAR(20),
    @cli_CorreoElectronico NVARCHAR(100),
    @cli_saldo DECIMAL(16,2),
    @cli_LimiteCredito DECIMAL(16,2),
    @cli_Descuento DECIMAL(16,2),
    @cli_UsuarioModificacion INT
AS
BEGIN
    UPDATE tbClientes
    SET cli_Nombre = @cli_Nombre,
        cli_Apellido = @cli_Apellido,
        mun_Id = @mun_Id,
        cli_Telefono = @cli_Telefono,
        cli_CorreoElectronico = @cli_CorreoElectronico,
        cli_saldo = @cli_saldo,
        cli_LimiteCredito = @cli_LimiteCredito,
        cli_Descuento = @cli_Descuento,
        cli_FechaModificacion = GETDATE(),
        cli_UsuarioModificacion = @cli_UsuarioModificacion
    WHERE cli_Id = @cli_Id
END

--Procedimiento almacenado Delete tbClientes

CREATE PROCEDURE UDP_tbClientes_Delete (
    @cli_Id INT, @cli_UsuarioModificacion INT
)
AS
BEGIN
    UPDATE tbClientes
    SET cli_Estado = 0,
        cli_FechaModificacion = GETDATE(),
        cli_UsuarioModificacion = @cli_UsuarioModificacion 
    WHERE art_Id = @art_Id
END



CREATE PROCEDURE UDP_tbMetodoPago_Insert
(
    @metpago_Id                      Char(1),
    @metpago_Descripcion             NVARCHAR (100),
    @metpago_UsuarioCreacion         INT
)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO tbMetodoPago ([metpago_Id], [metpago_Descripcion], [metpago_FechaCreacion], [metpago_UsuarioCreacion], [metpago_FechaModificacion], [metpago_UsuarioModificacion], [metpago_Estado])
    VALUES (@metpago_Id, @metpago_Descripcion, GETDATE(), @metpago_UsuarioCreacion, NULL, NULL, 1);
END


CREATE PROCEDURE UDP_tbMetodoPago_Update
	@metpago_Id                      Char(1),
	@metpago_Descripcion             NVARCHAR (100),
	@metpago_UsuarioModificacion     INT
AS
BEGIN
	UPDATE tbMetodoPago
	SET metpago_Descripcion = @metpago_Descripcion,
	    metpago_FechaModificacion = GETDATE(),
	    metpago_UsuarioModificacion = @metpago_UsuarioModificacion
	WHERE metpago_Id = @metpago_Id;
END

CREATE PROCEDURE UDP_tbMetodoPago_Delete (
    @metpago_Id INT, @metpago_UsuarioModificacion INT
)
AS
BEGIN
    UPDATE tbMetodoPago
    SET metpago_Estado = 0,
        metpago_FechaModificacion = GETDATE(),
        metpago_UsuarioModificacion = @metpago_UsuarioModificacion 
    WHERE art_Id = @art_Id
END



CREATE PROCEDURE UDP_tbPedidos_Insert
    @cli_Id INT,
    @ped_Fecha DATETIME,
    @dire_Id INT,
    @emp_Id INT,
    @metpago_Id CHAR(1),
    @ped_UsuarioCreacion INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO tbPedidios([cli_Id], [ped_Fecha], [dire_id], [emp_id], [metpago_Id], [ped_FechaCreacion], [ped_UsuarioCreacion], [ped_FechaModificacion], [ped_UsuarioModificacion], [ped_Estado])
    VALUES(@cli_Id, @ped_Fecha, @dire_Id, @emp_Id, @metpago_Id, GETDATE(), @ped_UsuarioCreacion, NULL, NULL, 1)
END

CREATE PROCEDURE UDP_tbpedidos_Update
    @ped_Id int,
    @cli_Id int,
    @ped_Fecha datetime,
    @dire_id int,
    @emp_id int,
    @metpago_Id char(1),
    @ped_UsuarioModificacion int
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE tbPedidios
    SET cli_Id = @cli_Id,
        ped_Fecha = @ped_Fecha,
        dire_id = @dire_id,
        emp_id = @emp_id,
        metpago_Id = @metpago_Id,
        ped_FechaModificacion = GETDATE(),
        ped_UsuarioModificacion = @ped_UsuarioModificacion,
        ped_Estado = 1
    WHERE ped_Id = @ped_Id;
END


CREATE PROCEDURE UDP_tbpedidos_Delete (
    @ped_Id INT, @ped_UsuarioModificacion INT
)
AS
BEGIN
    UPDATE tbMetodoPago
    SET ped_Estado = 0,
        ped_FechaModificacion = GETDATE(),
        ped_UsuarioModificacion = @ped_UsuarioModificacion 
    WHERE art_Id = @art_Id
END



CREATE PROCEDURE UDP_PedidoDetalle_Insert
    @ped_Id INT,
    @art_Id INT,
    @pede_cantidad INT,
    @pede_Precio DECIMAL(18,2),
    @pede_UsuarioCreacion INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar el nuevo registro
    INSERT INTO tbPedidiosDetalles ([ped_Id], [art_Id], [pede_catidad], [pede_Precio], [pede_FechaCreacion], [pede_UsuarioCreacion], [pede_FechaModificacion], [pede_UsuarioModificacion], [pede_Estado])
    VALUES (@ped_Id, @art_Id, @pede_cantidad, @pede_Precio, GETDATE(), @pede_UsuarioCreacion, NULL, NULL,  1);
END

CREATE PROCEDURE UDP_PedidoDetalle_Update
    @pede_Id INT,
    @ped_Id INT,
    @art_Id INT,
    @pede_Cantidad INT,
    @pede_Precio DECIMAL(18, 2),
    @pede_UsuarioModificacion INT
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE tbPedidiosDetalles
    SET ped_Id = @ped_Id,
        art_Id = @art_Id,
        pede_Cantidad = @pede_Cantidad,
        pede_Precio = @pede_Precio,
        pede_FechaModificacion = GETDATE(),
        pede_UsuarioModificacion = @pede_UsuarioModificacion
    WHERE pede_Id = @pede_Id;
END;

CREATE PROCEDURE UDP_PedidoDetalle_Delete (
    @pede_Id INT, @pedeUsuarioModificacion INT
)
AS
BEGIN
    UPDATE tbPedidiosDetalles
    SET pede_Estado = 0,
        pede_FechaModificacion = GETDATE(),
        pede_UsuarioModificacion = @pede_UsuarioModificacion 
    WHERE pede_Id = @pede_Id
END


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
---------------------------------------Select----------------------------------------
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
---------------------------------------Updates---------------------------------------
-------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------
---------------------------------------Deletes---------------------------------------
-------------------------------------------------------------------------------------

