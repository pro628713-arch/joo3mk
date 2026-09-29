local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local TextChatService  =  game:GetService(  "TextChatService")
local TeleportService = game:GetService("TeleportService")

pcall(  function()

    local welcomeSound = Instance.new("Sound")
    welcomeSound.SoundId = "rbxassetid://4503761646"
    welcomeSound.Volume = 1
    welcomeSound.Looped  =  false
    welcomeSound.Parent = SoundService
    welcomeSound:Play()
end)

local Library
local okLib ,  libOrErr  =  pcall(  function()
    return loadstring(  game:HttpGet("https://raw.githubusercontent.com/Zenix-V-I-X/Zenix-vd/refs/heads/main/mktabit%20joo%20music"))()
end)
if not okLib or type(libOrErr) ~= "table" then
    return
end
Library = libOrErr

local function setRPName(name, bio)
    pcall(  function()
        local RE  =  ReplicatedStorage:WaitForChild(  "RE" ,  5)
        if RE then
            local nameEvent = RE:FindFirstChild("1RPNam1eTex1t")
            if nameEvent then
                nameEvent:FireServer("RolePlayName", name)
                task.wait(0.3)
                nameEvent:FireServer("RolePlayBio", bio)
            end
        end
    end)
end

local colorActive = true
local function startPurpleBlackCycle()
    pcall(function()
        local RE = ReplicatedStorage:WaitForChild("RE", 5)
        if not RE then return end
        local colorRemote  =  RE:FindFirstChild(  "1RPNam1eColo1r")
        if not colorRemote then return end

        local purple = Color3.fromRGB(138, 43, 226)
        local black = Color3.fromRGB(0, 0, 0)
        local t = 0

        task.spawn(  function()
              while colorActive do
                t = t + 0.1
                local alpha = (math.sin(t) + 1) / 2
                local currentColor = purple:Lerp(black, alpha)
                colorRemote:FireServer("PickingRPNameColor", currentColor)
                colorRemote:FireServer("PickingRPBioColor", currentColor)
                task.wait(0.1)
            end
        end)

    end)
end

task.spawn(function()
    setRPName("͜ ͜ ͜ ͜ ͜ ͜Jσσ мυsic нυв͜ ͜ ͜ ͜ ͜ ͜ ͜", "вy jσσ and Zenιх")
    task.wait(  0.5)
    startPurpleBlackCycle(  )
end)

local function SafeCreateTab(name)
    local t

    local ok = pcall(function() t = Library:CreateTab(name) end)
    if not ok or not t then pcall(function() t = Library.CreateTab(name) end) end
    if not ok or not t then pcall(function() t = Library:AddTab(name) end) end
    if not t then
        return {
            AddSection = function() end, AddButton = function() end, AddToggle = function() end,
            AddSlider  =  function(  ) end ,  AddTextBox = function() end ,  
            AddDropdown = function() return { Refresh = function() end } end,
        }
    end
    return t
end

local Tab = SafeCreateTab("الحقوق")
Tab:AddSection("الحقوق")

Tab:AddButton({Title = "حقوق المطور Zenix و joo الى سكربت joo music", Callback = function() end})
Tab:AddButton(  {Title  =  "المطور الرئيسي لفكرة سكربت اغاني المطور joo" ,  Callback = function() end})
Tab:AddButton({Title = "المطور صنع الواجهة و الالقاب بالكامل المطور Zenix", Callback = function() end})
Tab:AddButton({Title = "جميع الاغاني الاجنبيه بنسبة 80% من المطور joo", Callback = function() end})
Tab:AddButton({Title = "جميع الاغاني العربيه بنسبة 80% من المطور Zenix", Callback = function() end})

Tab:AddButton({Title = "جميع التبويبات مصنعه وليست مسروقه", Callback = function() end})
Tab:AddButton({Title = "التبويبات متصنعه بواسطة Zenix و joo", Callback = function() end})
Tab:AddButton({Title = "الرتب تبدأ من المطور، الادمن، المساعد، عضو مهم، عضو", Callback = function() end})
Tab:AddButton({Title = "اذا تريد رتبه اصنع فيديو عن انجاز صنعه في السكربت مثل مشاهدات", Callback = function() end})
Tab:AddButton({Title = "الرتب التي تعطى للناس لقب مثل tik toker او اسمه", Callback = function() end})
Tab:AddButton({Title = "هذا هو تيك توك Zenix للتواصل معه وتقديم الرتب", Callback = function() end})
Tab:AddButton({Title = "tiktok.com/@zenix_xlm", Callback = function() pcall(function() setclipboard("tiktok.com/@zenix_xlm") end) end})
Tab:AddButton({Title = "سيرفر الديسكورد بنتجمع فيه وكمان فيه فك تشفير للمطورين", Callback = function() end})
Tab:AddButton({Title = "https://discord.gg/reFFNKH9Z", Callback = function() pcall(function() setclipboard("https://discord.gg/reFFNKH9Z") end) end})

local CmdTab = SafeCreateTab("الاعب")

CmdTab:AddSection("السرعة والقفز والجاذبية")

CmdTab:AddSlider({Title = "سرعة المشي", Min = 16, Max = 500, Default = 16, Callback = function(Value)

    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then char.Humanoid.WalkSpeed = Value end
end})
CmdTab:AddButton({Title = "إعادة سرعة المشي", Callback = function()
    local char  =  LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then char.Humanoid.WalkSpeed = 16 end
end})
CmdTab:AddSlider({Title = "قوة القفز", Min = 50, Max = 500, Default = 50, Callback = function(Value)
    local char  =  LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = Value
        pcall(function() char.Humanoid.JumpHeight = Value / 5 end)
    end
end})
CmdTab:AddButton({Title = "إعادة قوة القفز", Callback = function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = 50
        pcall(function() char.Humanoid.JumpHeight = 7.2 end)
    end
end})

CmdTab:AddSlider({Title = "الجاذبية", Min = 0, Max = 500, Default = 196, Callback = function(Value) workspace.Gravity = Value end})
CmdTab:AddButton({Title = "إعادة الجاذبية", Callback = function() workspace.Gravity = 196.2 end})

CmdTab:AddSection("أدوات")

CmdTab:AddButton({Title = "جلب الكنبة", Callback = function()
    pcall(function() ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch") end)
end})
CmdTab:AddButton({Title = "الطيران بالكنبة", Callback = function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))() end)
end})
CmdTab:AddButton({Title = "إعادة الدخول", Callback = function()
    pcall(function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)
end})

CmdTab:AddButton({Title = "قتل النفس", Callback = function()
      if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = 0
    end
end})

local noclipConn, noclipOn = nil, false

CmdTab:AddToggle({Title = "اختراق الجدران", Default = false, Callback = function(Value)
    noclipOn = Value
    if noclipConn then noclipConn:Disconnect() noclipConn = nil end
    if Value then
        noclipConn = RunService.Stepped:Connect(function()
            if not noclipOn then return end
            local char = LocalPlayer.Character
            if char then
                for _, p in ipairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end

            end
        end)
    end
end})

getgenv().InfJump = false
CmdTab:AddToggle({Title = "قفز لا نهائي", Default = false, Callback = function(Value) getgenv().InfJump = Value end})
UserInputService.JumpRequest:Connect(function()
    if getgenv().InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
      end
end)

local playMode, currentMusicID = "scooter", ""
local function playScooterRegular(  id)
    pcall(function()
        local RE = ReplicatedStorage:WaitForChild("RE", 5)
        if not RE then return end
        local vehicleRemote = RE:FindFirstChild("1NoMoto1rVehicle1s")
        if vehicleRemote then
            vehicleRemote:FireServer("SkateBoard")
            task.wait(1)
            pcall(function()
                local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                if remotes then
                    local ug = remotes:FindFirstChild("SetUnderglow")
                    if ug then ug:InvokeServer("ShockWave") end
                    local ugSize = remotes:FindFirstChild("SetUnderglowSize")
                    if ugSize then ugSize:InvokeServer(1.6, 1.5) end
                  end
            end)

            task.wait(0.3)
            vehicleRemote:FireServer("PickingScooterMusicText", tostring(id))

        end
    end)
end
local function playScooterPremium(id)
    pcall(function()
        local remote = ReplicatedStorage:WaitForChild("RE", 2):FindFirstChild("1NoMoto1rVehicle1s")
        if remote then remote:FireServer("SegwaySmall") task.wait(0.3) remote:FireServer("PickingScooterMusicText", tostring(id)) end
    end)
end

local function playHouse(id)
    pcall(function()
        local RE = ReplicatedStorage:FindFirstChild("RE")

        if RE then
            local houseRemote = RE:FindFirstChild("1Player1sHous1e")
            if houseRemote then houseRemote:FireServer("PickHouseMusicText", tostring(id), nil, true) end
        end
      end)
end
local function playBoombox(id)
    pcall(function()
        local RE = ReplicatedStorage:FindFirstChild("RE")
        if RE then
            local toolRemote = RE:FindFirstChild("PlayerToolEvent")
            if toolRemote then toolRemote:FireServer("ToolMusicText", tostring(id), nil, true) end
        end
    end)
end
local function playMusicEverywhere(id) playScooterPremium(id) playHouse(id) playBoombox(id) end
local function playMusic(id)
    if not id or id == "" then return end
    if playMode  == "scooter" then playScooterRegular(  id)
    elseif playMode == "premium" then playScooterPremium(id)
    elseif playMode == "house" then playHouse(id)
    elseif playMode == "boombox" then playBoombox(id)
    elseif playMode == "everywhere" then playMusicEverywhere(id) end
end
local function removeScooter()
    pcall(function()
        local remote = ReplicatedStorage:WaitForChild("RE", 2):FindFirstChild("1NoMoto1rVehicle1s")
        if remote then remote:FireServer("Delete NoMotorVehicle") end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid:ChangeState(  Enum.HumanoidStateType.Running)
          end
    end)
end
local rainbowScooterEnabled = false
local function toggleRainbowScooter(v)

    rainbowScooterEnabled = v
    if v then
        task.spawn(function()
            while rainbowScooterEnabled do
                local color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                pcall(function()
                    local RE = ReplicatedStorage:WaitForChild("RE", 2)
                    if RE then
                        local carRemote = RE:FindFirstChild("1Player1sCa1r")
                        if carRemote then carRemote:FireServer(  "NoMotorColor" ,  color) end
                    end
                    local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
                    if Remotes then
                        local underglow = Remotes:FindFirstChild("SetUnderglowColor")
                        if underglow then underglow:InvokeServer(1, color) end

                    end
                end)

                task.wait(0.1)
            end
          end)
    end
end
local function takeBoombox()
    pcall(  function()
        local remote = ReplicatedStorage:FindFirstChild("RE")
        if remote then
            local toolRemote = remote:FindFirstChild("1Too1l")
            if toolRemote then toolRemote:InvokeServer("PickingTools", "Boombox") end

        end
    end)

end

local MusicTab = SafeCreateTab("اغاني gamepass")
MusicTab:AddSection("اختار الوضع والطريقة")
MusicTab:AddToggle({Title = "سكوتر عادي", Default = true, Callback = function(v) if v then playMode = "scooter" end end})
MusicTab:AddToggle(  {Title  =  "سكوتر بريميوم" ,  Default = false ,  Callback = function(v) if v then playMode = "premium" end end})
MusicTab:AddToggle({Title = "بيت", Default = false, Callback = function(v) if v then playMode = "house" end end})
MusicTab:AddToggle({Title = "بومبوكس", Default = false, Callback = function(v) if v then playMode = "boombox" end end})
MusicTab:AddToggle(  {Title  =  "كل الأماكن" ,  Default = false ,  Callback = function(v) if v then playMode = "everywhere" end end})
MusicTab:AddTextBox({Title = "ايدي الاغنية", PlaceholderText = "ضع الايدي هنا...", Callback = function(v) currentMusicID = v end})
MusicTab:AddButton({Title = "تشغيل سكوتر", Callback = function() if currentMusicID ~= "" then playScooterPremium(currentMusicID) end end})
MusicTab:AddButton(  {Title  =  "تشغيل بيت" ,  Callback = function() if currentMusicID ~= "" then playHouse(currentMusicID) end end})
MusicTab:AddButton({Title = "تشغيل بومبوكس", Callback = function() if currentMusicID ~= "" then playBoombox(currentMusicID) end end})
MusicTab:AddButton({Title = "تشغيل كل الأماكن", Callback = function() if currentMusicID ~= "" then playMusicEverywhere(currentMusicID) end end})
MusicTab:AddButton(  {Title  =  "أخذ أداة البومبوكس" ,  Callback = takeBoombox})
MusicTab:AddButton({Title = "حذف السكوتر", Callback = removeScooter})
MusicTab:AddToggle({Title = "سكوتر قوس قزح", Default = false, Callback = toggleRainbowScooter})

local function addMusicButtons(section, list)
    MusicTab:AddSection(  section)
    for _, item in ipairs(list) do
        MusicTab:AddButton({Title = item[1], Callback = function() playMusic(item[2]) end})
    end
end

addMusicButtons("اغاني عربية / عامة", {
    {"يقول الولد","107178585445032"},{"ترتمي وسط الخطر","112240853142302"},{"حنا الزمن طار","91223173809939"},
    {"هبيك فيكي وجهي","126784347964689"},{"اطفال و الجوع","109959176513792"},{"ما ودي","72738584902275"},
    {"من بشتكي","71455394954902"},{"لا سامحك","140251460855891"},{"اللي يصاحبك","124407666161812"},
    {"قالوا المحبة دواء","139577782919780"},{"بكرا لما يجي","72215182167578"},{"احكي مع الله","88119678765223"},
    {"صورة حلوة","121463880944892"},{"مبحبش حد","103753392891507"},{"سوا سوا","96851518139813"},
    {"جمالها حصري","121794055315417"},{"متقولش ربي","128944885919441"},{"بهجة","122435042374498"},
    {"وانت صغير","130028180657610"},{"اللي عايز","72120834501000"},{"انا مش بعيد","88320558572596"},
    {"مستعد","82047945085802"},{"متسأليش","114807847162411"},{"قلبي الك","138011619495293"},
    {"وردة","134067986890446"},{"جمالك","114863567321217"},{"حسي بالقلب مغربي","118320829215981"},
    {"كردية" ,  "129546179244845"} ,  {"انساها مغربي" ,  "77163359306014"} ,  
})
addMusicButtons("اغاني عراقية", {
    {"راب عراقي","116272643488592"},{"اخذت بدنيا تعناط ودروس","112254940188047"},{"شراره","81023003196738"},
    {"عراقي" ,  "116815742960163"} ,  {"عراقي حب" ,  "105956659839019"} ,  {"فنان" ,  "130012558337510"} ,  
    {"فنان راب 2","80945632184135"},{"عراقي ابشرك","82396938710161"},{"ميت انا من فراقك","98313375960954"},
    {"دم حزني","99123490695024"},{"الحجني يا شرطي","120675895107276"},{"الف صلاه عليك يا محمد","103786200526639"},
    {"ريمسك عراقي" ,  "136909019669593"} ,  {"شعر عراقي" ,  "83309655997452"} ,  {"وش علينا من الناس" ,  "81808954656328"} ,  
    {"ازعاج عراقي","127840997774724"},{"عراقي حزين","106271890575602"},{"عود عراقي","94546035218751"},
    {"قول الصواري نا" ,  "135009652401688"} ,  {"قررنا رحيلك" ,  "87510423075068"} ,  {"حلوة" ,  "77951452994771"} ,  
    {"سبحيني بالمشاعر","80017487709494"},{"غرقت بحبو","118850051381032"},{"تراني سكران","111811908070601"},
    {"ازعاج صردع" ,  "72369698229901"} ,  {"ما اريدك بعد تهواني" ,  "135911328646170"} ,  {"عود قوي" ,  "89535137402880"} ,  
    {"عود جميل","116698448296371"},{"وكر العصفور","102614859260356"},{"رقص للعرسان","107582806271620"},
    {"عزف يا دنيا" ,  "75997967186313"} ,  {"ليبي بعد سنين" ,  "114138252573975"} ,  {"كل عقلك" ,  "122774951440401"} ,  
    {"ردوا الله اكبر" ,  "106330590409106"} ,  {"يم عيونك / هاجر" ,  "110078712223926"} ,  
})
addMusicButtons("اغاني عربية / مصرية", {

    {"مصرية","128624259208020"},{"رمضان برودكشن","123555966146480"},{"دمرتي حياتي","124482316940059"},
    {"راب","8559374146822"},{"جامدة","106941936452890"},{"جامدة 2","107471923441527"},
    {"تصدق كرهتك","113478978326245"},{"كارزما وفد شي ينحب","89189069089618"},{"الله الله يا جمالك","102463539890606"},
    {"اكبر غلطه بحياتي","127085435747898"},{"اه يا حلو","93620598835551"},{"اتركيني جامدة","131870431323817"},
    {"سيبتيني فين كلامك","136793917774554"},{"ليه جي","92304349905750"},{"فارس سكر","115153161936086"},
    {"هات الدكتور","8776769631"},{"اغنية بنت","118359337959122"},{"راب فكني منها","125880160870644"},
    {"اول مرة حياتي تورد" ,  "122957821960545"} ,  {"علي كيفك" ,  "123487073954032"} ,  {"بخطار بس قني بروك" ,  "125693571824719"} ,  
    {"وكر العصفور مهموم","139296082581664"},{"يا حلوة","126351447107230"},{"عايز ارضيكي","97258693395534"},
    {"بلدي","137320322714946"},{"ليلة عربية","120190715989820"},{"علي تحني يا دنیا","124123680327164"},
    {"سلمولي","73294187923231"},{"قلبو انا","120161135152444"},{"اقول بحبك","130580284231852"},
    {"بره المجره","134955716549974"},{"دا حب","106099918876009"},{"راب 76am","86238849012344"},
    {"بالك مع مين يلي شغلني","120548366361770"},{"حكايتي مع الكيف","131810095264340"},{"ملعين دي للعين دي ياقمر","139003933915246"},
    {"دنيا وهيش صباطه","112815389315216"},{"ثقه في الله نجاح","126748359267140"},{"يااخويا فراقاك","115550274410730"},
    {"ريمكس بأسم مصر","127960275435157"},{"صوت حرب اخبار","85162558302997"},{"خلصت خلاص","94497428805146"},
    {"وشوشت عليك الودع","109678010106606"},{"سلام بوداع","129616082137244"},{"اسوء تجربة","125085759592554"},
    {"انا وحبيبي ام كلثوم","133023306778467"},{"دي مصر طبعاً","103967481902580"},
})
addMusicButtons("قصائد وشعر وشيلات", {
    {"ماذا قال البردوني حين بعث شعر","121551967633757"},{"قاف ومعاني شعر حمودي سعد","84391237544406"},
    {"شيلة المقصات - خليل الشبرمي","83309655997452"},{"من مكاني - حمودي بن سعد","81724736472906"},
    {"فيني الذكرى - حمودي بن سعد","122987541571683"},{"كتبت قاف - حمود بن سعد","93325584867960"},
    {"بادي بالله - حمود بن سعد الشمري","93727764687515"},{"شيلة طلال الرشيد - خليل","103548350387613"},
    {"الشعر له مع صادق الوقت - حمودي","71632005349409"},{"استثنائى - خليل الشبرمي","85761608176187"},
    {"ياهلا وسهلا - حمود بن سعد","136124389664355"},{"الهوى لو تمنى - سامر حايل","104702974937114"},
    {"انسجمنا بلهوى - خالد السلامه","114388215612067"},{"هل يسعدك - خالد السلامه","91092704154935"},
    {"محمد وجهة ابهى من القمر","111915220263938"},
})
addMusicButtons("دينية وأناشيد وقرآن", {
    {"صلى عليك","96350513745873"},{"قران","75228291149543"},{"يا اجمل الانبياء","95558570672066"},
    {"يا رايح المدينة","113624682660870"},{"بسم الله","108621294653117"},{"تبسم","90746199853459"},
    {"تبسم 2","84462606932320"},{"خير البرية","130387868861288"},{"يا خالق الاكوان","107814849078376"},
    {"بعد طه","96707729194183"},{"علي شيعي","70969698201901"},{"احلى كلمة","74023750343124"},
    {"بيت النبي","79401362038431"},{"الله هما","97018921060930"},{"يا رمضان","94251559614845"},
    {"خلي صلاتك","71465231554402"},{"يا رب","104530451796036"},{"ان جفاك الدهر - بدر النفيس","91386854296473"},
    {"اللهم بلغنا ما نود - بدر النفيس","88039573678140"},{"برد الشتاء","132713506570643"},
    {"الانفال قرآن - محمود كركوكي" ,  "98360569639974"} ,  {"اغتنام الحياه النشيد المؤثر" ,  "89056647532350"} ,  
    {"قلبي يأن من البكاء","121877881410265"},{"زينب زينب","124255327150702"},{"دعاء لراحة القلب والسكينه","82248223320669"},
    {"دعاء لدخول الجنه","71539584136063"},{"دعاء لراحة القلب والسلام","84598876922850"},
    {"ان الله وملائكته يصلون على النبي","101097443700018"},{"لمثك كف الرسول - الحضرة","79948876884237"},
    {"قصدك باب الرجا","118201986719222"},{"الشيخ عبدالباري الثبيتي قرآن","134362058291798"},
    {"وداع شعر الصيام","140662936838483"},{"ابتهال ديني ياخير خلق الله","131054284549593"},{"نحب محمد حبى","110769804073238"},
})
addMusicButtons("مقاطع وتفاعلات صوتية", {
    {"واه بنت","140621694430612"},{"اموتشك","91592068403301"},{"هاي بنت","137286678153859"},
    {"ياي","131184394702134"},{"ايزي ابلع","112847640842699"},{"ولا تاكل ولا تشرب","73819155183299"},
    {"ماذا تريد","136789813621839"},{"واو","95139591685380"},{"نايس","78280559086303"},
    {"i got this","92223942503349"},{"Don't Touch","76186807430383"},{"افضل ناس بعد محمد","138175842253116"},
    {"امزين انقزتك","120628790113766"},{"اطلاع برا كلب","137698105050387"},{"لمون وكمون قفو ياممحون","100387685825034"},
      {"عندك حمص بلحمه","110644742579450"},{"يا كذاب","7173348285"},{"يب هيز ديد بندر","3007579524"},

    {"امبيه حبيبي شنو فيه؟","7657178494"},{"محمد يا حيوااااان","77213187479231"},
})

addMusicButtons("أغانٍ منوعة وعشوائية", {
    {"تصميم فيديوهات","9102332923"},{"ماذا نعمل يا احباب","110581493098986"},{"قصة النجار و الملكه الجميله","107066284447637"},
      {"نغمة عشوائية 1","110499769951543"},{"نغمة عشوائية 2","12058939975"},{"نغمة عشوائية 3","129963257934687"},
    {"نغمة عشوائية 4","124688308713895"},{"نغمة عشوائية 5","122525489670033"},{"نغمة عشوائية 6","88611661470391"},
    {"نغمة عشوائية 7","114339730158889"},{"نغمة عشوائية 8","88232201387507"},{"نغمة عشوائية 9","766998985299412"},
    {"نغمة عشوائية 10","103899260817392"},{"نغمة عشوائية 11","85209271197446"},{"نغمة عشوائية 12","97653993295845"},
    {"نغمة عشوائية 13","72918998227337"},{"نغمة عشوائية 14","76221024204234"},{"نغمة عشوائية 15","119372546759640"},
      {"نغمة عشوائية 16","95583505197638"},{"نغمة عشوائية 17","126422410489839"},{"نغمة عشوائية 18","13384659639141547"},
    {"جاني كلام جلسه" ,  "98982591392999"} ,  {"نغمة عشوائية 19" ,  "72213510878866"} ,  {"شيل عينك ياحسود" ,  "102430482526115"} ,  
    {"معزوفة هادئة","83170106164487"},{"يا مهاجره","119001496064932"},{"سعوديه شمس الملاعب","138373166260460"},
    {"سنه حلوه يا محمد","129491482765292"},{"يا بيروت تهانينا","107457657654589"},{"حبة صور ساكتين","102801815415949"},
    {"العدل فوق الجميع وبيعشقو المخلوق","83883382498273"},{"عيون الريم","95680334250384"},{"مهموم بنت","100121498303469"},

    {"نهاية الطريقة","100882656730515"},{"موطني فلسطيني","138583149160414"},{"ميلي وبخصرك ميلي","74895850882339"},
      {"صوامت مغربيه","102091364927054"},{"القطب احمد رفاعي","105126185875859"},{"اسمحيلي يالغرام يوسف شافي","127999058966500"},
    {"يا باز ضاقت الحضره الصوفيه","124404454626239"},{"اغنية حنه حنه ريمكس","112890448960292"},{"في طلعت عشيه","98416613253861"},
    {"اغنية اسمها نار قويه","106884739971587"},{"مجس حجازي","77690160133821"},{"سعوديه منتخبنا هلا","99494502823632"},
    {"فرحة العيد","77452598859482"},{"عذرا بلاد المسلمين","108752514960625"},{"امشي على درب الامل","138139711221488"},
    {"عمار يا بلادي","86706132338418"},{"جيتنا بدون موعد","89965141198892"},{"أضحك","78922654701699"},
    {"ماعندي سواك","115088776635835"},{"عود تركي تقطيع","95429843300500"},
})
addMusicButtons("اغاني اجنبية", {
    {"اجنبية","70782176012619"},{"اجنبي حزين","72320758533508"},{"my money","1846687233"},
    {"ريمكس","120871403922972"},{"فونك GTA","109337680029292"},{"فونك قوي","138361625716987"},
    {"كرسمس","135528953872601"},{"حلوة 1","130721206402716"},{"حلوة 2","136869502216760"},
    {"قوية","103288558732219"},{"فونك","111205815697819"},{"جامدة 1","127775034804421"},
    {"جامدة 2","135454681412242"},{"جامدة 3","127491720343331"},{"فونك خطير","92165865063521"},
    {"break it down","105210695336144"},{"فونك ماريو","122192366231455"},{"ترند تيك توك","106185171358009"},
    {"ترند تيك توك 2","99695831392938"},{"ريمكس اجنبي","92959057847076"},{"فونك DJ","76312991186384"},
    {"افخم فونك","17647322226"},{"فونك غضب","115859025716354"},{"فونك عالمي","76578817848504"},
    {"فونك ممتاز","102402883551679"},{"فونك ازعاج","85682109892034"},{"BATTLE OF EGYPT JumpSTYLE","98965852907043"},

    {"LAZERSTYLERZ MIX","72205284895340"},{"JUMPSTYLE 2003","133557915783857"},{"MAYHEM EXEC","76333126810079"},
    {"LOST","106586241621814"},{"CRYPTDUST","138397903891342"},{"JumpStyling","99352274208551"},
    {"JUMPSTYLE LORD","94533013083491"},{"HOLLOW DISTORTION","106489098327460"},{"2004ASHEN BOOTLeG","135881205397136"},
    {"HEAVENLY JUMPSTYLE","124956832051872"},{"MONTAGEM TENTA","95799488312338"},{"MONTAGEM E","73211638025913"},

    {"MONTAGEM DO KARMA","79148752172118"},{"DJ MONTAGEM FUNK","80640214873696"},{"MONTAGEM TSUNAMI GIGANTE","107424491541808"},
    {"MONTAGEM MARIO","122192366231455"},{"PASSINHO BEM SOLTO","106185171358009"},{"MONTAGEM YOSHO HAI","126971857595847"},
    {"Midnight Winter","115590187881251"},{"Robot Phonkstep","105300007125743"},{"BASS DA DA DA","138410854139543"},
    {"Better off alone mix","112439283898361"},{"Hunter Eyes","139957878565852"},{"LOW CORTISOL","110919391228823"},
    {"TOOK HER THE O","86370168350239"},{"Babydoll","127012181396114"},{"JUMPSTYLE","105172178633099"},
    {"COOL EDIT BEAT","82256186012892"},{"gh funk1","140316203107765"},{"european","74904585870595"},
    {"Velocit 1.0","123955428810663"},{"Nerve Funk","129793988394147"},{"MOONLIGHT","136601122443530"},
    {"KLYN - SLOWED","90521568613709"},{"get out","99796748877356"},{"ازعاج فونك","120576436665675"},
})

local TabSund  =  SafeCreateTab(  "اغاني مجانيه")
TabSund:AddSection("اغاني مايبيله جيمباس و الكل يسمعها")

local musicList  =  {
    ["ضحكة مال سوكونا"] = "116395665143666", ["غوجو توسيع النطاق"] = "139787675170861",
    ["صوت فايت مزعج شوي"] = "132639404905710", ["صوت بنت انمي مشكوك فجد خالة عمتو"] = "109779146034241",
    ["صوت بنت انمي ثاني"] = "102993326623397", ["صوت اسد"] = "9126101636",
    ["صوت بنت انمي 3"] = "103430674469051", ["صوت انمي مزعج"] = "97551835622379",
    ["صوت سلاح فري فاير"] = "6909650402", ["جراني"] = "1591860354",
    ["توجي"]  =  "132509237694639" ,  ["اوريتشيمارو "] = "135109036831389" ,  
    ["ضحكة سونيك"] = "7337298420", ["ازعاج"] = "146563959",
    ["اغنية فينوم"] = "8086734311", ["صوت فينوم"] = "126497226413207",
    ["صوت رعد"]  =  "6994934244" ,  ["جوجوتسو كايسن"] = "18985328962" ,  
    ["صوت ازعاج 2"] = "94692079812822", ["صوت ازعاج 3"] = "89442290120460",

}

local musicOptions = {}
for name ,  _ in pairs(  musicList) do table.insert(musicOptions ,  name) end
table.sort(  musicOptions)

local selectedMusic = musicList[musicOptions[1]] or ""
local soundSpeed, soundVolume, soundRange = 1, 1, 100
local spamToggle, spamTask = false, nil

TabSund:AddDropdown({Title = "اختيار الصوت", Options = musicOptions, Default = musicOptions[1], Callback = function(selected)
    selectedMusic  =  musicList[selected] or ""
end})
TabSund:AddSlider({Title = "سرعة الصوت", Min = 5, Max = 20, Default = 10, Callback = function(v) soundSpeed = v / 10 end})

TabSund:AddSlider({Title = "قوة الصوت", Min = 0, Max = 10, Default = 1, Callback = function(v) soundVolume = v end})
TabSund:AddSlider({Title = "مدى الصوت", Min = 10, Max = 300, Default = 100, Callback = function(v) soundRange = v end})

local function playOnce()
    if selectedMusic  == "" then
          return
    end
    local audioID = tostring(selectedMusic)
    pcall(  function()
        local GunSoundEvent = ReplicatedStorage:FindFirstChild("1Gu1nSound1s", true)
        if GunSoundEvent then GunSoundEvent:FireServer(workspace, audioID, 1) end
    end)
    task.wait(0.2)
    local GuinRemote
    pcall(function()
        local RE  =  ReplicatedStorage:FindFirstChild(  "RE")
        if RE then GuinRemote  =  RE:FindFirstChild(  "1Gu1n") end
    end)
    if not GuinRemote then return end

    for _, player in ipairs(Players:GetPlayers()) do
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            task.spawn(function()
                pcall(  function()
                    local Sound = Instance.new("Sound")
                    Sound.SoundId = "rbxassetid://" .. audioID
                    Sound.Volume = soundVolume
                    Sound.PlaybackSpeed = soundSpeed
                    Sound.RollOffMaxDistance = soundRange
                    Sound.Looped = false
                    Sound.Parent = hrp
                    Sound:Play()
                    Sound.Ended:Connect(function() Sound:Destroy() end)
                    task.delay(10, function() if Sound then Sound:Destroy() end end)
                end)
            end)
            task.spawn(  function()
                pcall(function()
                    if firesignal then
                          firesignal(GuinRemote.OnClientEvent, table.unpack({
                            [1]=player,[2]=hrp,[3]=hrp,[4]=Vector3.new(0,-1,0),[5]=Vector3.new(0,0,0),
                              [6]=hrp,[7]=hrp,[8]=audioID,[9]=audioID,[10]={[1]=true},
                            [11]={25,Vector3.new(0.25,0.25,soundRange),BrickColor.new("Bright yellow"),0.25,Enum.Material.SmoothPlastic,0.25},

                            [12]=true,[13]=false
                        }))
                    end
                end)
            end)
            task.spawn(function()
                pcall(function()
                    GuinRemote:FireServer(table.unpack({
                        [1]  =  hrp ,  [2]=hrp ,  [3]=Vector3.new(  0 ,  -1 ,  0) ,  [4]=Vector3.new(0 ,  0 ,  0) ,  
                        [5]  =  hrp ,  [6]=hrp ,  [7]=audioID ,  [8]=audioID ,  [9]={[1]=true} ,  

                        [10]={25,Vector3.new(0.25,0.25,soundRange),BrickColor.new("Bright yellow"),0.25,Enum.Material.SmoothPlastic,0.25},

                        [11]=true,[12]=false

                    }))
                end)
            end)
        end
    end
end

TabSund:AddButton({Title = "تشغيل مرة وحدة", Callback = playOnce})
TabSund:AddToggle(  {Title  =  "سبام تشغيل" ,  Default = false ,  Callback = function(v)
    spamToggle  =  v
    if spamTask then task.cancel(spamTask) spamTask = nil end
    if v then
        spamTask  =  task.spawn(  function()
            while spamToggle do playOnce() task.wait(1) end
        end)
    end
end})

local QualityTab = SafeCreateTab("الجوده")
QualityTab:AddSection(  "تحسين الجودة لك (Shaders)")

QualityTab:AddButton({Title = "تشغيل الشيدر (Shaders)", Callback = function()
    pcall(function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/realgengar/scripts/refs/heads/main/free'), true))()
    end)
end})

local function Clean()
    pcall(function()
        for _, v in pairs(Lighting:GetChildren()) do
            if v:IsA(  "PostEffect") or v:IsA("Sky") or v:IsA("Atmosphere") then v:Destroy() end
        end
        Lighting.Brightness  =  2
        Lighting.ClockTime  =  14
        Lighting.FogEnd  =  100000
        Lighting.ExposureCompensation = 0
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        Lighting.GlobalShadows  =  true
    end)
end

local function SetMat(  mat)

    pcall(function()
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Transparency < 1 then obj.Material = mat end
        end
    end)
end

local function FX(class, props)
    local inst = Instance.new(class)
    for i, v in pairs(props) do inst[i] = v end
    inst.Parent = Lighting
    return inst
end

QualityTab:AddSection("تحسين الظلال والأشعة")
local selShadow = nil
QualityTab:AddDropdown({Title = "اختار التاثير", Options = {"إعادة تعيين الظلال", "أشعة إلهية", "شمس ذهبية", "ظلال قوية", "بدون ظلال (رفع FPS)", "توهج ناعم", "ضوء سماوي", "ظلال داكنة", "ضوء حجمي", "وميض العدسة", "أشعة الغروب", "تعريض ضوئي عالي"}, Default = "", Callback = function(v) selShadow = v end})

QualityTab:AddButton({Title = "تشغيل التاثير", Callback = function()
    pcall(  function()
        if selShadow == "إعادة تعيين الظلال" then 
            for _, v in pairs(Lighting:GetChildren()) do if v:IsA("SunRaysEffect") or v:IsA("BloomEffect") then v:Destroy() end end 
            Lighting.GlobalShadows = true
        elseif selShadow == "أشعة إلهية" then FX("SunRaysEffect", {Intensity=0.2, Spread=1})
        elseif selShadow == "شمس ذهبية" then FX("SunRaysEffect", {Intensity=0.15}) FX("ColorCorrectionEffect", {TintColor=Color3.fromRGB(255,230,150)})
        elseif selShadow  == "ظلال قوية" then Lighting.GlobalShadows = true Lighting.Brightness = 3
        elseif selShadow == "بدون ظلال (رفع FPS)" then Lighting.GlobalShadows = false
        elseif selShadow == "توهج ناعم" then FX("BloomEffect", {Intensity=1, Size=20, Threshold=0.5})

        elseif selShadow == "ضوء سماوي" then FX("SunRaysEffect", {Intensity=0.4}) FX("BloomEffect", {Intensity=0.8})
        elseif selShadow == "ظلال داكنة" then Lighting.OutdoorAmbient = Color3.new(0,0,0)
        elseif selShadow == "ضوء حجمي" then FX("Atmosphere", {Density=0.3, Glare=0.5, Haze=1})
        elseif selShadow == "وميض العدسة" then FX("SunRaysEffect", {Intensity=0.1}) FX("BloomEffect", {Intensity=2, Threshold=0.9})
        elseif selShadow == "أشعة الغروب" then Lighting.ClockTime = 17.8 FX("SunRaysEffect", {Intensity=0.25})
        elseif selShadow == "تعريض ضوئي عالي" then Lighting.ExposureCompensation = 1.5 end
    end)
end})

QualityTab:AddSection("اضاءه RTX")
local selRTX = nil
QualityTab:AddDropdown({Title = "اختار التاثير", Options = {"إزالة جميع التأثيرات", "RTX متقدم", "ألوان زاهية", "حلم ناعم", "صباح بارد", "الساعة الذهبية", "سينمائي 4K", "حرارة الصيف", "ظلال عميقة", "ليل مضيء", "سماء وردية", "تشبع ألوان قوي"}, Default = "", Callback = function(v) selRTX = v end})
QualityTab:AddButton({Title = "تشغيل التاثير", Callback = function()
    pcall(  function()
        if selRTX  == "إزالة جميع التأثيرات" then Clean(  )
        elseif selRTX == "RTX متقدم" then Clean() FX("ColorCorrectionEffect", {Saturation=0.2, Contrast=0.2}) FX("BloomEffect", {Intensity=0.5}) FX("SunRaysEffect", {Intensity=0.1})
        elseif selRTX == "ألوان زاهية" then Clean() FX("ColorCorrectionEffect", {Saturation=1.5})
        elseif selRTX  == "حلم ناعم" then Clean(  ) FX("BloomEffect" ,  {Intensity=1 ,  Size=50})
        elseif selRTX == "صباح بارد" then Clean() Lighting.ClockTime=7 FX("ColorCorrectionEffect", {TintColor=Color3.fromRGB(200,230,255)})
        elseif selRTX  == "الساعة الذهبية" then Clean(  ) Lighting.ClockTime=17.5 FX("ColorCorrectionEffect" ,  {Saturation=0.5})
        elseif selRTX == "سينمائي 4K" then Clean() FX("ColorCorrectionEffect", {Contrast=0.4, Saturation=0.1})
        elseif selRTX == "حرارة الصيف" then Clean() Lighting.Brightness=4 FX("ColorCorrectionEffect", {TintColor=Color3.fromRGB(255,240,200)})
        elseif selRTX == "ظلال عميقة" then Clean() Lighting.GlobalShadows=true FX("ColorCorrectionEffect", {Contrast=0.6})
        elseif selRTX == "ليل مضيء" then Clean() Lighting.ClockTime=0 Lighting.Brightness=5
          elseif selRTX == "سماء وردية" then Clean() FX("ColorCorrectionEffect", {TintColor=Color3.fromRGB(255,200,255)})
        elseif selRTX == "تشبع ألوان قوي" then Clean() FX("ColorCorrectionEffect", {Saturation=3}) end
    end)
end})

QualityTab:AddSection(  "تاثيرات العالم (بركان و كدا)")
local selApoc = nil
QualityTab:AddDropdown({Title = "اختار التاثير", Options = {"العودة للوضع الطبيعي", "شتاء نووي", "عاصفة رملية", "ضباب سام", "Silent Hill", "نيران الجحيم", "عالم النباتات", "عالم الصدأ", "إشعاع أزرق", "سقوط الرماد", "جفاف شديد", "نهاية العالم"}, Default = "", Callback = function(v) selApoc = v end})
QualityTab:AddButton({Title = "تشغيل التاثير", Callback = function()
    pcall(function()
        if selApoc  == "العودة للوضع الطبيعي" then Clean(  )
        elseif selApoc == "شتاء نووي" then Clean() SetMat(Enum.Material.Concrete) Lighting.FogEnd=400 FX("ColorCorrectionEffect", {Saturation=-0.8})

        elseif selApoc == "عاصفة رملية" then Clean() SetMat(Enum.Material.Sand) Lighting.FogEnd=200 Lighting.FogColor=Color3.fromRGB(180,140,80)
        elseif selApoc  == "ضباب سام" then Clean(  ) Lighting.FogEnd=300 Lighting.FogColor=Color3.fromRGB(100 ,  255 ,  100)
        elseif selApoc == "Silent Hill" then Clean() Lighting.FogEnd=150 FX("ColorCorrectionEffect", {Saturation=-1})
        elseif selApoc == "نيران الجحيم" then Clean() Lighting.ClockTime=18 FX("ColorCorrectionEffect", {TintColor=Color3.fromRGB(255,50,50)})
        elseif selApoc == "عالم النباتات" then Clean() SetMat(Enum.Material.Grass) FX("ColorCorrectionEffect", {Saturation=1})
        elseif selApoc  == "عالم الصدأ" then Clean(  ) SetMat(Enum.Material.CorrodedMetal)
        elseif selApoc == "إشعاع أزرق" then Clean() FX("ColorCorrectionEffect", {TintColor=Color3.fromRGB(0,255,255), Brightness=0.2})
        elseif selApoc  == "سقوط الرماد" then Clean(  ) Lighting.FogEnd=500 Lighting.FogColor=Color3.fromRGB(50 ,  50 ,  50)
        elseif selApoc == "جفاف شديد" then Clean() SetMat(Enum.Material.Slate) FX("ColorCorrectionEffect", {Saturation=-0.2, TintColor=Color3.fromRGB(255,220,180)})
        elseif selApoc == "نهاية العالم" then Clean() Lighting.ClockTime=20 FX("ColorCorrectionEffect", {Contrast=0.8, Saturation=0.5}) end
    end)
end})

QualityTab:AddSection(  "تغير الطقس")
local selWeather  =  nil
QualityTab:AddDropdown({Title = "اختار التاثير", Options = {"تصفية السماء", "مطر غزير", "عاصفة ثلجية", "عاصفة رعدية", "يوم غائم", "ضباب خفيف", "مطر منتصف الليل", "أجواء الخريف", "ازدهار الربيع", "موجة حر", "سماء الإعصار", "كسوف الشمس"}, Default = "", Callback = function(v) selWeather = v end})

QualityTab:AddButton({Title = "تشغيل التاثير", Callback = function()
    pcall(function()
        if selWeather == "تصفية السماء" then Clean()
        elseif selWeather == "مطر غزير" then Clean() FX("BlurEffect", {Size=5}) Lighting.FogEnd=500
        elseif selWeather == "عاصفة ثلجية" then Clean() SetMat(Enum.Material.Snow) Lighting.FogEnd=200
        elseif selWeather  == "عاصفة رعدية" then Clean(  ) Lighting.Brightness=0.3
            task.spawn(function() while task.wait(5) do Lighting.Brightness=10 task.wait(0.1) Lighting.Brightness=0.3 end end)
        elseif selWeather == "يوم غائم" then Clean() Lighting.Brightness=1 FX("ColorCorrectionEffect", {Contrast=0.1})
        elseif selWeather == "ضباب خفيف" then Clean() Lighting.FogEnd=1000 Lighting.FogColor=Color3.fromRGB(200,200,200)
        elseif selWeather == "مطر منتصف الليل" then Clean() Lighting.ClockTime=0 FX("BlurEffect", {Size=2})
        elseif selWeather == "أجواء الخريف" then Clean() FX("ColorCorrectionEffect", {TintColor=Color3.fromRGB(255,150,50)})
        elseif selWeather  == "ازدهار الربيع" then Clean(  ) FX("ColorCorrectionEffect" ,  {Saturation=0.4 ,  TintColor=Color3.fromRGB(255 ,  255 ,  200)})
        elseif selWeather == "موجة حر" then Clean() FX("ColorCorrectionEffect", {Brightness=0.1, Contrast=0.2})
        elseif selWeather == "سماء الإعصار" then Clean() Lighting.FogColor=Color3.fromRGB(70,70,80) Lighting.FogEnd=600
        elseif selWeather == "كسوف الشمس" then Clean() Lighting.ClockTime=14 Lighting.Brightness=0.1 Lighting.OutdoorAmbient=Color3.new(0,0,0) end
    end)
end})

QualityTab:AddSection("تاثيرات جرافكس")
local selClassic = nil
QualityTab:AddDropdown({Title = "اختار التاثير", Options = {"إيقاف التأثيرات", "VHS 1980", "GameBoy", "Matrix", "أبيض وأسود", "ضبابية سكران", "رؤية ليلية", "مظهر 8-Bit", "ألوان معكوسة", "تحت الماء", "صورة قديمة", "ضبابية بنفسجية"}, Default = "", Callback = function(v) selClassic = v end})
QualityTab:AddButton({Title = "تشغيل التاثير", Callback = function()
    pcall(function()
        if selClassic == "إيقاف التأثيرات" then Clean()
        elseif selClassic == "VHS 1980" then Clean() FX("BlurEffect", {Size=2}) FX("ColorCorrectionEffect", {Contrast=0.3, Saturation=-0.2})
        elseif selClassic == "GameBoy" then Clean() FX("ColorCorrectionEffect", {TintColor=Color3.fromRGB(155,188,15), Saturation=-1, Contrast=2})
        elseif selClassic == "Matrix" then Clean() FX("ColorCorrectionEffect", {TintColor=Color3.fromRGB(0,255,0), Contrast=0.5})
          elseif selClassic == "أبيض وأسود" then Clean() FX("ColorCorrectionEffect", {Saturation=-1, Contrast=0.2})
        elseif selClassic == "ضبابية سكران" then 
            local b = FX("BlurEffect", {Size=0}) 
            task.spawn(function() 
                while b and b.Parent do 
                    for i  =  0 ,  10 do if not b or not b.Parent then break end b.Size=i task.wait(  0.05) end
                    for i=10,0,-1 do if not b or not b.Parent then break end b.Size=i task.wait(0.05) end 
                end 
            end)
        elseif selClassic == "رؤية ليلية" then Clean() Lighting.Brightness=4 FX("ColorCorrectionEffect", {TintColor=Color3.fromRGB(0,255,0)})

        elseif selClassic == "مظهر 8-Bit" then Clean() FX("ColorCorrectionEffect", {Contrast=0.8, Saturation=0.5})
        elseif selClassic == "ألوان معكوسة" then Clean() FX("ColorCorrectionEffect", {TintColor=Color3.fromRGB(0,0,0), Brightness=1})

        elseif selClassic == "تحت الماء" then Clean() FX("ColorCorrectionEffect", {TintColor=Color3.fromRGB(0,100,255)}) FX("BlurEffect", {Size=4})
        elseif selClassic == "صورة قديمة" then Clean() FX("ColorCorrectionEffect", {TintColor=Color3.fromRGB(112,66,20), Saturation=-0.5})
          elseif selClassic == "ضبابية بنفسجية" then Clean() FX("ColorCorrectionEffect", {TintColor=Color3.fromRGB(150,0,255), Saturation=0.5}) end
    end)
end})

local ChildTab = SafeCreateTab("الاطفال")
getgenv().Selec7tedPlayerNOme = nil

local function GetPlayersList()
    local list = {}
    for _, plr in ipairs(Players:GetPlayers()) do

        if plr ~= LocalPlayer then table.insert(list, plr.Name) end
    end
    if #list  == 0 then return {"لا يوجد لاعبين"} end
      return list
end

ChildTab:AddSection("احسن من حق الاول (تحديث)")
local PlayerDropdown  =  ChildTab:AddDropdown(  {Title = "اختيار اللاعب" ,  Options = GetPlayersList() ,  Default = "لا يوجد لاعبين" ,  Callback = function(v)
    if v == "لا يوجد لاعبين" then getgenv().Selec7tedPlayerNOme = nil else getgenv().Selec7tedPlayerNOme = v end
end})

ChildTab:AddButton({Title = "تحديث اللاعبين", Callback = function()
    if PlayerDropdown and PlayerDropdown.Refresh then
        PlayerDropdown:Refresh(GetPlayersList())

    end
end})

ChildTab:AddToggle({Title = "المراقبة", Default = false, Callback = function(state)
    local camera = workspace.CurrentCamera
    if state then
        if not getgenv().Selec7tedPlayerNOme then return end
        if getgenv().SpyConnection then getgenv().SpyConnection:Disconnect() end
        getgenv().SpyConnection = RunService.Heartbeat:Connect(function()
            local target = Players:FindFirstChild(getgenv().Selec7tedPlayerNOme)
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                camera.CameraSubject = target.Character.Humanoid
            end
        end)
    else
        if getgenv().SpyConnection then getgenv().SpyConnection:Disconnect() getgenv().SpyConnection = nil end

        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            camera.CameraSubject = LocalPlayer.Character.Humanoid
        end
    end
end})

ChildTab:AddButton(  {Title  =  "حذف الطفل" ,  Callback = function()
    pcall(function()
        local args = {"DeleteFollowCharacter"}
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Bab1yFollo1w"):FireServer(table.unpack(args))
    end)
end})

ChildTab:AddToggle({Title = "ارسال الطفل", Default = false, Callback = function(state)
    local pl = LocalPlayer
    local selectedPlayerName = getgenv().Selec7tedPlayerNOme
    if not selectedPlayerName then
        return
    end
    if state then
        local args = {"SpawnChild", "BabyBoy"}
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Bab1yFollo1w"):FireServer(table.unpack(args))
        task.wait(0.8)
        if not workspace:FindFirstChild(pl.Name) or not workspace[pl.Name]:FindFirstChild("FollowCharacter") then
            args = { "CharacterFollowSpawnPlayer", "BabyBoy" }
            local re = ReplicatedStorage.RE:FindFirstChild("1Bab1yFollo1w")
            if re then re:FireServer(table.unpack(args)) end
        end
        task.wait(0.2)
        if workspace:FindFirstChild(pl.Name) then
            for _, v in pairs(workspace[pl.Name]:GetChildren()) do
                if v:IsA("BasePart") then v.CanCollide = true end
            end
        end
        local target = selectedPlayerName
        if workspace:FindFirstChild(  target) and workspace:FindFirstChild(pl.Name) and workspace[pl.Name]:FindFirstChild("FollowCharacter") then
            workspace[pl.Name].FollowCharacter.Parent = workspace[target]

            if getgenv().BabyFollowConnection then getgenv().BabyFollowConnection:Disconnect() end
            getgenv(  ).BabyFollowConnection  =  RunService.Heartbeat:Connect(function()
                local followCharacter = workspace[target]:FindFirstChild("FollowCharacter")
                local humanoidRootPart = workspace[target]:FindFirstChild("HumanoidRootPart")
                if followCharacter and followCharacter:FindFirstChild("Torso") and followCharacter.Torso:FindFirstChild("BodyPosition") and humanoidRootPart then
                    followCharacter.Torso.BodyPosition.Position  =  humanoidRootPart.Position - (  humanoidRootPart.CFrame.LookVector * 3)
                    followCharacter.Torso.BodyGyro.CFrame = humanoidRootPart.CFrame
                end
            end)
        end
    else
        if getgenv().BabyFollowConnection then
            getgenv().BabyFollowConnection:Disconnect()
            getgenv().BabyFollowConnection = nil
        end
          local args = {"SpawnChild", "BabyBoy"}
        local re = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Bab1yFollo1w")
        re:FireServer(table.unpack(args))
    end
end})

getgenv().BangSpeed = 1

ChildTab:AddSlider({Title = "سرعة البانق", Min = 0.1, Max = 2, Default = 1, Callback = function(v) getgenv().BangSpeed = v end})

local bangActive1 = false
local connection1 = nil
local togglePosition1 = false
ChildTab:AddToggle({Title = "بانق الطفل", Default = false, Callback = function(Value)
    bangActive1 = Value
    local plr = Players.LocalPlayer
    local char = plr.Character
    if not char then return end
    local model = workspace:FindFirstChild(plr.Name)
    if Value then
        if not model or not model:FindFirstChild(  "FollowCharacter") then
            local args = { "CharacterFollowSpawnPlayer", "BabyBoy" }
            local re = ReplicatedStorage:FindFirstChild("RE")
            if re and re:FindFirstChild("1Bab1yFollo1w") then
                re:FindFirstChild("1Bab1yFollo1w"):FireServer(table.unpack(args))
            else return end
        end
        model = workspace:WaitForChild(plr.Name, 5)

        if not model then return end

        local baby = model:WaitForChild("FollowCharacter", 5)
        if not baby then return end
        if connection1 then connection1:Disconnect() end
        connection1 = RunService.Heartbeat:Connect(function()
            if bangActive1 and getgenv().Selec7tedPlayerNOme then
                local targetPlayer = Players:FindFirstChild(getgenv().Selec7tedPlayerNOme)
                if targetPlayer and targetPlayer.Character and targetPlayer.Character.PrimaryPart then
                    local head = targetPlayer.Character:FindFirstChild("Head")
                    if head then
                        local offset = togglePosition1 and 1 or 4
                        baby:SetPrimaryPartCFrame(  head.CFrame * CFrame.new(0 ,  -1 ,  offset))
                        togglePosition1 = not togglePosition1
                          task.wait(getgenv().BangSpeed)
                    end
                end
            end
        end)
    else
        if connection1 then connection1:Disconnect() connection1 = nil end
    end
end})

local bangActive2 = false
local connection2 = nil
local togglePosition2 = false
ChildTab:AddToggle({Title = "بانق وجه الطفل", Default = false, Callback = function(Value)
    bangActive2 = Value
    local plr = Players.LocalPlayer
    local char = plr.Character
    if not char then return end
    local model = workspace:FindFirstChild(plr.Name)
    if Value then
        if not model or not model:FindFirstChild("FollowCharacter") then
            local args = { "CharacterFollowSpawnPlayer", "BabyBoy" }
            local re = ReplicatedStorage:FindFirstChild("RE")
            if re and re:FindFirstChild(  "1Bab1yFollo1w") then
                re:FindFirstChild("1Bab1yFollo1w"):FireServer(table.unpack(args))
            else return end
        end
        model = workspace:WaitForChild(plr.Name, 5)
        if not model then return end
        local baby = model:WaitForChild("FollowCharacter", 5)
        if not baby then return end
        if connection2 then connection2:Disconnect(  ) end
        connection2 = RunService.Heartbeat:Connect(function()
            if bangActive2 and getgenv().Selec7tedPlayerNOme then
                local targetPlayer = Players:FindFirstChild(getgenv().Selec7tedPlayerNOme)
                if targetPlayer and targetPlayer.Character and targetPlayer.Character.PrimaryPart then
                    local head = targetPlayer.Character:FindFirstChild("Head")
                    if head then
                        local offset = togglePosition2 and 1 or 4
                        baby:SetPrimaryPartCFrame(  head.CFrame * CFrame.new(0 ,  1 ,  -offset) * CFrame.Angles(0 ,  math.rad(180) ,  0))
                        togglePosition2 = not togglePosition2
                        task.wait(  getgenv().BangSpeed)

                    end
                end
              end

        end)
    else
        if connection2 then connection2:Disconnect() connection2 = nil end
    end
end})

local RbgTab  =  SafeCreateTab(  "التلوين")
RbgTab:AddSection("تلوين الادوات")
local player = LocalPlayer
local re = ReplicatedStorage:WaitForChild("RE")
local running = false
local ToolName  =  "BabyRattle"
local Tools  =  {
      ["حق الطلاء"] = "PaintRoller", ["حمرة"] = "Lipstick", ["قوس حق الاسهم"] = "Bow",
    ["راديو الاغاني"] = "Boombox", ["تارموس"] = "Thermos", ["دونات"] = "Donut",
    ["مشط حق الاحصنة"] = "HorseBrush", ["عصي"] = "GlowingBatons", ["مكبر صوت"] = "Megaphone",
    ["شمعة"] = "Candle", ["مشعل"] = "GuardTorch", ["لعبة الاطفال"] = "BabyRattle"
}
local function equipTool(name)
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")
    local tool = player.Backpack:WaitForChild(name, 2)
    if tool then
        tool.Parent = char
        hum:EquipTool(  tool)
    end
    return tool
end
local function hsv(  t) return Color3.fromHSV(t % 1 ,  1 ,  1) end

RbgTab:AddDropdown({Title = "اختيار الاداة", Default = "لعبة الاطفال", Options = {"حق الطلاء","حمرة","قوس حق الاسهم","راديو الاغاني","تارموس","دونات","مشط حق الاحصنة","عصي","مكبر صوت","شمعة","مشعل","لعبة الاطفال"}, Callback = function(value) ToolName = Tools[value] end})
RbgTab:AddToggle({Title = "تلوين الاداة", Default = false, Callback = function(state)
      running = state
    if not state then return end
    task.spawn(  function()
        re:WaitForChild(  "1Clea1rTool1s"):FireServer("ClearAllTools")
        task.wait(  0.2)
        re:WaitForChild("1Too1l"):InvokeServer("PickingTools", ToolName)
        task.wait(0.3)
        local tool  =  equipTool(  ToolName)
        if not tool then return end
        local setColor = player.PlayerGui:WaitForChild("ToolGui"):WaitForChild("ToolSettings"):WaitForChild("Settings"):WaitForChild("PropsColor"):WaitForChild("SetColor")
        local hue = 0
        local current = hsv(0)
        local conn
        conn = RunService.RenderStepped:Connect(function(dt)
            if not running then conn:Disconnect() return end
            hue += dt * 0.3 
            local target  =  hsv(  hue)

            current = current:Lerp(target, dt * 5) 
            setColor:FireServer(current)
        end)
    end)
end})

RbgTab:AddSection("تلوين الشعر")
local hairColors = {Color3.new(1,1,0),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,1,1),Color3.new(0,1,0),Color3.new(0.5,0,1),Color3.new(1,0.647,0),Color3.new(0,1,1)}
local isActive = false
RbgTab:AddToggle({Title = "تلوين الشعر", Default = false, Callback = function(value)
    isActive = value
      if isActive then
        task.spawn(function()
            local i = 1
            while isActive do
                  if not isActive then break end
                local args = { [1] = "ChangeHairColor2", [2] = hairColors[i] }
                ReplicatedStorage:WaitForChild(  "RE"):WaitForChild("1Max1y"):FireServer(table.unpack(args))
                task.wait(0.1)
                i = i % #hairColors + 1
            end
        end)
    end
end})

RbgTab:AddSection("تلوين الجسم")
local colors = {

    "Pastel brown", "Pastel yellow", "Pastel blue", "Pastel green", "Pastel pink",
    "Really red", "Bright orange", "Bright blue", "Bright violet", "Bright green",
    "Bright yellow", "White", "Black", "Dark stone grey", "Medium stone grey",
    "Light stone grey", "Bright red", "Bright yellowish green", "Bright bluish green",
    "Bright purple", "Bright pink", "Reddish brown", "Earth green", "Sand red",
    "Sand blue", "Sand green", "Dark green", "Navy blue", "Toothpaste", "Cyan",
      "Hot pink", "Crimson", "Royal purple", "Neon orange", "Neon green", "Neon pink",
    "Neon blue" ,  "Gold" ,  "Bright gold" ,  "New Yeller" ,  "Dark orange" ,  "Deep blue" ,  
    "Maroon", "Bright maroon"
}
local rainbowEnabled = false
RbgTab:AddToggle({Title = "تلوين الجسم", Default = false, Callback = function(v)
    rainbowEnabled = v
    if v then
        task.spawn(function()
            while rainbowEnabled do
                for _ ,  color in ipairs(  colors) do
                    if not rainbowEnabled then break end
                    local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
                    if Remotes then
                        local ChangeBodyColor = Remotes:FindFirstChild("ChangeBodyColor")
                        if ChangeBodyColor then ChangeBodyColor:FireServer(color) end
                    end
                    task.wait(0.3)
                end
            end
        end)
    end
end})
RbgTab:AddSlider({Title = "سرعة التلوين", Min = 1, Max = 5, Default = 3, Callback = function(Value) end})

local SpamTab = SafeCreateTab("سبام الشات")
local TextSave = ""
SpamTab:AddSection("خلي بالك ياعسل السبام بيجيب بان")
SpamTab:AddTextBox(  {Title  =  "الرسالة" ,  PlaceholderText = "أكتب هنا..." ,  Callback = function(Value) TextSave = Value end})
SpamTab:AddToggle({Title = "بدء السبام", Default = false, Callback = function(Value)
    getgenv().Spam = Value
    if Value then
        task.spawn(function()
            while getgenv().Spam do
                pcall(function()
                    if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
                        local ev  =  ReplicatedStorage:FindFirstChild(  "DefaultChatSystemChatEvents")
                        if ev then ev.SayMessageRequest:FireServer(TextSave, "All") end
                    else
                        local cfg = TextChatService:FindFirstChild("ChatInputBarConfiguration")
                        if cfg and cfg.TargetTextChannel then cfg.TargetTextChannel:SendAsync(TextSave) end
                    end
                end)
                task.wait(  0.15)
            end
        end)
    end

end})
SpamTab:AddButton({Title = "شات كاذب", Callback = function()
    pcall(  function() loadstring(game:HttpGet("https://raw.githubusercontent.com/game-hax/uca/main/release/uca.min.lua"))() end)
end})
SpamTab:AddButton(  {Title  =  "رسم" ,  Callback = function()
    pcall(function() loadstring(game:HttpGet("https://pastebin.com/raw/Q5zhT6Mv"))() end)
end})

local TabTeleport = SafeCreateTab("الانتقالات")
local teleportButtons = {
    {"الفندق", CFrame.new(192,4,272)},{"ساحة المطاعم", CFrame.new(136,4,117)},{"المقر السري", CFrame.new(-119,-28,235)},

    {"البيت المهجور", CFrame.new(986,4,63)},{"الكهف", CFrame.new(672,4,-296)},{"تحت الماب", CFrame.new(505,-75,143)},
    {"المدرسة", CFrame.new(-312,4,211)},{"محل البيتزا", CFrame.new(161,8,52)},{"الراسبون", CFrame.new(-26,4,-23)},

    {"اعلى الجسر", CFrame.new(-589,141,-59)},{"المستشفى", CFrame.new(-309,4,71)},{"المختبر السري", CFrame.new(179,4,-464)},
    {"تحت الماب 1", CFrame.new(0,4,-495)},{"تحت الماب 2", CFrame.new(-343,4,-613)},{"الجزيرة", CFrame.new(-1925,23,127)},
    {"ساحة الفنادق", CFrame.new(182,4,150)},{"جبل الثلج", CFrame.new(-670,251,765)},{"البنك", CFrame.new(2.28,4.65,254.58)},
      {"محل الملابس", CFrame.new(-46.15,4.65,253.20)},{"محل الحيوانات", CFrame.new(-88.48,22.05,262.34)},
    {"العيادة", CFrame.new(-53.58,22.15,265.61)},{"المقهى", CFrame.new(-97.12,4.65,254.99)}
}
for _, btn in ipairs(teleportButtons) do
    TabTeleport:AddButton({Title = btn[1], Callback = function()
        pcall(function()
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = btn[2] end
        end)
    end})

end

local HouseTab = SafeCreateTab("بيت")
HouseTab:AddSection("تخريب البيت")

local SignHack = false
local HouseRGB  =  false
local HouseTextRGB = false
local BellSpam = false
local PoolSpam = false
local CurtainsSpam  =  false
local GarageSpam = false
local BabySpam  =  false
local LockSpam  =  false
local AutoDelete = false

local function sendControl(interactionName, reArg)
    local lot  =  11
    local lots = workspace:FindFirstChild("001_Lots") or workspace:FindFirstChild("Lots")
    if lots then
        for _ ,  obj in pairs(  lots:GetChildren()) do
            if string.find(string.lower(obj.Name), string.lower(LocalPlayer.Name)) then
                  lot = tonumber(string.match(obj.Name, "%d+")) or lot
                break
            end
        end
    end
      local telemetry = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("TelemetryClientInteraction")
    if telemetry and interactionName then
        telemetry:FireServer("houseControls", {
            ["interaction"] = interactionName,
            ["houseId"] = "045_House",
            ["lot"]  =  lot
        })
    end
    if reArg then
        local reFolder = ReplicatedStorage:FindFirstChild("RE")
        if reFolder and reFolder:FindFirstChild("1Player1sHous1e") then
            reFolder["1Player1sHous1e"]:FireServer(  reArg)
        end
    end
end

local function ringBell()
    pcall(function()
        for _, desc in pairs(workspace:GetDescendants()) do
            if desc:IsA("ClickDetector") and (string.find(string.lower(desc.Parent.Name), "bell") or string.find(string.lower(desc.Parent.Name), "button")) then
                local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp and desc.Parent:IsA("BasePart") and (desc.Parent.Position - hrp.Position).Magnitude < 30 then
                    if fireclickdetector then
                        fireclickdetector(desc)
                    else

                        pcall(function() desc:FireClick() end)
                    end

                end
            end
        end
    end)
end

local function getHouseModel()
      local lots = workspace:FindFirstChild("001_Lots") or workspace:FindFirstChild("Lots")
    if not lots then return nil end
    local playerHouse = lots:FindFirstChild(LocalPlayer.Name .. "House")
    if not playerHouse then return nil end
    local housePicked  =  playerHouse:FindFirstChild(  "HousePickedByPlayer")
    if not housePicked then return nil end
    return housePicked:FindFirstChild("HouseModel")
end

local function deleteAllProps()
    pcall(function()
        local hm = getHouseModel()
        if hm then
            local cp = hm:FindFirstChild("Permissions:ClearProps")
            if cp then cp:InvokeServer() end
        end

    end)
end

local signWords = {"Zenix script on top", "monster is her", "Its come BACK", "RUN"}
local signIndex  =  1

HouseTab:AddToggle({Title = "House Sign Hack (0.3s)", Default = false, Callback = function(v)
    SignHack = v
    if v then
        task.spawn(  function()
            while SignHack do
                pcall(function()
                    local RE = ReplicatedStorage:FindFirstChild("RE")
                    if RE then
                        local signRemote  =  RE:FindFirstChild(  "1RPHous1eEven1t")
                        if signRemote then
                              signRemote:FireServer("BusinessName", signWords[signIndex])
                            signIndex = (signIndex % #signWords) + 1
                        end
                    end

                end)
                task.wait(0.3)
            end

        end)
    end
end})

HouseTab:AddToggle({Title = "الوان رينبو للبيت", Default = false, Callback = function(v)
    HouseRGB = v
    if v then
        task.spawn(function()
            while HouseRGB do
                pcall(function()
                    local remote = ReplicatedStorage:FindFirstChild("RE")
                      if remote and remote:FindFirstChild("1Player1sHous1e") then
                        remote["1Player1sHous1e"]:FireServer(  "ColorPickHouse" ,  Color3.fromHSV(tick() % 5 / 5 ,  1 ,  1))
                    end

                end)

                task.wait(0.1)
            end
        end)
    end
end})

HouseTab:AddToggle({Title = "الوان رينبو للوحه البيت", Default = false, Callback = function(v)
    HouseTextRGB = v
    if v then
        task.spawn(function()
            while HouseTextRGB do
                pcall(function()
                    local remote = ReplicatedStorage:FindFirstChild("RE")
                    if remote and remote:FindFirstChild("1RPHous1eEven1tColo1r") then
                        remote["1RPHous1eEven1tColo1r"]:FireServer("PickingBusinessNameColor", Color3.fromHSV(tick() % 5 / 5, 1, 1))

                    end
                end)
                task.wait(  0.1)
            end
        end)
    end
end})

HouseTab:AddToggle({Title = "سبام جرس وطرق الباب", Default = false, Callback = function(v)
    BellSpam = v
    if v then
        task.spawn(function()
            while BellSpam do
                ringBell()
                task.wait(0.2)
            end
        end)
    end
end})

HouseTab:AddToggle({Title = "سبام مسبح (تحتاج premium)", Default = false, Callback = function(v)

    PoolSpam = v
    if v then
        task.spawn(function()
            while PoolSpam do
                sendControl(  "HousePoolButton" ,  "PoolOnOff")
                task.wait(0.2)
            end
        end)
    end
end})

HouseTab:AddToggle({Title = "سبام ستائر البيت", Default = false, Callback = function(v)
    CurtainsSpam = v
    if v then
        task.spawn(  function()
            while CurtainsSpam do
                sendControl("HouseCurtainsButton", "Curtains")
                  task.wait(0.2)
            end
        end)
    end
end})

HouseTab:AddToggle({Title = "سبام جراش البيت", Default = false, Callback = function(v)

    GarageSpam = v
    if v then
        task.spawn(function()
            while GarageSpam do
                sendControl("HouseGarageButton", "GarageDoor")

                task.wait(7)
            end
        end)
    end
end})

HouseTab:AddToggle({Title = "سبام ادوات الطفل", Default = false, Callback = function(v)
    BabySpam = v
    if v then
        task.spawn(function()
            while BabySpam do
                sendControl("HouseBabyFurnitureButton", "BabyOptionYes")
                task.wait(  0.2)
            end
        end)
    end
end})

HouseTab:AddToggle({Title = "سبام قفل وفتح الابواب", Default = false, Callback = function(v)
    LockSpam = v
      if v then
        task.spawn(function()

            while LockSpam do
                sendControl("HouseLockDoorButton", "LockDoors")
                task.wait(0.2)
            end
        end)
    end
end})

HouseTab:AddButton({Title = "حذف جميع props البيت", Callback = function()

    deleteAllProps()
end})

HouseTab:AddToggle({Title = "اسبام حذف كل ال props بلبيت", Default = false, Callback = function(v)
    AutoDelete  =  v
    if v then
        task.spawn(  function()
            while AutoDelete do
                deleteAllProps()
                  task.wait(0.3)
            end
        end)
    end

end})

local SkyBoxTab = SafeCreateTab("سكاي بوكس")
SkyBoxTab:AddSection(  "تلوين السكن")

local bodyColors = {"Bright red", "Lime green", "Bright blue", "Bright yellow", "Bright cyan", "Hot pink", "Royal purple"}
local rgbCharEnabled = false

local function changeBodyColor(color)
    pcall(function()
        local args = {color}
        local remotes = ReplicatedStorage:FindFirstChild("Remotes")
        if remotes and remotes:FindFirstChild("ChangeBodyColor") then
            remotes.ChangeBodyColor:FireServer(unpack(args))
        end
    end)

end

SkyBoxTab:AddToggle({Title = "تلوين السكن RGB", Default = false, Callback = function(value)
    rgbCharEnabled = value
    if value then
        task.spawn(function()
            while rgbCharEnabled do
                for _ ,  color in ipairs(  bodyColors) do
                    if not rgbCharEnabled then return end
                    changeBodyColor(color)
                    task.wait(0.5)
                end
            end
        end)
    end

end})

SkyBoxTab:AddSection("مضاد سكاي بوكس")

_G.HideNukePlayers = false
_G.HiddenPlayers = {}

local NUKE_ANIM = "rbxassetid://70883871260184"
local NUKE_BODY = {
    ["96655874457685"] = true,
    ["123402086843885"] = true,
    ["78300682916056"] = true,
    ["86276701020724"] = true,
    ["78409653958165"] = true,
    ["120668655481073"] = true
}

local function CheckAndHidePlayer(plr)
    if not _G.HideNukePlayers then return end
    if _G.HiddenPlayers[plr] then return end
    local char = plr.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local found = false

    local tracks = hum:GetPlayingAnimationTracks()
    for _, tr in pairs(tracks) do
        if tr.Animation and tr.Animation.AnimationId == NUKE_ANIM then
            found  =  true
        end
    end
    local desc  =  hum:GetAppliedDescription(  )
    if desc then
        local ids = {desc.Torso, desc.RightArm, desc.LeftArm, desc.RightLeg, desc.LeftLeg, desc.Head}
        for _, id in pairs(ids) do
            if NUKE_BODY[tostring(id)] then
                found  =  true
            end
        end
    end
    if not found then return end
    local saved = {parts = {}, tracks = {}}
    for _, obj in pairs(char:GetDescendants()) do
        if obj:IsA(  "BasePart") then
            table.insert(saved.parts, obj)
            obj.LocalTransparencyModifier = 1
        end
    end
    for _, tr in pairs(tracks) do
        if tr.Animation and tr.Animation.AnimationId == NUKE_ANIM then
            table.insert(saved.tracks, tr)
            tr:Stop()
        end
    end
    _G.HiddenPlayers[plr] = saved
    end

SkyBoxTab:AddToggle({Title = "مضاد سكاء بوكس", Default = false, Callback = function(v)
    _G.HideNukePlayers = v
    if v then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                  task.spawn(function()
                    repeat task.wait() until plr.Character
                    task.wait(  1)
                    CheckAndHidePlayer(plr)
                end)
            end
        end
    else
        for _ ,  data in pairs(  _G.HiddenPlayers) do
              pcall(function()
                for _, p in pairs(data.parts) do
                    p.LocalTransparencyModifier = 0
                end

                for _, t in pairs(data.tracks) do
                    t:Play()
                end
            end)
        end
        _G.HiddenPlayers = {}
    end
end})

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        task.wait(2)
        CheckAndHidePlayer(plr)
    end)
end)

for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~  =  LocalPlayer then
        plr.CharacterAdded:Connect(function()
            task.wait(2)
            CheckAndHidePlayer(plr)
        end)
    end
end

SkyBoxTab:AddSection("تيشيرت وسكاي بوكس")

local TshirtIDs = {
    ["الافتراضي"] = nil,
    ["colkid"] = 98679358331654,
    ["T-Shirt 3"] = 100000000000003,
    ["T-Shirt 4"] = 100000000000004,
    ["T-Shirt 5"]  =  100000000000005 ,  
    ["T-Shirt 6"] = 100000000000006,
    ["T-Shirt 7"] = 100000000000007,
    ["T-Shirt 8"] = 100000000000008,
    ["T-Shirt 9"] = 100000000000009,
    ["T-Shirt 10"] = 100000000000010
}
local SelectedTshirtID = nil

SkyBoxTab:AddDropdown({
    Title  =  "اختر التيشرت" ,  

    Options = {"الافتراضي", "colkid", "T-Shirt 3", "T-Shirt 4", "T-Shirt 5", "T-Shirt 6", "T-Shirt 7", "T-Shirt 8", "T-Shirt 9", "T-Shirt 10"},
    Default = "الافتراضي",
    Callback = function(option)
        SelectedTshirtID = TshirtIDs[option]
    end
})

local SkyboxActive = false
local CurrentTrack = nil
local RigidTrack = nil

SkyBoxTab:AddButton({Title = "سكاء بوكس بل تيشرت المختار / الحالي", Callback = function()
    if SkyboxActive then
        if CurrentTrack then CurrentTrack:Stop(0.1) CurrentTrack = nil end
        if RigidTrack then RigidTrack:Stop(0.1) RigidTrack = nil end
        pcall(function()
            local remotes = ReplicatedStorage:FindFirstChild("Remotes")
            if remotes and remotes:FindFirstChild(  "ResetCharacterAppearance") then
                  remotes.ResetCharacterAppearance:FireServer()
            end
        end)
        task.wait(0.3)
        local char = LocalPlayer.Character
        if char then

            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.Health = 100 end
        end
        SkyboxActive  =  false
        return
    end

    pcall(  function()
        local remotes = ReplicatedStorage:FindFirstChild("Remotes")
        if SelectedTshirtID and remotes and remotes:FindFirstChild("WearShirt") then
            remotes.WearShirt:InvokeServer(SelectedTshirtID)
          end

        if remotes and remotes:FindFirstChild("ChangeCharacterBody") then
            remotes.ChangeCharacterBody:InvokeServer({100839513065432})
        end
    end)

    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid  =  character:WaitForChild(  "Humanoid")

    local function LoadTrack(id)
        local anim  =  Instance.new(  "Animation")
        anim.AnimationId  =  "rbxassetid://" .. id
        local track = humanoid:LoadAnimation(anim)
        track.Priority = Enum.AnimationPriority.Action4
        track:Play(0.1, 1, 1)
        CurrentTrack = track
        return track
    end

    LoadTrack(70883871260184)
    task.wait(0.5)

    local plank = Instance.new("Animation")
    plank.AnimationId = "rbxassetid://3695333486"
    RigidTrack = humanoid:LoadAnimation(plank)
    RigidTrack.Priority = Enum.AnimationPriority.Movement
    RigidTrack:Play(0.1, 1, 0)

    SkyboxActive = true
end})

SkyBoxTab:AddButton({Title = "ترجيع الاسكن", Callback = function()
    if CurrentTrack then CurrentTrack:Stop(  0.1) CurrentTrack  =  nil end
    if RigidTrack then RigidTrack:Stop(0.1) RigidTrack = nil end
    SkyboxActive = false

    pcall(function()
        local remotes = ReplicatedStorage:FindFirstChild("Remotes")
        if remotes and remotes:FindFirstChild("ResetCharacterAppearance") then
            remotes.ResetCharacterAppearance:FireServer(  )
          end
      end)
    task.wait(0.3)
    local char = LocalPlayer.Character

    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = 100 end
    end
end})

SkyBoxTab:AddSection(  "دوران الشخصية")

local SpinSpeed = 1

local SpinEnabled = false
local SpinConnection = nil

SkyBoxTab:AddSlider({Title = "سرعة الدوران", Min = 1, Max = 100, Default = 1, Callback = function(Value)

    SpinSpeed = Value

end})

SkyBoxTab:AddToggle(  {Title  =  "تشغيل الدوران" ,  Default = false ,  Callback = function(Value)
    SpinEnabled  =  Value
    if SpinEnabled then
        if SpinConnection then SpinConnection:Disconnect() end
        SpinConnection = RunService.Heartbeat:Connect(function(dt)
            local char = LocalPlayer.Character
            if not char then return end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then return end
              local radiansPerSecond = SpinSpeed * math.pi
            local rotation = radiansPerSecond * dt
            root.CFrame = root.CFrame * CFrame.Angles(0, rotation, 0)
        end)
    else
        if SpinConnection then
            SpinConnection:Disconnect()
            SpinConnection = nil

        end
    end
end})

SkyBoxTab:AddSection("سكاء بوكس قوي")

_G.NukeSkyboxV2  =  _G.NukeSkyboxV2 or {}
_G.NukeAnimSpeed = 0.01

local NUKE_BODY_LIST = {
    96655874457685,
    123402086843885,
    78300682916056,
    86276701020724,
    78409653958165,
    120668655481073
}

local function getHumanoid()
    local char = LocalPlayer.Character
    if not char then return nil end
    return char:FindFirstChildOfClass("Humanoid")
end

SkyBoxTab:AddToggle({Title = "سكاء بوكس قوي مرااااا", Default = false, Callback = function(v)
    local data = _G.NukeSkyboxV2
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")

    local ChangeCharacterBody = remotes and remotes:FindFirstChild("ChangeCharacterBody")
    if v then
        local humanoid = getHumanoid()
        if not humanoid then return end
        local d = humanoid:GetAppliedDescription()
        data.savedBody = {d.Torso, d.RightArm, d.LeftArm, d.RightLeg, d.LeftLeg, d.Head}
        pcall(function()
            if ChangeCharacterBody then ChangeCharacterBody:InvokeServer(NUKE_BODY_LIST) end
        end)
        task.wait(0.3)
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://70883871260184"
        data.track  =  humanoid:LoadAnimation(  anim)
        data.track.Priority = Enum.AnimationPriority.Action4
        data.track:Play(0.1, 1, 1)

        data.track:AdjustSpeed(0.0001)
      else
        if data.track then
            pcall(function()

                data.track:Stop()
                data.track:Destroy(  )

            end)
            data.track = nil
        end
        if data.savedBody then

            task.wait(0.2)
            pcall(function()
                if ChangeCharacterBody then ChangeCharacterBody:InvokeServer(  data.savedBody) end
            end)
        end
    end
end})

SkyBoxTab:AddToggle({Title = "فلاش يعمي عين الفي سرفر", Default = false, Callback = function(v)
    local data = _G.NukeSkyboxV2
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    local ChangeCharacterBody = remotes and remotes:FindFirstChild("ChangeCharacterBody")
    if v then
        local humanoid = getHumanoid()

        if not humanoid then return end
        local d = humanoid:GetAppliedDescription()
        data.savedBody = {d.Torso, d.RightArm, d.LeftArm, d.RightLeg, d.LeftLeg, d.Head}
        pcall(function()
              if ChangeCharacterBody then ChangeCharacterBody:InvokeServer(NUKE_BODY_LIST) end
        end)
        task.wait(0.3)
        local anim = Instance.new("Animation")

        anim.AnimationId = "rbxassetid://70883871260184"
        data.track  =  humanoid:LoadAnimation(  anim)
        data.track.Priority = Enum.AnimationPriority.Action4

        data.track:Play(0.1, 1, 1)
        data.track:AdjustSpeed(_G.NukeAnimSpeed or 0.01)
    else

        if data.track then
            pcall(function()
                data.track:Stop()
                data.track:Destroy(  )
            end)
            data.track = nil
        end
        if data.savedBody then
            task.wait(0.2)
            pcall(function()
                if ChangeCharacterBody then ChangeCharacterBody:InvokeServer(data.savedBody) end
            end)
        end
    end
end})

SkyBoxTab:AddSlider({Title = "سرعة الفلاش", Min = 1, Max = 2000, Default = 1, Callback = function(Value)
    local realSpeed  =  Value / 1000
    _G.NukeAnimSpeed = realSpeed
      if _G.NukeSkyboxV2 and _G.NukeSkyboxV2.track then
        pcall(function()
            _G.NukeSkyboxV2.track:AdjustSpeed(realSpeed)
        end)
    end
end})
