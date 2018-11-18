USE [TheHeaven]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bill](
	[Bill_ID] [int] IDENTITY(1,1) NOT NULL,
	[Bill_Date] [date] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[Member_ID] [varchar](10) NULL,
	[Appointed] [bit] NOT NULL,
	[IsDel] [bit] NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[CreateUser] [nvarchar](20) NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[UpdateUser] [nvarchar](20) NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_Item](
	[Bill_ID] [int] NOT NULL,
	[C_Item_ID] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Executor_ID] [int] NULL,
	[Point] [decimal](2, 1) NOT NULL,
	[IsDel] [bit] NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[CreateUser] [nvarchar](20) NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[UpdateUser] [nvarchar](20) NULL,
 CONSTRAINT [PK_Bill_Item_1] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC,
	[C_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_Sell](
	[Bill_ID] [int] NOT NULL,
	[Sell_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[P_Item_ID] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Percentage] [int] NOT NULL,
	[IsDel] [bit] NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[CreateUser] [nvarchar](20) NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[UpdateUser] [nvarchar](20) NULL,
 CONSTRAINT [PK_Sell] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC,
	[Sell_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consume_Category](
	[C_Category_ID] [int] NOT NULL,
	[C_Category_Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Consume_Category] PRIMARY KEY CLUSTERED 
(
	[C_Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consume_Item](
	[C_Item_ID] [int] NOT NULL,
	[C_Category_ID] [int] NOT NULL,
	[C_Item_Name] [nvarchar](30) NOT NULL,
	[Point] [decimal](2, 1) NOT NULL,
	[IsIntoPersonal] [bit] NOT NULL,
	[IsIntoCompany] [bit] NOT NULL,
	[Percentage] [decimal](9, 2) NOT NULL,
	[IsDel] [bit] NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[CreateUser] [nvarchar](20) NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[UpdateUser] [nvarchar](20) NULL,
 CONSTRAINT [PK_Consume_Item_1] PRIMARY KEY CLUSTERED 
(
	[C_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_ID] [int] NOT NULL,
	[Employee_Name] [nvarchar](10) NOT NULL,
	[Gender] [varchar](1) NOT NULL,
	[Tel_Home] [varchar](20) NULL,
	[Tel_Phone] [varchar](20) NULL,
	[Tel_Contact] [varchar](20) NOT NULL,
	[Address_Resident] [nvarchar](50) NULL,
	[Address_Mailing] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Position_ID] [int] NOT NULL,
	[IsDel] [bit] NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[CreateUser] [nvarchar](20) NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[UpdateUser] [nvarchar](20) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[Member_ID] [varchar](10) NOT NULL,
	[Member_Name] [nvarchar](30) NOT NULL,
	[Contact_NO] [varchar](20) NULL,
	[County] [nvarchar](10) NULL,
	[Address] [nvarchar](50) NULL,
	[Note] [nvarchar](100) NULL,
	[IsDel] [bit] NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[CreateUser] [nvarchar](20) NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[UpdateUser] [nvarchar](20) NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[Member_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Category](
	[P_Category_ID] [int] NOT NULL,
	[P_Category_Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Product_Category] PRIMARY KEY CLUSTERED 
(
	[P_Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Item](
	[P_Item_ID] [int] NOT NULL,
	[P_Category_ID] [int] NOT NULL,
	[P_Item_Name] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Percentage] [decimal](9, 2) NOT NULL,
	[IsDel] [bit] NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[CreateUser] [nvarchar](20) NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[UpdateUser] [nvarchar](20) NULL,
 CONSTRAINT [PK_Product_Item_1] PRIMARY KEY CLUSTERED 
(
	[P_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_Bill_Date]  DEFAULT (getdate()) FOR [Bill_Date]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_Appointed]  DEFAULT ((0)) FOR [Appointed]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_IsDel]  DEFAULT ((0)) FOR [IsDel]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_CreateTime1]  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[Bill_Item] ADD  CONSTRAINT [DF_Bill_Item_IsDel]  DEFAULT ((0)) FOR [IsDel]
GO
ALTER TABLE [dbo].[Bill_Item] ADD  CONSTRAINT [DF_Bill_Item_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Bill_Item] ADD  CONSTRAINT [DF_Bill_Item_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[Bill_Sell] ADD  CONSTRAINT [DF_Sell_IsDel_1]  DEFAULT ((0)) FOR [IsDel]
GO
ALTER TABLE [dbo].[Bill_Sell] ADD  CONSTRAINT [DF_Sell_CreateTime_1]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Bill_Sell] ADD  CONSTRAINT [DF_Sell_UpdateTime_1]  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[Consume_Item] ADD  CONSTRAINT [DF_Consume_Item_Point]  DEFAULT ((0.0)) FOR [Point]
GO
ALTER TABLE [dbo].[Consume_Item] ADD  CONSTRAINT [DF_Consumption_Percentage]  DEFAULT ((1.00)) FOR [Percentage]
GO
ALTER TABLE [dbo].[Consume_Item] ADD  CONSTRAINT [DF_Consume_Item_IsDel]  DEFAULT ((0)) FOR [IsDel]
GO
ALTER TABLE [dbo].[Consume_Item] ADD  CONSTRAINT [DF_Consume_Item_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Consume_Item] ADD  CONSTRAINT [DF_Consume_Item_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_IsDel_1]  DEFAULT ((0)) FOR [IsDel]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_CreateTime_1]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_UpdateTime_1]  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_IsDel]  DEFAULT ((0)) FOR [IsDel]
GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[Product_Item] ADD  CONSTRAINT [DF_Product_Item_Percentage]  DEFAULT ((0.20)) FOR [Percentage]
GO
ALTER TABLE [dbo].[Product_Item] ADD  CONSTRAINT [DF_Product_Item_IsDel]  DEFAULT ((0)) FOR [IsDel]
GO
ALTER TABLE [dbo].[Product_Item] ADD  CONSTRAINT [DF_Product_Item_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Product_Item] ADD  CONSTRAINT [DF_Product_Item_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Employee] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([Employee_ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Employee]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Member] FOREIGN KEY([Member_ID])
REFERENCES [dbo].[Member] ([Member_ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Member]
GO
ALTER TABLE [dbo].[Bill_Item]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Item_Bill] FOREIGN KEY([Bill_ID])
REFERENCES [dbo].[Bill] ([Bill_ID])
GO
ALTER TABLE [dbo].[Bill_Item] CHECK CONSTRAINT [FK_Bill_Item_Bill]
GO
ALTER TABLE [dbo].[Bill_Item]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Item_Consume_Item] FOREIGN KEY([C_Item_ID])
REFERENCES [dbo].[Consume_Item] ([C_Item_ID])
GO
ALTER TABLE [dbo].[Bill_Item] CHECK CONSTRAINT [FK_Bill_Item_Consume_Item]
GO
ALTER TABLE [dbo].[Bill_Item]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Item_Employee] FOREIGN KEY([Executor_ID])
REFERENCES [dbo].[Employee] ([Employee_ID])
GO
ALTER TABLE [dbo].[Bill_Item] CHECK CONSTRAINT [FK_Bill_Item_Employee]
GO
ALTER TABLE [dbo].[Bill_Sell]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Sell_Bill] FOREIGN KEY([Bill_ID])
REFERENCES [dbo].[Bill] ([Bill_ID])
GO
ALTER TABLE [dbo].[Bill_Sell] CHECK CONSTRAINT [FK_Bill_Sell_Bill]
GO
ALTER TABLE [dbo].[Bill_Sell]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Sell_Product_Item] FOREIGN KEY([P_Item_ID])
REFERENCES [dbo].[Product_Item] ([P_Item_ID])
GO
ALTER TABLE [dbo].[Bill_Sell] CHECK CONSTRAINT [FK_Bill_Sell_Product_Item]
GO
ALTER TABLE [dbo].[Consume_Item]  WITH CHECK ADD  CONSTRAINT [FK_Consume_Item_Consume_Category1] FOREIGN KEY([C_Category_ID])
REFERENCES [dbo].[Consume_Category] ([C_Category_ID])
GO
ALTER TABLE [dbo].[Consume_Item] CHECK CONSTRAINT [FK_Consume_Item_Consume_Category1]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Position1] FOREIGN KEY([Position_ID])
REFERENCES [dbo].[Position] ([Position_ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Position1]
GO
ALTER TABLE [dbo].[Product_Item]  WITH CHECK ADD  CONSTRAINT [FK_Product_Item_Product_Category1] FOREIGN KEY([P_Category_ID])
REFERENCES [dbo].[Product_Category] ([P_Category_ID])
GO
ALTER TABLE [dbo].[Product_Item] CHECK CONSTRAINT [FK_Product_Item_Product_Category1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳單編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill', @level2type=N'COLUMN',@level2name=N'Bill_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳單日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill', @level2type=N'COLUMN',@level2name=N'Bill_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'員工編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill', @level2type=N'COLUMN',@level2name=N'Employee_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否為指定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill', @level2type=N'COLUMN',@level2name=N'Appointed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳單編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill_Item', @level2type=N'COLUMN',@level2name=N'Bill_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消費項目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill_Item', @level2type=N'COLUMN',@level2name=N'C_Item_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill_Item', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'執行人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill_Item', @level2type=N'COLUMN',@level2name=N'Executor_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'獲得點數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill_Item', @level2type=N'COLUMN',@level2name=N'Point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳單編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill_Sell', @level2type=N'COLUMN',@level2name=N'Bill_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'員工編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill_Sell', @level2type=N'COLUMN',@level2name=N'Employee_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'產品ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill_Sell', @level2type=N'COLUMN',@level2name=N'P_Item_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill_Sell', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'抽成百分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill_Sell', @level2type=N'COLUMN',@level2name=N'Percentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消費種類ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consume_Category', @level2type=N'COLUMN',@level2name=N'C_Category_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消費種類名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consume_Category', @level2type=N'COLUMN',@level2name=N'C_Category_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消費項目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consume_Item', @level2type=N'COLUMN',@level2name=N'C_Item_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消費種類ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consume_Item', @level2type=N'COLUMN',@level2name=N'C_Category_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消費項目名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consume_Item', @level2type=N'COLUMN',@level2name=N'C_Item_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'獲得點數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consume_Item', @level2type=N'COLUMN',@level2name=N'Point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否入個人業績' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consume_Item', @level2type=N'COLUMN',@level2name=N'IsIntoPersonal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否入店營業額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consume_Item', @level2type=N'COLUMN',@level2name=N'IsIntoCompany'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'抽成百分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consume_Item', @level2type=N'COLUMN',@level2name=N'Percentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'員工編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Employee_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'員工姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Employee_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'住家電話' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Tel_Home'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手機號碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Tel_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'戶籍地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Address_Resident'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'居住地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Address_Mailing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'電子郵件地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'職位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Position_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'會員編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Member', @level2type=N'COLUMN',@level2name=N'Member_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'會員名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Member', @level2type=N'COLUMN',@level2name=N'Member_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'連絡電話' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Member', @level2type=N'COLUMN',@level2name=N'Contact_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'產品分類ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product_Category', @level2type=N'COLUMN',@level2name=N'P_Category_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'產品分類名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product_Category', @level2type=N'COLUMN',@level2name=N'P_Category_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'產品ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product_Item', @level2type=N'COLUMN',@level2name=N'P_Item_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'產品分類ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product_Item', @level2type=N'COLUMN',@level2name=N'P_Category_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'產品名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product_Item', @level2type=N'COLUMN',@level2name=N'P_Item_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'產品售價' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product_Item', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'販賣抽成百分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product_Item', @level2type=N'COLUMN',@level2name=N'Percentage'
GO
