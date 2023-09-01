Astro.Collectible = {}

require "astro.collectibles.cygnus"
require "astro.collectibles.libra-ex"
require "astro.collectibles.cancer-ex"
require "astro.collectibles.scorpio-ex"
require "astro.collectibles.capricorn-ex"
require "astro.collectibles.king-baby"
require "astro.collectibles.virgo-ex"
require "astro.collectibles.leo-ex"
require "astro.collectibles.aquarius-ex"
require "astro.collectibles.aries-ex"
require "astro.collectibles.taurus-ex"
require "astro.collectibles.luna"

if EID then
    EID:addDescriptionModifier(
        "TrinketStackingPlus",
        function(descObj)
            return true
        end,
        function(descObj)
            if
                descObj.ObjSubType == CollectibleType.COLLECTIBLE_LITTLE_HORN or
                    descObj.ObjSubType == CollectibleType.COLLECTIBLE_EUTHANASIA or
                    descObj.ObjSubType == CollectibleType.COLLECTIBLE_LOST_CONTACT
             then
                EID:appendToDescription(descObj, "#↓ {{DamageSmall}}공격력 배율 x0.75")
            end

            return descObj
        end
    )
end

Astro:AddCallback(
    ModCallbacks.MC_EVALUATE_CACHE,
    ---@param player EntityPlayer
    ---@param cacheFlag CacheFlag
    function(_, player, cacheFlag)
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            if
                player:HasCollectible(CollectibleType.COLLECTIBLE_LITTLE_HORN) or
                    player:HasCollectible(CollectibleType.COLLECTIBLE_EUTHANASIA) or
                    player:HasCollectible(CollectibleType.COLLECTIBLE_LOST_CONTACT)
             then
                player.Damage = player.Damage * 0.75
            end
        end
    end
)
