local	charm_bracelet_mod = RegisterMod( "charm_bracelet" , 1 );

local	bracelet = Isaac.GetItemIdByName( "Charm Bracelet" ) -- each time you kill an enemy, charm another enemy for 3 seconds.
function charm_bracelet_mod:bracelet_effect()
  local player = Isaac.GetPlayer(0)
  if player:HasCollectible(bracelet) then
    for i, entity in pairs(Isaac.GetRoomEntities()) do
      if entity:IsVulnerableEnemy() then
        entity:AddCharmed(3000) -- should charm for 3 seconds
        break
      end
    end
  end
end
--callback
charm_bracelet_mod:AddCallback( ModCallbacks.MC_POST_ENTITY_KILL , charm_bracelet_mod.bracelet_effect);