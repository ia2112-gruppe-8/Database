USE [master]
GO
/****** Object:  Database [Alarmsystem_hytte]    Script Date: 25.04.2019 13:47:05 ******/
CREATE DATABASE [Alarmsystem_hytte]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Alarmsystem_hytte', FILENAME = N'D:\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\Alarmsystem_hytte.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Alarmsystem_hytte_log', FILENAME = N'D:\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\Alarmsystem_hytte_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Alarmsystem_hytte] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Alarmsystem_hytte].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Alarmsystem_hytte] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET ARITHABORT OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Alarmsystem_hytte] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Alarmsystem_hytte] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Alarmsystem_hytte] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Alarmsystem_hytte] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Alarmsystem_hytte] SET  MULTI_USER 
GO
ALTER DATABASE [Alarmsystem_hytte] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Alarmsystem_hytte] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Alarmsystem_hytte] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Alarmsystem_hytte] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Alarmsystem_hytte] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Alarmsystem_hytte] SET QUERY_STORE = OFF
GO
USE [Alarmsystem_hytte]
GO
/****** Object:  Table [dbo].[Abonnenter]    Script Date: 25.04.2019 13:47:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abonnenter](
	[Navn] [varchar](60) NOT NULL,
	[E-Mail] [varchar](60) NOT NULL,
	[tlf.Nummer] [int] NULL,
 CONSTRAINT [PK_Abonnenter_1] PRIMARY KEY CLUSTERED 
(
	[E-Mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alarmer]    Script Date: 25.04.2019 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alarmer](
	[Alarmtype] [varchar](50) NOT NULL,
	[Tidsrom] [datetime] NOT NULL,
	[Verdi\temperatur] [int] NOT NULL,
	[aktiv\ikke aktiv] [bit] NULL,
	[LavGrense] [int] NULL,
	[HøyGrense] [int] NULL,
 CONSTRAINT [PK_Alarmer] PRIMARY KEY CLUSTERED 
(
	[Alarmtype] ASC,
	[Tidsrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 25.04.2019 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions](
	[Alarmtype] [varchar](50) NOT NULL,
	[Tlf.Nummer] [int] NULL,
	[E-Mail] [varchar](60) NOT NULL,
 CONSTRAINT [PK_Subscriptions_1] PRIMARY KEY CLUSTERED 
(
	[Alarmtype] ASC,
	[E-Mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempMålinger]    Script Date: 25.04.2019 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempMålinger](
	[Tidsrom] [datetime] NOT NULL,
	[Verdi\temperatur] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Abonnenter] ([Navn], [E-Mail], [tlf.Nummer]) VALUES (N'Jørgen Sneisen', N'221950@usn.no', 94408381)
INSERT [dbo].[Abonnenter] ([Navn], [E-Mail], [tlf.Nummer]) VALUES (N'Jørgen Sneisen2', N'jorgen.sneisen@gmail.com', NULL)
INSERT [dbo].[Abonnenter] ([Navn], [E-Mail], [tlf.Nummer]) VALUES (N'Jørgen Sneisen', N'jorgen.sneisen@lf-nett.no', 94408381)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-02-16T15:15:00.000' AS DateTime), 69, 0, 0, 35)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-28T20:13:38.197' AS DateTime), 70, 0, 0, 35)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-28T20:51:34.210' AS DateTime), 0, 0, 0, 35)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-28T20:56:30.187' AS DateTime), 0, 0, 0, 35)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-29T23:39:42.663' AS DateTime), 30, 0, 0, 30)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-29T23:39:59.260' AS DateTime), 30, 0, 0, 30)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-29T23:43:08.590' AS DateTime), 30, 0, 0, 30)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-29T23:43:22.030' AS DateTime), 30, 0, 0, 30)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-29T23:43:24.827' AS DateTime), 30, 0, 0, 30)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-29T23:43:30.007' AS DateTime), 30, 0, 0, 30)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-29T23:43:33.010' AS DateTime), 397, 0, 0, 30)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-29T23:43:35.987' AS DateTime), 408, 0, 0, 30)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-29T23:43:39.037' AS DateTime), 439, 0, 0, 30)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-30T00:13:55.593' AS DateTime), 30, 0, 0, 30)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-30T00:14:55.450' AS DateTime), 31, 0, 0, 30)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-30T00:22:14.783' AS DateTime), 30, 0, 0, 30)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'0', CAST(N'2019-03-30T00:23:55.617' AS DateTime), 30, 0, 0, 30)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'1', CAST(N'2019-03-28T19:41:00.000' AS DateTime), 1, 0, 0, 1)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'1', CAST(N'2019-03-29T23:38:43.377' AS DateTime), 0, 0, 0, 2)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'1', CAST(N'2019-03-29T23:41:55.237' AS DateTime), 0, 0, 0, 2)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'2', CAST(N'2019-03-29T23:33:41.507' AS DateTime), 1, 0, 0, 1)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'2', CAST(N'2019-03-29T23:39:12.703' AS DateTime), 0, 0, 0, 2)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'2', CAST(N'2019-05-17T18:22:00.000' AS DateTime), 69, 0, 50, 68)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'3', CAST(N'2019-04-16T23:59:00.000' AS DateTime), 40, 0, 0, 35)
INSERT [dbo].[Alarmer] ([Alarmtype], [Tidsrom], [Verdi\temperatur], [aktiv\ikke aktiv], [LavGrense], [HøyGrense]) VALUES (N'4', CAST(N'2019-03-28T21:05:56.653' AS DateTime), 0, 0, 0, 35)
INSERT [dbo].[Subscriptions] ([Alarmtype], [Tlf.Nummer], [E-Mail]) VALUES (N'0', 94408381, N'221950@usn.no')
INSERT [dbo].[Subscriptions] ([Alarmtype], [Tlf.Nummer], [E-Mail]) VALUES (N'0', NULL, N'jorgen.sneisen@gmail.com')
INSERT [dbo].[Subscriptions] ([Alarmtype], [Tlf.Nummer], [E-Mail]) VALUES (N'0', NULL, N'jorgen.sneisen@lf-nett.no')
INSERT [dbo].[Subscriptions] ([Alarmtype], [Tlf.Nummer], [E-Mail]) VALUES (N'1', NULL, N'jorgen.sneisen@lf-nett.no')
INSERT [dbo].[Subscriptions] ([Alarmtype], [Tlf.Nummer], [E-Mail]) VALUES (N'2', NULL, N'jorgen.sneisen@gmail.com')
INSERT [dbo].[Subscriptions] ([Alarmtype], [Tlf.Nummer], [E-Mail]) VALUES (N'2', NULL, N'jorgen.sneisen@lf-nett.no')
INSERT [dbo].[Subscriptions] ([Alarmtype], [Tlf.Nummer], [E-Mail]) VALUES (N'3', NULL, N'jorgen.sneisen@lf-nett.no')
INSERT [dbo].[Subscriptions] ([Alarmtype], [Tlf.Nummer], [E-Mail]) VALUES (N'4', NULL, N'jorgen.sneisen@gmail.com')
INSERT [dbo].[Subscriptions] ([Alarmtype], [Tlf.Nummer], [E-Mail]) VALUES (N'4', NULL, N'jorgen.sneisen@lf-nett.no')
INSERT [dbo].[TempMålinger] ([Tidsrom], [Verdi\temperatur]) VALUES (CAST(N'2019-03-28T17:35:43.967' AS DateTime), -13)
INSERT [dbo].[TempMålinger] ([Tidsrom], [Verdi\temperatur]) VALUES (CAST(N'2019-03-28T17:35:45.183' AS DateTime), 10)
INSERT [dbo].[TempMålinger] ([Tidsrom], [Verdi\temperatur]) VALUES (CAST(N'2019-03-28T17:35:46.857' AS DateTime), 9)
INSERT [dbo].[TempMålinger] ([Tidsrom], [Verdi\temperatur]) VALUES (CAST(N'2019-03-28T17:35:48.153' AS DateTime), -16)
INSERT [dbo].[TempMålinger] ([Tidsrom], [Verdi\temperatur]) VALUES (CAST(N'2019-03-28T17:35:49.320' AS DateTime), 1)
INSERT [dbo].[TempMålinger] ([Tidsrom], [Verdi\temperatur]) VALUES (CAST(N'2019-03-28T17:35:50.310' AS DateTime), 36)
INSERT [dbo].[TempMålinger] ([Tidsrom], [Verdi\temperatur]) VALUES (CAST(N'2019-03-28T17:35:50.953' AS DateTime), -3)
INSERT [dbo].[TempMålinger] ([Tidsrom], [Verdi\temperatur]) VALUES (CAST(N'2019-03-28T17:35:51.087' AS DateTime), 37)
INSERT [dbo].[TempMålinger] ([Tidsrom], [Verdi\temperatur]) VALUES (CAST(N'2019-03-28T17:35:51.257' AS DateTime), 7)
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Subscriptions_Abonnenter] FOREIGN KEY([E-Mail])
REFERENCES [dbo].[Abonnenter] ([E-Mail])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_Abonnenter]
GO
/****** Object:  StoredProcedure [dbo].[AddSubscriber]    Script Date: 25.04.2019 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddSubscriber]

@Navn varchar(60), @Mail varchar(60), @Nummer int, @Alarmtype int
 AS
 INSERT INTO ABONNENTER 
 VALUES(@navn,@Mail,@Nummer)
 INSERT INTO Subscriptions
 VALUES(@Alarmtype,@Nummer, @Mail)
 --WHERE navn = @navn, email = @[E-Mail], tlf = @[tlf.Nummer]
	

 
GO
/****** Object:  StoredProcedure [dbo].[createSubscription]    Script Date: 25.04.2019 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[createSubscription]
@type int, @mail varchar(60)
as
INSERT INTO Subscriptions
VALUES(@type,NULL,@mail)
GO
/****** Object:  StoredProcedure [dbo].[DeleteSubscriber]    Script Date: 25.04.2019 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteSubscriber]
@Mail varchar(60)
AS
DELETE FROM Subscriptions
where [E-Mail] =@Mail
DELETE FROM ABONNENTER
where [E-Mail] = @Mail
GO
/****** Object:  StoredProcedure [dbo].[insertAlarms]    Script Date: 25.04.2019 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertAlarms]
@type int, @time datetime, @value int, @active bit, @Llimit int, @Hlimit int
AS
INSERT INTO Alarmer
VALUES(@type,@time,@value,@active,@Llimit,@Hlimit)
GO
/****** Object:  StoredProcedure [dbo].[insertTemp]    Script Date: 25.04.2019 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertTemp]
@temp int, @dato datetime
AS
INSERT INTO TempMålinger
VALUES(@dato,@temp)
GO
/****** Object:  StoredProcedure [dbo].[kvitterAlarmer]    Script Date: 25.04.2019 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[kvitterAlarmer]
AS
UPDATE Alarmer
Set [aktiv\ikke aktiv] = 0
Where [aktiv\ikke aktiv] = 1;
GO
/****** Object:  StoredProcedure [dbo].[updtAbbonenter]    Script Date: 25.04.2019 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[updtAbbonenter]
@oldMail varchar(60), @newMail varchar(60), @number int, @name varchar(60)
as 
UPdate Abonnenter
Set [E-Mail] = @newMail, [tlf.Nummer] = @number, Navn = @name
Where [E-Mail] = @oldMail
GO
USE [master]
GO
ALTER DATABASE [Alarmsystem_hytte] SET  READ_WRITE 
GO
