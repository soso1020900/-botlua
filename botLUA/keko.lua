-- BY : @ikeko My file :@file_lua
local action = function(msg, matches)
 if matches[1] == "start" then
			keyboard = {} 
	keyboard.inline_keyboard = {
      {
		{text = "قنات السورس", url="https://t.me/botlua"},					
			},	
		     {
		{text = "شرح سورس عله يوتيوب", url="https://youtu.be/W_hTq5Rrk_o"},					
			},
       {
		{text = "مبرمج السورس", url="https://t.me/ikeko"},					
			},	
	}
		api.sendKeyboard(msg.chat.id, '• مرحبا بك 👋🏻ֆ\n• في بوت تشغيل ملفات\n• الخاصه بـ @FILE_LUA\n• فقط ارسل الملف وسأقوم بتشغيله ✅ֆ', keyboard)     
	end	
	    if msg.document then				
			api.sendMessage(msg.chat.id, 'نتضر حتا يتم رفع ملف')
      local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/getFile?file_id='..(msg.document.file_id or msg.forward_from.document.file_id)..''
			local res = HTTPS.request(url)
			local jres = JSON.decode(res)	
			local download = download_to_file("https://api.telegram.org/file/bot"..config.bot_api_key.."/"..jres.result.file_path, 'botLUA/keko.lua')
			api.sendMessage(msg.chat.id, 'تم رفع الملف')
    	api.sendMessage(msg.chat.id, 'جاري اعاده تشغيل البوت')
    	api.sendMessage(msg.chat.id, 'تم اعاده تشغيل وتشغيل الملف المطلوب بنجاح')
		  bot_init(true)
  end
	end
local triggers = {
  '^/(start)',
   '###file',
}
return {
  action = action,
  triggers = triggers,
}
 
