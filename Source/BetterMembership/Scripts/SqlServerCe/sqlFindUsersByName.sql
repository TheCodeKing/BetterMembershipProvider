﻿Select	total.total Total,
		p.[userId] UserId, 
		p.[userName] UserName,
		m.[IsConfirmed] IsConfirmed,
		m.[lastPasswordFailureDate] LastPasswordFailureDate,
		m.[PasswordFailuresSinceLastSuccess] PasswordFailuresSinceLastSuccess,
		m.[createDate] creationDate,
		m.[passwordChangedDate] PasswordChangedDate,
		p.[email] Email
From	[UserProfile] p
		left join [webpages_Membership] m on m.UserId=p.[UserId]
		cross join (
			Select	Count(*) Total
			From	[UserProfile] p
			Where	UPPER(p.[userName]) like UPPER(@2)
		) total
Where UPPER(p.[userName]) like UPPER(@2)
Order By p.[UserId]
OFFSET @0 ROWS FETCH NEXT @1 ROWS ONLY