CREATE SCHEMA [RAULVF]
GO

CREATE TABLE [RAULVF].[departamentos] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nombre_departamento] varchar(50) NOT NULL
)
GO

CREATE TABLE [RAULVF].[municipios] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nombre_municipio] varchar(50) NOT NULL,
  [departamento_id] integer NOT NULL
)
GO

CREATE TABLE [RAULVF].[facultades] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nombre_facultad] varchar(50) NOT NULL
)
GO

CREATE TABLE [RAULVF].[carreras] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nombre_carrera] varchar(50) NOT NULL,
  [facultad_id] integer NOT NULL
)
GO

CREATE TABLE [RAULVF].[profesores] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nombre_profesor] varchar(50) NOT NULL,
  [nivelacademico] varchar(50) NOT NULL
)
GO

CREATE TABLE [RAULVF].[asignaturas] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nombre_asignatura] varchar(50) NOT NULL
)
GO

CREATE TABLE [RAULVF].[estudiantes] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [carnet] varchar(10) NOT NULL,
  [nombres] varchar(50) NOT NULL,
  [sexo] char(1) NOT NULL,
  [nacimiento] datetime NOT NULL,
  [email] varchar(20) NOT NULL,
  [direccion] varchar(250) NOT NULL,
  [turno] varchar(50) NOT NULL,
  [municipio_id] integer NOT NULL,
  [carrera_id] integer NOT NULL
)
GO

CREATE TABLE [RAULVF].[matriculas] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [estudiante_id] integer NOT NULL,
  [year] varchar(4) NOT NULL,
  [semestre] varchar(1) NOT NULL,
  [asignatura_id] integer NOT NULL,
  [profesor_id] integer NOT NULL
)
GO

ALTER TABLE [RAULVF].[estudiantes] ADD CONSTRAINT [EstudianteVF_MuniV1] FOREIGN KEY ([carrera_id]) REFERENCES [RAULVF].[carreras] ([id])
GO

ALTER TABLE [RAULVF].[municipios] ADD CONSTRAINT [DeptV1_MuniVF] FOREIGN KEY ([departamento_id]) REFERENCES [RAULVF].[departamentos] ([id])
GO

ALTER TABLE [RAULVF].[carreras] ADD CONSTRAINT [Facu_Carr] FOREIGN KEY ([facultad_id]) REFERENCES [RAULVF].[facultades] ([id])
GO

ALTER TABLE [RAULVF].[estudiantes] ADD CONSTRAINT [Muni_Estu] FOREIGN KEY ([municipio_id]) REFERENCES [RAULVF].[municipios] ([id])
GO

ALTER TABLE [RAULVF].[matriculas] ADD CONSTRAINT [Mat_Prof] FOREIGN KEY ([profesor_id]) REFERENCES [RAULVF].[profesores] ([id])
GO

ALTER TABLE [RAULVF].[matriculas] ADD CONSTRAINT [Mat_Asig] FOREIGN KEY ([asignatura_id]) REFERENCES [RAULVF].[asignaturas] ([id])
GO

ALTER TABLE [RAULVF].[matriculas] ADD CONSTRAINT [Mat_Estu] FOREIGN KEY ([estudiante_id]) REFERENCES [RAULVF].[estudiantes] ([id])
GO
