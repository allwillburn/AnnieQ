if GetObjectName(GetMyHero()) ~= "Annie" then return end

local BonusAP = GetBonusAP(myHero)
local QDmg = 80 + (35 * GetCastLevel(myHero, _Q)) + (BonusAP * .8)
local QRange = 650

local AnnieMenu = Menu("Annie", "Annie")

AnnieMenu:SubMenu("Farm", "Farm")
AnnieMenu.Farm:Boolean("Q", "AutoQ", true)

OnTick(function (myHero)
 
BonusAP = GetBonusAP(myHero)
QDmg = 70 + (35 * GetCastLevel(myHero, _Q)) + (BonusAP * .8)

--Auto Q on minions
    for _, minion in pairs(minionManager.objects) do
        if AnnieMenu.Farm.Q:Value() and Ready(_Q) and ValidTarget(minion, QRange) and GetCurrentHP(minion) < CalcDamage(myHero,minion,QDmg,0) then
            CastTargetSpell(minion,_Q)
        end
    end
end)

