IF DB_ID('BD_HOSPITAL')IS NOT NULL
DROP DATABASE BD_HOSPITAL
GO
CREATE DATABASE BD_HOSPITAL
ON
(
	NAME=BD_HOSPITAL_PRI,
	FILENAME='C:\BASE DE DATOS\HOSPITAL\BD_HOSPITAL_PRI.MDF',
	SIZE=15,
	MAXSIZE=150,
	FILEGROWTH=10
),
(
	NAME=BD_HOSPITAL_TRA,
	FILENAME='C:\BASE DE DATOS\HOSPITAL\BD_HOSPITAL_TRA.NDF',
	SIZE=10,
	MAXSIZE=100,
	FILEGROWTH=10%
)
GO
SP_HELPDB BD_HOSPITAL
GO


---realizar modificaciones

USE master
ALTER DATABASE BD_HOSPITAL
ADD FILE
(NAME='BD_HOSPITAL_SEC1' ,FILENAME='C:\BASE DE DATOS\HOSPITAL\SEC\BD_HOSPITAL_SEC1.NDF', SIZE=10 , MAXSIZE=100),
(NAME='BD_HOSPITAL_SEC2' ,FILENAME='C:\BASE DE DATOS\HOSPITAL\SEC\BD_HOSPITAL_SEC2.NDF', SIZE=10 , MAXSIZE=100),
(NAME='BD_HOSPITAL_SEC3' ,FILENAME='C:\BASE DE DATOS\HOSPITAL\SEC\BD_HOSPITAL_SEC3.NDF', SIZE=10 , MAXSIZE=100)

GO
SP_HELPDB BD_HOSPITAL
GO

USE master
ALTER DATABASE BD_HOSPITAL
REMOVE FILE BD_HOSPITAL_SEC1
GO
SP_HELPDB BD_HOSPITAL
GO


CASO PROPUESTO 03 FERRETERIA

IF DB_ID('BD_FERRETERIA') IS NOT NULL
	DROP DATABASE BD_FERRETERIA
GO
CREATE DATABASE BD_FERRETERIA
ON
(
	NAME=BD_FERRETERIA_PRI,
	FILENAME='C:\BASE DE DATOS\FERRETERIA\DATOS\BD_FERRETERIA_PRI.MDF',
	SIZE=10,
	MAXSIZE=200,
	FILEGROWTH=15%
),
(
	NAME=BD_FERRETERIA_SEC,
	FILENAME='C:\BASE DE DATOS\FERRETERIA\SECUNDARIOS\BD_FERRETERIA_SEC.NDF',
	SIZE=7,
	MAXSIZE=70,
	FILEGROWTH=7%
)
LOG ON
(
	NAME=BD_FERRETERIA_TRANS,
	FILENAME='C:\BASE DE DATOS\FERRETERIA\TRANS\BD_FERRETERIA_TRANS.LDF',
	SIZE=8,
	MAXSIZE=80,
	FILEGROWTH=8%
)

GO
SP_HELPDB BD_FERRETERIA
GO


--REALIZAR MODIFICACIONES

USE master
ALTER DATABASE BD_FERRETERIA
MODIFY FILE(NAME='BD_FERRETERIA_TRANS' , SIZE=25 , FILEGROWTH=17%)
GO
ALTER DATABASE BD_FERRETERIA
ADD FILE(NAME=BD_FERRETERIA_SEC2, FILENAME='C:\BASE DE DATOS\FERRETERIA\SECUNDARIOS\BD_FERRETERIA_SEC2.NDF'  ,SIZE=10,MAXSIZE=100 ),
		(NAME=BD_FERRETERIA_SEC3, FILENAME='C:\BASE DE DATOS\FERRETERIA\SECUNDARIOS\BD_FERRETERIA_SEC3.NDF'  ,SIZE=10,MAXSIZE=100 ),
		(NAME=BD_FERRETERIA_SEC4, FILENAME='C:\BASE DE DATOS\FERRETERIA\SECUNDARIOS\BD_FERRETERIA_SEC4.NDF'  ,SIZE=10,MAXSIZE=100 ),
		(NAME=BD_FERRETERIA_SEC5, FILENAME='C:\BASE DE DATOS\FERRETERIA\SECUNDARIOS\BD_FERRETERIA_SEC5.NDF'  ,SIZE=10,MAXSIZE=100 )
	GO


USE master
ALTER DATABASE BD_FERRETERIA
REMOVE FILE BD_FERRETERIA_SEC4
GO

USE master
ALTER DATABASE BD_FERRETERIA
REMOVE FILE BD_FERRETERIA_SEC5
GO

SP_HELPDB BD_FERRETERIA
GO


