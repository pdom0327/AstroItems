-- TrinketType.TRINKET_UMBILICAL_CORD : 해당 장신구 증발되고, 리틀 스티븐(CollectibleType.COLLECTIBLE_LITTLE_STEVEN) 지급
-- TrinketType.TRINKET_MISSING_PAGE : 해당 장신구 증발되고, 네크로노미콘(CollectibleType.COLLECTIBLE_NECRONOMICON) 소환
-- TrinketType.TRINKET_FADED_POLAROID : 해당 장신구 증발되고, 네거티브, 폴라로이드 2개 등장 후 한개 획득
-- TrinketType.TRINKET_LOUSE : 해당 장신구 증발되고, 인페2(CollectibleType.COLLECTIBLE_INFESTATION_2) 소환
-- TrinketType.TRINKET_BROKEN_SYRINGE : 해당 장신구 증발되면서 아이작에 존재하는 주사기 2개 소환되고 1개 선택
-- TrinketType.TRINKET_RED_PATCH : 해당 장신구 증발되고, 블러디 러스트 소환

-- TrinketType.TRINKET_SILVER_DOLLAR : 황금으로 되는 즉시 캐릭터에게 흡수
-- TrinketType.TRINKET_BLOODY_CROWN : 황금으로 되는 즉시 캐릭터에게 흡수
-- TrinketType.TRINKET_HOLY_CROWN : 황금으로 되는 즉시 캐릭터에게 흡수
-- TrinketType.TRINKET_WICKED_CROWN : 황금으로 되는 즉시 캐릭터에게 흡수
-- TrinketType.TRINKET_NUMBER_MAGNET : 황금으로 되는 즉시 캐릭터에게 흡수

-- TrinketType.TRINKET_PURPLE_HEART : 배수 1.2배 증가

-- TrinketType.TRINKET_PINKY_EYE : 공격 시 100% 확률로 독눈물
-- TrinketType.TRINKET_PUSH_PIN : 공격 시 100% 확률로 관통 눈물

-- TrinketType.TRINKET_SUPER_BALL : 공격 시 25% 확률로 시맨트 적용 (럭1당 1%p 증가)
-- TrinketType.TRINKET_BRAIN_WORM : 공격 시 50% 확률로 유도 적용 (럭1당 1%p 증가)

-- TrinketType.TRINKET_BLACK_LIPSTICK : 스테이지 진입 시 블랙 하트 1개 소환
-- TrinketType.TRINKET_RUSTED_KEY : 스테이지 진입 시 마다 금키 소환
-- TrinketType.TRINKET_SAFETY_CAP : 스테이지 진입 시 마다 걸프 알약 소환
-- TrinketType.TRINKET_ACE_SPADES : 스테이지 진입 시 마다 랜덤 카드 소환
-- TrinketType.TRINKET_MATCH_STICK : 스테이지 진입 시 기가 폭탄 소환(5.40.7)

-- TrinketType.TRINKET_BLOODY_PENNY : 동전 획득 시 종류 상관 없이 25% 확률로 빨간 하트 반칸 드랍 (럭1당 1%p 증가)
-- TrinketType.TRINKET_BURNT_PENNY : 동전 획득 시 종류 상관 없이 25% 확률로 랜덤 폭탄 소환 (럭1당 1%p 증가)
-- TrinketType.TRINKET_FLAT_PENNY : 동전 획득 시 종류 상관 없이 25% 확률로 랜덤 열쇠 소환 (럭1당 1%p 증가)
-- TrinketType.TRINKET_COUNTERFEIT_PENNY : 동전 획득 시 종류 상관 없이 25% 확률로 랜덤 동전 1개 소환 (럭1당 1%p 증가)
-- TrinketType.TRINKET_ROTTEN_PENNY : 동전 획득 시 종류 상관 없이 100% 확률로 자폭 파리 하나 소환
-- TrinketType.TRINKET_BLESSED_PENNY : 동전 획득 시 종류 상관 없이 12.5% 확률로 소울 하트 반칸 소환 (럭1당 1%p 증가)

-- TrinketType.TRINKET_BAT_WING : 소지중인 상태일경우 공중 적용

-- TrinketType.TRINKET_TEMPORARY_TATTOO : 미니맵에 전투방 위치를 표시해주고, 전투방을 조건없이 들어갈 수 있음

local isc = require("astro.lib.isaacscript-common")

local GRID_SIZE = 40
local GOLDEN_TRINKET_OFFSET = 32768

local game = Game()

if EID then
    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_UMBILICAL_CORD,
        {"!!! 획득 시 사라지고 {{Collectible100}}Little Steven을 획득합니다."}
    )
    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_MISSING_PAGE,
        {"!!! 획득 시 사라지고 {{Collectible35}}The Necronomicon을 소환합니다."}
    )
    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_FADED_POLAROID,
        {"!!! 획득 시 사라지고 {{Collectible327}}The Polaroid과 {{Collectible328}}The Negative를 소환합니다. 하나를 선택하면 나머지는 사라집니다."}
    )
    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_LOUSE,
        {
            "효과 2배#!!! {{ColorGold}}획득 시 사라지고 {{Collectible234}} 소환합니다.",
            "효과 3배#!!! {{ColorGold}}획득 시 사라지고 {{Collectible234}} 소환합니다."
        }
    )
    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_BROKEN_SYRINGE,
        {"!!! 획득 시 사라지고 랜덤한 주사기 아이템 2개를 소환합니다. 하나를 선택하면 나머지는 사라집니다."}
    )
    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_RED_PATCH,
        {"!!! 획득 시 사라지고 {{Collectible157}}BloodyLust을 소환합니다."}
    )

    Astro.Utill:addGoldenTrinketDescription(TrinketType.TRINKET_SILVER_DOLLAR, {"!!! 획득 시 바로 흡수됩니다."})
    Astro.Utill:addGoldenTrinketDescription(TrinketType.TRINKET_BLOODY_CROWN, {"!!! 획득 시 바로 흡수됩니다."})
    Astro.Utill:addGoldenTrinketDescription(TrinketType.TRINKET_HOLY_CROWN, {"!!! 획득 시 바로 흡수됩니다."})
    Astro.Utill:addGoldenTrinketDescription(TrinketType.TRINKET_WICKED_CROWN, {"!!! 획득 시 바로 흡수됩니다."})
    Astro.Utill:addGoldenTrinketDescription(TrinketType.TRINKET_NUMBER_MAGNET, {"!!! 획득 시 바로 흡수됩니다."})

    Astro.Utill:addGoldenTrinketDescription(TrinketType.TRINKET_PURPLE_HEART, {"↑ {{DamageSmall}}공격력 x1.2"})

    Astro.Utill:addGoldenTrinketDescription(TrinketType.TRINKET_PINKY_EYE, "", 10, 10)
    Astro.Utill:addGoldenTrinketDescription(TrinketType.TRINKET_PUSH_PIN, "", 10, 10)

    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_SUPER_BALL,
        "25%의 확률로 적용됩니다.#!!! {{ColorGold}}{{LuckSmall}}행운 수치 비례: 행운 75 이상일 때 100% 확률"
    )
    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_BRAIN_WORM,
        "눈물을 발사할 때 25%의 확률로 유도 효과가 생깁니다.#!!! {{ColorGold}}{{LuckSmall}}행운 수치 비례: 행운 50 이상일 때 100% 확률"
    )

    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_BLACK_LIPSTICK,
        "스테이지를 넘어갈 때마다 {{BlackHeart}}블랙하트를 하나 드랍합니다."
    )
    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_RUSTED_KEY,
        "스테이지를 넘어갈 때마다 {{GoldenKey}}황금열쇠를 하나 드랍합니다."
    )
    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_SAFETY_CAP,
        "스테이지를 넘어갈 때마다 {{Pill1}}Gulp! 알약을 하나 드랍합니다."
    )
    Astro.Utill:addGoldenTrinketDescription(TrinketType.TRINKET_ACE_SPADES, "스테이지를 넘어갈 때마다 {{Card}}카드를 하나 생성합니다.")
    Astro.Utill:addGoldenTrinketDescription(TrinketType.TRINKET_MATCH_STICK, "스테이지를 넘어갈 때마다 {{Bomb}}기가 폭탄을 하나 드랍합니다.")

    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_BLOODY_PENNY,
        "효과가 1번 더 발동합니다. 동전 가치를 반영하지 않습니다.#!!! {{ColorGold}}{{LuckSmall}}행운 수치 비례: 행운 75 이상일 때 100% 확률"
    )
    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_BURNT_PENNY,
        "효과가 1번 더 발동합니다. 동전 가치를 반영하지 않습니다.#!!! {{ColorGold}}{{LuckSmall}}행운 수치 비례: 행운 75 이상일 때 100% 확률"
    )
    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_FLAT_PENNY,
        "효과가 1번 더 발동합니다. 동전 가치를 반영하지 않습니다.#!!! {{ColorGold}}{{LuckSmall}}행운 수치 비례: 행운 75 이상일 때 100% 확률"
    )
    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_COUNTERFEIT_PENNY,
        "효과가 1번 더 발동합니다. 동전 가치를 반영하지 않습니다.#!!! {{ColorGold}}{{LuckSmall}}행운 수치 비례: 행운 75 이상일 때 100% 확률"
    )
    Astro.Utill:addGoldenTrinketDescription(TrinketType.TRINKET_ROTTEN_PENNY, "효과가 1번 더 발동합니다.")
    Astro.Utill:addGoldenTrinketDescription(
        TrinketType.TRINKET_BLESSED_PENNY,
        "효과가 1번 더 발동합니다. 동전 가치를 반영하지 않습니다.#!!! {{ColorGold}}{{LuckSmall}}행운 수치 비례: 행운 88 이상일 때 100% 확률"
    )

    Astro.Utill:addGoldenTrinketDescription(TrinketType.TRINKET_BAT_WING, "비행 능력을 얻습니다.")

    Astro.Utill:addGoldenTrinketDescription(TrinketType.TRINKET_TEMPORARY_TATTOO, "{{ChallengeRoom}} 소지 중일 때 도전방/보스도전방에 항상 입장할 수 있습니다.#{{ColorGold}}맵에 {{ChallengeRoom}}도전방/보스도전방의 위치가 표시됩니다.")
end

---@param value integer
---@param trinket TrinketType
---@return boolean
local function CheckTrinket(value, trinket)
    if value == trinket or value - GOLDEN_TRINKET_OFFSET == trinket then
        return true
    end

    return false
end

---@param player EntityPlayer
---@param type integer
---@return boolean
local function RunEffect(player, type)
    if CheckTrinket(type, TrinketType.TRINKET_UMBILICAL_CORD) then
        player:AddCollectible(CollectibleType.COLLECTIBLE_LITTLE_STEVEN)
        return true
    elseif CheckTrinket(type, TrinketType.TRINKET_MISSING_PAGE) then
        local currentRoom = game:GetLevel():GetCurrentRoom()
        Isaac.Spawn(
            EntityType.ENTITY_PICKUP,
            PickupVariant.PICKUP_COLLECTIBLE,
            CollectibleType.COLLECTIBLE_NECRONOMICON,
            currentRoom:FindFreePickupSpawnPosition(player.Position + Vector(0, -GRID_SIZE), GRID_SIZE, true),
            Vector.Zero,
            nil
        )
        return true
    elseif CheckTrinket(type, TrinketType.TRINKET_RED_PATCH) then
        local currentRoom = game:GetLevel():GetCurrentRoom()
        Isaac.Spawn(
            EntityType.ENTITY_PICKUP,
            PickupVariant.PICKUP_COLLECTIBLE,
            CollectibleType.COLLECTIBLE_BLOODY_LUST,
            currentRoom:FindFreePickupSpawnPosition(player.Position + Vector(0, -GRID_SIZE), GRID_SIZE, true),
            Vector.Zero,
            nil
        )
        return true
    elseif CheckTrinket(type, TrinketType.TRINKET_FADED_POLAROID) then
        local currentRoom = game:GetLevel():GetCurrentRoom()
        Isaac.Spawn(
                EntityType.ENTITY_PICKUP,
                PickupVariant.PICKUP_COLLECTIBLE,
                CollectibleType.COLLECTIBLE_POLAROID,
                currentRoom:FindFreePickupSpawnPosition(
                    player.Position + Vector(-GRID_SIZE, -GRID_SIZE),
                    GRID_SIZE,
                    true
                ),
                Vector.Zero,
                nil
            ):ToPickup().OptionsPickupIndex = TrinketType.TRINKET_FADED_POLAROID
        Isaac.Spawn(
                EntityType.ENTITY_PICKUP,
                PickupVariant.PICKUP_COLLECTIBLE,
                CollectibleType.COLLECTIBLE_NEGATIVE,
                currentRoom:FindFreePickupSpawnPosition(
                    player.Position + Vector(GRID_SIZE, -GRID_SIZE),
                    GRID_SIZE,
                    true
                ),
                Vector.Zero,
                nil
            ):ToPickup().OptionsPickupIndex = TrinketType.TRINKET_FADED_POLAROID
        return true
    elseif CheckTrinket(type, TrinketType.TRINKET_LOUSE) then
        local currentRoom = game:GetLevel():GetCurrentRoom()
        Isaac.Spawn(
            EntityType.ENTITY_PICKUP,
            PickupVariant.PICKUP_COLLECTIBLE,
            CollectibleType.COLLECTIBLE_INFESTATION_2,
            currentRoom:FindFreePickupSpawnPosition(player.Position + Vector(0, -GRID_SIZE), GRID_SIZE, true),
            Vector.Zero,
            nil
        )
        return true
    elseif CheckTrinket(type, TrinketType.TRINKET_BROKEN_SYRINGE) then
        local currentRoom = game:GetLevel():GetCurrentRoom()
        local rng = player:GetTrinketRNG(TrinketType.TRINKET_BROKEN_SYRINGE)

        local syringes = {
            CollectibleType.COLLECTIBLE_VIRUS,
            CollectibleType.COLLECTIBLE_ROID_RAGE,
            CollectibleType.COLLECTIBLE_GROWTH_HORMONES,
            CollectibleType.COLLECTIBLE_SPEED_BALL,
            CollectibleType.COLLECTIBLE_EXPERIMENTAL_TREATMENT,
            CollectibleType.COLLECTIBLE_SYNTHOIL,
            CollectibleType.COLLECTIBLE_ADRENALINE,
            CollectibleType.COLLECTIBLE_EUTHANASIA
        }

        local count = #syringes

        local firstIndex = rng:RandomInt(count) + 1
        local secondIndex = rng:RandomInt(count - 1) + 1

        Isaac.Spawn(
                EntityType.ENTITY_PICKUP,
                PickupVariant.PICKUP_COLLECTIBLE,
                syringes[firstIndex],
                currentRoom:FindFreePickupSpawnPosition(
                    player.Position + Vector(-GRID_SIZE, -GRID_SIZE),
                    GRID_SIZE,
                    true
                ),
                Vector.Zero,
                nil
            ):ToPickup().OptionsPickupIndex = TrinketType.TRINKET_BROKEN_SYRINGE

        table.remove(syringes, firstIndex)

        Isaac.Spawn(
                EntityType.ENTITY_PICKUP,
                PickupVariant.PICKUP_COLLECTIBLE,
                syringes[secondIndex],
                currentRoom:FindFreePickupSpawnPosition(
                    player.Position + Vector(GRID_SIZE, -GRID_SIZE),
                    GRID_SIZE,
                    true
                ),
                Vector.Zero,
                nil
            ):ToPickup().OptionsPickupIndex = TrinketType.TRINKET_BROKEN_SYRINGE
        return true
    elseif CheckTrinket(type, TrinketType.TRINKET_SILVER_DOLLAR) then
        isc:smeltTrinket(player, TrinketType.TRINKET_SILVER_DOLLAR + GOLDEN_TRINKET_OFFSET)
        return true
    elseif CheckTrinket(type, TrinketType.TRINKET_BLOODY_CROWN) then
        isc:smeltTrinket(player, TrinketType.TRINKET_BLOODY_CROWN + GOLDEN_TRINKET_OFFSET)
        return true
    elseif CheckTrinket(type, TrinketType.TRINKET_HOLY_CROWN) then
        isc:smeltTrinket(player, TrinketType.TRINKET_HOLY_CROWN + GOLDEN_TRINKET_OFFSET)
        return true
    elseif CheckTrinket(type, TrinketType.TRINKET_WICKED_CROWN) then
        isc:smeltTrinket(player, TrinketType.TRINKET_WICKED_CROWN + GOLDEN_TRINKET_OFFSET)
        return true
    elseif CheckTrinket(type, TrinketType.TRINKET_NUMBER_MAGNET) then
        isc:smeltTrinket(player, TrinketType.TRINKET_NUMBER_MAGNET + GOLDEN_TRINKET_OFFSET)
        return true
    elseif CheckTrinket(type, TrinketType.TRINKET_LOCUST_OF_PESTILENCE) then
        isc:smeltTrinket(player, TrinketType.TRINKET_LOCUST_OF_PESTILENCE + GOLDEN_TRINKET_OFFSET)
        return true
    elseif CheckTrinket(type, TrinketType.TRINKET_LOCUST_OF_FAMINE) then
        isc:smeltTrinket(player, TrinketType.TRINKET_LOCUST_OF_FAMINE + GOLDEN_TRINKET_OFFSET)
        return true
    elseif CheckTrinket(type, TrinketType.TRINKET_LOCUST_OF_DEATH) then
        isc:smeltTrinket(player, TrinketType.TRINKET_LOCUST_OF_DEATH + GOLDEN_TRINKET_OFFSET)
        return true
    elseif CheckTrinket(type, TrinketType.TRINKET_LOCUST_OF_CONQUEST) then
        isc:smeltTrinket(player, TrinketType.TRINKET_LOCUST_OF_CONQUEST + GOLDEN_TRINKET_OFFSET)
        return true
    end

    return false
end

-- 최적화 해야 함
Astro:AddCallback(
    ModCallbacks.MC_POST_PEFFECT_UPDATE,
    ---@param player EntityPlayer
    function(_, player)
        local trinket0 = player:GetTrinket(0)
        local trinket1 = player:GetTrinket(1)

        if
            (player:HasCollectible(CollectibleType.COLLECTIBLE_MOMS_BOX) or isc:isGoldenTrinketType(trinket0)) and
                RunEffect(player, trinket0)
         then
            player:TryRemoveTrinket(trinket0)
        elseif
            (player:HasCollectible(CollectibleType.COLLECTIBLE_MOMS_BOX) or isc:isGoldenTrinketType(trinket1)) and
                RunEffect(player, trinket1)
         then
            player:TryRemoveTrinket(trinket1)
        end

        if player:GetTrinketMultiplier(TrinketType.TRINKET_TEMPORARY_TATTOO) > 1 then
            local level = game:GetLevel()
            local idx = level:QueryRoomTypeIndex(RoomType.ROOM_CHALLENGE, false, RNG())
            local room = level:GetRoomByIdx(idx)
    
            if room.Data.Type == RoomType.ROOM_CHALLENGE then
                room.DisplayFlags = room.DisplayFlags | 1 << 2
                level:UpdateVisibility()
            end
            
            local currentRoom = Game():GetLevel():GetCurrentRoom()

            for _, value in pairs(isc:getDoors()) do
                local door = value ---@type GridEntityDoor

                if currentRoom:IsClear() and door:IsOpen() == false and door.TargetRoomType == RoomType.ROOM_CHALLENGE then
                    door:TryUnlock(Isaac.GetPlayer(), true)
                end
            end
        end
    end
)

Astro:AddCallback(
    ModCallbacks.MC_EVALUATE_CACHE,
    ---@param player EntityPlayer
    ---@param cacheFlag CacheFlag
    function(_, player, cacheFlag)
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            if player:GetTrinketMultiplier(TrinketType.TRINKET_PURPLE_HEART) > 1 then
                player.Damage = player.Damage * 1.2
            end
        elseif cacheFlag == CacheFlag.CACHE_FLYING then
            if player:GetTrinketMultiplier(TrinketType.TRINKET_BAT_WING) > 1 then
                player.CanFly = true
            end
        elseif cacheFlag == CacheFlag.CACHE_TEARFLAG then
            if player:GetTrinketMultiplier(TrinketType.TRINKET_PINKY_EYE) > 1 then
                player.TearFlags = player.TearFlags | TearFlags.TEAR_POISON
            end

            if player:GetTrinketMultiplier(TrinketType.TRINKET_PUSH_PIN) > 1 then
                player.TearFlags = player.TearFlags | TearFlags.TEAR_SPECTRAL | TearFlags.TEAR_PIERCING
            end
        end
    end
)

Astro:AddCallback(
    ModCallbacks.MC_POST_FIRE_TEAR,
    ---@param tear EntityTear
    function(_, tear)
        local player = Astro.Utill:GetPlayerFromEntity(tear)

        if player ~= nil then
            if player:GetTrinketMultiplier(TrinketType.TRINKET_PINKY_EYE) > 1 then
                tear.Color = Color(0.4, 0.97, 0.5, 1, 0, 0, 0)
            end

            if player:GetTrinketMultiplier(TrinketType.TRINKET_PUSH_PIN) > 1 then
                if tear.Variant == TearVariant.BLUE then
                    tear:ChangeVariant(TearVariant.CUPID_BLUE)
                elseif tear.Variant == TearVariant.BLOOD then
                    tear:ChangeVariant(TearVariant.CUPID_BLOOD)
                end

                tear.Color = Color(1.5, 2, 2, 0.5, 0, 0, 0)
            end

            if player:GetTrinketMultiplier(TrinketType.TRINKET_SUPER_BALL) > 1 then
                local rng = player:GetTrinketRNG(TrinketType.TRINKET_SUPER_BALL)

                if rng:RandomFloat() < 0.25 + player.Luck / 100 then
                    tear.TearFlags = tear.TearFlags | TearFlags.TEAR_BOUNCE
                    tear.Color = Color(1, 1, 0.8, 1, 0.1, 0.1, 0.1)
                end
            end

            if player:GetTrinketMultiplier(TrinketType.TRINKET_BRAIN_WORM) > 1 then
                local rng = player:GetTrinketRNG(TrinketType.TRINKET_BRAIN_WORM)

                if rng:RandomFloat() < 0.5 + player.Luck / 100 then
                    tear.TearFlags = tear.TearFlags | TearFlags.TEAR_HOMING
                -- tear.Color = Color(0.4, 0.15, 0.38, 1, 0.27843, 0, 0.4549)
                end
            end
        end
    end
)

Astro:AddCallback(
    ModCallbacks.MC_POST_NEW_LEVEL,
    function()
        for i = 1, game:GetNumPlayers() do
            local player = Isaac.GetPlayer(i - 1)
            local currentRoom = game:GetLevel():GetCurrentRoom()

            if player:GetTrinketMultiplier(TrinketType.TRINKET_BLACK_LIPSTICK) > 1 then
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_HEART,
                    HeartSubType.HEART_BLACK,
                    currentRoom:FindFreePickupSpawnPosition(player.Position, GRID_SIZE, true),
                    Vector.Zero,
                    nil
                )
            end

            if player:GetTrinketMultiplier(TrinketType.TRINKET_RUSTED_KEY) > 1 then
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_KEY,
                    KeySubType.KEY_GOLDEN,
                    currentRoom:FindFreePickupSpawnPosition(player.Position, GRID_SIZE, true),
                    Vector.Zero,
                    nil
                )
            end

            if player:GetTrinketMultiplier(TrinketType.TRINKET_SAFETY_CAP) > 1 then
                local itemPool = game:GetItemPool()
                local pillColor = itemPool:ForceAddPillEffect(PillEffect.PILLEFFECT_GULP)

                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_PILL,
                    pillColor,
                    currentRoom:FindFreePickupSpawnPosition(player.Position, 40, true),
                    Vector.Zero,
                    nil
                )
            end

            if player:GetTrinketMultiplier(TrinketType.TRINKET_ACE_SPADES) > 1 then
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_TAROTCARD,
                    0,
                    currentRoom:FindFreePickupSpawnPosition(player.Position, GRID_SIZE, true),
                    Vector.Zero,
                    nil
                )
            end

            if player:GetTrinketMultiplier(TrinketType.TRINKET_MATCH_STICK) > 1 then
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_BOMB,
                    BombSubType.BOMB_GIGA,
                    currentRoom:FindFreePickupSpawnPosition(player.Position, GRID_SIZE, true),
                    Vector.Zero,
                    nil
                )
            end
        end
    end
)

Astro:AddCallbackCustom(
    isc.ModCallbackCustom.POST_PICKUP_COLLECT,
    ---@param pickup EntityPickup
    ---@param player EntityPlayer
    function(_, pickup, player)
        if pickup.Variant == PickupVariant.PICKUP_COIN then
            local currentRoom = game:GetLevel():GetCurrentRoom()

            if player:GetTrinketMultiplier(TrinketType.TRINKET_BLOODY_PENNY) > 1 then
                local rng = player:GetTrinketRNG(TrinketType.TRINKET_BLOODY_PENNY)

                if rng:RandomFloat() < 0.25 + player.Luck / 100 then
                    Isaac.Spawn(
                        EntityType.ENTITY_PICKUP,
                        PickupVariant.PICKUP_HEART,
                        2,
                        currentRoom:FindFreePickupSpawnPosition(player.Position, GRID_SIZE, true),
                        Vector.Zero,
                        nil
                    )
                end
            end

            if player:GetTrinketMultiplier(TrinketType.TRINKET_BURNT_PENNY) > 1 then
                local rng = player:GetTrinketRNG(TrinketType.TRINKET_BURNT_PENNY)

                if rng:RandomFloat() < 0.25 + player.Luck / 100 then
                    Isaac.Spawn(
                        EntityType.ENTITY_PICKUP,
                        PickupVariant.PICKUP_BOMB,
                        0,
                        currentRoom:FindFreePickupSpawnPosition(player.Position, GRID_SIZE, true),
                        Vector.Zero,
                        nil
                    )
                end
            end

            if player:GetTrinketMultiplier(TrinketType.TRINKET_FLAT_PENNY) > 1 then
                local rng = player:GetTrinketRNG(TrinketType.TRINKET_FLAT_PENNY)

                if rng:RandomFloat() < 0.25 + player.Luck / 100 then
                    Isaac.Spawn(
                        EntityType.ENTITY_PICKUP,
                        PickupVariant.PICKUP_KEY,
                        0,
                        currentRoom:FindFreePickupSpawnPosition(player.Position, GRID_SIZE, true),
                        Vector.Zero,
                        nil
                    )
                end
            end

            if player:GetTrinketMultiplier(TrinketType.TRINKET_COUNTERFEIT_PENNY) > 1 then
                local rng = player:GetTrinketRNG(TrinketType.TRINKET_COUNTERFEIT_PENNY)

                if rng:RandomFloat() < 0.25 + player.Luck / 100 then
                    Isaac.Spawn(
                        EntityType.ENTITY_PICKUP,
                        PickupVariant.PICKUP_COIN,
                        0,
                        currentRoom:FindFreePickupSpawnPosition(player.Position, GRID_SIZE, true),
                        Vector.Zero,
                        nil
                    )
                end
            end

            if player:GetTrinketMultiplier(TrinketType.TRINKET_ROTTEN_PENNY) > 1 then
                Isaac.Spawn(
                    EntityType.ENTITY_FAMILIAR,
                    FamiliarVariant.BLUE_FLY,
                    0,
                    player.Position,
                    Vector.Zero,
                    player
                )
            end

            if player:GetTrinketMultiplier(TrinketType.TRINKET_BLESSED_PENNY) > 1 then
                local rng = player:GetTrinketRNG(TrinketType.TRINKET_BLESSED_PENNY)

                if rng:RandomFloat() < 0.125 + player.Luck / 100 then
                    Isaac.Spawn(
                        EntityType.ENTITY_PICKUP,
                        PickupVariant.PICKUP_HEART,
                        HeartSubType.HEART_HALF_SOUL,
                        currentRoom:FindFreePickupSpawnPosition(player.Position, GRID_SIZE, true),
                        Vector.Zero,
                        nil
                    )
                end
            end
        end
    end
)
