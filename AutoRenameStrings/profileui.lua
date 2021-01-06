local _G, select, setmetatable                          = _G, select, setmetatable

local TMW                                               = _G.TMW

local aayUCM                                                = _G.Action

local IqRiyF                                            = aayUCM.Const
local wkAgxY                                            = aayUCM.Print
local rneEsJ                                     = aayUCM.GetSpellInfo
local GhncrC                                        = aayUCM.GetToggle
local XGRXMh                                       = aayUCM.GetLatency
local cKCAiP                                 = aayUCM.InterruptIsValid
local lJtavb                                             = aayUCM.Unit
local lOckhr                                       = _G.UnitIsUnit
local RSNOeZ                                       = aayUCM.MultiUnits
local CPkKuf                                     = aayUCM.CPkKuf


local ACTION_CONST_PALADIN_RETRIBUTION                  = IqRiyF.PALADIN_RETRIBUTION    
local ipairs, pairs, type, CopyTable                    = _G.ipairs, _G.pairs, _G.type, _G.CopyTables
local player                                            = "player"

local S                                                 = {
    DivineShield                                        = (rneEsJ(642)),
    BlessingofProtection                                = (rneEsJ(1022)),
    ShieldofVengeance                                   = (rneEsJ(184662)),
    Stoneform                                           = (rneEsJ(20594)),
    HammerofJustice                                     = (rneEsJ(853)),
    WordofGlory                                         = (rneEsJ(85673)),
}

local L                                             = {}
L.AUTO                                                = {
    enUS = "Auto",
    ruRU = "Авто ",
}
L.OFF                                                = {
    enUS = "Off",
    ruRU = "Выкл.",
}
L.PVP                                                 = {
    ANY = "PvP",
}
L.MOUSEOVER                                            = {
    enUS = "Use\n@mouseover",
    ruRU = "Использовать\n@mouseover",
}
L.MOUSEOVERTT                                        = {
    enUS = "Will unlock use actions for @mouseover units\nExample: Resuscitate, Healing\n\nRight click: Create macro",
    ruRU = "Разблокирует использование действий для @mouseover юнитов\nНапример: Воскрешение, Хилинг\n\nПравая кнопка мышки: Создать макрос",
}
L.AOE                                                = {
    enUS = "Use\nAoE",
    ruRU = "Использовать\nAoE",
}
L.AOETT                                                = {
    enUS = "Enable multiunits rotation\n\nRight click: Create macro",
    ruRU = "Включает ротацию для нескольких целей\n\nПравая кнопка мышки: Создать макрос",
}
L.DEFENSIVE                                            = {
    enUS = "Self Defensive",
    ruRU = "Своя Оборона",
}
L.ROTATION                                            = {
    enUS = "Rotation",
    ruRU = "Ротация",
}
L.CATCHINVISIBLE                                    = {
    enUS = "Catch Invisible (arena)",
    ruRU = "Поймать Невидимок (арена)",
}
L.CATCHINVISIBLETT                                    = {
    enUS = "Cast when combat around has been begin and enemy team still has unit in invisible\nDoesn't work if you're mounted or in combat!\n\nRight click: Create macro",
    ruRU = "Применять когда бой поблизости начат и команда противника до сих пор имеет юнита в невидимости\nНе работает, когда вы на транспорте или в бою!\n\nПравая кнопка мышки: Создать макрос",
}
L.CUSTOMINTERRUPTPVE                                = {
    ANY = "Mythic+ & Raid\nCustom Interrupts (PvE)",
}
L.CUSTOMINTERRUPTPVE_TT                                = {
    enUS = "Custom list for Interrupt and CC in Mythic+ and Raid",
}
L.STONEFORM											= {
	enUS = S.Stoneform .. "\nHealth Percent",
	ruRU = S.Stoneform .. "\nПроцент Здоровья",
}
L.DivineShield										= {
	enUS = S.DivineShield .. "\nHealth Percent (Self)",
	ruRU = S.DivineShield .. "\nЗдоровье Процент (Свое)",
}
L.ShieldofVengeance										= {
	enUS = S.ShieldofVengeance .. "\nHealth Percent (Self)",
	ruRU = S.ShieldofVengeance .. "\nЗдоровье Процент (Свое)",
}
L.BlessingofProtection										= {
	enUS = S.BlessingofProtection .. "\nHealth Percent (Self)",
	ruRU = S.BlessingofProtection .. "\nЗдоровье Процент (Свое)",
}
L.WordofGlory										= {
	enUS = S.WordofGlory.. "\nHealth Percent (Self)",
	ruRU = S.WordofGlory .. "\nЗдоровье Процент (Свое)",
}
L.HammerofJusticePvP										= {
	ANY = "PvP " .. S.HammerofJustice,
}
L.HammerofJusticePvPTT									= {
	enUS = "@arena1-3 interrupt PvP list from 'Interrupts' tab by " .. S.HammerofJustice .. "\nMore custom config you can find in group by open /tmw\n\nRight click: Create macro",
	ruRU = "@arena1-3 прерывание Параличом PvP списка из вкладки 'Прерывания'\nБольше кастомизации вы найдете в группе открыв /tmw\n\nПравая кнопка мышки: Создать макрос",
}
L.HammerofJusticePvP_ONLYHEAL								= {
	enUS = "Only Heal Casts",
	ruRU = "Только Исцел. Заклинания",
}
L.HammerofJusticePvP_ONLYPVP								= {
	enUS = "Only PvP Casts",
	ruRU = "Только PvP Заклинания",
}
L.HammerofJusticePvP_BOTH									= {
	enUS = "Heal + PvP Casts",
	ruRU = "Исцел. + PvP Заклинания",
}
local SliderMarginOptions = { margin = { top = 10 } }
local LayoutConfigOptions = { gutter = 4, padding = { left = 5, right = 5 } }
aayUCM.Data.ProfileEnabled[aayUCM.CurrentProfile]             = true
aayUCM.Data.ProfileUI                                     = {
    DateTime = "v1.13 (22.11.2020)",
    [2] = {
        [ACTION_CONST_PALADIN_RETRIBUTION] = {
            LayoutOptions = LayoutConfigOptions,
            {
                {
                    E                 = "Checkbox",
                    DB                 = "mouseover",
                    DBV             = true,
                    L                 = L.MOUSEOVER,
                    TT                 = L.MOUSEOVERTT,
                    M                 = {},
                },
                {
                    E                 = "Checkbox",
                    DB                 = "AoE",
                    DBV             = true,
                    L                 = L.AOE,
                    TT                 = L.AOETT,
                    M                 = {},
                },
            },
            {
                {
                    E         = "Checkbox",
                    DB         = "ZakLLInterrupts",
                    DBV     = true,
                    L         = L.CUSTOMINTERRUPTPVE,
                    TT         = L.CUSTOMINTERRUPTPVE_TT,
                    M         = {},
                },
                
            },
            {
                {
                    E                 = "Header",
                    L                 = L.DEFENSIVE,
                },
            },
            {
				{
					E 				= "Slider",
					MIN 			= -1,
					MAX 			= 100,
					DB 				= "DivineShield",
					DBV 			= 100,
					ONOFF 			= true,
					L 				= L.DivineShield,
					M 				= {},
				},
				{
					E 				= "Slider",
					MIN				= -1,
					MAX				= 100,
					DB 				= "BlessingofProtection",
					DBV				= 100,
					ONOFF 			= true,
					L 				= L.BlessingofProtection,
					M 				= {},
				},
            },
            {
				{
					E 				= "Slider",
					MIN 			= -1,
					MAX 			= 100,
					DB 				= "ShieldofVengeance",
					DBV 			= 100,
					ONOFF 			= true,
					L 				= L.ShieldofVengeance,
					M 				= {},
				},
				{
					E 				= "Slider",
					MIN				= -1,
					MAX				= 100,
					DB 				= "Stoneform",
					DBV				= 100,
					ONOFF 			= true,
					L 				= L.STONEFORM,
					M 				= {},
				},
            },
            {
                {
					E 				= "Slider",
					MIN 			= -1,
					MAX 			= 100,
					DB 				= "WordofGlory",
					DBV 			= 100,
					ONOFF 			= true,
					L 				= L.WordofGlory,
					M 				= {},
				},
            },
            {
                {
                    E                = "Header",
                    L                = L.PVP,
                },
            },
            {
				{
					E 				= "Checkbox",
					DB 				= "CatchInvisible",
					DBV 			= true,
					L 				= L.CATCHINVISIBLE,
					TT 				= L.CATCHINVISIBLETT,
					M 				= {},
				},
				{
					E 				= "Dropdown",
					OT 				= {
						{ text = L.HammerofJusticePvP_ONLYHEAL, 	value = "Heal" 	},
						{ text = L.HammerofJusticePvP_ONLYPVP, 	value = "PvP" 	},
						{ text = L.HammerofJusticePvP_BOTH, 		value = "BOTH" 	},
						{ text = L.OFF, 					value = "OFF" 	},
					},
					DB 				= "HammerofJusticePvP",
					DBV 			= "BOTH",
					L 				= L.HammerofJusticePvP,
					TT 				= L.HammerofJusticePvPTT,
					M 				= {},
				},
			},
        }
    }
}

local ImunBuffsCC	 		 				= {"CCTotalImun", "DamagePhysImun", "TotalImun"}
local ImunBuffsInterrupt	 				= {"KickImun", "TotalImun", "DamagePhysImun"}

function aayUCM:sSXOab(Tnoeol, jqBiuh)
    if aayUCM.IsInPvP and (aayUCM.Zone == "arena" or aayUCM.Zone == "pvp") then
        if self.isRebuke then
            local TbqULc, _, _, NOmLdU = cKCAiP(Tnoeol, "Heal", nil, jqBiuh)
            if not TbqULc then
                TbqULc, _, _, NOmLdU = cKCAiP(Tnoeol, "PvP", nil, jqBiuh)
            end
            if TbqULc and not NOmLdU and self:IsReadyByPassCastGCD(Tnoeol) and self:AbsentImun(Tnoeol, ImunBuffsInterrupt, true) then
                return true
            end
        end
        
        if self.isHammer then
            local HammerofJusticePvP = GhncrC(2, "HammerofJusticePvP")
            if HammerofJusticePvP and HammerofJusticePvP ~= "OFF" and self:IsReadyByPassCastGCD(Tnoeol) then
                local _, hvzSKV, yUdmeB
                if Toggle == "BOTH" then
                    hvzSKV, _, _, yUdmeB = select(2, cKCAiP(Tnoeol, "Heal", nil, jqBiuh))
                    if not hvzSKV then
                        hvzSKV, _, _, yUdmeB = select(2, cKCAiP(Tnoeol, "PvP", nil, jqBiuh))
                    end
                else
                    hvzSKV, _, _, yUdmeB = select(2, cKCAiP(Tnoeol, Toggle, nil, jqBiuh))
                end
                if hvzSKV and yUdmeB >= XGRXMh() and lJtavb(Tnoeol):IsControlAble("stun") and not lJtavb(Tnoeol):InLOS() and self:AbsentImun(Tnoeol, ImunBuffsCC, true) then
                    return true
                end
            end
        end
    end
end

