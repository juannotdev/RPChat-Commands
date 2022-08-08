RegisterNetEvent('sendProximityMessageMe') -- Me Command
AddEventHandler('sendProximityMessageMe', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {254, 235, 169}, "[Me] " .. name .."^0: ".. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 30 then
    TriggerEvent('chatMessage', "", {254, 235, 169}, "[Me] " .. name .."^0: ".. message)
  end
end)

RegisterNetEvent('sendProximityMessageDo') -- Do Command
AddEventHandler('sendProximityMessageDo', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {174, 219, 242}, "[Do] " .. name .."^0: " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 30 then
    TriggerEvent('chatMessage', "", {174, 219, 242}, "[Do] " .. name .."^0: " .. message)
  end
end)

RegisterNetEvent('sendProximityMessageOOC') -- OOC Command
AddEventHandler('sendProximityMessageOOC', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {205, 205, 205}, "[OOC] " .. name .."^0: " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 30 then
    TriggerEvent('chatMessage', "", {205, 205, 205}, "[OOC] " .. name .."^0: " .. message)
  end
end)

-- Discord Command
if EnableDiscordCommand == true then
	RegisterCommand('discord', function(source, args)
		TriggerEvent('chatMessage', "", source, "^5^*DISCORD: ^0" .. DiscordLink)
	end)
end

-- Website Command
if EnableWebsiteCommand == true then
  RegisterCommand("website", function(source, args)
     TriggerEvent("chatMessage", "", source, "^5^*WEBSITE: ^0" .. WebsiteLink)
  end)
end
