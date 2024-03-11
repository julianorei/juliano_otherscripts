--removerambulanciasnpc
Citizen.CreateThread(function()
	for i = 1, 15 do
			EnableDispatchService(i, false)
	end
end)

--nao passar de passageiro para condutor
local disableShuffle = true
function disableSeatShuffle(flag)
disableShuffle = flag
end

Citizen.CreateThread(function()
while true do
	Citizen.Wait(0)
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) and disableShuffle then
		if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
			if GetIsTaskActive(GetPlayerPed(-1), 165) then
				SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
			end
		end
	end
end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
	disableSeatShuffle(false)
	Citizen.Wait(5000)
	disableSeatShuffle(true)
else
	CancelEvent()
end
end)

--NUNCA DESLIGAR
--Citizen.CreateThread(function()
 --   while true do
   --     Citizen.Wait(0)

    --    local ped = GetPlayerPed(-1)
--
      --  if DoesEntityExist(ped) and IsPedInAnyVehicle(ped, false) and IsControlPressed(2, 75) and not IsEntityDead(ped) and not IsPauseMenuActive() then
       --     local engineWasRunning = GetIsVehicleEngineRunning(GetVehiclePedIsIn(ped, true))
      --      Citizen.Wait(1000)
       --     if DoesEntityExist(ped) and not IsPedInAnyVehicle(ped, false) and not IsEntityDead(ped) and not IsPauseMenuActive() then
         --       local veh = GetVehiclePedIsIn(ped, true)
         --       if (engineWasRunning) then
           --         SetVehicleEngineOn(veh, true, true, true)
           --     end
          --  end
      --  end
  --  end
--end)

-- No Weapon Reward Car 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        DisablePlayerVehicleRewards(PlayerId())
    end
end)