SELECT * FROM Messages
SELECT * FROM Topics
SELECT * FROM Users
select * from memberships

SELECT * FROM Users u
INNER JOIN Memberships m
ON u.UserID = m.UserID
LEFT JOIN Topics t
ON t.StartedBy = u.UserID 
LEFT JOIN (SELECT WrittenBy, COUNT(MessageID) MessageCount FROM Messages GROUP BY WrittenBy) MessageCount
ON u.UserID = MessageCount.WrittenBy
LEFT JOIN Messages mess
ON mess.WrittenBy = u.UserID
WHERE t.TopicID = (
	SELECT TOP 1 st.TopicID FROM Topics st
	LEFT JOIN [Messages] sm
	ON st.TopicID = sm.MessageID
	WHERE st.StartedBy = u.UserID
	ORDER BY sm.DateWritten DESC
)
AND Mess.MessageID = (
	SELECT MAX(messageID) FROM [Messages]
	WHERE TopicID = t.TopicID
	AND StartedBy = u.UserID
)


select * from users u INNER JOIN Memberships m ON m.UserId = u.UserId LEFT JOIN utilisateurs ut ON ut.UserId = u.UserId



SELECT * FROM Users u
INNER JOIN Memberships m
ON u.UserID = m.UserID
LEFT JOIN Topics t
ON t.StartedBy = u.UserID 
LEFT JOIN (SELECT WrittenBy, COUNT(MessageID) MessageCount FROM Messages GROUP BY WrittenBy) MessageCount
ON u.UserID = MessageCount.WrittenBy
LEFT JOIN Messages mess
ON mess.WrittenBy = u.UserID
WHERE t.TopicID = (
	SELECT TOP 1 TopicID FROM Topics
	WHERE StartedBy = u.UserId
	ORDER BY t.TopicID DESC
)
AND Mess.MessageID = (
	SELECT MAX(messageID) FROM [Messages]
	WHERE TopicID = t.TopicID
	AND StartedBy = u.UserID
)



SELECT * FROM Users u
INNER JOIN Memberships m
ON u.UserID = m.UserID
LEFT JOIN Topics t
ON t.StartedBy = u.UserID 
LEFT JOIN (SELECT WrittenBy, COUNT(MessageID) MessageCount FROM Messages GROUP BY WrittenBy) MessageCount
ON u.UserID = MessageCount.WrittenBy
WHERE t.TopicID IS NULL
   OR t.TopicID = (
	SELECT TOP 1 st.TopicID FROM Topics st
	WHERE st.StartedBY = t.StartedBy
	ORDER BY st.TopicID DESC
)

SELECT * FROM Users u
INNER JOIN Memberships m
ON u.UserID = m.UserID
INNER JOIN (SELECT WrittenBy, COUNT(MessageID) MessageCount FROM Messages GROUP BY WrittenBy) MessageCount
ON u.UserID = MessageCount.WrittenBy
LEFT JOIN (
    SELECT TOP 1 t.TopicID, TopicTitle, DateWritten, StartedBy FROM Topics t
    INNER JOIN Messages m
    ON t.TopicID = m.TopicID
    ORDER BY TopicID DESC
) TopicInfos
ON u.UserID = TopicInfos.StartedBy





SELECT b.BoardID, b.BoardCategoryID, b.BoardName,
		m.DateWritten, m.WrittenBy, m.MessageID, m.TopicID,
		t.topicID, t.TopicTitle,
		u.UserName,
		(SELECT COUNT(*) FROM Topics WHERE BoardID = t.BoardID) AS TopicCount,
		(SELECT COUNT(*) FROM Topics st 
            INNER JOIN Messages sm 
            ON st.TopicID = sm.TopicID 
            WHERE st.BoardID = t.BoardID) AS MessageCount
FROM Boards b 
LEFT JOIN Topics t 
ON b.BoardID = t.BoardID 
LEFT JOIN [Messages] m 
ON t.TopicID = m.TopicID
LEFT JOIN Users u
ON u.UserId = m.WrittenBy
WHERE t.topicID = (
	SELECT TOP 1 st.TopicID FROM Topics st
	LEFT JOIN [Messages] sm
	ON st.TopicID = sm.MessageID
	WHERE st.BoardID = b.BoardID
	ORDER BY sm.DateWritten DESC
) AND m.messageID = (
	SELECT MAX(messageID) FROM [Messages]
	WHERE TopicID = t.TopicID
)