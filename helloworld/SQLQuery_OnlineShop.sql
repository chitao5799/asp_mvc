use OnlineShop
go

set ansi_nulls on
go
set quoted_identifier on
go 

create proc Sp_account_login
@username varchar(20),
@password varchar(50)
as
begin
	declare @count int
	declare @res int
	select @count = COUNT(*) from Account where UserName=@username and Password=@password
	if @count>0
		set @res=1
	else 
		set @res=0

	select @res
end

-------------------

create proc Sp_Category_ListAll
as
begin
	select * from Category where [Status]=1
	order by [Order] asc
end

------------
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY,
	[Name] [nvarchar](50) NULL,
	[Alias] [varchar](50) NULL,
	[ParentID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Order] [int] NULL,
	[Status] [bit] NULL,
)
GO

ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
-------------
create proc Sp_Category_Insert
@name nvarchar(50),
@Alias varchar(50),
@ParentID int,
@Order int,
@Status bit
as
begin
	insert into Category([Name],Alias,ParentID,CreatedDate,[Order],[Status])
	values(@name,@Alias,@ParentID,getdate(),@Order,@Status)
end

