Astro:AddCallback(
	ModCallbacks.MC_POST_GAME_STARTED,
	function(_, _)
		local player = Isaac.GetPlayer()
		local itemConfig = Isaac.GetItemConfig()
		local itemConfigItem = itemConfig:GetCollectible(CollectibleType.COLLECTIBLE_MORE_OPTIONS)

		player:RemoveCostume(itemConfigItem)
	end
)

function Astro:CurseRemove(curse) -- 입장 전 저주 제거
	if (Game():GetLevel():GetStage() <= 3 and curse ~= 0) then
		return 0
	end

	-- return ~(~BitSet128(curse) | BitSet128(
	-- 	LevelCurse.CURSE_OF_MAZE |
	-- 	LevelCurse.CURSE_OF_DARKNESS |
	-- 	LevelCurse.CURSE_OF_THE_LOST |
	-- 	LevelCurse.CURSE_OF_THE_UNKNOWN
	-- )).l;

	for i = 1, Game():GetNumPlayers() do
		local player = Isaac.GetPlayer(i - 1)

		if player:HasTrinket(TrinketType.TRINKET_PERFECTION) then
			return 0
		end
	end
end

Astro:AddCallback(ModCallbacks.MC_POST_CURSE_EVAL, Astro.CurseRemove)

---@param player EntityPlayer
function Astro:OnUpdate(player)
	local level = Game():GetLevel()
	local stage = level:GetStage()

	if
		stage >= LevelStage.STAGE4_3 or
			(stage == LevelStage.STAGE4_2 and level:GetStageType() == StageType.STAGETYPE_REPENTANCE)
	 then
		local playerType = player:GetPlayerType()

		if playerType == PlayerType.PLAYER_KEEPER or playerType == PlayerType.PLAYER_KEEPER_B or playerType == PlayerType.PLAYER_THESOUL_B then
		elseif playerType == PlayerType.PLAYER_THEFORGOTTEN then
			player:AddBoneHearts(-player:GetBoneHearts() + 2)
			player:AddBrokenHearts(4 - player:GetBrokenHearts())
			player:GetSubPlayer():AddBrokenHearts(2 - player:GetSubPlayer():GetBrokenHearts())
		elseif playerType == PlayerType.PLAYER_THESOUL then
			player:AddBrokenHearts(2 - player:GetBrokenHearts())
			player:GetSubPlayer():AddBoneHearts(-player:GetSubPlayer():GetBoneHearts() + 2)
			player:GetSubPlayer():AddBrokenHearts(4 - player:GetSubPlayer():GetBrokenHearts())
		else
			if player:GetEffectiveMaxHearts() > 2 then
				if player:GetMaxHearts() >= 2 then
					player:AddMaxHearts(2 - player:GetMaxHearts(), true)
					player:AddBoneHearts(-player:GetBoneHearts())
				else
					player:AddBoneHearts(1 - player:GetBoneHearts())
				end
			end

			if player:GetSoulHearts() > 6 then
				player:AddSoulHearts(6 - player:GetSoulHearts())
			end

			if player:GetBrokenHearts() < 8 then
				player:AddBrokenHearts(8 - player:GetBrokenHearts())
			end
		end
	end

	if player:HasCollectible(CollectibleType.COLLECTIBLE_MAGIC_8_BALL, true) then
		local idx = level:QueryRoomTypeIndex(RoomType.ROOM_PLANETARIUM, false, RNG())
		local room = level:GetRoomByIdx(idx)

		if room.Data.Type == RoomType.ROOM_PLANETARIUM then
			room.DisplayFlags = room.DisplayFlags | 1 << 2
			level:UpdateVisibility()
		end
	end
end

Astro:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, Astro.OnUpdate)