
-- BY @ikeko 
-- MY FILE : @file_lua

local action = function(msg, matches)
	
if is_admin(msg) then	
	if matches[1] == 'bc' then
		local users = client:smembers('keko')
		local text = ''
		if not users then
		text = 'لا يوجد اعضاء'
		end
		for i=1, #users do
		api.sendMessage(users[i], matches[2], true)
		print(colors('%{green bright}ارسال الى : '), users[i])
		text = 'تم النشر الرساله الى جميع الاعضاء'
		end
		api.sendReply(msg, text, true)
	end


 if matches[1] == 'stats' then
		local members = client:smembers('keko')
		local keko = ''
		if members then
			for i=1, #members do
				keko = '*اعضاء البوت* : `'..i..'`\n'
			end
		end
		api.sendMessage(msg.chat.id, keko, true)
	end
end
end
	local triggers = {
	'^/(bc) (.*)$',
	'^/(stats)$',
}
return {
	action = action,
	triggers = triggers,
}
