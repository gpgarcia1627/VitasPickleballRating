CREATE TABLE [dbo].[PlayerRating]
(
    [PlayerRatingId]    INT         NOT NULL identity(1,1) PRIMARY KEY,
    [PlayerId]          INT         NOT NULL,
    [GameId]            INT         NULL,
    [Rating]            INT         NOT NULL,
    [RatingDate]        DATETIMEOFFSET NOT NULL DEFAULT SYSDATETIMEOFFSET()

)
