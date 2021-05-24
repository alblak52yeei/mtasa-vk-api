local MESSAGE_SEND_URL = 'https://api.vk.com/method/messages.send'
local ACCESS_TOKEN = 'your_access_token' -- here is the access_token of the VK group from which you want to send messages
local bDebugState = false -- to enable debug mode, set the value to true

local char_to_hex = function(c)
  	return string.format("%%%02X", string.byte(c))
end

local function urlencode(url)
	if url == nil then return end
	url = url:gsub("\n", "\r\n")
	url = url:gsub("([^%w ])", char_to_hex)
	url = url:gsub(" ", "+")
	return url
end

function SendMessage( iChat, sMessage )
	assert( iChat and type( iChat ) == 'number', 'Bad argument 1 @ SendMessage (number expected, got '..type( iChat )..')' )
	assert( sMessage and type( sMessage ) == 'string', 'Bad argument 2 @ SendMessage (string expected, got '..type( sMessage )..')' )
    return fetchRemote( MESSAGE_SEND_URL..'?chat_id='..iChat..'&message='..urlencode( sMessage )..'&access_token='..urlencode( ACCESS_TOKEN )..'&v=5.37', 
    	function( result ) 
    		if bDebugState then
    			iprint( result )
    		end
    	end )
end
