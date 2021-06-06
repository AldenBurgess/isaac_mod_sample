local	gloves_mod = RegisterMod( "thiefs_gloves" , 1 );

local	gloves = Isaac.GetItemIdByName( "Thief's Gloves" ) -- each time you kill an enemy, while close to them, drop a coin..
function gloves_mod:item_effect()
  local player = Isaac.GetPlayer(0)
  if player:HasCollectible(bracelet) then
    for i, entity in pairs(Isaac.GetRoomEntities()) do
      if entity:IsVulnerableEnemy() then
        entity:AddCharmed(3) -- should charm for 3 seconds
        break
      end
    end
  end
end
--callback
charm_bracelet_mod:AddCallback( ModCallbacks.MC_POST_UPDATE , charm_bracelet_mod.bracelet_effect);