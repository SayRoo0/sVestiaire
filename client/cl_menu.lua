
local main, desc = "~r~Vestiaire", "~r~SxG Développement"
local blabla = ""
local sub = function(str)
    return main .. "_" .. str
end
function openvestiaire()
    if mainOpened then
        return
    end
    mainOpened = true
    RMenu.Add(main, sub("Main"), RageUI.CreateMenu(main, desc))
    RMenu:Get(main, sub("Main")):SetRectangleBanner(0, 0, 0, 255)
    RMenu:Get(main, sub("Main")).Closed = function()
        blabla = ""
        Permission = false 
    end
    RageUI.Visible(RMenu:Get(main, sub("Main")), true)
    Citizen.CreateThread(function()
        while mainOpened do
            local shouldmainOpened = false
            local function OpenMenu()
                shouldmainOpened = true
            end
            RageUI.IsVisible(RMenu:Get(main, sub("Main")), true, true, true, function()
                OpenMenu()
                RageUI.Separator("~r~→ ~s~Total de tenue : "..#Tenuvest.." ~r~←~s~")
                if Permission then
              RageUI.ButtonWithStyle("~r~> ~s~Enregistrer une nouvelle Tenue", nil, {}, true, function(h,a,s)
                    if s then
                        nomTenu = KeyboardInput("~b~Nom de la Tenue", "", 15)
                        if nomTenu ~= "" then
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                    MaTenu = {
                                        tshirt_1 = skin.tshirt_1,
                                        tshirt_2 = skin.tshirt_2,
                                        torso_1 = skin.torso_1,
                                        torso_2 = skin.torso_2,
                                        torso_1 = skin.torso_1,
                                        pants_1 = skin.pants_1,
                                        pants_2 = skin.pants_2,
                                        arms = skin.arms,
                                        glasses_1 = skin.glasses_1,
                                        glasses_2 = skin.glasses_2,
                                        mask_1 = skin.mask_1,
                                        mask_2 = skin.mask_2,
                                        bproof_1 = skin.bproof_1,
                                        bproof_2 = skin.bproof_2,
                                        chain_1 = skin.chain_1,
                                        chain_2 = skin.chain_2,
                                        bags_1 = skin.bags_1,
                                        bags_2 = skin.bags_2,
                                        bracelets_1 = skin.bracelets_1,
                                        bracelets_2 = skin.bracelets_2,
                                        watches_1 = skin.watches_1,
                                        watches_2 = skin.watches_2,
                                        helmet_1 = skin.helmet_1,
                                        helmet_2 = skin.helmet_2,
                                        ears_1 = skin.ears_1,
                                        ears_2 = skin.ears_2,
                                        shoes_1 = skin.shoes_1,
                                        shoes_2 = skin.shoes_2
                                    }
                                TriggerServerEvent("add:vet",MaTenu,nomTenu,ESX.PlayerData.job.name)
                                RageUI.CloseAll()
                            end)
                        end)
                    else 
                        ESX.ShowNotification("~r~Il faut donner un nom à cette tenue") end end end)
                    end
                    RageUI.ButtonWithStyle("~r~> ~s~Remettre sa Tenue", nil, {}, true, function(h,a,s)
                        if s then
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                    TriggerEvent('skinchanger:loadClothes', skin)
                                end)
                            end)
                        end end)
    
                        RageUI.Separator("~r~↓~s~ Tenue du vestiaire ~r~↓")
                 for k,v in pairs(Tenuvest) do 
                    RageUI.ButtonWithStyle(v.nomtenu, blabla, {}, true, function(h,a,s)
                        if a and Permission then 
                            blabla = "Pour supprimer la Tenue appuyez sur ←"
                            if IsControlPressed(1, 174) then 
                                TriggerServerEvent("del:vet",v.idtenu)
                                RageUI.CloseAll()
                            end
                        end
                        if s then
                            SetPedComponentVariation(GetPlayerPed(-1), 3, v.tenu.arms)
                            SetPedComponentVariation(GetPlayerPed(-1), 8, v.tenu.tshirt_1, v.tenu.tshirt_2, 2)
                            SetPedComponentVariation(GetPlayerPed(-1), 11, v.tenu.torso_1, v.tenu.torso_2, 2)
                            SetPedComponentVariation(GetPlayerPed(-1), 4, v.tenu.pants_1,v.tenu.pants_2, 2)
                            SetPedComponentVariation(GetPlayerPed(-1), 6, v.tenu.shoes_1,v.tenu.shoes_2, 2)
                            SetPedComponentVariation(GetPlayerPed(-1), 5, v.tenu.bags_1,v.tenu.bags_2, 2)
                            SetPedComponentVariation(GetPlayerPed(-1), 7, v.tenu.bproof_1,v.tenu.bproof_2, 2)
                            SetPedComponentVariation(GetPlayerPed(-1), 1, v.tenu.mask_1, v.tenu.mask_2, 2)
                            SetPedPropIndex(GetPlayerPed(-1), 2, v.tenu.ears_1, v.tenu.ears_2, 2)
                            SetPedPropIndex(GetPlayerPed(-1), 1, v.tenu.glasses_1, v.tenu.glasses_2, 2)
                            SetPedPropIndex(GetPlayerPed(-1), 0, v.tenu.helmet_1, v.tenu.helmet_2, 2)
                            SetPedPropIndex(GetPlayerPed(-1), 6, v.tenu.watches_1, v.tenu.watches_2, 2)
                            SetPedPropIndex(GetPlayerPed(-1), 1, v.tenu.bracelets_1, v.tenu.bracelets_2, 2)
                            print("load : "..v.nomtenu)
                    end end)
                 end
            end, function()
            end)
            if not shouldmainOpened and mainOpened then
                mainOpened = false
            end
            Wait(0)
        end
        RMenu:Delete(main, sub("Main"))
    end)
end