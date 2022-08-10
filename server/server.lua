webhook = ''  -- Paste your webhook link in there.
whcolor = '' -- Paste your webhook color in there.

if webhook == '' then
    print('ResourceLog: You haven\'t set a webhook to this script.')
else
    print('ResourceLog: Your webhook now works successfully.')
end

if whcolor == '' then
    print('ResourceLog: You haven\'t set a webhook color to this script.')
else
    print('ResourceLog: Your webhook color now works successfully.')
end

if StartLog == true then
    AddEventHandler('onResourceStart', function(resourceName)
        Wait(1000)
            sendToDiscord(whcolor, "Resource Started: ", "`" ..resourceName.. "`", date)
        end)
    end

if StopLog == true then
    AddEventHandler('onResourceStop', function(resourceName)
        Wait(1000)
            sendToDiscord(whcolor, "Resource Stopped: ", "`" ..resourceName.. "`", date)
        end)
    end



function sendToDiscord(color, title, message, footer)
    local date = os.date(("%x | %I:%M:%S %p")) 
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. title .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = "ResourceLog · ".. date,
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
end
