/*
Post-Deployment Script Template                            
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.        
 Use SQLCMD syntax to include a file in the post-deployment script.            
 Example:      :r .\myfile.sql                                
 Use SQLCMD syntax to reference a variable in the post-deployment script.        
 Example:      :setvar TableName MyTable                            
               SELECT * FROM [$(TableName)]                    
--------------------------------------------------------------------------------------
*/
insert into [dbo].[Player] 
    ([FirstName], [LastName])
VALUES 
    ('Jean-Michael', 'Querol'),
    ('Keenan', 'Rodriguez'),
    ('Goutham', 'Kanddibanda'),
    ('Gerardo', 'Garcia'),
    ('Samuel', 'Horowitz'),
    ('Denise', 'Sleem')
    ;

insert into [dbo].[TypeGame] 
    ([GameType])
VALUES 
    ('Recreational'),
    ('Tournament')
    ;

insert into [dbo].[Team] 
    ([PlayerIdOne], [PlayerIdTwo])
VALUES 
    (1, 2),     -- Jean-Michael Querol, Keenan Rodriguez
    (3, 4),     -- Goutham Kanddibanda, Gerardo Garcia
    (2, 4),     -- Keenan Rodriguez, Gerardo Garcia
    (1, 3),     -- Jean-Michael Querol, Goutham Kanddibanda
    (1, 4),     -- Jean-Michael Querol, Gerardo Garcia

    (2, 3),     -- Keenan Rodriguez, Goutham Kanddibanda
    (5, 6),     -- Samuel Horowitz, Denise Sleem
    (4, 6),     -- Gerardo Garcia, Denise Sleem
    (3, 5),     -- Goutham Kanddibanda, Samuel Horowitz
    (4, 5),     -- Gerardo Garcia, Samuel Horowitz  

    (3, 6)      -- Goutham Kanddibanda, Denise Sleem
;

insert into [dbo].[Game] 
    ([PlayedDate], [TypeGameId], [TeamOneId], [TeamOneScore], [TeamTwoId], [TeamTwoScore])
Values
    -- i do not remember the scores for the first set of games
    ('2025-07-25 19:15 -4:00', 1, 9, 11, 8, 4),
    ('2025-07-25 19:35 -4:00', 1, 9, 11, 8, 6),
    ('2025-07-25 21:55 -4:00', 1, 10, 11, 11, 9),
    -- second session
    ('2025-07-31 18:34 -4:00', 1, 1, 11, 2, 3),
    ('2025-07-31 18:54 -4:00', 1, 3, 11, 4, 0),
    ('2025-07-31 19:14 -4:00', 1, 6, 11, 5, 8),
    ('2025-07-31 19:34 -4:00', 1, 6, 11, 5, 5),
    ('2025-07-31 19:54 -4:00', 1, 1, 11, 2, 9)
;

insert into [dbo].[PlayerRating] 
    ([PlayerId], [Rating], [RatingDate])
values
    (1, 200, '2025-07-24 00:00 -4:00'),
    (2, 200, '2025-07-24 00:00 -4:00'),
    (3, 200, '2025-07-24 00:00 -4:00'),
    (4, 200, '2025-07-24 00:00 -4:00'),
    (5, 200, '2025-07-24 00:00 -4:00'),
    (6, 200, '2025-07-24 00:00 -4:00')