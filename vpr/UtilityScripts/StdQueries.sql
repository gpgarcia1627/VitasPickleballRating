
select top 100 *
from [vpr].[dbo].GameDetails gd
--where gd.PlayedDate < '2025-7-30'
order by gd.PlayedDate

-- games played by each player
select p.FirstName
    , GameCount = COUNT(g.GameId)
from [vpr].[dbo].[Player] p 
left join Team  t on t.PlayerIdOne = p.PlayerId or t.PlayerIdTwo = p.PlayerId
left join Game  g on t.TeamId = g.TeamOneId or t.TeamId = g.TeamTwoId
group by p.FirstName
;

-- standings by player
WITH PlayerGameStats AS
(
    select  p.PlayerId
            , g.GameId
            , t.TeamId
            , CASE WHEN g.TeamOneId = t.TeamId 
                    and g.TeamOneScore > g.TeamTwoScore 
                   THEN  1
                   ELSE 0 END AS Result
    from [vpr].[dbo].[Player] p 
    left join Team  t on    t.PlayerIdOne = p.PlayerId
                        or  t.PlayerIdTwo = p.PlayerId
    join Game  g on    t.TeamId = g.TeamOneId 
                   or  t.TeamId = g.TeamTwoId
)
select  p.FirstName
    , GamesPlayed = COUNT(pg.GameId)
    , Wins = COUNT(CASE WHEN Result = 1 THEN 1 END)
    , Losses = COUNT(CASE WHEN Result = 0 THEN 1 END)
    , WinPct = COUNT(CASE WHEN pg.Result = 1 THEN 1 END) * 1.0 / COUNT(pg.GameId)

    from PlayerGameStats pg
    join [vpr].[dbo].[Player] p on pg.PlayerId = p.PlayerId
    group by p.FirstName
    order by 5 desc

