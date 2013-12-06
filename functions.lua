local destro = { }

function destro.interruptEvents(unit)
  if UnitBuff("player", 31821) then return true end -- Devo
  if not unit then unit = "boss1" end
  local spell = UnitCastingInfo(unit)
  local stop = false
  if spell == GetSpellInfo(138763) then stop = true end
  if spell == GetSpellInfo(137457) then stop = true end
  if spell == GetSpellInfo(143343) then stop = true end -- Thok
  if stop then
    if UnitCastingInfo("player") or UnitChannelInfo("player") then
      RunMacroText("/stopcasting")
      return false
    end
  end
  return true
end

function destro.Healthstone(target)
  if GetItemCount(5512, nil, true) == 3 then return false end
  return true
end

function destro.CurseofElements(target)
  if UnitLevel("target") == -1 then 
    return true 
    end
  return false
end

function destro.Doomguard (target)
  if not (UnitBuff("player", 2825) or
     UnitBuff("player", 90355) or
     UnitBuff("player", 80353) or
     UnitBuff("player", 32182)) then
   return false
 end
 return true
end

ProbablyEngine.library.register("destro", destro)
