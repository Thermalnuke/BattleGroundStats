local bgsPlayed = ""
local bgsWon = ""
local UIConfig = CreateFrame("Frame",OLDDICK_MainFrame, UIParent, "BasicFrameTemplateWithInset")
UIConfig:SetSize(400,360);
UIConfig:SetPoint("CENTER",UIParent,"CENTER");

--Child Frame Widgets
UIConfig.title = UIConfig:CreateFontString(nil, "OLDDICK");
UIConfig.title:SetFontObject("GameFontHighlight");
UIConfig.title:SetPoint("LEFT", UIConfig.TitleBg, "LEFT",5,0);
UIConfig.title:SetText("OLDDICK's Dick");

for _, CategoryId in pairs(GetStatisticsCategoryList()) do	
		for i = 1, GetCategoryNumAchievements(CategoryId) do
			local ID, Name = GetAchievementInfo(CategoryId, i)
			if Name == "Battlegrounds played" then
                 bgsPlayed = GetStatistic(ID)
			end
			if Name == "Battlegrounds won" then
                 bgsWon = GetStatistic(ID)
			end
		end		
	end

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end
	
local bgsPlayedTitle = UIConfig:CreateFontString(nil, "ARTWORK", "GameFontHighLightSmall")
bgsPlayedTitle:SetPoint("TOPLEFT", UIConfig, "TOPLEFT", 10, -30)
bgsPlayedTitle:SetText("Battlegrounds Played")

local bgsWonTitle = UIConfig:CreateFontString(nil, "ARTWORK", "GameFontHighLightSmall")
bgsWonTitle:SetPoint("TOPLEFT", UIConfig, "TOPLEFT", 150, -30)
bgsWonTitle:SetText("Battlegrounds Won")

local bgsPercentTitle = UIConfig:CreateFontString(nil, "ARTWORK", "GameFontHighLightSmall")
bgsPercentTitle:SetPoint("TOPLEFT", UIConfig, "TOPLEFT", 280, -30)
bgsPercentTitle:SetText("Win Percentage")

local bgsPlayedNum = UIConfig:CreateFontString(nil, "ARTWORK", "GameFontHighLightLarge")
bgsPlayedNum:SetPoint("TOPLEFT", UIConfig, "TOPLEFT", 50, -50)
bgsPlayedNum:SetText(bgsPlayed)

local bgsWonNum = UIConfig:CreateFontString(nil, "ARTWORK", "GameFontHighLightLarge")
bgsWonNum:SetPoint("TOPLEFT", UIConfig, "TOPLEFT", 190, -50)
bgsWonNum:SetText(bgsWon)

local bgsPercentNum = UIConfig:CreateFontString(nil, "ARTWORK", "GameFontHighLightLarge")
bgsPercentNum:SetPoint("TOPLEFT", UIConfig, "TOPLEFT", 290, -50)
bgsPercentNum:SetText(round((bgsWon / bgsPlayed)* 100,3) .. "%")



	
	

