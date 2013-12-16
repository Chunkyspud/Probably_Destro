-- ProbablyEngine Rotation Packager
-- Custom Destruction Warlock Rotation
-- Created on Nov 30th 2013 5:12 am
ProbablyEngine.rotation.register_custom(267, "Destro",{

{ "109773", "!player.buff" },

{ "1490", { -- Curse of the Elements
  "@destro.Boss",
  "target.debuff.duration <= 14",
  "!modifier.last(1490)",
  }
}, 

{ "104232", { -- Rain of Fire
  "modifier.lshift",
  "player.spell(104232).casted < 1" 
  }, "ground" 
},

{ "!30283", { -- Shadowfury
  "modifier.rshift",
  "player.spell(30283).casted < 1" 
  }, 
  "ground" 
},

{ "!20707", { -- Soulstone
  "!mouseover.alive",
  "modifier.ralt",
}}, 

{ "!80240", "modifier.lalt", "mouseover" }, -- Havoc

  { "!113858", --Dark Soul: Instability
  "player.buff(146046)" 
  },
  
  -- Survival
{ "!114635", { --Ember Tap
  "player.health <= 20",
  "player.embers >= 10"
  }
},

  { "108416", "player.health <= 50" },--Sacrificial Pact

  { "!#5512", "player.health <= 40", "player" }, --Healthstone

  -- Pet Sac in case we die
{{
  { "691", { 
    "!modifier.last(691)", 
    "!player.buff(108503)" }},
  { "112869", {
    "!modifier.last(112869)",
    "player.spell(108499).exists" }},
}, 
  { "!player.moving", 
     "!pet.exists",
     "toggle.sacrifice"
}},
  { "108503", { 
    "pet.exists", 
    "!player.buff",
    "player.spell(108503).exists",
    "toggle.sacrifice" 
}},  
  -- Cooldowns
{{
  { "18540", "player.buff(2825)" },
  { "112927", "player.buff(2825)" },
 }, "modifier.cooldowns"},


 -- AOE
  { "/cancelaura 108683", -- Brimstone off
    "!modifier.multitarget"},

  { "108683", { -- Brimstone
    "!player.buff(108683)",
    "modifier.multitarget",
    "player.embers >= 10"
  }},
  
  { "108686", { -- Immolate
    "player.buff(108683)",
    "target.debuff(108686).duration <= 4",
    "player.spell(108686).casted < 1",
    "modifier.multitarget",
  }},
  
  { "108685", { -- Conflagrate
    "player.buff(108683)",
    "modifier.multitarget",
  }},

  { "114654", { -- Incinerate AOE
    "player.buff(108683)",
    "modifier.multitarget",
  }},

  { "114654", { -- Incinerate Moving AOE
    "player.buff(108683)",
    "modifier.multitarget",
    "player.moving",
  }},
 
  { "29722", { -- Incinerate Embers
    "!player.buff(108683)",
    "player.embers < 10",
    "modifier.multitarget",
   }},

  -- Opener
{{
  { "17962", "player.spell.charges >= 1" },
  { "29722", "player.buff(117828).count > 3" },
  { "116858", "player.embers >= 20" },
  { "348", {
    "target.debuff.duration <= 3",
    "!modifier.last" }}
 },
  { "player.time < 25", "@destro.Boss", }},
  
  -- Rotation

{{ -- ShadowBurn
  { "!17877", "player.buff(80240).count >= 1" }, -- Havoc
  { "!17877", "player.buff(113858)" }, -- Darksoul
  { "!17877", "player.buff(114207)" }, -- Skull Banner
  { "!17877", "player.buff(146218)" }, -- Yu'lon's Bite
  { "!17877", "player.buff(146046)" }, -- Expanded Mind
  { "!17877", "player.buff(138898)" }, -- Breath of Hydra
  { "!17877", "player.buff(139133)" }, -- Cha-Ye's Essence
  { "!17877", "player.buff(126577)" }, -- Light of the Cosmos
  { "!17877", "player.buff(138963)" }, -- Unnering Vision 
  { "!17877", "player.buff(138786)" }, -- Wushoolay's
  { "!17877", "player.buff(136082)" }, -- Static-Caster's
  { "!17877", "player.buff(148897)" }, -- Frenzied Crystal
  { "!17877", "player.buff(148906)" }, -- Kardris' Toxic Totem
  { "!17877", "player.buff(146184)" }, -- Blood of Y'Shaarj
  { "!17877", "player.embers >= 35" }, -- Capped
  { "!17877", "target.deathin < 20" }, -- TTD < 30
},
  { "target.health < 20" 
}},

{ "348", { --Immolate
    "target.debuff(348).duration <= 3",
    "player.spell(348).casted < 1",
    "@destro.interruptEvents(target)",
    "!player.moving",
}},  

{{ -- Chaos Bolt
  { "116858", { --Don't cap
    "!modifier.last(116858)", 
    "player.embers >= 35" }}, 
  { "116858", "player.buff(113858).duration > 2.7" }, -- Darksoul    
  { "116858", "player.buff(114207).duration > 2.7" }, -- Skull Banner
  { "116858", "player.buff(146218).duration > 2.7" }, -- Yu'lon's Bite
  { "116858", "player.buff(146046).duration > 2.7" }, -- Bindings of Immerseus
  { "116858", "player.buff(138898).duration > 2.7" }, -- Breath of Hydra
  { "116858", "player.buff(139133).duration > 2.7" }, -- Cha-Ye's Essence
  { "116858", "player.buff(126577).duration > 2.7" }, -- Light of the Cosmos
  { "116858", "player.buff(138963).duration > 2.7" }, -- Unnering Vision 
  { "116858", "player.buff(138786).duration > 2.7" }, -- Wushoolay's
  { "116858", "player.buff(136082).duration > 2.7" }, -- Static-Caster's
  { "116858", "player.buff(148897).duration > 2.7" }, -- Frenzied Crystal
  { "116858", "player.buff(148906).duration > 2.7" }, -- Kardris' Toxic Totem
  { "116858", "player.buff(146184).duration > 2.7" }, -- Blood of Y'Shaarj
},
  { "target.health > 20", "@destro.interruptEvents(target)", "!player.moving" 
}},
 
  { "116858", { -- Chaos Bolt Havoc
      "player.buff(80240).count = 3",
      "target.health > 20",
      "@destro.interruptEvents(target)",
      "!player.moving"
  }},


  { "17962", "player.spell(17962).charges >= 1" }, -- Conflagrate

  { "29722", { -- Incinerate
    "player.buff(117828)",
    "@destro.interruptEvents(target)",
}}, 

  { "77799", { -- Fel Flame
    "!player.spell(137587).exists", 
    "player.moving" 
}},

{ "348", { --Immolate
    "target.debuff(348).duration <= 3",
    "player.spell(348).casted < 1",
    "@destro.interruptEvents(target)",
    "!player.moving",
}},  

  { "29722", "@destro.interruptEvents(target)" }, -- Incinerate
},
{
  -- Out of Combat
  -- Buffs
  { "109773", "!player.buff" },
 
  -- Create Healthstone
  { "6201", { 
      "@destro.Healthstone",
      "!modifier.last(6201)" 
  }},

  -- Pet Sac
{{
  { "691", { 
    "!modifier.last(691)", 
    "!player.buff(108503)" }},
  { "112869", {
    "!modifier.last(112869)",
    "player.spell(108499).exists" }},
}, 
  { "!player.moving", 
     "!pet.exists",
     "toggle.sacrifice"
}},
  { "108503", { 
    "pet.exists", 
    "!player.buff",
    "player.spell(108503).exists",
    "toggle.sacrifice"
  }},

}, function()
ProbablyEngine.toggle.create('sacrifice', 'Interface\\Icons\\warlock_grimoireofsacrifice', 'Sacrifice', 'Toggle Summon and Sacrifice')
end)
