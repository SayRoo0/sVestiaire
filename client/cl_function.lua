DrawName3D = function(x,y,z, text) 
SetDrawOrigin(x, y, z, 0);
SetTextFont(0)
SetTextProportional(0)
SetTextScale(0.0, 0.40)
SetTextColour(255, 255, 255, 255)
SetTextDropshadow(0, 0, 0, 0, 255)
SetTextEdge(2, 0, 0, 0, 150)
SetTextDropShadow()
SetTextOutline()
SetTextEntry("STRING")
SetTextCentre(1)
AddTextComponentString(text)
DrawText(0.0, 0.0)
ClearDrawOrigin()
end
KeyboardInput = function(TextEntry, ExampleText, MaxStringLength)
AddTextEntry('FMMC_KEY_TIP1', TextEntry .. '')
DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
blockinput = true
while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
Citizen.Wait(0)
end
if UpdateOnscreenKeyboard() ~= 2 then
local result = GetOnscreenKeyboardResult()
Citizen.Wait(500)
blockinput = false
return result
else
Citizen.Wait(500)
blockinput = false
return nil
end
end
GetTenue = function() 
Tenuvest = {}
ESX.TriggerServerCallback("sheesh:getTenue", function(result)
Tenuvest = result
end, ESX.PlayerData.job.name)
 end
