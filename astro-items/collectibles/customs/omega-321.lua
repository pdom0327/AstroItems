AstroItems.Collectible.OMEGA_321 = Isaac.GetItemIdByName("Omega 321")

if EID then
    AstroItems:AddEIDCollectible(AstroItems.Collectible.OMEGA_321, "오메가 321", "최초로 달에 착륙한 시계", "방 입장 시 모든 적들을 8초간 둔화시킵니다.#중첩이 가능합니다.")
end

AstroItems:AddCallback(
    ModCallbacks.MC_POST_NEW_ROOM,
    function()
        local currentRoom = Game():GetLevel():GetCurrentRoom()

        if not currentRoom:IsClear() then
            for i = 1, Game():GetNumPlayers() do
                local player = Isaac.GetPlayer(i - 1)

                if player:HasCollectible(AstroItems.Collectible.OMEGA_321) then
                    for _ = 1, player:GetCollectibleNum(AstroItems.Collectible.OMEGA_321) do
                        player:UseActiveItem(CollectibleType.COLLECTIBLE_HOURGLASS, false, true, false, false)
                    end

                    break
                end
            end
        end
    end
)
