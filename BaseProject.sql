USE [BaseDatabase]
GO

/****** Object:  StoredProcedure [dbo].[ViewBooking]    Script Date: 29-05-2022 12:50:58 PM ******/
DROP PROCEDURE [dbo].[ViewBooking]
GO
/****** Object:  StoredProcedure [dbo].[UpsertHotel]    Script Date: 29-05-2022 12:50:58 PM ******/
DROP PROCEDURE [dbo].[UpsertHotel]
GO
/****** Object:  StoredProcedure [dbo].[SearchHotelByName]    Script Date: 29-05-2022 12:50:58 PM ******/
DROP PROCEDURE [dbo].[SearchHotelByName]
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 29-05-2022 12:50:58 PM ******/
DROP PROCEDURE [dbo].[RegisterUser]
GO
/****** Object:  StoredProcedure [dbo].[MakingBooking]    Script Date: 29-05-2022 12:50:58 PM ******/
DROP PROCEDURE [dbo].[MakingBooking]
GO
/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 29-05-2022 12:50:58 PM ******/
DROP PROCEDURE [dbo].[LoginUser]
GO
/****** Object:  StoredProcedure [dbo].[GetHotelById]    Script Date: 29-05-2022 12:50:58 PM ******/
DROP PROCEDURE [dbo].[GetHotelById]
GO
/****** Object:  StoredProcedure [dbo].[GetAllUser]    Script Date: 29-05-2022 12:50:58 PM ******/
DROP PROCEDURE [dbo].[GetAllUser]
GO
/****** Object:  StoredProcedure [dbo].[CancelBooking]    Script Date: 29-05-2022 12:50:58 PM ******/
DROP PROCEDURE [dbo].[CancelBooking]
GO
ALTER TABLE [dbo].[Booking] DROP CONSTRAINT [FK_Booking_User]
GO
ALTER TABLE [dbo].[Booking] DROP CONSTRAINT [FK_Booking_Hotel]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_IsActive]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_IsDeleted]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_ModifiedDate]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_CreatedDate]
GO
ALTER TABLE [dbo].[Hotel] DROP CONSTRAINT [DF_Hotel_IsActive]
GO
ALTER TABLE [dbo].[Hotel] DROP CONSTRAINT [DF_Hotel_IsDeleted]
GO
ALTER TABLE [dbo].[Hotel] DROP CONSTRAINT [DF_Hotel_ModifiedDate]
GO
ALTER TABLE [dbo].[Hotel] DROP CONSTRAINT [DF_Hotel_CreatedDate]
GO
ALTER TABLE [dbo].[Booking] DROP CONSTRAINT [DF_Booking_IsActive]
GO
ALTER TABLE [dbo].[Booking] DROP CONSTRAINT [DF_Booking_IsDeleted]
GO
ALTER TABLE [dbo].[Booking] DROP CONSTRAINT [DF_Booking_ModifiedDate]
GO
ALTER TABLE [dbo].[Booking] DROP CONSTRAINT [DF_Booking_CreatedDate]
GO
/****** Object:  Table [dbo].[User]    Script Date: 29-05-2022 12:50:58 PM ******/
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 29-05-2022 12:50:58 PM ******/
DROP TABLE [dbo].[Hotel]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 29-05-2022 12:50:58 PM ******/
DROP TABLE [dbo].[Booking]
GO
USE [master]
GO
/****** Object:  Database [BaseDatabase]    Script Date: 29-05-2022 12:50:58 PM ******/
DROP DATABASE [BaseDatabase]
GO
/****** Object:  Database [BaseDatabase]    Script Date: 29-05-2022 12:50:58 PM ******/
CREATE DATABASE [BaseDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BaseDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BaseDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BaseDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BaseDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BaseDatabase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BaseDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BaseDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BaseDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BaseDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BaseDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BaseDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [BaseDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BaseDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BaseDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BaseDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BaseDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BaseDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BaseDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BaseDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BaseDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BaseDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BaseDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BaseDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BaseDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BaseDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BaseDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BaseDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BaseDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BaseDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BaseDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [BaseDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BaseDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BaseDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BaseDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BaseDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BaseDatabase] SET QUERY_STORE = OFF
GO
USE [BaseDatabase]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BaseDatabase]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 29-05-2022 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[BookingName] [varchar](50) NULL,
	[Check_In] [datetime] NULL,
	[Check_Out] [datetime] NOT NULL,
	[HotelId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 29-05-2022 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelId] [int] IDENTITY(1,1) NOT NULL,
	[HotelName] [varchar](50) NOT NULL,
	[HotelAddress] [varchar](50) NOT NULL,
	[CommunicationId] [int] NULL,
	[CommunicationType] [varchar](50) NULL,
	[Number] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 29-05-2022 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NOT NULL,
	[Gender] [varchar](4) NOT NULL,
	[UserPic] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[CommunicationId] [int] NULL,
	[CommunicationType] [varchar](50) NULL,
	[Number] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([BookingId], [BookingName], [Check_In], [Check_Out], [HotelId], [UserId], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsDeleted], [IsActive]) VALUES (1, N'RK', CAST(N'2022-05-27T19:11:02.117' AS DateTime), CAST(N'2022-05-28T19:11:02.117' AS DateTime), 1, 1, NULL, CAST(N'2022-05-29T00:41:21.843' AS DateTime), CAST(N'2022-05-29T00:41:21.843' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Booking] ([BookingId], [BookingName], [Check_In], [Check_Out], [HotelId], [UserId], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsDeleted], [IsActive]) VALUES (2, N'RK', CAST(N'2022-05-27T19:11:02.117' AS DateTime), CAST(N'2022-05-28T19:11:02.117' AS DateTime), 1, 1, NULL, CAST(N'2022-05-29T00:48:31.183' AS DateTime), CAST(N'2022-05-29T00:48:31.183' AS DateTime), NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([HotelId], [HotelName], [HotelAddress], [CommunicationId], [CommunicationType], [Number], [EmailId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [IsActive]) VALUES (1, N'RKH', N'Pune', 0, N'string', N'string', N'string', NULL, CAST(N'2022-05-28T22:25:06.900' AS DateTime), NULL, CAST(N'2022-05-28T22:25:06.900' AS DateTime), 0, 1)
INSERT [dbo].[Hotel] ([HotelId], [HotelName], [HotelAddress], [CommunicationId], [CommunicationType], [Number], [EmailId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [IsActive]) VALUES (2, N'HJ', N'Pune', 1, N'EMAIL', N'', N'HJ@gmail.com', NULL, CAST(N'2022-05-28T22:28:31.180' AS DateTime), NULL, CAST(N'2022-05-28T22:28:31.180' AS DateTime), 0, 1)
INSERT [dbo].[Hotel] ([HotelId], [HotelName], [HotelAddress], [CommunicationId], [CommunicationType], [Number], [EmailId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [IsActive]) VALUES (3, N'RK', N'Pune', 0, N'string', N'string', N'string', NULL, CAST(N'2022-05-28T22:58:11.030' AS DateTime), NULL, CAST(N'2022-05-28T22:58:11.030' AS DateTime), 0, 1)
INSERT [dbo].[Hotel] ([HotelId], [HotelName], [HotelAddress], [CommunicationId], [CommunicationType], [Number], [EmailId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [IsActive]) VALUES (4, N'PJ Hotel', N'Ahmedabad', 0, N'string', N'string', N'string', NULL, CAST(N'2022-05-28T23:21:10.587' AS DateTime), NULL, CAST(N'2022-05-28T23:21:10.587' AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[Hotel] OFF
INSERT [dbo].[User] ([UserId], [UserName], [FirstName], [LastName], [MiddleName], [Gender], [UserPic], [Password], [CommunicationId], [CommunicationType], [Number], [EmailId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [IsActive]) VALUES (1, N'Murtuza.Travadi', N'Murtuza', N'Travadi', N'A', N'M', NULL, N'12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [UserName], [FirstName], [LastName], [MiddleName], [Gender], [UserPic], [Password], [CommunicationId], [CommunicationType], [Number], [EmailId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [IsActive]) VALUES (2, N'Sample', N'Fist_test', N'Last_test', N'Middle_test', N'F', N'', N'12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [UserName], [FirstName], [LastName], [MiddleName], [Gender], [UserPic], [Password], [CommunicationId], [CommunicationType], [Number], [EmailId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [IsActive]) VALUES (6, N'aateka.nulwala', N'aateka', N'nulwala', N'M', N'F', N'', N'123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [UserName], [FirstName], [LastName], [MiddleName], [Gender], [UserPic], [Password], [CommunicationId], [CommunicationType], [Number], [EmailId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [IsActive]) VALUES (7, N'Sample', N'Fist_test', N'Last_test', N'Middle_test', N'F', N'', N'12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [UserName], [FirstName], [LastName], [MiddleName], [Gender], [UserPic], [Password], [CommunicationId], [CommunicationType], [Number], [EmailId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted], [IsActive]) VALUES (8, N'aateka.nulwala', N'aateka', N'nulwala', N'', N'F', N'', N'12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
ALTER TABLE [dbo].[Booking] ADD  CONSTRAINT [DF_Booking_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Booking] ADD  CONSTRAINT [DF_Booking_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Booking] ADD  CONSTRAINT [DF_Booking_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Booking] ADD  CONSTRAINT [DF_Booking_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Hotel] ADD  CONSTRAINT [DF_Hotel_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Hotel] ADD  CONSTRAINT [DF_Hotel_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Hotel] ADD  CONSTRAINT [DF_Hotel_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Hotel] ADD  CONSTRAINT [DF_Hotel_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Booking]  WITH NOCHECK ADD  CONSTRAINT [FK_Booking_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([HotelId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Hotel]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_User]
GO
/****** Object:  StoredProcedure [dbo].[CancelBooking]    Script Date: 29-05-2022 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Murtuza Travadi
-- Create date: 29/05/2022
-- Description:	Cancel Booking
-- =============================================
CREATE PROCEDURE [dbo].[CancelBooking]
	@BookingID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here	
		UPDATE [Booking] SET IsDeleted = 1 WHERE [BookingId] = @BookingID
		SELECT 1
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUser]    Script Date: 29-05-2022 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author Murtuza Travadi>
-- Create date: <Create Date 28/05/2022>
-- Description:	<Description Get All User Details>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUser]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [UserId]
      ,[UserName]
      ,[FirstName]
      ,[LastName]
      ,[MiddleName]
      ,[Gender]
      ,[UserPic]
  FROM [BaseDatabase].[dbo].[User] (NOLOCK)
END
GO
/****** Object:  StoredProcedure [dbo].[GetHotelById]    Script Date: 29-05-2022 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Murtuza Travadi
-- Create date: 28/05/2022
-- Description:	Search Hotel By Name
-- =============================================
CREATE PROCEDURE [dbo].[GetHotelById]
	-- Add the parameters for the stored procedure here
	@Id varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	[HotelId]
      ,[HotelName]
      ,[HotelAddress]
  FROM [dbo].[Hotel] (nolock) WHERE [HotelId] = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 29-05-2022 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Murtuza Travadi>
-- Create date: <28/05/2022>
-- Description:	<Check Username and password exists in system>
-- =============================================
CREATE PROCEDURE [dbo].[LoginUser]
	-- Add the parameters for the stored procedure here
	@UserName Varchar(50),
	@Password nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserID FROM [dbo].[User] (NOLOCK) WHERE [UserName]=@UserName and [Password]=@Password
END
GO
/****** Object:  StoredProcedure [dbo].[MakingBooking]    Script Date: 29-05-2022 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Murtuza Travadi
-- Create date: 29/05/2022
-- Description:	Making Booking
-- =============================================
CREATE PROCEDURE [dbo].[MakingBooking]
	@BookingID int,
	@BookingName varchar(50),
	@Check_In datetime,
	@Check_Out datetime,
	@HotelId int,
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF(@BookingID = 0)
	BEGIN
		INSERT INTO [dbo].[Booking]
           ([BookingName]
           ,[Check_In]
           ,[Check_Out]
           ,[HotelId]
           ,[UserId])
     VALUES
           (@BookingName,
			@Check_In
           ,@Check_Out
           ,@HotelId
           ,@UserId)

		SELECT [BookingId]
				,[BookingName]
				,[Check_In]
				,[Check_Out]
				,[HotelId]
				,[UserId]
		FROM [dbo].[Booking] WHERE [BookingId] = @@IDENTITY

	END
	ELSE
	BEGIN
		UPDATE [dbo].[Booking]
			SET [BookingName] = @BookingName
				,[Check_In] = @Check_In
				,[Check_Out] = @Check_Out
				,[HotelId] = @HotelId
				,[UserId] = @UserId
		WHERE [BookingId] = @BookingID

		
		SELECT [BookingId]
				,[BookingName]
				,[Check_In]
				,[Check_Out]
				,[HotelId]
				,[UserId]
		FROM [dbo].[Booking] WHERE [BookingId] = @BookingID

	END

END
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 29-05-2022 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Murtuza
-- Create date: 28/0/2022
-- Description:	Register User
-- =============================================
CREATE PROCEDURE [dbo].[RegisterUser]
	-- Add the parameters for the stored procedure here
	@UserName varchar(50),
	@FirstName varchar(50),
	@LastName varchar(50),
	@MiddleName varchar(50),
	@Gender varchar(4),
	@UserPic nvarchar(max),
	@Password nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
INSERT INTO [dbo].[User]
           ([UserName]
           ,[FirstName]
           ,[LastName]
           ,[MiddleName]
           ,[Gender]
           ,[UserPic]
           ,[Password])
     VALUES
          (@UserName,@FirstName,@LastName,@MiddleName,@Gender,@UserPic,@Password)

		  SELECT [UserId]
      ,[UserName]
      ,[FirstName]
      ,[LastName]
      ,[MiddleName]
      ,[Gender]
      ,[UserPic]
  FROM [BaseDatabase].[dbo].[User] (NOLOCK) WHERE [UserId] = @@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[SearchHotelByName]    Script Date: 29-05-2022 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Murtuza Travadi
-- Create date: 28/05/2022
-- Description:	Search Hotel By Name

--[SearchHotelByName] @Name = 'RK'
-- =============================================
CREATE PROCEDURE [dbo].[SearchHotelByName]
	-- Add the parameters for the stored procedure here
	@Name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	[HotelId]
      ,[HotelName]
      ,[HotelAddress]
  FROM [dbo].[Hotel] (nolock) WHERE [HotelName] LIKE '%'+@Name+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[UpsertHotel]    Script Date: 29-05-2022 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Murtuza Travadi
-- Create date: 28/05/2022
-- Description:	Update / Insert hotel details
-- =============================================
CREATE PROCEDURE [dbo].[UpsertHotel]
	-- Add the parameters for the stored procedure here
	@HotelId varchar(50),
	@HotelName varchar(50),
	@HotelAddress varchar(50),
	@CommunicationId int,
	@CommunicationType varchar(50),
	@Number varchar(50),
	@EmailId varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF(@HotelId = 0)
	BEGIN
		INSERT INTO [dbo].[Hotel]
           ([HotelName]
           ,[HotelAddress]
           ,[CommunicationId]
           ,[CommunicationType]
           ,[Number]
           ,[EmailId]
           ,[IsDeleted]
           ,[IsActive])
     VALUES
           (@HotelName
           ,@HotelAddress
           ,@CommunicationId
           ,@CommunicationType
           ,@Number
           ,@EmailId
           ,0
           ,1)

			SELECT 
			[HotelId]
			,[HotelName]
			,[HotelAddress]
			FROM [dbo].[Hotel] (nolock) WHERE [HotelId] = @@IDENTITY
	END
	ELSE
	BEGIN
	
			UPDATE [dbo].[Hotel]
			  SET [HotelName] = @HotelName
			     ,[HotelAddress] = @HotelAddress
			     ,[CommunicationId] = @CommunicationId
			     ,[CommunicationType] = @CommunicationType
			     ,[Number] = @Number
			     ,[EmailId] = @EmailId
			WHERE [HotelId] = @HotelId

				SELECT 
			[HotelId]
			,[HotelName]
			,[HotelAddress]
			FROM [dbo].[Hotel] (nolock) WHERE [HotelId] = @HotelId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ViewBooking]    Script Date: 29-05-2022 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Murtuza Travadi
-- Create date: 29/05/2022
-- Description:	View Booking
-- =============================================
CREATE PROCEDURE [dbo].[ViewBooking]
	@BookingID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here	
		SELECT [BookingId]
				,[BookingName]
				,[Check_In]
				,[Check_Out]
				,[HotelId]
				,[UserId]
		FROM [dbo].[Booking] WHERE [BookingId] = @BookingID AND  IsDeleted = 0
END
GO
USE [master]
GO
ALTER DATABASE [BaseDatabase] SET  READ_WRITE 
GO
