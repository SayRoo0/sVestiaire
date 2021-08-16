
ESX = nil
Citizen.CreateThread(function()while ESX == nil do TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end) Citizen.Wait(10) end while ESX.GetPlayerData().job == nil do Citizen.Wait(10)end ESX.PlayerData = ESX.GetPlayerData()end)
RegisterNetEvent('esx:setJob')AddEventHandler('esx:setJob', function(job)ESX.PlayerData.job = job end)
RegisterNetEvent("esx:setJob2")AddEventHandler("esx:setJob2", function(job2)ESX.PlayerData.job2 = job2 end)
print("^1sVestiaire by Sheeeeesh#0010")
-- marker
Citizen.CreateThread(function()
while true do 
local interval = 2800
for i = 1, #CFGVestiaire do
local v = CFGVestiaire[i]
local dist = Vdist(GetEntityCoords(GetPlayerPed(-1), false), v.vestiaire.pos)
if dist <= 3 and ESX.PlayerData.job.name == v.Jobname or dist <= 3 and ESX.PlayerData.job2.name == v.Job2name then 
    xJob1 = v.Jobname
    xJob2 = v.Job2name
for _,Perm in pairs(v.vestiaire.GradePerm) do
DrawName3D(v.vestiaire.pos.x,v.vestiaire.pos.y,v.vestiaire.pos.z,v.vestiaire.msg)
if ESX.PlayerData.job.name == xJob1 and ESX.PlayerData.job.grade_name == Perm or ESX.PlayerData.job2.name == xJob2 and ESX.PlayerData.job2.grade_name == Perm  then
Permission = true
end
interval = 5
if IsControlJustPressed(1,51) then
openvestiaire(GetTenue())
end
end
end
end
Citizen.Wait(interval)
end
end)