local MESSAGE_SEND_URL = 'https://api.vk.com/method/messages.send'
local ACCESS_TOKEN = 'your_access_token' -- here is the access_token of the VK group from which you want to send messages
local bDebugState = false -- to enable debug mode, set the value to true

function SendMessage( iChat, sMessage )
	assert( iChat and type( iChat ) == 'number', 'Bad argument 1 @ SendMessage (number expected, got '..type( iChat )..')' )
	assert( sMessage and type( sMessage ) == 'string', 'Bad argument 2 @ SendMessage (string expected, got '..type( sMessage )..')' )
    return fetchRemote( MESSAGE_SEND_URL..'?chat_id='..iChat..'&message='..sMessage..'&access_token='..ACCESS_TOKEN..'&v=5.37', 
    	function( result ) 
    		if bDebugState then
    			iprint( result )
    		end
    	end )
end
