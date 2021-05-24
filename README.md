# mtasa-vk-api
A resource that allows you to send messages on behalf of a VK group directly from the MTA.

**Documentation**

In the second line of VKMessages.lua, enter your access_token in the ACCESS_TOKEN variable and start the resource.

Send message:
```lua
  -- Both export:
  exports["mta-vk-api"]:SendMessage( iChat, sMessage )
    or
  exports.mta-vk-api:SendMessage( iChat, sMessage )
```
