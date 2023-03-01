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
	rol_FechaCreacion			DATETIME not null,
	rol_UsuarioModificacion 	INT ,
	rol_FechaModificacion		DATETIME,
	rol_Estado					BIT NOT NULL,

	CONSTRAINT PK_dbo_tbRoles_rol_id PRIMARY KEY (rol_id),
	CONSTRAINT FK_dbo_tbRoles_rol_rol_UsuarioCreacion FOREIGN KEY (rol_UsuarioCreacion) REFERENCES tbUsuarios (usu_Id),
	CONSTRAINT FK_dbo_tbRoles_rol_UsuarioModificacion FOREIGN KEY (rol_UsuarioModificacion) REFERENCES tbUsuarios (usu_Id)

);


CREATE TABLE tbRolesXPantalla(
	
	ropa_id						INT IDENTITY(1,1),
    rol_id                      INT,
    pan_id                          INT,
	ropa_UsuarioCreacion			INT not null,
	ropa_FechaCreacion			DATETIME not null,
	ropa_UsuarioModificacion 	INT ,
	ropa_FechaModificacion		DATETIME,
	ropa_Estado					BIT NOT NULL,

	CONSTRAINT PK_dbo_tbRolesXPantalla_ropa_id PRIMARY KEY (ropa_id),
    CONSTRAINT PK_dbo_tbRolesXPantalla_tbRoles_rol_id   FOREIGN KEy (rol_id) REFERENCES tbRoles (rol_Id),
    CONSTRAINT PK_dbo_tbRolesXPantalla_tbPantallas_pan_id   FOREIGN KEy (pan_id) REFERENCES tbPantallas (pan_id),
	CONSTRAINT FK_dbo_tbRolesXPantalla_ropa_UsuarioCreacion FOREIGN KEY (ropa_UsuarioCreacion) REFERENCES tbUsuarios (usu_Id),
	CONSTRAINT FK_dbo_tbRolesXPantalla_ropa_UsuarioModificacion FOREIGN KEY (ropa_UsuarioModificacion) REFERENCES tbUsuarios (usu_Id)

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


CREATE TABLE tbFabricas(

    fab_id                              INT IDENTITY(1,1),
    fab_Nombre                          NVARCHAR (150) NOT NULL,
	---dep_Id								CHAR(2) NOT NULL,
    mun_Id                              Char(4) NOT NULL,
    fab_DireccionExacta                 NVARCHAR (500) NOT NULL,
    fab_Telefono                        NVARCHAR (20) NOT NULL,
    fab_FechaCreacion		            DATETIME NOT null,
    fab_UsuarioCreacion		            INT NOT null,
    fab_FechaModificacion	            DATETIME,
    fab_UsuarioModificacion             INT,
    fab_Estado                          BIT NOT null,
    CONSTRAINT PK_dbo_tbFabricas_fab_Id PRIMARY KEY(fab_Id),
    CONSTRAINT FK_dbo_tbFabricas_tbMunicipio_mun_id FOREIGN key(mun_id) REFERENCES tbMunicipios(mun_id),
    --CONSTRAINT FK_dbo_tbFabricas_tbDepartamentos_dep_Id FOREIGN key(dep_Id) REFERENCES tbDepartamentos (dep_Id)


);



--Articulos
CREATE TABLE tbArticulos(
art_Id			                    INT IDENTITY(1,1),
art_Nombre		                    NVARCHAR (200) NOT NULL,
art_Precio		                    DECIMAL (18,2) NOT NULL,
cat_Id			                    INT not null,
art_Stock		                    INT not null,
fab_id								INT,
art_FechaCreacion					DATETIME not null,
art_UsuarioCreacion					INT not null,
art_FechaModificacion				DATETIME,
art_UsuarioModificacion				INT,
art_Estado							BIT not null,

CONSTRAINT PK_dbo_tbArticulos_art_Id PRIMARY KEY(art_Id),
CONSTRAINT FK_dbo_tbArticulos_tbCategoria_cat_Id FOREIGN KEY (cat_Id) REFERENCES tbCategoria (cat_Id),
CONSTRAINT FK_dbo_tbArticulos_tbFabricas_fab_Id FOREIGN KEY (fab_id) REFERENCES tbFabricas (fab_id),
CONSTRAINT FK_dbo_tbArticulos_dbo_tbUsuarios_art_UsuarioCreacion_usu_Id FOREIGN KEY(art_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbArticulos_dbo_tbUsuarios_art_UsuarioModificacion_usu_Id FOREIGN KEY(art_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

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
--CONSTRAINT FK_dbo_tbClientes_dbo_tbMunicipios_mun_Id FOREIGN KEY(mun_Id) REFERENCES tbMunicipios(mun_Id),
CONSTRAINT FK_dbo_tbClientes_dbo_tbUsuarios_cli_UsuarioCreacion_usu_Id FOREIGN KEY(cli_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbClientes_dbo_tbUsuarios_cli_UsuarioModificacion_usu_Id FOREIGN KEY(cli_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);


CREATE TABLE tbDirecciones(
dire_ID                                 INT IDENTITY(1,1),
mun_Id                                  CHAR(4) NOT NULL,
dire_Calle                              NVARCHAR(500) NOT NULL,
dire_Comuna                             NVARCHAR(500) NOT NULL,
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
    metpago_Id                      INT IDENTITY(1,1) not null,
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


CREATE TABLE tbPedidos(
    ped_Id                              INT IDENTITY(1,1),
    cli_Id                              INT not null,
    ped_Fecha							Datetime NOT NULL,
    dire_id                             INT,
    emp_id								INT not null,
    metpago_Id							INT not null,
    ped_FechaCreacion					DATETIME not null,
    ped_UsuarioCreacion					INT not null,
    ped_FechaModificacion				DATETIME,
    ped_UsuarioModificacion				INT,
    ped_Estado							BIT not null,

    CONSTRAINT PK_dbo_tbPedidos_ped_Id PRIMARY KEY(ped_Id),
    CONSTRAINT FK_dbo_tbPedidos_tbClientes_cli_id FOREIGN KEY(cli_Id) REFERENCES tbClientes(cli_Id),  
    CONSTRAINT FK_dbo_tbPedidos_tbDirecciones_dire_id FOREIGN key (dire_id) REFERENCES tbDirecciones (dire_id),
    CONSTRAINT FK_dbo_tbPedidos_tbMetodoPago_metpago_id FOREIGN KEY(metpago_Id) REFERENCES tbMetodoPago(metpago_Id),
    CONSTRAINT FK_dbo_tbPedidos_dbo_tbEmpleados_emp_Id FOREIGN KEY(emp_Id) REFERENCES tbEmpleados(emp_Id),
    CONSTRAINT FK_dbo_tbPedidos_dbo_tbUsuarios_ped_UsuarioCreacion_usu_Id FOREIGN KEY(ped_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
    CONSTRAINT FK_dbo_tbPedidos_dbo_tbUsuarios_ped_UsuarioModificacion_usu_Id FOREIGN KEY(ped_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);


CREATE TABLE tbPedidosDetalles (
pede_Id                             INT IDENTITY(1,1),
ped_Id                              INT not null,
art_Id                              INT not null,
pede_Cantidad						INT NOT NULL,
pede_Precio							DECIMAL (18,2) NOT NULL,
pede_FechaCreacion					DATETIME not null,
pede_UsuarioCreacion				INT not null,
pede_FechaModificacion				DATETIME,
pede_UsuarioModificacion			INT,
pede_Estado							BIT not null,
CONSTRAINT PK_dbo_tbPedidosDetalles_pede_Id PRIMARY KEY(pede_Id),
CONSTRAINT FK_dbo_tbPedidosDetalles_tbPedidos_ped_id FOREIGN KEY(ped_Id) REFERENCES tbPedidos(ped_Id),
CONSTRAINT FK_dbo_tbPedidosDetalles_tbArticulos_art_id FOREIGN KEY(art_Id) REFERENCES tbArticulos(art_Id),
CONSTRAINT FK_dbo_tbPedidosDetalles_dbo_tbUsuarios_pede_UsuarioCreacion_usu_Id FOREIGN KEY(pede_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbPedidosDetalles_dbo_tbUsuarios_pede_UsuarioModificacion_usu_Id FOREIGN KEY(pede_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);

-------------------------------------------------------------------------------------
-------------------------Procedimientos Almacenados----------------------------------
-------------------------------------------------------------------------------------
GO
CREATE OR ALTER PROCEDURE UDP_InsertarUsuario
	@usu_Usuario Nvarchar(150),
	@usu_Contrasenia Nvarchar(max),
	@emp_Id int,
	@rol_id int,
	@usu_UsuarioCreacion int

AS
BEGIN

Declare @Password Nvarchar(max) = (HASHBYTES('SHA2_512',@usu_Contrasenia))

INSERT INTO [dbo].[tbUsuarios]
           ([usu_Usuario]
           ,[usu_Contrasenia]
           ,[emp_Id]
           ,[rol_id]
           ,[usu_UsuarioCreacion]
           ,[usu_FechaCreacion]
           ,[usu_UsuarioModificacion]
           ,[usu_FechaModificacion]
           ,[usu_Estado])
     VALUES
           (@usu_Usuario
           ,@Password
           ,@emp_Id
		   ,@rol_id
           ,@usu_UsuarioCreacion
           ,GetDate()
           ,null
           ,null
           ,1)

END
GO

EXEC UDP_InsertarUsuario 'Donal2','Donal2',7,4,1


--Editar Usuario 
GO
CREATE OR ALTER PROCEDURE UDP_EdicionUsuario
	@usu_Id INT,
	@emp_Id int,
	@rol_id	INT,
	@usuarioModificacion int
AS
BEGIN


UPDATE [dbo].[tbUsuarios]
   SET [emp_Id] = @emp_Id
      ,[usu_UsuarioModificacion] = @usuarioModificacion
	  ,rol_id = @rol_id
      ,[usu_FechaModificacion] = GetDate()
      ,[usu_Estado] = 1
 WHERE usu_Id = @usu_Id


END
GO


--borrar Usuario
CREATE OR ALTER PROCEDURE UDP_BorrarUsuario
	@IdEdicion INT
AS
BEGIN

UPDATE [dbo].[tbUsuarios]
   SET [usu_Estado] = 0
 WHERE usu_Id = @IdEdicion


END
GO
GO
--view usuarios
CREATE VIEW VW_UsuariosIndex
AS
(
SELECT [usu_Id]
      ,[usu_Usuario]
      ,[usu_Contrasenia]
      ,T1.[emp_Id]
	  ,t2.emp_Nombre
	  ,t2.emp_Apellido
      ,T1.[rol_id]
	  ,T3.rol_Nombre
      ,[usu_UsuarioCreacion]
      ,[usu_FechaCreacion]
      ,[usu_UsuarioModificacion]
      ,[usu_FechaModificacion]
      ,[usu_Estado]
  FROM [dbPedidosEncargos].[dbo].[tbUsuarios] T1 INNER	JOIN	tbEmpleados T2
  ON T1.emp_Id = t2.emp_Id INNER JOIN tbRoles T3
  ON t3.rol_id = t1.rol_id
  WHERE T1.usu_Estado = 1
  )
GO

-- Procedimiento Almacenado de Direcciones

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
CREATE OR ALTER PROCEDURE UDP_tbDirecciones_Insert (@dire_Calle  NVARCHAR(250), @dire_Comuna 	NVARCHAR(250), @mun_Id	NVARCHAR(4), @cli_Id INT, @dire_UsuarioCreacion INT)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @dire_FechaCreacion  		DATETIME = GETDATE();
	DECLARE @dire_Estado 				BIT = 1;

    -- Insert statements for procedure here
	INSERT INTO tbDirecciones ([dire_Calle], [dire_Comuna], [mun_Id], [cli_Id], [dire_FechaCreacion], [dire_UsuarioCreacion], [dire_FechaModificacion], [dire_UsuarioModificacion], [dire_Estado])
	VALUES (@dire_Calle, @dire_Comuna, @mun_Id, @cli_Id, @dire_FechaCreacion, @dire_UsuarioCreacion, null,null, @dire_Estado)
END
GO


GO
CREATE OR ALTER PROCEDURE UDP_tbDirecciones_Update (@dire_ID INT , @dire_Calle  NVARCHAR(250), @dire_Comuna 	NVARCHAR(250), @mun_Id	NVARCHAR(4), @cli_Id INT, @dire_UsuarioModificacion INT)
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
GO
CREATE OR ALTER PROCEDURE UDP_tbDepartamentos_Insert
    @dep_Id NVARCHAR(4),
    @dep_Nombre NVARCHAR(150),
	@dep_UsuarioCreacion INT

AS
BEGIN
    INSERT INTO tbDepartamentos([dep_Id],[dep_Nombre], [dep_FechaCreacion], [dep_UsuarioCreacion], [dep_FechaModificacion], [dep_UsuarioModificacion], [dep_Estado]) 
    VALUES (@dep_Id, @dep_Nombre, GETDATE(), @dep_UsuarioCreacion, NULL, NULL, 1);
END

GO
CREATE PROCEDURE UDP_tbDepartamentos_Update
    @dep_Id CHAR(2),
    @dep_Nombre NVARCHAR(200),
    @dep_UsuarioModificacion INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE tbDepartamentos
    SET dep_Nombre = @dep_Nombre,
        dep_FechaModificacion = GETDATE(),
        dep_UsuarioModificacion = @dep_UsuarioModificacion
    WHERE dep_Id = @dep_Id;
END


GO
CREATE OR ALTER PROCEDURE UDP_tbDepartamentos_Delete
	@dep_Id CHAR(2)
AS
BEGIN


UPDATE [dbo].[tbDepartamentos]
   SET [dep_Estado] = 0
 WHERE [dep_Id] = @dep_Id


END
GO
------------------------------------------------------------------------------



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
GO
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
GO
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
GO
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

--Triger para Borar Un Articulo articulos
GO
CREATE TRIGGER trg_AumentarStockluegoBorrar
   ON [dbo].[tbPedidosDetalles]
   AFTER Delete
AS 
BEGIN
	

	DECLARE @NuevoStock int = (select t1.art_Stock from [tbArticulos] as t1 WHERE t1.art_Id = (select t1.art_Id from deleted as t1)) + (select t1.pede_Cantidad from deleted as t1 WHERE t1.art_Id = (select t1.art_Id from deleted as t1))

UPDATE [dbo].[tbArticulos]
   SET [art_Stock] = @NuevoStock
 WHERE art_Id = (select t1.art_Id from deleted as t1)


END
GO
go


--Triger para disminuir la cantidad de los articulos

go
CREATE TRIGGER trg_DisminuirStock
   ON  [dbo].[tbPedidosDetalles]
   AFTER INSERT
AS 
BEGIN
	
	DECLARE @NuevoStock int = (select t1.art_Stock from [tbArticulos] as t1 WHERE t1.art_Id = (select t1.art_Id from inserted as t1)) - (select t1.pede_Cantidad from inserted as t1 WHERE t1.art_Id = (select t1.art_Id from inserted as t1))

UPDATE [dbo].[tbArticulos]
   SET [art_Stock] = @NuevoStock
 WHERE art_Id = (select t1.art_Id from inserted as t1)


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
GO
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
	@emp_UsuarioCreacion INT
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
           ,@emp_UsuarioCreacion
           ,null
           ,null
           ,1)



END
GO





-- Procedimiento de Update Empleados
GO
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
GO
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
GO
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
GO
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
GO
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
GO
CREATE OR ALTER PROCEDURE UDP_tbCategorias_Delete
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
GO
CREATE PROCEDURE UDP_tbfabrica_Select
AS
BEGIN
    SELECT fab_id, fab_Nombre, mun_Id, fab_Telefono, fab_FechaCreacion, fab_UsuarioCreacion, fab_FechaModificacion, fab_UsuarioModificacion, fab_Estado
    FROM tbFabricas
    WHERE fab_Estado = 1;
END


-- Procedimiento de Insertar Fabrica

GO
CREATE OR ALTER PROCEDURE UDP_tbFabrica_Insert
    @fab_Nombre NVARCHAR(150),
    @mun_Id CHAR(4),
	@fab_DireccionExacta NVARCHAR(250),
    @fab_Telefono NVARCHAR(20),
    @usuario INT
AS
BEGIN
    INSERT INTO tbFabricas (fab_Nombre, mun_Id, fab_DireccionExacta, fab_Telefono, fab_FechaCreacion, fab_UsuarioCreacion, fab_FechaModificacion, fab_UsuarioModificacion, fab_Estado)
    VALUES (@fab_Nombre , @mun_Id, @fab_DireccionExacta, @fab_Telefono, GETDATE() , @usuario, NULL, NULL, 1);
END
GO

-- Procedimiento de Update Fabricaj
GO
CREATE OR ALTER PROCEDURE UDP_tbfabrica_Update
    @fab_id INT,
    @fab_Nombre NVARCHAR(150),
    @mun_Id CHAR(4),
	@fab_DireccionExacta NVARCHAR(250),
    @fab_Telefono NVARCHAR(20),
    @usuario INT
AS
BEGIN
    UPDATE tbFabricas
    SET  fab_Nombre = @fab_Nombre,
         mun_Id = @mun_Id,
        fab_DireccionExacta = @fab_DireccionExacta,
        fab_Telefono = @fab_Telefono,
        fab_FechaModificacion = GETDATE(),
        fab_UsuarioModificacion = @usuario
    WHERE fab_Id = @fab_id;
END
GO

GO
CREATE PROCEDURE UDP_tbfabrica_Delete (
    @fab_Id INT, @fab_UsuarioModificacion INT
)
AS
BEGIN
    UPDATE tbFabricas
    SET fab_Estado = 0,
        fab_FechaModificacion = GETDATE(),
        fab_UsuarioModificacion = @fab_UsuarioModificacion 
    WHERE fab_Id = @fab_Id
END


-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
--Procedimiento almacenado Select / Index tbArticulos
GO
CREATE PROCEDURE UDP_tbArticulos_Select
AS
BEGIN
    SELECT art_Id, art_Nombre, art_Precio, cat_Id,  art_Stock, art_FechaCreacion, art_UsuarioCreacion, art_FechaModificacion, art_UsuarioModificacion, art_Estado
    FROM tbArticulos
    WHERE art_Estado = 1;
END

--Procedimiento almacenado Insert tbArticulos
GO
CREATE OR ALTER PROCEDURE UDP_tbArticulos_Insert
    @art_Nombre NVARCHAR(200),
    @art_Precio DECIMAL(18, 2),
    @cat_Id INT,
    @art_Stock INT,
    @art_Fabrica INT,
    @art_UsuarioCreacion INT

AS
BEGIN
    INSERT INTO tbArticulos ([art_Nombre], [art_Precio], [cat_Id],  [fab_id], [art_Stock], [art_FechaCreacion], [art_UsuarioCreacion], [art_FechaModificacion], [art_UsuarioModificacion], [art_Estado] )
    VALUES (@art_Nombre, @art_Precio, @cat_Id, @art_Stock, @art_Fabrica,  GETDATE(), @art_UsuarioCreacion, NULL, NULL, 1);
END

--Procedimiento almacenado Update tbArticulos
GO
CREATE OR ALTER PROCEDURE UDP_tbArticulo_Update
    @art_Id INT,
    @art_Nombre NVARCHAR(200),
    @art_Precio DECIMAL(18, 2),
    @cat_Id INT,
    @art_Stock INT,
    @art_Fabrica INT,
    @art_UsuarioCreacion INT
AS
BEGIN
    UPDATE tbArticulos
    SET art_Nombre = @art_Nombre,
        art_Precio = @art_Precio,
        cat_Id    = @cat_id,
        art_Stock = @art_Stock,
        [fab_id] = @art_Fabrica,
        art_FechaModificacion = GETDATE(),
        art_UsuarioModificacion =  @art_UsuarioCreacion 
    WHERE art_Id = @art_Id
END

--Procedimiento almacenado Delete tbArticulos
GO
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
GO
CREATE PROCEDURE UDP_tbClientes_Insert
    @cli_Nombre NVARCHAR(100),
    @cli_Apellido NVARCHAR(100),
    @cli_Telefono NVARCHAR(20),
    @cli_CorreoElectronico NVARCHAR(100),
    @cli_saldo DECIMAL(16,2),
    @cli_LimiteCredito DECIMAL(16,2),
    @cli_Descuento DECIMAL(16,2),
    @cli_UsuarioCreacion INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO tbClientes([cli_Nombre], [cli_Apellido], [cli_Telefono], [cli_CorreoElectronico], [cli_saldo], [cli_LimiteCredito], [cli_Descuento], [cli_FechaCreacion], [cli_UsuarioCreacion], [cli_FechaModificacion], [cli_UsuarioModificacion], [cli_Estado])
    VALUES (@cli_Nombre, @cli_Apellido, @cli_Telefono, @cli_CorreoElectronico, @cli_saldo, @cli_LimiteCredito, @cli_Descuento, GETDATE(), @cli_UsuarioCreacion, NULL,  NULL	, 1)
END
GO
--Procedimiento almacenado Update tbClientes
GO
CREATE PROCEDURE UDP_tbClientes_Update
    @cli_Id INT,
    @cli_Nombre NVARCHAR(100),
    @cli_Apellido NVARCHAR(100),
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
GO
CREATE PROCEDURE UDP_tbClientes_Delete (
    @cli_Id INT, @cli_UsuarioModificacion INT
)
AS
BEGIN
    UPDATE tbClientes
    SET cli_Estado = 0,
        cli_FechaModificacion = GETDATE(),
        cli_UsuarioModificacion = @cli_UsuarioModificacion 
    WHERE cli_Id = @cli_Id
END

--Procedimiento Almacenado Insert MetodoPago
GO
CREATE PROCEDURE UDP_tbMetodoPago_Insert
(
    @metpago_Descripcion             NVARCHAR (100),
    @metpago_UsuarioCreacion         INT
)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO tbMetodoPago ([metpago_Descripcion], [metpago_FechaCreacion], [metpago_UsuarioCreacion], [metpago_FechaModificacion], [metpago_UsuarioModificacion], [metpago_Estado])
    VALUES (@metpago_Descripcion, GETDATE(), @metpago_UsuarioCreacion, NULL, NULL, 1);
END

--Procedimiento Almacenado Update MetodoPago
GO
CREATE PROCEDURE UDP_tbMetodoPago_Update
	@metpago_Id                      INT,
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

--Procedimiento Almacenado Delete MetodoPago
GO
CREATE PROCEDURE UDP_tbMetodoPago_Delete (
    @metpago_Id INT, @metpago_UsuarioModificacion INT
)
AS
BEGIN
    UPDATE tbMetodoPago
    SET metpago_Estado = 0,
        metpago_FechaModificacion = GETDATE(),
        metpago_UsuarioModificacion = @metpago_UsuarioModificacion 
    WHERE  metpago_Id = @metpago_Id
END


--Procedimiento Almacenado Insert Pedidos
GO
CREATE PROCEDURE UDP_tbPedidos_Insert
    @cli_Id INT,
    @dire_Id INT,
    @emp_Id INT,
    @metpago_Id INT,
    @ped_UsuarioCreacion INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO tbPedidos([cli_Id], [ped_Fecha], [dire_id], [emp_id], [metpago_Id], [ped_FechaCreacion], [ped_UsuarioCreacion], [ped_FechaModificacion], [ped_UsuarioModificacion], [ped_Estado])
    VALUES(@cli_Id, GETDATE(), @dire_Id, @emp_Id, @metpago_Id, GETDATE(), @ped_UsuarioCreacion, NULL, NULL, 1)
END
GO
--Procedimiento Almacenado U[date Pedidos
GO
CREATE PROCEDURE UDP_tbpedidos_Update
    @ped_Id int,
    @cli_Id int,
    @dire_id int,
    @emp_id int,
    @metpago_Id INT,
    @ped_UsuarioModificacion int
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE tbPedidos
    SET cli_Id = @cli_Id,
        dire_id = @dire_id,
        emp_id = @emp_id,
        metpago_Id = @metpago_Id,
        ped_FechaModificacion = GETDATE(),
        ped_UsuarioModificacion = @ped_UsuarioModificacion,
        ped_Estado = 1
    WHERE ped_Id = @ped_Id;
END
GO
--Procedimiento Almacenado Delete Pedidos
GO
CREATE PROCEDURE UDP_tbpedidos_Delete (
    @ped_Id INT, @ped_UsuarioModificacion INT
)
AS
BEGIN
    UPDATE tbPedidos
    SET ped_Estado = 0,
        ped_FechaModificacion = GETDATE(),
        ped_UsuarioModificacion = @ped_UsuarioModificacion 
    WHERE ped_Id = @ped_Id
END
GO

--Procedimiento Almacenado Insert PedidosDetalle
--GO
--CREATE PROCEDURE UDP_PedidoDetalle_Insert
--    @ped_Id INT,
--    @art_Id INT,
--    @pede_cantidad INT,
--    @pede_Precio DECIMAL(18,2),
--    @pede_UsuarioCreacion INT
--AS
--BEGIN
--    SET NOCOUNT ON;

--    -- Insertar el nuevo registro
--    INSERT INTO tbPedidosDetalles ([ped_Id], [art_Id], [pede_Cantidad], [pede_Precio], [pede_FechaCreacion], [pede_UsuarioCreacion], [pede_FechaModificacion], [pede_UsuarioModificacion], [pede_Estado])
--    VALUES (@ped_Id, @art_Id, @pede_cantidad, @pede_Precio, GETDATE(), @pede_UsuarioCreacion, NULL, NULL,  1);
--END
--GO

GO
CREATE OR ALTER PROCEDURE UDP_PedidoDetalle_Insert
    @ped_Id INT,
    @art_Id INT,
    @pede_cantidad INT,
    @pede_UsuarioCreacion INT
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @precio DECIMAL(18,2) = (SELECT art_Precio FROM tbArticulos WHERE art_Id = @art_Id)
    -- Insertar el nuevo registro
    INSERT INTO tbPedidosDetalles ([ped_Id], [art_Id], [pede_Cantidad], [pede_Precio], [pede_FechaCreacion], [pede_UsuarioCreacion], [pede_FechaModificacion], [pede_UsuarioModificacion], [pede_Estado])
    VALUES (@ped_Id, @art_Id, @pede_cantidad, @precio, GETDATE(), @pede_UsuarioCreacion, NULL, NULL,  1);
END
GO

--Procedimiento Almacenado Update PedidosDetalle
GO
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
    
    UPDATE tbPedidosDetalles
    SET ped_Id = @ped_Id,
        art_Id = @art_Id,
        pede_Cantidad = @pede_Cantidad,
        pede_Precio = @pede_Precio,
        pede_FechaModificacion = GETDATE(),
        pede_UsuarioModificacion = @pede_UsuarioModificacion
    WHERE pede_Id = @pede_Id;
END

--Procedimiento Almacenado Delete PedidosDetalle
GO
CREATE PROCEDURE UDP_PedidoDetalle_Delete (
    @pede_Id INT, @pede_UsuarioModificacion INT
)
AS
BEGIN
    UPDATE tbPedidosDetalles
    SET pede_Estado = 0,
        pede_FechaModificacion = GETDATE(),
        pede_UsuarioModificacion = @pede_UsuarioModificacion 
    WHERE pede_Id = @pede_Id
END
GO




--Login
GO
CREATE OR ALTER PROCEDURE UDP_Login
	@usu_Usuario Nvarchar(100),
	@usu_Contrasenia Nvarchar(Max)
AS
BEGIN

Declare @Password Nvarchar(max) = (HASHBYTES('SHA2_512',@usu_Contrasenia))

SELECT [usu_Id]
      ,[usu_Usuario]
      ,[usu_Contrasenia]
      ,T1.[emp_Id]
	  ,t2.emp_Nombre + ' ' + t2.emp_Apellido as emp_Nombre 
      ,[usu_UsuarioCreacion]
      ,[usu_FechaCreacion]
      ,[usu_UsuarioModificacion]
      ,[usu_FechaModificacion]
      ,[usu_Estado]
	  ,T1.rol_id
  FROM [tbUsuarios] T1 INNER JOIN [dbo].[tbEmpleados] T2
  ON T1.emp_Id = T2.emp_Id
  WHERE t1.usu_Contrasenia = @Password 
  AND t1.usu_Usuario = @usu_Usuario

END
GO



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
           ,[usu_Estado]
           ,rol_id)
     VALUES
           ('admin',HASHBYTES('SHA2_512','admin'),1,1,GETDATE(),null,null,1,1)
GO

INSERT	INTO dbo.tbPantallas
(
    pan_Nombre,
    pan_UsuarioCreacion,
    pan_FechaCreacion,
    pan_UsuarioModificacion,
    pan_FechaModificacion,
    pan_Estado
)
VALUES
('Clientes/Direcciones', 1, GETDATE(),null, null, 1 ),
('Pedidos/Detalles', 1, GETDATE(),null, null, 1 ),
('Articulos', 1, GETDATE(),null, null, 1 ),
('Categorias', 1, GETDATE(),null, null, 1 ),
('Cargos', 1, GETDATE(),null, null, 1 ),
('Fabricas', 1, GETDATE(),null, null, 1 ),
('Usuarios', 1, GETDATE(),null, null, 1 ),
('Municipios', 1, GETDATE(),null, null, 1 ),
('Departamentos', 1, GETDATE(),null, null, 1 ),
('Estados Civiles', 1, GETDATE(),null, null, 1 ),
('Empleados', 1, GETDATE(),null, null, 1 )

INSERT	INTO dbo.tbRoles
(
    rol_Nombre,
    rol_UsuarioCreacion,
    rol_FechaCreacion,
    rol_UsuarioModificacion,
    rol_FechaModificacion,
    rol_Estado
)
VALUES
('Admin',1,GETDATE(),NULL,NULL, 1),	
('Gestor',1,GETDATE(),NULL,NULL, 1),	
('Vendedor',1,GETDATE(),NULL,NULL, 1),	
('Repartidor',1,GETDATE(),NULL,NULL, 1),	
('Recursos Humanos',1,GETDATE(),NULL,NULL, 1)	


INSERT INTO [dbo].[tbDepartamentos]
VALUES ('01', 'Atlántida', GETDATE(), 1,null,null,1),
	   ('02', 'Colón', GETDATE(), 1,null,null,1),
	   ('03', 'Comayagua', GETDATE(), 1,null,null,1),
	   ('04', 'Copán', GETDATE(), 1,null,null,1),
	   ('05', 'Cortés', GETDATE(), 1,null,null,1),
	   ('06', 'Choluteca', GETDATE(), 1,null,null,1),
	   ('07', 'El Paraíso', GETDATE(), 1,null,null,1),
	   ('08', 'fabncisco Morazán', GETDATE(), 1,null,null,1),
	   ('09', 'Gracias a Dios', GETDATE(), 1,null,null,1),
	   ('10', 'Intibucá', GETDATE(), 1,null,null,1),
	   ('11', 'Islas de la Bahía', GETDATE(), 1,null,null,1),
	   ('12', 'La Paz', GETDATE(), 1,null,null,1),
	   ('13', 'Lempira', GETDATE(), 1,null,null,1),
	   ('14', 'Ocotepeque', GETDATE(), 1,null,null,1),
	   ('15', 'Olancho', GETDATE(), 1,null,null,1),
	   ('16', 'Santa Bárbara', GETDATE(), 1,null,null,1),
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
      ('0405','Corquén','04', 1, GETDATE(), 1),
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
      ('0705','Gáinope','07', 1, GETDATE(), 1),
	  ('0801','Distrito Central (Comayagüela y Tegucigalpa)','08', 1, GETDATE(), 1),
      ('0802','Alubarón','08', 1, GETDATE(), 1),
      ('0803','Cedros','08', 1, GETDATE(), 1),
      ('0804','Curarón','08', 1, GETDATE(), 1),
	  ('0805','El Porvenir','08', 1, GETDATE(), 1),
	  ('0901','Puerto Lempira','09', 1, GETDATE(), 1),
      ('0902','Brus Laguna','09', 1, GETDATE(), 1),
      ('0903','Ahuas','09', 1, GETDATE(), 1),
	  ('0904','Juan fabncisco Bulnes','09', 1, GETDATE(), 1),
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
      ('1302','Belón','13', 1, GETDATE(), 1),
      ('1303','Candelaria','13', 1, GETDATE(), 1),
	  ('1304','Cololaca','13', 1, GETDATE(), 1),
      ('1305','Erandique','13', 1, GETDATE(), 1),
	  ('1401','Ocotepeque','14', 1, GETDATE(), 1),
      ('1402','Belón Gualcho','14', 1, GETDATE(), 1),
      ('1403','Concepción','14', 1, GETDATE(), 1),
	  ('1404','Dolores Merendón','14', 1, GETDATE(), 1),
      ('1405','fabternidad','14', 1, GETDATE(), 1),
	  ('1501','Juticalpa','15', 1, GETDATE(), 1),
      ('1502','Campamento','15', 1, GETDATE(), 1),
      ('1503','Catacamas','15', 1, GETDATE(), 1),
	  ('1504','Concordia','15', 1, GETDATE(), 1),
      ('1505','Dulce Nombre de Culmá','15', 1, GETDATE(), 1),
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
                ('Vendedor',GetDate(),1,null,null,1),
                ('Recepcionista',GetDate(),1,null,null,1)

--INSERT INTO [dbo].[tbEmpleados]
--           ([emp_Nombre]
--           ,[emp_Apellido]
--           ,[emp_Sexo]
--           ,[mun_Id]
--           ,[emp_DireccionExacta]
--           ,[estciv_Id]
--           ,[emp_Telefono]
--           ,[emp_CorreoElectronico]
--           ,[emp_FechaNacimiento]
--           ,[emp_FechaContratacion]
--           ,[car_Id]
--           ,[emp_FechaCreacion]
--           ,[emp_UsuarioCreacion]
--           ,[emp_FechaModificacion]
--           ,[emp_UsuarioModificacion]
--           ,[emp_Estado])
--     VALUES
--           ('Daniel','Espinoza' ,'M','0501' ,'Col. Municipal','S' ,'87756952' ,'daniele09099@gmail.com','02-04-2005' ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
--           ('Selvin','Medina' ,'M','0501' ,'Rivera','C' ,'98552231' ,'selvinmedi@gmail.com','20-06-2004' ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
--           ('Christpher','Aguilar' ,'M','0501' ,'Col. Satelite','U' ,'77450210' ,'agilarchris@gmail.com','03-10-2004' ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
--           ('Alessia','Medina' ,'F','0501' ,'Col. Miguel Angel Pavon','S' ,'99864520' ,'aless65@gmail.com','06-05-2005' ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
--           ('Axel','Gomez' ,'M','0501' ,'Bosques de Jucutuma','C' ,'50220345' ,'Gomez03@gmail.com','10-02-2003' ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
--           ('Angie','Rolitas' ,'F','0501' ,'Col. Felipe','S' ,'88541230' ,'rolitaAngie@gmail.com','12-07-2005' ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
--           ('Dua','Lipa' ,'F','0501' ,'Rio de piedras','S' ,'00000000' ,'lipa1995@gmail.com','22-08-1995' ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
--           ('Daniel','Espinoza' ,'M','0501' ,'Col. Municipal','S' ,'87756952' ,'daniele09099@gmail.com','02-04-2005' ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
--           ('Daniel','Espinoza' ,'M','0501' ,'Col. Municipal','S' ,'87756952' ,'daniele09099@gmail.com','02-04-2005' ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
--           ('Daniel','Espinoza' ,'M','0501' ,'Col. Municipal','S' ,'87756952' ,'daniele09099@gmail.com','02-04-2005' ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
--           ('Daniel','Espinoza' ,'M','0501' ,'Col. Municipal','S' ,'87756952' ,'daniele09099@gmail.com','02-04-2005' ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
--           ('Daniel','Espinoza' ,'M','0501' ,'Col. Municipal','S' ,'87756952' ,'daniele09099@gmail.com','02-04-2005' ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1)
--GO


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
           ('Daniel','Espinoza' ,'M','0501' ,'Col. Municipal','S' ,'87756952' ,'daniele09099@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Selvin','Medina' ,'M','0501' ,'Rivera','C' ,'98552231' ,'selvinmedi@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Christpher','Aguilar' ,'M','0501' ,'Col. Satelite','U' ,'77450210' ,'agilarchris@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Alessia','Medina' ,'F','0501' ,'Col. Miguel Angel Pavon','S' ,'99864520' ,'aless65@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Axel','Gomez' ,'M','0501' ,'Bosques de Jucutuma','C' ,'50220345' ,'Gomez03@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Angie','Rolitas' ,'F','0501' ,'Col. Felipe','S' ,'88541230' ,'rolitaAngie@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Dua','Lipa' ,'F','0501' ,'Rio de piedras','S' ,'00000000' ,'lipa1995@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Pitbull','Perez' ,'M','0501' ,'Rio de piedras','S' ,'00000000' ,'pitbull@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Michael','Jackson' ,'M','0501' ,'Rio de piedras','S' ,'00000000' ,'Jackson@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Lady','Gaga' ,'F','0501' ,'Rio de piedras','S' ,'00000000' ,'gaga@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Lionel','Messi' ,'M','0501' ,'Rio de piedras','S' ,'00000000' ,'Messi@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Cristiano','Ronaldo' ,'M','0501' ,'Rio de piedras','S' ,'00000000' ,'ElBicho@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1)
GO


ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbUsuarios_usu_UsuarioCreacion_usu_Id FOREIGN KEY([usu_UsuarioCreacion]) REFERENCES tbUsuarios(usu_Id);

GO

ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbUsuarios_usu_UsuarioModificacion_usu_Id FOREIGN KEY([usu_UsuarioModificacion]) REFERENCES tbUsuarios(usu_Id);

GO

ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbEmpleados_emp_Id FOREIGN KEY([emp_Id]) REFERENCES tbEmpleados([emp_Id]);


GO

ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbRoles_rol_Id FOREIGN KEY([rol_Id]) REFERENCES tbRoles([rol_Id]);

INSERT INTO [dbo].[tbMetodoPago]
           ([metpago_Descripcion]
           ,[metpago_FechaCreacion]
           ,[metpago_UsuarioCreacion]
           ,[metpago_FechaModificacion]
           ,[metpago_UsuarioModificacion]
           ,[metpago_Estado])
     VALUES
           ('Efectivo',GetDate(),1,null ,null,1),
           ('Tarjeta de Credito',GetDate(),1,null ,null,1),
           ('Tarjeta de Debito',GetDate(),1,null ,null,1)
GO


INSERT	INTO dbo.tbPantallas
(
    pan_Nombre,
    pan_UsuarioCreacion,
    pan_FechaCreacion,
    pan_UsuarioModificacion,
    pan_FechaModificacion,
    pan_Estado
)
VALUES
('Clientes/Dirreciones',1,GETDATE(), NULL,NULL,1),
('Pedidos/Detalles',1,GETDATE(), NULL,NULL,1),
('Articulos',1,GETDATE(), NULL,NULL,1),
('Categorias',1,GETDATE(), NULL,NULL,1),
('Cargos',1,GETDATE(), NULL,NULL,1),
('Fabricas',1,GETDATE(), NULL,NULL,1),
('Usuarios',1,GETDATE(), NULL,NULL,1),
('Municipios',1,GETDATE(), NULL,NULL,1),
('Departamentos',1,GETDATE(), NULL,NULL,1),
('Estados Civiles',1,GETDATE(), NULL,NULL,1),
('Empleados',1,GETDATE(), NULL,NULL,1)




INSERT	INTO dbo.tbRoles
(
    rol_Nombre,
    rol_UsuarioCreacion,
    rol_FechaCreacion,
    rol_UsuarioModificacion,
    rol_FechaModificacion,
    rol_Estado
)
VALUES
('Admin',1,GETDATE(), NULL	,NULL,1),
('Gestor',1,GETDATE(), NULL	,NULL,1),
('Vendedor',1,GETDATE(), NULL	,NULL,1),
('Repartidor',1,GETDATE(), NULL	,NULL,1),
('Recursos Humanos',1,GETDATE(), NULL	,NULL,1)

INSERT	INTO	dbo.tbRolesXPantalla
(
    rol_id,
    pan_id,
    ropa_UsuarioCreacion,
    ropa_FechaCreacion,
    ropa_UsuarioModificacion,
    ropa_FechaModificacion,
    ropa_Estado
)
VALUES
(1,1,1,GETDATE(),NULL,NULL,1),
(1,2,1,GETDATE(),NULL,NULL,1),
(1,3,1,GETDATE(),NULL,NULL,1),
(1,4,1,GETDATE(),NULL,NULL,1),
(1,5,1,GETDATE(),NULL,NULL,1),
(1,6,1,GETDATE(),NULL,NULL,1),
(1,7,1,GETDATE(),NULL,NULL,1),
(1,8,1,GETDATE(),NULL,NULL,1),
(1,9,1,GETDATE(),NULL,NULL,1),
(1,10,1,GETDATE(),NULL,NULL,1),
(1,11,1,GETDATE(),NULL,NULL,1),
(2,3,1,GETDATE(),NULL,NULL,1),
(2,4,1,GETDATE(),NULL,NULL,1),
(2,5,1,GETDATE(),NULL,NULL,1),
(2,6,1,GETDATE(),NULL,NULL,1),
(2,8,1,GETDATE(),NULL,NULL,1),
(2,9,1,GETDATE(),NULL,NULL,1),
(2,10,1,GETDATE(),NULL,NULL,1),
(3,1,1,GETDATE(),NULL,NULL,1),
(3,2,1,GETDATE(),NULL,NULL,1),
(4,2,1,GETDATE(),NULL,NULL,1),
(5,7,1,GETDATE(),NULL,NULL,1),
(5,11,1,GETDATE(),NULL,NULL,1)

--Categorias
INSERT INTO [dbo].[tbCategoria]
           ([cat_Descripcion]
           ,[cat_FechaCreacion]
           ,[cat_UsuarioCreacion]
           ,[cat_FechaModificacion]
           ,[cat_UsuarioModificacion]
           ,[cat_Estado])
     VALUES
           ('Botanas',GETDATE(),1,null,null,1),
		   ('Muebles de Casa',GETDATE(),1,null,null,1),
		   ('Prendas',GETDATE(),1,null,null,1),
		   ('Medicinal',GETDATE(),1,null,null,1),
		   ('Electronicos',GETDATE(),1,null,null,1),
		   ('Sustancias ilegales',GETDATE(),1,null,null,1),
		   ('Materia Prima',GETDATE(),1,null,null,1),
		   ('Consumo Basico',GETDATE(),1,null,null,1),
		   ('Limpieza Personal',GETDATE(),1,null,null,1),
		   ('Limpieza',GETDATE(),1,null,null,1)

GO

--Fabricas


INSERT INTO [dbo].[tbFabricas]
           ([fab_Nombre], [mun_Id], [fab_DireccionExacta], [fab_Telefono], [fab_FechaCreacion], [fab_UsuarioCreacion], [fab_FechaModificacion], [fab_UsuarioModificacion], [fab_Estado])
     VALUES
           ('The Willy Wonka Candy Company' ,'0501', '7 calle, 10 ave, sps ','55484578',GETDATE(),1,NULL ,NULL,1),
			('Apple' ,'0501', '10 calle, 10 ave, sps ','55484578',GETDATE(),1,NULL ,NULL,1),
			('Saudi Aramco' ,'0501', '1 calle, 113 ave, sps ','55484578',GETDATE(),1,NULL ,NULL,1),
			('Microsoft' ,'0501', '5 calle, 5 ave, sps ','55484578',GETDATE(),1,NULL ,NULL,1),
			('Alphabet (Google)' ,'0501', '7 calle, 10 ave, sps ','55484578',GETDATE(),1,NULL ,NULL,1),
			('Amazon' ,'0501', '7 calle, 10 ave, sps ','55484578',GETDATE(),1,NULL ,NULL,1),
			('Tesla' ,'0501', '7 calle, 10 ave, sps ','55484578',GETDATE(),1,NULL ,NULL,1),
			('Meta (Facebook)' ,'0501', '7 calle, 10 ave, sps ','55484578',GETDATE(),1,NULL ,NULL,1),
			('Berkshire Hathaway' ,'0501', '7 calle, 10 ave, sps ','55484578',GETDATE(),1,NULL ,NULL,1),
			('TSMC' ,'0501', '7 calle, 10 ave, sps ','55484578',GETDATE(),1,NULL ,NULL,1)


GO


---Articulos
INSERT INTO tbArticulos (art_Nombre, art_Precio, cat_Id, art_Stock, fab_id, art_FechaCreacion, art_UsuarioCreacion, art_Estado)
VALUES ('Silla de madera', 50.00, 1, 10, 1, GETDATE(), 1, 1);
INSERT INTO tbArticulos (art_Nombre, art_Precio, cat_Id, art_Stock, fab_id, art_FechaCreacion, art_UsuarioCreacion, art_Estado)
VALUES ('Computadora portátil', 1000.00, 5, 5, 1, GETDATE(), 1, 1);
INSERT INTO tbArticulos (art_Nombre, art_Precio, cat_Id, art_Stock, fab_id, art_FechaCreacion, art_UsuarioCreacion, art_Estado)
VALUES ('Vestido de gala', 200.00, 3, 3, 3, GETDATE(), 1, 1);
INSERT INTO tbArticulos (art_Nombre, art_Precio, cat_Id, art_Stock, fab_id, art_FechaCreacion, art_UsuarioCreacion, art_Estado)
VALUES ('Toallas de baño', 10.00, 9, 20, 4, GETDATE(), 1, 1);
INSERT INTO tbArticulos (art_Nombre, art_Precio, cat_Id, art_Stock, fab_id, art_FechaCreacion, art_UsuarioCreacion, art_Estado)
VALUES ('iPhone 13', 1200.00, 5, 7, 3, GETDATE(), 1, 1);
INSERT INTO tbArticulos (art_Nombre, art_Precio, cat_Id, art_Stock, fab_id, art_FechaCreacion, art_UsuarioCreacion, art_Estado)
VALUES ('Teclado mecánico', 80.00, 5, 30, 6, '2022-02-01 10:00:00', 1, 1);
INSERT INTO tbArticulos (art_Nombre, art_Precio, cat_Id, art_Stock, fab_id, art_FechaCreacion, art_UsuarioCreacion, art_FechaModificacion, art_UsuarioModificacion, art_Estado)
VALUES ('Camisa blanca', 20.00, 3, 50, 3, '2022-01-01 12:00:00', 1, '2022-01-02 14:00:00', 1, 1);
INSERT INTO tbArticulos (art_Nombre, art_Precio, cat_Id, art_Stock, fab_Id, art_FechaCreacion, art_UsuarioCreacion, art_Estado)
VALUES ('Lápiz bicolor Staedtler', 1.99, 3, 500, 10, GETDATE(), 1, 1);
INSERT INTO tbArticulos (art_Nombre, art_Precio, cat_Id, art_Stock, fab_Id, art_FechaCreacion, art_UsuarioCreacion, art_Estado)
VALUES ('Monitor LG 27 pulgadas', 189.99, 5, 50, 6, GETDATE(), 1, 1);
INSERT INTO tbArticulos (art_Nombre, art_Precio, cat_Id, art_Stock, fab_Id, art_FechaCreacion, art_UsuarioCreacion, art_Estado)
VALUES ('Teclado inalámbrico Logitech', 35.99, 5, 100, 5, GETDATE(), 1, 1);
INSERT INTO tbArticulos (art_Nombre, art_Precio, cat_Id, art_Stock, fab_id, art_FechaCreacion, art_UsuarioCreacion, art_Estado)
VALUES ('Papa frita', 1.50, 1, 500, 2, GETDATE(), 1, 1);
INSERT INTO tbArticulos (art_Nombre, art_Precio, cat_Id, art_Stock, fab_id, art_FechaCreacion, art_UsuarioCreacion, art_Estado)
VALUES ('Lámpara de mesa', 50.00, 2, 25, 6, GETDATE(), 1, 1);
INSERT INTO tbArticulos (art_Nombre, art_Precio, cat_Id, art_Stock, fab_id, art_FechaCreacion, art_UsuarioCreacion, art_Estado)
VALUES ('Jabón de tocador', 2.50, 9, 200, 10, GETDATE(), 1, 1);



INSERT INTO [dbo].[tbClientes]
           ([cli_Nombre]
           ,[cli_Apellido]
           ,[cli_Telefono]
           ,[cli_CorreoElectronico]
           ,[cli_saldo]
           ,[cli_LimiteCredito]
           ,[cli_Descuento]
           ,[cli_FechaCreacion]
           ,[cli_UsuarioCreacion]
           ,[cli_FechaModificacion]
           ,[cli_UsuarioModificacion]
           ,[cli_Estado])
     VALUES
           ('Daniel','Espinoza','32723854','daniele@gmail.com',100,400,0.05,GETDATE(),1,null,NULL,1)

--Direcciones

EXEC UDP_tbDirecciones_Insert '1ra calle, pasaje el sauce', 'Col. Satelite', '0501', 1, 1
EXEC UDP_tbDirecciones_Insert '2da calle', 'Col. Municipal', '0501', 1, 1
EXEC UDP_tbDirecciones_Insert '2da calle, pasaje Luisiana', 'Rivera', '0501', 1, 1
EXEC UDP_tbDirecciones_Insert '1ra calle, pasaje quintanilla', 'Col. Porvenir', '0501', 1, 1






--Pedidos
go
EXEC UDP_tbPedidos_Insert 1,1, 10,1,1
go
EXEC UDP_tbPedidos_Insert 1,1, 1,1,1
go
EXEC UDP_tbPedidos_Insert 1,1, 2,1,1
go
EXEC UDP_tbPedidos_Insert 1,1, 9,1,1
go




--Pedidos Detalles

EXEC UDP_PedidoDetalle_Insert 1, 2, 10, 1
EXEC UDP_PedidoDetalle_Insert 1, 5, 2, 1
EXEC UDP_PedidoDetalle_Insert 2, 9, 3, 1
EXEC UDP_PedidoDetalle_Insert 2, 11, 1, 1
EXEC UDP_PedidoDetalle_Insert 3, 3, 4, 1
EXEC UDP_PedidoDetalle_Insert 3, 7, 100 , 1
EXEC UDP_PedidoDetalle_Insert 4, 4, 2 , 1
EXEC UDP_PedidoDetalle_Insert 4, 8, 1 , 1

GO
CREATE OR ALTER VIEW VW_ClientesIndex
AS
SELECT [cli_Id]
      ,[cli_Nombre]
      ,[cli_Apellido]
      ,[cli_Telefono]
      ,[cli_CorreoElectronico]
      ,[cli_saldo]
      ,[cli_LimiteCredito]
      ,[cli_Descuento]
      ,[cli_FechaCreacion]
      ,[cli_UsuarioCreacion]
      ,[cli_FechaModificacion]
      ,[cli_UsuarioModificacion]
      ,[cli_Estado]
  FROM [dbPedidosEncargos].[dbo].[tbClientes]

GO

Create OR ALTER VIEW VW_DireccionesIndex
as
SELECT T2.cli_Id
		, cli_Nombre
		, cli_Apellido
		, cli_Telefono
		, cli_CorreoElectronico
		, cli_saldo
		, cli_LimiteCredito
		, cli_Descuento
		, cli_FechaCreacion
		, cli_UsuarioCreacion
		, cli_FechaModificacion
		, cli_UsuarioModificacion
		, cli_Estado
		,[dire_ID]
		,t1.[mun_Id]
		,T3.mun_Nombre
		,t3.dep_Id
		,t4.dep_Nombre
      ,[dire_Calle]
      ,[dire_Comuna]
      ,[dire_FechaCreacion]
      ,[dire_UsuarioCreacion]
      ,[dire_FechaModificacion]
      ,[dire_UsuarioModificacion]
      ,[dire_Estado]
  FROM [dbPedidosEncargos].[dbo].[tbDirecciones] T1 INNER JOIN [dbo].[tbClientes] T2
  ON t1.cli_Id = T2.cli_Id INNER JOIN [dbo].[tbMunicipios] T3
  ON t3.mun_Id = t1.mun_Id INNER JOIN [dbo].[tbDepartamentos] T4
  ON t4.dep_Id = t3.dep_Id
  WHERE T2.cli_Id = 1
  GO

CREATE PROCEDURE UDP_CargarMunicipios
@dep_Id VARCHAR(2)
AS
BEGIN
SELECT mun_Id,mun_Nombre FROM [dbo].[tbMunicipios] WHERE dep_Id= @dep_Id
END
GO




GO
Create Procedure UDP_tbMunicipiosInsert
@dep_Id Char(2),
@mun_Id Char(4),
@mun_Nombre Nvarchar(150),
@mun_UsuarioCreacion INT
as
begin

INSERT INTO [dbo].[tbMunicipios]
           ([mun_Id]
           ,[dep_Id]
           ,[mun_Nombre]
           ,[mun_FechaCreacion]
           ,[mun_UsuarioCreacion]
           ,[mun_FechaModificacion]
           ,[mun_UsuarioModificacion]
           ,[mun_Estado])
     VALUES
           (@mun_Id
           ,@dep_Id
           ,@mun_Nombre
           ,GETDATE()
           ,@mun_UsuarioCreacion
           ,NULL
           ,NULL
           ,1)

end 

GO


Create Procedure UDP_tbMunicipiosUpdate
@mun_Id Char(4),
@dep_Id Char(2),
@mun_Nombre Nvarchar(150),
@mun_UsuarioModificacion INT
as
begin

UPDATE [dbo].[tbMunicipios]
   SET [dep_Id] = @dep_Id
      ,[mun_Nombre] = @mun_Nombre
      ,[mun_FechaModificacion] = GETDATE()
      ,[mun_UsuarioModificacion] = @mun_UsuarioModificacion
 WHERE mun_Id = @mun_Id



end 
GO

Create Procedure UDP_tbMunicipiosDelete
@mun_Id Char(4)
as
begin

UPDATE [dbo].[tbMunicipios]
   SET mun_Estado = 0
 WHERE mun_Id = @mun_Id



end 
GO

CREATE OR ALTER	PROCEDURE UDP_tbEstadoCivilesInsert
@estciv_Id  CHAR(1),
@estciv_Nombre Varchar(200),
@estciv_UsuarioCreacion INT
as
begin
INSERT INTO [dbo].[tbEstadosCiviles]
           ([estciv_Id]
           ,[estciv_Nombre]
           ,[estciv_FechaCreacion]
           ,[estciv_UsuarioCreacion]
           ,[estciv_FechaModificacion]
           ,[estciv_UsuarioModificacion]
           ,[estciv_Estado])
     VALUES
           (@estciv_Id
           ,@estciv_Nombre
           ,GETDATE()
           ,@estciv_UsuarioCreacion
           ,NULL
           ,NULL
           ,1)

END

GO
CREATE OR ALTER	PROCEDURE UDP_tbEstadoCivilesUpdate
@Oldestciv_Id  CHAR(1),
@Newestciv_Id  CHAR(1),
@estciv_Nombre Varchar(200),
@estciv_UsuarioModificacion INT

as
begin

UPDATE [dbo].[tbEstadosCiviles]
   SET [estciv_Id] = @Newestciv_Id
      ,[estciv_Nombre] = @estciv_Nombre
      ,[estciv_FechaModificacion] = GETDATE()
      ,[estciv_UsuarioModificacion] = @estciv_UsuarioModificacion
 WHERE estciv_Id = @Oldestciv_Id

END

GO
CREATE OR ALTER	PROCEDURE UDP_tbEstadoCivilesDelete
@estciv_Id  CHAR(1)

as
begin

UPDATE [dbo].[tbEstadosCiviles]
   SET estciv_Estado = 0
 WHERE estciv_Id = @estciv_Id

end
