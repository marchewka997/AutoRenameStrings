local _G, select, setmetatable                          = _G, select, setmetatable

local TMW                                               = _G.TMW

local A                                                 = _G.Action

local HCGIwg                                            = A.Const
local WPCrRB                                     = A.GetSpellInfo
local LiLQqt                                        = A.GetToggle
local bHPkkz                                       = A.GetLatency
local qBYijs                                 = A.InterruptIsValid
local LggLxl                                             = A.Unit


local ACTION_CONST_PALADIN_RETRIBUTION                  = HCGIwg.PALADIN_RETRIBUTION
local vPlayer                                            = "player"

local iqSYpz                                                = {
    DivineShield                                        = (WPCrRB(642)),
    BlessingofProtection                                = (WPCrRB(1022)),
    ShieldofVengeance                                   = (WPCrRB(184662)),
    Stoneform                                           = (WPCrRB(20594)),
    HammerofJustice                                     = (WPCrRB(853)),
    WordofGlory                                         = (WPCrRB(85673)),
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
	enUS = iqSYpz.Stoneform .. "\nHealth Percent",
	ruRU = iqSYpz.Stoneform .. "\nПроцент Здоровья",
}
L.DivineShield										= {
	enUS = iqSYpz.DivineShield .. "\nHealth Percent (Self)",
	ruRU = iqSYpz.DivineShield .. "\nЗдоровье Процент (Свое)",
}
L.ShieldofVengeance										= {
	enUS = iqSYpz.ShieldofVengeance .. "\nHealth Percent (Self)",
	ruRU = iqSYpz.ShieldofVengeance .. "\nЗдоровье Процент (Свое)",
}
L.BlessingofProtection										= {
	enUS = iqSYpz.BlessingofProtection .. "\nHealth Percent (Self)",
	ruRU = iqSYpz.BlessingofProtection .. "\nЗдоровье Процент (Свое)",
}
L.WordofGlory										= {
	enUS = iqSYpz.WordofGlory.. "\nHealth Percent (Self)",
	ruRU = iqSYpz.WordofGlory .. "\nЗдоровье Процент (Свое)",
}
L.HammerofJusticePvP										= {
	ANY = "PvP " .. iqSYpz.HammerofJustice,
}
L.HammerofJusticePvPTT									= {
	enUS = "@arena1-3 interrupt PvP list from 'Interrupts' tab by " .. iqSYpz.HammerofJustice .. "\nMore custom config you can find in group by open /tmw\n\nRight click: Create macro",
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
A.Data.ProfileEnabled[A.CurrentProfile]             = true
A.Data.ProfileUI                                     = {
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
            { -- [2] Self Defensives
                {
                    E                 = "Header",
                    L                 = L.DEFENSIVE,
                },
            },
            { -- [4]
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
            { -- [4]
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

function A:DYfFWB(BoCZPY, JCQiTi)
    if A.IsInPvP and (A.Zone == "arena" or A.Zone == "pvp") then
        if self.isRebuke then
            local SNftjd, _, _, MzbkCV = qBYijs(BoCZPY, "Heal", nil, JCQiTi)
            if not SNftjd then
                SNftjd, _, _, MzbkCV = qBYijs(BoCZPY, "PvP", nil, JCQiTi)
            end
            if SNftjd and not MzbkCV and self:IsReadyByPassCastGCD(BoCZPY) and self:AbsentImun(BoCZPY, ImunBuffsInterrupt, true) then
                return true
            end
        end
        
        if self.isHammer then
            local HammerofJusticePvP = LiLQqt(2, "HammerofJusticePvP")
            if HammerofJusticePvP and HammerofJusticePvP ~= "OFF" and self:IsReadyByPassCastGCD(BoCZPY) then
                local _, gHPSiw, xfsMcc
                if Toggle == "BOTH" then
                    gHPSiw, _, _, xfsMcc = select(2, qBYijs(BoCZPY, "Heal", nil, JCQiTi))
                    if not gHPSiw then
                        gHPSiw, _, _, xfsMcc = select(2, qBYijs(BoCZPY, "PvP", nil, JCQiTi))
                    end
                else
                    gHPSiw, _, _, xfsMcc = select(2, qBYijs(BoCZPY, Toggle, nil, JCQiTi))
                end
                if gHPSiw and xfsMcc >= bHPkkz() and LggLxl(BoCZPY):IsControlAble("stun") and not LggLxl(BoCZPY):InLOS() and self:AbsentImun(BoCZPY, ImunBuffsCC, true) then
                    return true
                end
            end
        end
    end
end

