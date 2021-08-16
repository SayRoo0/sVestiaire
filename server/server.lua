TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
ESX.RegisterServerCallback("sheesh:getTenue", function(source, cb, xJob)
local tenuvest = {}
local xPlayer = ESX.GetPlayerFromId(source)
local id = xPlayer.getIdentifier()
MySQL.Async.fetchAll('SELECT * FROM vestiaire WHERE job = @a', {["@a"]= xJob}, function(result)
for i = 1, #result, 1 do
table.insert(tenuvest, {
nomtenu = result[i].nom,
tenu = json.decode(result[i].tenu),
idtenu = result[i].id
})end cb(tenuvest)end)end)
print("^1sVestiaire by Sheeeeesh#0010^7")
RegisterServerEvent("add:vet")
AddEventHandler("add:vet", function(tenu,nomtenu,xJob)
local xPlayer = ESX.GetPlayerFromId(source)
local id = xPlayer.getIdentifier()
MySQL.Async.execute('INSERT INTO vestiaire (identifier, tenu, nom, job) VALUES (@a,@b,@c,@d)',{['@a']=id, ['@b']=json.encode(tenu),['@c']=nomtenu,['@d']=xJob},function()end)end)
RegisterServerEvent("del:vet")
AddEventHandler("del:vet", function(id)
MySQL.Async.execute('DELETE FROM `vestiaire`WHERE id = @id',{['@id'] = id}, function()end)end)



