AstroItems.Collectible.SINFUL_SPOILS_STRUGGLE = Isaac.GetItemIdByName("Sinful Spoils Struggle")

local useSound = Isaac.GetSoundIdByName('Destroyed')
local useSoundVoulme = 1 -- 0 ~ 1

AstroItems:AddCallback(
    ModCallbacks.MC_POST_GAME_STARTED,
    function(_, isContinued)
        if EID then
            AstroItems:AddEIDCollectible(AstroItems.Collectible.SINFUL_SPOILS_STRUGGLE, "아라메시아의 의", "당신은 오랜 맹약의 의식에 의해 이 세계에 내려왔습니다. ", "사용 시 {{Trinket" .. AstroItems.Trinket.BLACK_MIRROR .. "}}Black Mirror를 소환합니다.#스테이지 진입 시 쿨타임이 채워집니다.#성전의 수견사, 일리걸 나이트가 아닐 경우 사용 시 {{LuckSmall}}행운이 2 감소합니다.")
            AstroItems:AddEIDCollectible(
                AstroItems.Collectible.SINFUL_SPOILS_STRUGGLE,
                "죄보합전",
                "...",
                "일급 비밀방에서 사용 시 소지된 아이템 중 1개를 재거합니다. {{Collectible" .. AstroItems.Collectible.ORIGINAL_SINFUL_SPOILS_SNAKE_EYE .. "}}Original Sinful Spoils - Snake Eye, {{Collectible" .. AstroItems.Collectible.SINFUL_SPOILS_OF_SUBVERSION_SNAKE_EYE .. "}}Sinful Spoils of Subversion - Snake Eye 중 하나와 제거된 아이템을 소환합니다. 하나를 선택하면 나머지는 사라집니다.#스테이지 진입 시 쿨타임이 채워집니다.#디아벨스타, 디아벨제가 아닐 경우 사용 시 {{LuckSmall}}행운이 1 감소하고 제거 후 소환되는 아이템이 2개로 증가합니다."
            )
        end

        if not isContinued then
            AstroItems.Data.SinfulSpoilsStruggle = {
                luck = 0
            }
        end
    end
)

AstroItems:AddCallback(
    ModCallbacks.MC_POST_NEW_LEVEL,
    function(_)
        for i = 1, Game():GetNumPlayers() do
            local player = Isaac.GetPlayer(i - 1)

            for j = 0, ActiveSlot.SLOT_POCKET2 do
                if player:GetActiveItem(j) == AstroItems.Collectible.SINFUL_SPOILS_STRUGGLE then
                    if player:GetPlayerType() == AstroItems.Players.WATER_ENCHANTRESS and player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) then
                        player:AddCollectible(CollectibleType.COLLECTIBLE_BATTERY)
                        player:SetActiveCharge(100, j)
                        player:RemoveCollectible(CollectibleType.COLLECTIBLE_BATTERY)
                    else
                        player:SetActiveCharge(50, j)
                    end
                end
            end
        end
    end
)


AstroItems:AddCallback(
    ModCallbacks.MC_USE_ITEM,
    ---@param collectibleID CollectibleType
    ---@param rngObj RNG
    ---@param playerWhoUsedItem EntityPlayer
    ---@param useFlags UseFlag
    ---@param activeSlot ActiveSlot
    ---@param varData integer
    function(_, collectibleID, rngObj, playerWhoUsedItem, useFlags, activeSlot, varData)
        if Game():GetLevel():GetCurrentRoom():GetType() ~= RoomType.ROOM_SUPERSECRET then
            return {
                Discharge = false,
                Remove = false,
                ShowAnim = false,
            }
        end

        local inventory = AstroItems:getPlayerInventory(playerWhoUsedItem, false)
        local rng = playerWhoUsedItem:GetCollectibleRNG(AstroItems.Collectible.SINFUL_SPOILS_STRUGGLE)

        local hadCollectables = {}

        if AstroItems:IsDiabellstar(playerWhoUsedItem) then
            hadCollectables = AstroItems:GetRandomCollectibles(inventory, rng, 1, AstroItems.Collectible.SINFUL_SPOILS_STRUGGLE, true)
        else
            hadCollectables = AstroItems:GetRandomCollectibles(inventory, rng, 2, AstroItems.Collectible.SINFUL_SPOILS_STRUGGLE, true)
        end

        if hadCollectables[1] == nil then
            return {
                Discharge = false,
                Remove = false,
                ShowAnim = false,
            }
        end

        for _, hadCollectable in ipairs(hadCollectables) do
            AstroItems:SpawnCollectible(hadCollectable, playerWhoUsedItem.Position, AstroItems.Collectible.SINFUL_SPOILS_STRUGGLE)
            playerWhoUsedItem:RemoveCollectible(hadCollectable)
        end

        local random = rng:RandomInt(2)

        if random == 0 then
            AstroItems:SpawnCollectible(AstroItems.Collectible.ORIGINAL_SINFUL_SPOILS_SNAKE_EYE, playerWhoUsedItem.Position, AstroItems.Collectible.SINFUL_SPOILS_STRUGGLE)
        else
            AstroItems:SpawnCollectible(AstroItems.Collectible.SINFUL_SPOILS_OF_SUBVERSION_SNAKE_EYE, playerWhoUsedItem.Position, AstroItems.Collectible.SINFUL_SPOILS_STRUGGLE)
        end

        SFXManager():Play(useSound, useSoundVoulme)

        if not AstroItems:IsDiabellstar(playerWhoUsedItem) then
            AstroItems.Data.SinfulSpoilsStruggle.luck = AstroItems.Data.SinfulSpoilsStruggle.luck - 1

            playerWhoUsedItem:AddCacheFlags(CacheFlag.CACHE_LUCK)
            playerWhoUsedItem:EvaluateItems()
        end

        return {
            Discharge = true,
            Remove = false,
            ShowAnim = true,
        }
    end,
    AstroItems.Collectible.SINFUL_SPOILS_STRUGGLE
)

AstroItems:AddCallback(
    ModCallbacks.MC_EVALUATE_CACHE,
    ---@param player EntityPlayer
    ---@param cacheFlag CacheFlag
    function(_, player, cacheFlag)
        if not AstroItems:IsDiabellstar(player) and AstroItems.Data.SinfulSpoilsStruggle ~= nil then
            player.Luck = player.Luck + AstroItems.Data.SinfulSpoilsStruggle.luck
        end
    end,
    CacheFlag.CACHE_LUCK
)
