-- Animation Tester with JSON Import
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local Player = Players.LocalPlayer

-- PASTE YOUR JSON HERE (between the [[ ]] brackets)
local preloadedJSON = [[{
	"JohnDoe": [
		{"Id":"83251433279852","Name":"rbxassetid://83251433279852"},
		{"Id":"95716232259748","Name":"rbxassetid://95716232259748"},
		{"Id":"105880087711722","Name":"rbxassetid://105880087711722"},
		{"Id":"105458270463374","Name":"rbxassetid://105458270463374"},
		{"Id":"132653655520682","Name":"rbxassetid://132653655520682"},
		{"Id":"81193817424328","Name":"rbxassetid://81193817424328"},
		{"Id":"95998575259602","Name":"rbxassetid://95998575259602"},
		{"Id":"113999568620448","Name":"rbxassetid://113999568620448"},
		{"Id":"93758847362442","Name":"rbxassetid://93758847362442"},
		{"Id":"102030137400786","Name":"rbxassetid://102030137400786"},
		{"Id":"127172483138092","Name":"rbxassetid://127172483138092"},
		{"Id":"86758834842420","Name":"rbxassetid://86758834842420"},
		{"Id":"125305739659347","Name":"rbxassetid://125305739659347"},
		{"Id":"105757153998613","Name":"rbxassetid://105757153998613"},
		{"Id":"93871230063034","Name":"rbxassetid://93871230063034"},
		{"Id":"114974379639555","Name":"rbxassetid://114974379639555"}
	],
	"Taph": [
		{"Id":"131082534135875","Name":"rbxassetid://131082534135875"},
		{"Id":"134027914413177","Name":"rbxassetid://134027914413177"},
		{"Id":"132377038617766","Name":"rbxassetid://132377038617766"},
		{"Id":"123920512025716","Name":"rbxassetid://123920512025716"},
		{"Id":"130498773808198","Name":"rbxassetid://130498773808198"},
		{"Id":"115946474977409","Name":"rbxassetid://115946474977409"},
		{"Id":"136252471123500","Name":"rbxassetid://136252471123500"},
		{"Id":"134624270247120","Name":"rbxassetid://134624270247120"},
		{"Id":"122093265676661","Name":"rbxassetid://122093265676661"},
		{"Id":"97339712737072","Name":"rbxassetid://97339712737072"},
		{"Id":"108018357044094","Name":"rbxassetid://108018357044094"}
	],
	"Noli": [
		{"Id":"129491851057694","Name":"rbxassetid://129491851057694"},
		{"Id":"135884061951801","Name":"rbxassetid://135884061951801"},
		{"Id":"114356208094580","Name":"rbxassetid://114356208094580"},
		{"Id":"92243093913547","Name":"rbxassetid://92243093913547"},
		{"Id":"139835501033932","Name":"rbxassetid://139835501033932"},
		{"Id":"91758760621955","Name":"rbxassetid://91758760621955"},
		{"Id":"94039555054855","Name":"rbxassetid://94039555054855"},
		{"Id":"93841120533318","Name":"rbxassetid://93841120533318"},
		{"Id":"139321362207112","Name":"rbxassetid://139321362207112"},
		{"Id":"81533966558979","Name":"rbxassetid://81533966558979"},
		{"Id":"126896426760253","Name":"rbxassetid://126896426760253"},
		{"Id":"140042539182927","Name":"rbxassetid://140042539182927"},
		{"Id":"116544958644813","Name":"rbxassetid://116544958644813"},
		{"Id":"83465205704188","Name":"rbxassetid://83465205704188"},
		{"Id":"104744456957363","Name":"rbxassetid://104744456957363"},
		{"Id":"89207009102595","Name":"rbxassetid://89207009102595"},
		{"Id":"92599409662127","Name":"rbxassetid://92599409662127"},
		{"Id":"134053005930385","Name":"rbxassetid://134053005930385"},
		{"Id":"106538427162796","Name":"rbxassetid://106538427162796"},
		{"Id":"107339108383093","Name":"rbxassetid://107339108383093"},
		{"Id":"82002727792391","Name":"rbxassetid://82002727792391"},
		{"Id":"140061272138793","Name":"rbxassetid://140061272138793"},
		{"Id":"117451341682452","Name":"rbxassetid://117451341682452"},
		{"Id":"125504560920616","Name":"rbxassetid://125504560920616"},
		{"Id":"128923537868786","Name":"rbxassetid://128923537868786"},
		{"Id":"122580527125278","Name":"rbxassetid://122580527125278"},
		{"Id":"99164529472582","Name":"rbxassetid://99164529472582"},
		{"Id":"109700476007435","Name":"rbxassetid://109700476007435"},
		{"Id":"113357690193035","Name":"rbxassetid://113357690193035"}
	],
	"007n7": [
		{"Id":"115946474977409","Name":"rbxassetid://115946474977409"},
		{"Id":"131082534135875","Name":"rbxassetid://131082534135875"},
		{"Id":"108018357044094","Name":"rbxassetid://108018357044094"},
		{"Id":"136252471123500","Name":"rbxassetid://136252471123500"},
		{"Id":"134624270247120","Name":"rbxassetid://134624270247120"},
		{"Id":"132377038617766","Name":"rbxassetid://132377038617766"},
		{"Id":"123915228705093","Name":"rbxassetid://123915228705093"}
	],
	"TwoTime": [
		{"Id":"119434518007321","Name":"rbxassetid://119434518007321"},
		{"Id":"131082534135875","Name":"rbxassetid://131082534135875"},
		{"Id":"74530436512522","Name":"rbxassetid://74530436512522"},
		{"Id":"98606150731314","Name":"rbxassetid://98606150731314"},
		{"Id":"136252471123500","Name":"rbxassetid://136252471123500"},
		{"Id":"132377038617766","Name":"rbxassetid://132377038617766"},
		{"Id":"134624270247120","Name":"rbxassetid://134624270247120"},
		{"Id":"94721495253171","Name":"rbxassetid://94721495253171"},
		{"Id":"115946474977409","Name":"rbxassetid://115946474977409"},
		{"Id":"86545133269813","Name":"rbxassetid://86545133269813"},
		{"Id":"93499989310243","Name":"rbxassetid://93499989310243"},
		{"Id":"89448354637442","Name":"rbxassetid://89448354637442"},
		{"Id":"117339039533356","Name":"rbxassetid://117339039533356"},
		{"Id":"115194624791339","Name":"rbxassetid://115194624791339"},
		{"Id":"108018357044094","Name":"rbxassetid://108018357044094"}
	],
	"c00lkidd": [
		{"Id":"89669118763885","Name":"rbxassetid://89669118763885"},
		{"Id":"133688616073016","Name":"rbxassetid://133688616073016"},
		{"Id":"78051806190478","Name":"rbxassetid://78051806190478"},
		{"Id":"18885903667","Name":"rbxassetid://18885903667"},
		{"Id":"18885915433","Name":"rbxassetid://18885915433"},
		{"Id":"86524030996609","Name":"rbxassetid://86524030996609"},
		{"Id":"108042935463999","Name":"rbxassetid://108042935463999"},
		{"Id":"78439581321137","Name":"rbxassetid://78439581321137"},
		{"Id":"18885919947","Name":"rbxassetid://18885919947"},
		{"Id":"18924919303","Name":"rbxassetid://18924919303"},
		{"Id":"18925097303","Name":"rbxassetid://18925097303"},
		{"Id":"98456918873918","Name":"rbxassetid://98456918873918"},
		{"Id":"18885906143","Name":"rbxassetid://18885906143"},
		{"Id":"106776364623742","Name":"rbxassetid://106776364623742"},
		{"Id":"132293609857524","Name":"rbxassetid://132293609857524"},
		{"Id":"96571077893813","Name":"rbxassetid://96571077893813"},
		{"Id":"18885940850","Name":"rbxassetid://18885940850"},
		{"Id":"109869078763813","Name":"rbxassetid://109869078763813"},
		{"Id":"125337218572338","Name":"rbxassetid://125337218572338"},
		{"Id":"83635673319417","Name":"rbxassetid://83635673319417"},
		{"Id":"18885937766","Name":"rbxassetid://18885937766"},
		{"Id":"18885909645","Name":"rbxassetid://18885909645"}
	],
	"Dusekkar": [
		{"Id":"92305864294317","Name":"rbxassetid://92305864294317"},
		{"Id":"81098493643721","Name":"rbxassetid://81098493643721"},
		{"Id":"138915609882599","Name":"rbxassetid://138915609882599"},
		{"Id":"125869734469543","Name":"rbxassetid://125869734469543"},
		{"Id":"71505511479171","Name":"rbxassetid://71505511479171"},
		{"Id":"102812745115149","Name":"rbxassetid://102812745115149"},
		{"Id":"107756518054855","Name":"rbxassetid://107756518054855"},
		{"Id":"138695523464886","Name":"rbxassetid://138695523464886"},
		{"Id":"77894750279891","Name":"rbxassetid://77894750279891"}
	],
	"Elliot": [
		{"Id":"114155003741146","Name":"rbxassetid://114155003741146"},
		{"Id":"115946474977409","Name":"rbxassetid://115946474977409"},
		{"Id":"131082534135875","Name":"rbxassetid://131082534135875"},
		{"Id":"134624270247120","Name":"rbxassetid://134624270247120"},
		{"Id":"136252471123500","Name":"rbxassetid://136252471123500"},
		{"Id":"132377038617766","Name":"rbxassetid://132377038617766"},
		{"Id":"108018357044094","Name":"rbxassetid://108018357044094"}
	],
	"Veeronica": [
		{"Id":"110879154366453","Name":"rbxassetid://110879154366453"},
		{"Id":"134624270247120","Name":"rbxassetid://134624270247120"},
		{"Id":"122542233810574","Name":"rbxassetid://122542233810574"},
		{"Id":"98708147177657","Name":"rbxassetid://98708147177657"},
		{"Id":"96618767275101","Name":"rbxassetid://96618767275101"},
		{"Id":"85122802634658","Name":"rbxassetid://85122802634658"},
		{"Id":"123803922491274","Name":"rbxassetid://123803922491274"},
		{"Id":"130352140726486","Name":"rbxassetid://130352140726486"},
		{"Id":"115946474977409","Name":"rbxassetid://115946474977409"},
		{"Id":"119326397274934","Name":"rbxassetid://119326397274934"},
		{"Id":"136244983244630","Name":"rbxassetid://136244983244630"},
		{"Id":"79451658483719","Name":"rbxassetid://79451658483719"},
		{"Id":"93955932530032","Name":"rbxassetid://93955932530032"},
		{"Id":"117058860640843","Name":"rbxassetid://117058860640843"},
		{"Id":"136252471123500","Name":"rbxassetid://136252471123500"},
		{"Id":"132377038617766","Name":"rbxassetid://132377038617766"},
		{"Id":"108018357044094","Name":"rbxassetid://108018357044094"}
	],
	"Slasher": [
		{"Id":"129546372182752","Name":"rbxassetid://129546372182752"},
		{"Id":"121086746534252","Name":"rbxassetid://121086746534252"},
		{"Id":"101736016625776","Name":"rbxassetid://101736016625776"},
		{"Id":"71908227364423","Name":"rbxassetid://71908227364423"},
		{"Id":"109845134167647","Name":"rbxassetid://109845134167647"},
		{"Id":"109875321916742","Name":"rbxassetid://109875321916742"},
		{"Id":"83786820541907","Name":"rbxassetid://83786820541907"},
		{"Id":"138038974138812","Name":"rbxassetid://138038974138812"},
		{"Id":"73797519945529","Name":"rbxassetid://73797519945529"},
		{"Id":"84890708571468","Name":"rbxassetid://84890708571468"},
		{"Id":"116050994905421","Name":"rbxassetid://116050994905421"},
		{"Id":"93622022596108","Name":"rbxassetid://93622022596108"},
		{"Id":"126830014841198","Name":"rbxassetid://126830014841198"},
		{"Id":"109589533330665","Name":"rbxassetid://109589533330665"},
		{"Id":"99444830407272","Name":"rbxassetid://99444830407272"},
		{"Id":"93054787145505","Name":"rbxassetid://93054787145505"},
		{"Id":"86451881483688","Name":"rbxassetid://86451881483688"},
		{"Id":"85591573377728","Name":"rbxassetid://85591573377728"},
		{"Id":"84525150536125","Name":"rbxassetid://84525150536125"},
		{"Id":"75595031025056","Name":"rbxassetid://75595031025056"},
		{"Id":"125119944753086","Name":"rbxassetid://125119944753086"},
		{"Id":"126355327951215","Name":"rbxassetid://126355327951215"},
		{"Id":"99444830407272","Name":"rbxassetid://99444830407272"}
	],
	"Chance": [
		{"Id":"88851377209988","Name":"rbxassetid://88851377209988"},
		{"Id":"131082534135875","Name":"rbxassetid://131082534135875"},
		{"Id":"128455891079960","Name":"rbxassetid://128455891079960"},
		{"Id":"118647044497447","Name":"rbxassetid://118647044497447"},
		{"Id":"132377038617766","Name":"rbxassetid://132377038617766"},
		{"Id":"82516682306810","Name":"rbxassetid://82516682306810"},
		{"Id":"133461474706559","Name":"rbxassetid://133461474706559"},
		{"Id":"115946474977409","Name":"rbxassetid://115946474977409"},
		{"Id":"133491532453922","Name":"rbxassetid://133491532453922"},
		{"Id":"108018357044094","Name":"rbxassetid://108018357044094"},
		{"Id":"136252471123500","Name":"rbxassetid://136252471123500"},
		{"Id":"134624270247120","Name":"rbxassetid://134624270247120"},
		{"Id":"90499469533503","Name":"rbxassetid://90499469533503"}
	],
	"Noob": [
		{"Id":"121781457295101","Name":"rbxassetid://121781457295101"},
		{"Id":"134267746354043","Name":"rbxassetid://134267746354043"},
		{"Id":"120313643102609","Name":"rbxassetid://120313643102609"},
		{"Id":"124033675853489","Name":"rbxassetid://124033675853489"},
		{"Id":"86557953969836","Name":"rbxassetid://86557953969836"},
		{"Id":"93756544924691","Name":"rbxassetid://93756544924691"},
		{"Id":"124570913423478","Name":"rbxassetid://124570913423478"},
		{"Id":"96771054624545","Name":"rbxassetid://96771054624545"},
		{"Id":"121164912540853","Name":"rbxassetid://121164912540853"}
	],
	"Builderman": [
		{"Id":"112583398395682","Name":"rbxassetid://112583398395682"},
		{"Id":"134624270247120","Name":"rbxassetid://134624270247120"},
		{"Id":"132377038617766","Name":"rbxassetid://132377038617766"},
		{"Id":"133461474706559","Name":"rbxassetid://133461474706559"},
		{"Id":"115946474977409","Name":"rbxassetid://115946474977409"},
		{"Id":"108018357044094","Name":"rbxassetid://108018357044094"},
		{"Id":"136252471123500","Name":"rbxassetid://136252471123500"},
		{"Id":"131082534135875","Name":"rbxassetid://131082534135875"},
		{"Id":"135478644516351","Name":"rbxassetid://135478644516351"},
		{"Id":"90772467802274","Name":"rbxassetid://90772467802274"},
		{"Id":"130782464742780","Name":"rbxassetid://130782464742780"}
	],
	"Guest1337": [
		{"Id":"87259391926321","Name":"rbxassetid://87259391926321"},
		{"Id":"106014898528300","Name":"rbxassetid://106014898528300"},
		{"Id":"134624270247120","Name":"rbxassetid://134624270247120"},
		{"Id":"132377038617766","Name":"rbxassetid://132377038617766"},
		{"Id":"115946474977409","Name":"rbxassetid://115946474977409"},
		{"Id":"136252471123500","Name":"rbxassetid://136252471123500"},
		{"Id":"72722244508749","Name":"rbxassetid://72722244508749"},
		{"Id":"131082534135875","Name":"rbxassetid://131082534135875"},
		{"Id":"108018357044094","Name":"rbxassetid://108018357044094"}
	],
	"Shedletsky": [
		{"Id":"121781457295101","Name":"rbxassetid://121781457295101"},
		{"Id":"115946474977409","Name":"rbxassetid://115946474977409"},
		{"Id":"131082534135875","Name":"rbxassetid://131082534135875"},
		{"Id":"132377038617766","Name":"rbxassetid://132377038617766"},
		{"Id":"119462383658044","Name":"rbxassetid://119462383658044"},
		{"Id":"134624270247120","Name":"rbxassetid://134624270247120"},
		{"Id":"136252471123500","Name":"rbxassetid://136252471123500"},
		{"Id":"108018357044094","Name":"rbxassetid://108018357044094"}
	],
	"Sixer": [
		{"Id":"131140322818412","Name":"rbxassetid://131140322818412"},
		{"Id":"127502467840751","Name":"rbxassetid://127502467840751"},
		{"Id":"122709416391891","Name":"rbxassetid://122709416391891"},
		{"Id":"87989533095285","Name":"rbxassetid://87989533095285"},
		{"Id":"101413761015692","Name":"rbxassetid://101413761015692"},
		{"Id":"128414736976503","Name":"rbxassetid://128414736976503"},
		{"Id":"104549041212532","Name":"rbxassetid://104549041212532"},
		{"Id":"131502830124602","Name":"rbxassetid://131502830124602"},
		{"Id":"133363345661032","Name":"rbxassetid://133363345661032"},
		{"Id":"132834873930733","Name":"rbxassetid://132834873930733"},
		{"Id":"117920317437952","Name":"rbxassetid://117920317437952"},
		{"Id":"93710082600204","Name":"rbxassetid://93710082600204"},
		{"Id":"117834850464068","Name":"rbxassetid://117834850464068"},
		{"Id":"140365014326125","Name":"rbxassetid://140365014326125"},
		{"Id":"95861257649134","Name":"rbxassetid://95861257649134"},
		{"Id":"139309647473555","Name":"rbxassetid://139309647473555"},
		{"Id":"101031946095087","Name":"rbxassetid://101031946095087"},
		{"Id":"88567465014619","Name":"rbxassetid://88567465014619"},
		{"Id":"106678099957758","Name":"rbxassetid://106678099957758"},
		{"Id":"134320358464350","Name":"rbxassetid://134320358464350"},
		{"Id":"95502447159281","Name":"rbxassetid://95502447159281"},
		{"Id":"103699298199261","Name":"rbxassetid://103699298199261"},
		{"Id":"116486067093695","Name":"rbxassetid://116486067093695"},
		{"Id":"121808371053483","Name":"rbxassetid://121808371053483"},
		{"Id":"129890247062796","Name":"rbxassetid://129890247062796"}
	],
	"1x1x1x1": [
		{"Id":"93368339913846","Name":"rbxassetid://93368339913846"},
		{"Id":"116471413261624","Name":"rbxassetid://116471413261624"},
		{"Id":"138754221537146","Name":"rbxassetid://138754221537146"},
		{"Id":"119429069577280","Name":"rbxassetid://119429069577280"},
		{"Id":"129809576292762","Name":"rbxassetid://129809576292762"},
		{"Id":"137889266669216","Name":"rbxassetid://137889266669216"},
		{"Id":"121740536645205","Name":"rbxassetid://121740536645205"},
		{"Id":"90184955335084","Name":"rbxassetid://90184955335084"},
		{"Id":"81326704545708","Name":"rbxassetid://81326704545708"},
		{"Id":"131430497821198","Name":"rbxassetid://131430497821198"},
		{"Id":"116996902830888","Name":"rbxassetid://116996902830888"},
		{"Id":"83829782357897","Name":"rbxassetid://83829782357897"},
		{"Id":"106485518413331","Name":"rbxassetid://106485518413331"},
		{"Id":"109130982296927","Name":"rbxassetid://109130982296927"},
		{"Id":"89252407304675","Name":"rbxassetid://89252407304675"},
		{"Id":"123924093489218","Name":"rbxassetid://123924093489218"},
		{"Id":"116039506373774","Name":"rbxassetid://116039506373774"},
		{"Id":"96642629473615","Name":"rbxassetid://96642629473615"},
		{"Id":"131392439047269","Name":"rbxassetid://131392439047269"},
		{"Id":"121164654140845","Name":"rbxassetid://121164654140845"},
		{"Id":"131235528875091","Name":"rbxassetid://131235528875091"},
		{"Id":"119181003138006","Name":"rbxassetid://119181003138006"},
		{"Id":"123924093489218","Name":"rbxassetid://123924093489218"}
	]
}]]

-- Storage for animations
local savedAnimations = {} -- {["CharacterName"] = {{Id, Name}, ...}}
local characterNames = {} -- Ordered list of character names
local currentCharIndex = 1 -- Which character's animations we're browsing
local currentAnimIndex = 1 -- Which animation in that character's list
local animationList = {} -- Current Animation objects
local currentTrack = nil
local Character
local Humanoid
local Animator

print("=== FORSAKEN ANIMATION TESTER ===")
print("Press [B] to switch to next character's animations")
print("Press [V] to switch to previous character's animations")
print("Press [K] to play next animation")
print("Press [J] to play previous animation")
print("Press [R] to manually save current character's animations")
print("Animations will loop until you change them.")

-- Parse the JSON and load animations
local function loadJSONAnimations()
    local success, parsed = pcall(function()
        return HttpService:JSONDecode(preloadedJSON)
    end)
    
    if not success then
        warn("❌ Failed to parse JSON! Make sure it's valid.")
        return false
    end
    
    savedAnimations = parsed
    characterNames = {}
    
    -- Extract character names in order
    for charName, _ in pairs(savedAnimations) do
        table.insert(characterNames, charName)
    end
    
    -- Sort alphabetically for consistency
    table.sort(characterNames)
    
    print("\n✅ Loaded " .. #characterNames .. " characters from JSON:")
    for i, name in ipairs(characterNames) do
        local count = #savedAnimations[name]
        print("   " .. i .. ". " .. name .. " (" .. count .. " animations)")
    end
    
    return true
end

-- Get current selected character name
local function getCurrentCharacter()
    if #characterNames == 0 then
        return nil
    end
    return characterNames[currentCharIndex]
end

-- Load animations from selected character to current Roblox character
local function loadAnimationsToCharacter()
    if not Character then
        warn("⚠️ No character available!")
        return false
    end
    
    local selectedChar = getCurrentCharacter()
    if not selectedChar then
        warn("⚠️ No character selected!")
        return false
    end
    
    local anims = savedAnimations[selectedChar]
    if not anims or #anims == 0 then
        warn("⚠️ No animations for: " .. selectedChar)
        return false
    end
    
    -- Stop current animation
    if currentTrack then
        currentTrack:Stop()
        currentTrack = nil
    end
    
    -- Clear existing animations
    for _, child in ipairs(Character:GetChildren()) do
        if child:IsA("Animation") then
            child:Destroy()
        end
    end
    
    -- Create new Animation objects
    animationList = {}
    for i, animData in ipairs(anims) do
        local newAnim = Instance.new("Animation")
        newAnim.AnimationId = "rbxassetid://" .. animData.Id
        newAnim.Name = animData.Name
        newAnim.Parent = Character
        table.insert(animationList, newAnim)
    end
    
    print("\n📦 Loaded " .. #animationList .. " animations from: " .. selectedChar)
    
    return true
end

-- Switch to different character's animation set
local function switchCharacter(direction)
    if #characterNames == 0 then
        warn("⚠️ No characters loaded!")
        return
    end
    
    currentCharIndex = currentCharIndex + direction
    
    -- Wrap around
    if currentCharIndex < 1 then
        currentCharIndex = #characterNames
    elseif currentCharIndex > #characterNames then
        currentCharIndex = 1
    end
    
    local charName = characterNames[currentCharIndex]
    local count = #savedAnimations[charName]
    
    print("\n🎭 Selected [" .. currentCharIndex .. "/" .. #characterNames .. "]: " .. charName .. " (" .. count .. " animations)")
    
    -- Load this character's animations
    if loadAnimationsToCharacter() then
        currentAnimIndex = 1
    end
end

-- Play animation at index
local function playAnimation(index)
    if not Character or not Animator then
        warn("⚠️ Character not ready!")
        return
    end
    
    if #animationList == 0 then
        warn("⚠️ No animations loaded!")
        return
    end
    
    -- Stop current
    if currentTrack then
        currentTrack:Stop()
        currentTrack = nil
    end
    
    -- Wrap index
    if index < 1 then index = #animationList end
    if index > #animationList then index = 1 end
    currentAnimIndex = index
    
    local animObject = animationList[currentAnimIndex]
    local charName = getCurrentCharacter() or "Unknown"
    
    print("\n▶ [" .. charName .. "] Playing [" .. currentAnimIndex .. "/" .. #animationList .. "]: " .. animObject.Name)
    
    -- Load and play
    local success, result = pcall(function()
        return Animator:LoadAnimation(animObject)
    end)
    
    if success then
        currentTrack = result
        currentTrack.Looped = true
        currentTrack:Play()
    else
        warn("❌ Failed to load animation: " .. tostring(result))
    end
end

-- Manual save from current character
local function saveCurrentCharacter()
    if not Character then
        warn("⚠️ No character available!")
        return
    end
    
    local anims = {}
    for _, child in ipairs(Character:GetChildren()) do
        if child:IsA("Animation") then
            local id = child.AnimationId:gsub("rbxassetid://", "")
            table.insert(anims, {
                Id = id,
                Name = child.Name
            })
        end
    end
    
    if #anims == 0 then
        warn("⚠️ No animations found in character!")
        return
    end
    
    local charName = Character.Name
    savedAnimations[charName] = anims
    
    if not table.find(characterNames, charName) then
        table.insert(characterNames, charName)
        table.sort(characterNames)
    end
    
    print("\n💾 Saved " .. #anims .. " animations for: " .. charName)
    print("📋 Total characters: " .. #characterNames)
end

-- Setup character
local function setupCharacter(newCharacter)
    Character = newCharacter
    Humanoid = Character:WaitForChild("Humanoid")
    Animator = Humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator")
    Animator.Parent = Humanoid
    
    print("\n🎭 Character loaded: " .. Character.Name)
    
    -- Stop current animation
    if currentTrack then
        currentTrack:Stop()
        currentTrack = nil
    end
    
    -- Reload animations if we have a selected character
    if getCurrentCharacter() then
        loadAnimationsToCharacter()
        if #animationList > 0 then
            playAnimation(currentAnimIndex)
        end
    end
    
    -- Death handler
    Humanoid.Died:Connect(function()
        if currentTrack then
            currentTrack:Stop()
            currentTrack = nil
        end
    end)
end

-- Key handlers
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.B then
        switchCharacter(1) -- Next character
    elseif input.KeyCode == Enum.KeyCode.V then
        switchCharacter(-1) -- Previous character
    elseif input.KeyCode == Enum.KeyCode.K then
        playAnimation(currentAnimIndex + 1) -- Next animation
    elseif input.KeyCode == Enum.KeyCode.J then
        playAnimation(currentAnimIndex - 1) -- Previous animation
    elseif input.KeyCode == Enum.KeyCode.R then
        saveCurrentCharacter() -- Manual save
    end
end)

-- Initialize
print("\n🔄 Loading animations from JSON...")
if loadJSONAnimations() then
    setupCharacter(Player.Character or Player.CharacterAdded:Wait())
    
    -- Auto-load first character's animations
    if #characterNames > 0 then
        switchCharacter(0) -- Load current (first) character
    end
else
    warn("⚠️ Failed to load JSON. Check your JSON format!")
    setupCharacter(Player.Character or Player.CharacterAdded:Wait())
end

-- Handle respawns
Player.CharacterAdded:Connect(function(newCharacter)
    print("\n🔄 Player respawned!")
    setupCharacter(newCharacter)
end)
