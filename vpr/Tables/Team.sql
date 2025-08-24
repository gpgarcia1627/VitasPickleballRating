CREATE TABLE [dbo].[Team]
(
    [TeamId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [PlayerIdOne] INT NOT NULL, 
    [PlayerIdTwo] INT NOT NULL, 
    [ChangedDate] DATETIMEOFFSET NOT NULL DEFAULT SYSDATETIMEOFFSET(), 
    CONSTRAINT [FK_Team_PlayerOne] FOREIGN KEY ([PlayerIdOne]) REFERENCES [Player]([PlayerId]), 
    CONSTRAINT [FK_Team_PlayerTwo ] FOREIGN KEY ([PlayerIdTwo]) REFERENCES [Player]([PlayerId]), 
    CONSTRAINT [CK_Team_Player] CHECK ([PlayerIdOne] <> [PlayerIdTwo]),
    CONSTRAINT [CK_Team_Player_order] CHECK ([PlayerIdOne] < [PlayerIdTwo])
)
