local webhook = '' -- Webhook link for Chat Logs
local whcolor = '' -- Webhook color, use https://www.spycolor.com

if (webhook == nil or webhook == '') then
  print("There is no webhook assinged to the RP Chat Logs.")
end

if (whcolor == nil or whcolor == '') then
  print("There is no webhook color assinged to the RP Chat Logs.")
end

if EnableRPChat == true then

  -- Me Command
  RegisterCommand('me', function(source, args, user)
  if #args > 0 then
    local name = GetPlayerName(source)
    local chatMessage = table.concat(args, " ")
    local date = os.date(("%A, %B %m, %Y | %I:%M:%S %p"))
    TriggerClientEvent("sendProximityMessageMe", -1, source, name, chatMessage)
    sendToDiscord(whcolor, "Command Log: /me", "**Player Using Command:\n"..name.." | Server ID: "..source.."\n\nMessage:**\n".."`"..chatMessage.."`",date)
    end
    end, false)

  -- Do Command
  RegisterCommand('do', function(source, args, user)
  if #args > 0 then
    local name = GetPlayerName(source)
    local chatMessage = table.concat(args, " ")
    local date = os.date(("%A, %B %m, %Y | %I:%M:%S %p"))
    TriggerClientEvent("sendProximityMessageDo", -1, source, name, chatMessage)
    sendToDiscord(whcolor, "Command Log: /do", "**Player Using Command:\n"..name.." | Server ID: "..source.."\n\nMessage:**\n".."`"..chatMessage.."`",date)
    end
    end, false)

  -- OOC Command
  RegisterCommand('ooc', function(source, args, user)
  if #args > 0 then
    local name = GetPlayerName(source)
    local chatMessage = table.concat(args, " ")
    local date = os.date(("%A, %B %m, %Y | %I:%M:%S %p"))
  	TriggerClientEvent('sendProximityMessageOOC', -1, source, name, chatMessage)
    sendToDiscord(whcolor, "Command Log: /ooc", "**Player Using Command:\n"..name.." | Server ID: "..source.."\n\nMessage:**\n".."`"..chatMessage.."`",date)
    end
    end, false)

  -- Global Do Command
  RegisterCommand('gdo', function(source, args, user)
  if #args > 0 then
    local name = GetPlayerName(source)
    local chatMessage = table.concat(args, " ")
    local date = os.date(("%A, %B %m, %Y | %I:%M:%S %p"))
    TriggerClientEvent('chatMessage', -1, "[Global Do] " .. name, {93, 182, 229}, chatMessage)
    sendToDiscord(whcolor, "Command Log: /gdo", "**Player Using Command:\n"..name.." | Server ID: "..source.."\n\nMessage:**\n".."`"..chatMessage.."`",date)
    end 
    end, false)

    -- Global Me Command
  RegisterCommand('gme', function(source, args, user)
  if #args > 0 then
    local name = GetPlayerName(source)
    local chatMessage = table.concat(args, " ")
    local date = os.date(("%A, %B %m, %Y | %I:%M:%S %p"))
    TriggerClientEvent('chatMessage', -1, "[Global Me] " .. name, {240, 200, 80}, chatMessage)
    sendToDiscord(whcolor, "Command Log: /gme", "**Player Using Command:\n"..name.." | Server ID: "..source.."\n\nMessage:**\n".."`"..chatMessage.."`",date)
    end
    end, false)

  -- Twitter Command  
  RegisterCommand('twt', function(source, args, user)
  if #args > 0 then
    local name = GetPlayerName(source)
    local chatMessage = table.concat(args, " ")
    local date = os.date(("%A, %B %m, %Y | %I:%M:%S %p"))
  	TriggerClientEvent('chatMessage', -1, "^4[Twitter] ^0(^4@" .. name .. "^0)", {47, 92, 115}, chatMessage)
    sendToDiscord(whcolor, "Command Log: /twt", "**Player Using Command:\n"..name.." | Server ID: "..source.."\n\nMessage:**\n".."`"..chatMessage.."`",date)
    end
    end, false)

  -- GOOC Command  
  RegisterCommand('gooc', function(source, args, user)
  if #args > 0 then
    local name = GetPlayerName(source)
    local chatMessage = table.concat(args, " ")
    local date = os.date(("%A, %B %m, %Y | %I:%M:%S %p"))
  	TriggerClientEvent('chatMessage', -1, "[GOOC] " .. name, {155, 155, 155}, chatMessage)
    sendToDiscord(whcolor, "Command Log: /gooc", "**Player Using Command:\n"..name.." | Server ID: "..source.."\n\nMessage:**\n".."`"..chatMessage.."`",date)
    end
    end, false)

  -- Darkweb Command  
  RegisterCommand('dark', function(source, args, user)
  if #args > 0 then
    local darkNumber = math.random(100000, 999999)
    local name = GetPlayerName(source)
    local chatMessage = table.concat(args, " ")
    local date = os.date(("%A, %B %m, %Y | %I:%M:%S %p"))
    TriggerClientEvent('chatMessage', -1, "[Dark] anonymous_"..darkNumber, {128, 128, 128}, chatMessage)
    sendToDiscord(whcolor, "Command Log: /dark", "**Player Using Command:\n"..name.." | Server ID: "..source.."\n\nMessage:**\n".."`"..chatMessage.."`",date)
    end
    end, false)
end

-- DON'T TOUCH THIS UNLESS YOU KNOW WHAT YOU ARE DOING
function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

function sendToDiscord(color, name, message, footer)
  local embed = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = footer,
            },
        }
    }

  PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
end
