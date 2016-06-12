CREATE TABLE [dbo].[Users] (
    [UserID]        INT           IDENTITY (4000, 1) NOT NULL,
    [Username]      VARCHAR (20) NOT NULL,
    [Password]      VARCHAR (30) NOT NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([UserID] ASC),
);