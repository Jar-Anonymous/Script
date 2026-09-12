warn("[Vertex] Loading...")

local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService       = game:GetService("RunService")
local Players          = game:GetService("Players")
local Workspace        = game:GetService("Workspace")
local Lighting         = game:GetService("Lighting")
local HttpService      = game:GetService("HttpService")
local TeleportService  = game:GetService("TeleportService")
local VirtualUser      = game:GetService("VirtualUser")
local StarterGui       = game:GetService("StarterGui")
local TweenService2    = TweenService
local LocalPlayer      = Players.LocalPlayer
local Camera           = Workspace.CurrentCamera
local Mouse            = LocalPlayer:GetMouse()
local LOGO_ID          = "rbxassetid://18417217430"
local CONFIG_FILE      = "VertexHub_config.json"

local Lang = {
    current = "English",
    strings = {
        English = {
            farm="Farm", combat="Combat", utility="Utility", misc="Misc", config="Config", credits="Credits",
            coming_soon="COMING SOON", farm_sub="Farm features are being prepared.",
            owner="Owner", made_by="Made by", country="Country", version="Version", ui_style="UI Style",
            github="GitHub", discord="Discord", thanks="Special Thanks",
            aimbot="Aimbot", esp_box="ESP Box", esp_name="ESP Name", esp_health="ESP Health",
            esp_dist="ESP Distance", esp_tracer="ESP Tracer", esp_chams="ESP Chams",
            team_check="Team Check", wall_check="Wall Check", target_prio="Target Priority",
            walk_speed="Walk Speed", jump_power="Jump Power", noclip="Noclip", inf_jump="Infinite Jump",
            fly="Fly", anti_afk="Anti AFK", fullbright="Fullbright", remove_fog="Remove Fog",
            fov_changer="FOV Changer", fps_boost="FPS Boost",
            auto_rejoin="Auto Rejoin", server_hop="Server Hop", rejoin_same="Rejoin Same",
            player_info="Player Info", copy_jobid="Copy JobID", rejoin_jobid="Rejoin by JobID",
            hide_players="Hide Other Players", freeze_self="Freeze Self", godmode="Godmode",
            dmg_indicator="Damage Indicator",
            save_config="Save Config", load_config="Load Config", delete_config="Delete Config",
            reset_default="Reset Default", accent_color="Accent Color", ui_scale="UI Scale",
            auto_save="Auto Save", export_config="Export Config",
            device_pick="Choose Device", device_laptop="Laptop", device_tablet="Tablet",
            device_pc="PC", device_phone="Handphone", device_sub="Pick your platform for fly controls",
            enabled="Enabled", disabled="Disabled", language="Language",
        },
        Indonesia = {
            farm="Tani", combat="Tempur", utility="Utilitas", misc="Lain", config="Konfig", credits="Kredit",
            coming_soon="SEGERA HADIR", farm_sub="Fitur tani sedang disiapkan.",
            owner="Pemilik", made_by="Dibuat oleh", country="Negara", version="Versi", ui_style="Gaya UI",
            github="GitHub", discord="Discord", thanks="Terima Kasih",
            aimbot="Aimbot", esp_box="Kotak ESP", esp_name="Nama ESP", esp_health="Nyawa ESP",
            esp_dist="Jarak ESP", esp_tracer="Garis ESP", esp_chams="Chams",
            team_check="Cek Tim", wall_check="Cek Dinding", target_prio="Prioritas Target",
            walk_speed="Kecepatan Jalan", jump_power="Kekuatan Lompat", noclip="Tembus", inf_jump="Lompat Tanpa Henti",
            fly="Terbang", anti_afk="Anti AFK", fullbright="Terang Penuh", remove_fog="Hapus Kabut",
            fov_changer="Ubah FOV", fps_boost="Boost FPS",
            auto_rejoin="Auto Masuk Ulang", server_hop="Pindah Server", rejoin_same="Masuk Server Sama",
            player_info="Info Pemain", copy_jobid="Salin JobID", rejoin_jobid="Masuk via JobID",
            hide_players="Sembunyikan Pemain", freeze_self="Bekukan Diri", godmode="Mode Dewa",
            dmg_indicator="Indikator Damage",
            save_config="Simpan Konfig", load_config="Muat Konfig", delete_config="Hapus Konfig",
            reset_default="Reset Default", accent_color="Warna Aksen", ui_scale="Skala UI",
            auto_save="Auto Simpan", export_config="Ekspor Konfig",
            device_pick="Pilih Perangkat", device_laptop="Laptop", device_tablet="Tablet",
            device_pc="PC", device_phone="HP", device_sub="Pilih platform untuk kontrol terbang",
            enabled="Aktif", disabled="Mati", language="Bahasa",
        },
        Chinese = {
            farm="农场", combat="战斗", utility="实用", misc="杂项", config="配置", credits="鸣谢",
            coming_soon="即将推出", farm_sub="农场功能正在准备中。",
            owner="拥有者", made_by="制作", country="国家", version="版本", ui_style="界面风格",
            github="GitHub", discord="Discord", thanks="特别感谢",
            aimbot="自动瞄准", esp_box="透视框", esp_name="透视名称", esp_health="透视血量",
            esp_dist="透视距离", esp_tracer="透视线", esp_chams="透视高亮",
            team_check="队伍检查", wall_check="墙体检查", target_prio="目标优先级",
            walk_speed="移动速度", jump_power="跳跃力", noclip="穿墙", inf_jump="无限跳",
            fly="飞行", anti_afk="防挂机", fullbright="全亮", remove_fog="去雾",
            fov_changer="视野修改", fps_boost="帧数提升",
            auto_rejoin="自动重连", server_hop="换服", rejoin_same="重进本服",
            player_info="玩家信息", copy_jobid="复制ID", rejoin_jobid="按ID进服",
            hide_players="隐藏玩家", freeze_self="冻结自身", godmode="无敌",
            dmg_indicator="伤害提示",
            save_config="保存", load_config="加载", delete_config="删除",
            reset_default="重置", accent_color="主题色", ui_scale="界面缩放",
            auto_save="自动保存", export_config="导出",
            device_pick="选择设备", device_laptop="笔记本", device_tablet="平板",
            device_pc="电脑", device_phone="手机", device_sub="选择飞行控制平台",
            enabled="开启", disabled="关闭", language="语言",
        },
        Japanese = {
            farm="農場", combat="戦闘", utility="ユーティリティ", misc="その他", config="設定", credits="クレジット",
            coming_soon="近日公開", farm_sub="農場機能準備中。",
            owner="オーナー", made_by="製作者", country="国", version="バージョン", ui_style="UI スタイル",
            github="GitHub", discord="Discord", thanks="スペシャルサンクス",
            aimbot="エイムボット", esp_box="ESP ボックス", esp_name="ESP 名前", esp_health="ESP 体力",
            esp_dist="ESP 距離", esp_tracer="ESP トレーサー", esp_chams="ESP チャム",
            team_check="チーム確認", wall_check="壁確認", target_prio="ターゲット優先",
            walk_speed="歩行速度", jump_power="ジャンプ力", noclip="壁抜け", inf_jump="無限ジャンプ",
            fly="飛行", anti_afk="AFK 防止", fullbright="全明", remove_fog="霧除去",
            fov_changer="FOV 変更", fps_boost="FPS 向上",
            auto_rejoin="自動再参加", server_hop="サーバーホップ", rejoin_same="同じサーバー",
            player_info="プレイヤー情報", copy_jobid="JobID コピー", rejoin_jobid="JobID 参加",
            hide_players="他プレイヤー非表示", freeze_self="自分を凍結", godmode="ゴッドモード",
            dmg_indicator="ダメージ表示",
            save_config="保存", load_config="読み込み", delete_config="削除",
            reset_default="リセット", accent_color="アクセント色", ui_scale="UI スケール",
            auto_save="自動保存", export_config="エクスポート",
            device_pick="デバイス選択", device_laptop="ノート", device_tablet="タブレット",
            device_pc="PC", device_phone="スマホ", device_sub="飛行操作用のプラットフォーム",
            enabled="有効", disabled="無効", language="言語",
        },
        Russian = {
            farm="Ферма", combat="Бой", utility="Утилита", misc="Прочее", config="Конфиг", credits="Титры",
            coming_soon="СКОРО", farm_sub="Функции фермы готовятся.",
            owner="Владелец", made_by="Создано", country="Страна", version="Версия", ui_style="Стиль UI",
            github="GitHub", discord="Discord", thanks="Благодарности",
            aimbot="Аимбот", esp_box="ESP Рамка", esp_name="ESP Имя", esp_health="ESP Здоровье",
            esp_dist="ESP Дистанция", esp_tracer="ESP Линия", esp_chams="ESP Подсветка",
            team_check="Проверка команды", wall_check="Проверка стен", target_prio="Приоритет цели",
            walk_speed="Скорость", jump_power="Прыжок", noclip="Сквозь стены", inf_jump="Беск. прыжок",
            fly="Полёт", anti_afk="Анти AFK", fullbright="Ярко", remove_fog="Убрать туман",
            fov_changer="Изм. FOV", fps_boost="Буст FPS",
            auto_rejoin="Авто-возврат", server_hop="Смена сервера", rejoin_same="Вернуться",
            player_info="Инфо игрока", copy_jobid="Копир. JobID", rejoin_jobid="По JobID",
            hide_players="Скрыть игроков", freeze_self="Заморозить", godmode="Бог-режим",
            dmg_indicator="Индикатор урона",
            save_config="Сохранить", load_config="Загрузить", delete_config="Удалить",
            reset_default="Сброс", accent_color="Цвет акцента", ui_scale="Масштаб UI",
            auto_save="Автосохр.", export_config="Экспорт",
            device_pick="Выбор устройства", device_laptop="Ноутбук", device_tablet="Планшет",
            device_pc="ПК", device_phone="Телефон", device_sub="Платформа для полёта",
            enabled="Вкл", disabled="Выкл", language="Язык",
        },
    },
}

local function T(key)
    local s = Lang.strings[Lang.current] or Lang.strings.English
    return s[key] or Lang.strings.English[key] or key
end

local C = {
    bg        = Color3.fromRGB(16, 16, 20),
    bg2       = Color3.fromRGB(22, 22, 27),
    bg3       = Color3.fromRGB(28, 28, 34),
    sidebar   = Color3.fromRGB(12, 12, 15),
    sidebarHi = Color3.fromRGB(24, 24, 30),
    panel     = Color3.fromRGB(30, 30, 36),
    panel2    = Color3.fromRGB(38, 38, 46),
    card      = Color3.fromRGB(42, 42, 50),
    cardHi    = Color3.fromRGB(54, 54, 64),
    accent    = Color3.fromRGB(180, 180, 195),
    accentHi  = Color3.fromRGB(240, 240, 250),
    accent2   = Color3.fromRGB(110, 110, 125),
    green     = Color3.fromRGB(130, 205, 160),
    greenBg   = Color3.fromRGB(40, 70, 55),
    yellow    = Color3.fromRGB(225, 195, 115),
    yellowBg  = Color3.fromRGB(80, 68, 40),
    red       = Color3.fromRGB(225, 125, 135),
    redBg     = Color3.fromRGB(80, 45, 50),
    cyan      = Color3.fromRGB(145, 205, 225),
    cyanBg    = Color3.fromRGB(45, 70, 85),
    text      = Color3.fromRGB(242, 242, 248),
    textDim   = Color3.fromRGB(155, 155, 168),
    textSoft  = Color3.fromRGB(115, 115, 128),
    border    = Color3.fromRGB(60, 60, 70),
    borderHi  = Color3.fromRGB(100, 100, 115),
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VertexHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999

local parented = false
if syn and syn.protect_gui then
    pcall(function()
        syn.protect_gui(ScreenGui)
        ScreenGui.Parent = game:GetService("CoreGui")
        parented = true
    end)
end
if not parented and gethui then
    pcall(function() ScreenGui.Parent = gethui() parented = true end)
end
if not parented then
    pcall(function() ScreenGui.Parent = game:GetService("CoreGui") parented = true end)
end
if not parented then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

local function corner(o, r)
    local c = Instance.new("UICorner", o)
    c.CornerRadius = UDim.new(0, r or 10)
    return c
end
local function stroke(o, col, th, tr)
    local s = Instance.new("UIStroke", o)
    s.Color = col
    s.Thickness = th or 1
    s.Transparency = tr or 0.3
    return s
end
local function gradient(o, c1, c2, rot)
    local g = Instance.new("UIGradient", o)
    g.Color = ColorSequence.new(c1, c2)
    g.Rotation = rot or 90
    return g
end

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = C.bg
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, -340, 0.5, -240)
Main.Size = UDim2.new(0, 680, 0, 480)
Main.Active = true
Main.ClipsDescendants = true
Main.Visible = true
corner(Main, 20)

local mainGrad = Instance.new("UIGradient", Main)
mainGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, C.bg),
    ColorSequenceKeypoint.new(0.5, C.bg2),
    ColorSequenceKeypoint.new(1, C.bg)
}
mainGrad.Rotation = 135

local mainStroke = stroke(Main, C.border, 1.2, 0.15)

task.spawn(function()
    while Main.Parent do
        for i = 0, 1, 0.012 do
            if not Main.Parent then break end
            mainStroke.Color = Color3.fromRGB(
                130 + math.sin(i * math.pi * 2) * 60,
                130 + math.cos(i * math.pi * 2) * 50,
                160 + math.sin(i * math.pi * 2) * 60
            )
            RunService.RenderStepped:Wait()
        end
    end
end)

local Shadow = Instance.new("ImageLabel", Main)
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.Position = UDim2.new(0.5, 0, 0.5, 14)
Shadow.Size = UDim2.new(1, 70, 1, 70)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://6014261993"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.45
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
Shadow.ZIndex = 0

local ParticleLayer = Instance.new("Frame", Main)
ParticleLayer.Size = UDim2.new(1, 0, 1, 0)
ParticleLayer.BackgroundTransparency = 1
ParticleLayer.ZIndex = 1
ParticleLayer.ClipsDescendants = true

for i = 1, 10 do
    local p = Instance.new("Frame", ParticleLayer)
    local sz = math.random(2, 4)
    p.Size = UDim2.new(0, sz, 0, sz)
    p.BackgroundColor3 = C.accentHi
    p.BackgroundTransparency = 0.85
    p.BorderSizePixel = 0
    p.Position = UDim2.new(math.random(), 0, math.random(), 0)
    p.ZIndex = 1
    corner(p, sz)
    task.spawn(function()
        while p.Parent do
            local duration = 5 + math.random(2, 5)
            TweenService:Create(p, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
                Position = UDim2.new(p.Position.X.Scale + (math.random(-6, 6) / 100), 0, -0.1, 0)
            }):Play()
            task.wait(duration)
            if p.Parent then
                p.Position = UDim2.new(math.random(), 0, 1, 0)
            end
        end
    end)
end

local dragActive, dragStartPos, dragStartInput, dragConn = false, nil, nil, nil

local function bindDrag(handle)
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragActive = true
            dragStartInput = input.Position
            dragStartPos = Main.Position
            if dragConn then pcall(function() dragConn:Disconnect() end) end
            dragConn = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragActive = false
                    dragStartInput = nil
                    dragStartPos = nil
                end
            end)
        end
    end)
end

UserInputService.InputChanged:Connect(function(input)
    if not dragActive then return end
    if input.UserInputType ~= Enum.UserInputType.MouseMovement
    and input.UserInputType ~= Enum.UserInputType.Touch then return end
    if not dragStartPos or not dragStartInput then return end
    local delta = input.Position - dragStartInput
    Main.Position = UDim2.new(
        dragStartPos.X.Scale, dragStartPos.X.Offset + delta.X,
        dragStartPos.Y.Scale, dragStartPos.Y.Offset + delta.Y
    )
end)

local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 62)
Header.BackgroundColor3 = C.sidebar
Header.BorderSizePixel = 0
Header.ZIndex = 3
corner(Header, 20)

local HeaderFix = Instance.new("Frame", Header)
HeaderFix.Size = UDim2.new(1, 0, 0, 20)
HeaderFix.Position = UDim2.new(0, 0, 1, -20)
HeaderFix.BackgroundColor3 = C.sidebar
HeaderFix.BorderSizePixel = 0

bindDrag(Header)

local LogoGlow = Instance.new("ImageLabel", Header)
LogoGlow.Size = UDim2.new(0, 58, 0, 58)
LogoGlow.Position = UDim2.new(0, 10, 0.5, -29)
LogoGlow.BackgroundTransparency = 1
LogoGlow.Image = "rbxassetid://5028857084"
LogoGlow.ImageColor3 = C.accent
LogoGlow.ImageTransparency = 0.4
LogoGlow.ZIndex = 3

task.spawn(function()
    while LogoGlow.Parent do
        TweenService:Create(LogoGlow, TweenInfo.new(1.6), {ImageTransparency = 0.75}):Play()
        task.wait(1.6)
        TweenService:Create(LogoGlow, TweenInfo.new(1.6), {ImageTransparency = 0.4}):Play()
        task.wait(1.6)
    end
end)

local LogoBox = Instance.new("ImageLabel", Header)
LogoBox.Size = UDim2.new(0, 42, 0, 42)
LogoBox.Position = UDim2.new(0, 18, 0.5, -21)
LogoBox.BackgroundColor3 = C.panel
LogoBox.BorderSizePixel = 0
LogoBox.Image = LOGO_ID
LogoBox.ScaleType = Enum.ScaleType.Crop
LogoBox.ZIndex = 4
corner(LogoBox, 12)
stroke(LogoBox, C.borderHi, 1.5, 0.2)

local TitleLbl = Instance.new("TextLabel", Header)
TitleLbl.Size = UDim2.new(0, 220, 0, 20)
TitleLbl.Position = UDim2.new(0, 68, 0, 14)
TitleLbl.BackgroundTransparency = 1
TitleLbl.Text = "VERTEX HUB"
TitleLbl.Font = Enum.Font.GothamBlack
TitleLbl.TextColor3 = C.text
TitleLbl.TextSize = 15
TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
TitleLbl.ZIndex = 4

local TitleGrad = Instance.new("UIGradient", TitleLbl)
TitleGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, C.accentHi),
    ColorSequenceKeypoint.new(0.5, C.accent),
    ColorSequenceKeypoint.new(1, C.cyan)
}

local SubLbl = Instance.new("TextLabel", Header)
SubLbl.Size = UDim2.new(0, 340, 0, 12)
SubLbl.Position = UDim2.new(0, 68, 0, 36)
SubLbl.BackgroundTransparency = 1
SubLbl.Text = "Owner: Jar  •  Made by Jar Local  •  Indonesia"
SubLbl.Font = Enum.Font.GothamMedium
SubLbl.TextColor3 = C.textDim
SubLbl.TextSize = 9
SubLbl.TextXAlignment = Enum.TextXAlignment.Left
SubLbl.ZIndex = 4

local function headerBtn(text, hoverColor, xOff)
    local b = Instance.new("TextButton", Header)
    b.Size = UDim2.new(0, 32, 0, 32)
    b.Position = UDim2.new(1, xOff, 0.5, -16)
    b.BackgroundColor3 = C.panel
    b.BorderSizePixel = 0
    b.Text = text
    b.Font = Enum.Font.GothamBold
    b.TextColor3 = C.textDim
    b.TextSize = 14
    b.AutoButtonColor = false
    b.ZIndex = 4
    corner(b, 9)
    local s = stroke(b, C.border, 1, 0.3)
    b.MouseEnter:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.15), {BackgroundColor3 = hoverColor, TextColor3 = Color3.fromRGB(255,255,255)}):Play()
        TweenService:Create(s, TweenInfo.new(0.15), {Color = hoverColor, Transparency = 0}):Play()
    end)
    b.MouseLeave:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.15), {BackgroundColor3 = C.panel, TextColor3 = C.textDim}):Play()
        TweenService:Create(s, TweenInfo.new(0.15), {Color = C.border, Transparency = 0.3}):Play()
    end)
    return b
end

local CloseBtn = headerBtn("✕", C.red, -44)
local MinBtn   = headerBtn("—", C.yellow, -80)

local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 170, 1, -62)
Sidebar.Position = UDim2.new(0, 0, 0, 62)
Sidebar.BackgroundColor3 = C.sidebar
Sidebar.BorderSizePixel = 0
Sidebar.ZIndex = 3

local TabList = Instance.new("Frame", Sidebar)
TabList.Position = UDim2.new(0, 10, 0, 12)
TabList.Size = UDim2.new(1, -20, 1, -90)
TabList.BackgroundTransparency = 1

local TabLayout = Instance.new("UIListLayout", TabList)
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 6)

local ProfileBox = Instance.new("Frame", Sidebar)
ProfileBox.Position = UDim2.new(0, 8, 1, -76)
ProfileBox.Size = UDim2.new(1, -16, 0, 68)
ProfileBox.BackgroundColor3 = C.panel
ProfileBox.BorderSizePixel = 0
corner(ProfileBox, 12)
stroke(ProfileBox, C.border, 1, 0.3)

local Avatar = Instance.new("ImageLabel", ProfileBox)
Avatar.Size = UDim2.new(0, 44, 0, 44)
Avatar.Position = UDim2.new(0, 10, 0, 12)
Avatar.BackgroundColor3 = C.panel2
Avatar.BorderSizePixel = 0
Avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"
Avatar.ScaleType = Enum.ScaleType.Crop
corner(Avatar, 22)
stroke(Avatar, C.borderHi, 1.5, 0.2)

local NameLbl = Instance.new("TextLabel", ProfileBox)
NameLbl.Size = UDim2.new(1, -66, 0, 16)
NameLbl.Position = UDim2.new(0, 60, 0, 14)
NameLbl.BackgroundTransparency = 1
NameLbl.Text = LocalPlayer.DisplayName
NameLbl.Font = Enum.Font.GothamBold
NameLbl.TextColor3 = C.text
NameLbl.TextSize = 11
NameLbl.TextXAlignment = Enum.TextXAlignment.Left
NameLbl.TextTruncate = Enum.TextTruncate.AtEnd

local UserLbl = Instance.new("TextLabel", ProfileBox)
UserLbl.Size = UDim2.new(1, -66, 0, 14)
UserLbl.Position = UDim2.new(0, 60, 0, 32)
UserLbl.BackgroundTransparency = 1
UserLbl.Text = "@" .. LocalPlayer.Name
UserLbl.Font = Enum.Font.GothamMedium
UserLbl.TextColor3 = C.textDim
UserLbl.TextSize = 10
UserLbl.TextXAlignment = Enum.TextXAlignment.Left
UserLbl.TextTruncate = Enum.TextTruncate.AtEnd

local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0, 170, 0, 62)
Content.Size = UDim2.new(1, -170, 1, -62)
Content.BackgroundColor3 = C.bg2
Content.BorderSizePixel = 0
Content.ZIndex = 2

local TopBar = Instance.new("Frame", Content)
TopBar.Size = UDim2.new(1, 0, 0, 48)
TopBar.BackgroundColor3 = C.bg2
TopBar.BorderSizePixel = 0

local TopTitle = Instance.new("TextLabel", TopBar)
TopTitle.Size = UDim2.new(1, -32, 1, 0)
TopTitle.Position = UDim2.new(0, 18, 0, 0)
TopTitle.BackgroundTransparency = 1
TopTitle.Text = "Combat"
TopTitle.Font = Enum.Font.GothamBold
TopTitle.TextColor3 = C.text
TopTitle.TextSize = 14
TopTitle.TextXAlignment = Enum.TextXAlignment.Left

local TopDivider = Instance.new("Frame", Content)
TopDivider.Size = UDim2.new(1, -28, 0, 1)
TopDivider.Position = UDim2.new(0, 14, 0, 48)
TopDivider.BackgroundColor3 = C.border
TopDivider.BorderSizePixel = 0
TopDivider.BackgroundTransparency = 0.4

local PageContainer = Instance.new("Frame", Content)
PageContainer.Position = UDim2.new(0, 14, 0, 60)
PageContainer.Size = UDim2.new(1, -28, 1, -72)
PageContainer.BackgroundTransparency = 1

local Tabs = {}
local TabButtons = {}

local function makeTabButton(key, order)
    local b = Instance.new("TextButton", TabList)
    b.Size = UDim2.new(1, 0, 0, 36)
    b.BackgroundColor3 = C.panel
    b.BackgroundTransparency = 1
    b.BorderSizePixel = 0
    b.Text = "   " .. T(key)
    b.Font = Enum.Font.GothamSemibold
    b.TextColor3 = C.textDim
    b.TextSize = 11
    b.TextXAlignment = Enum.TextXAlignment.Left
    b.AutoButtonColor = false
    b.LayoutOrder = order
    b.Name = key
    corner(b, 10)

    local indicator = Instance.new("Frame", b)
    indicator.Size = UDim2.new(0, 3, 0, 0)
    indicator.Position = UDim2.new(0, 0, 0.5, 0)
    indicator.AnchorPoint = Vector2.new(0, 0.5)
    indicator.BackgroundColor3 = C.accentHi
    indicator.BorderSizePixel = 0
    corner(indicator, 2)

    local page = Instance.new("ScrollingFrame", PageContainer)
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.ScrollBarThickness = 4
    page.ScrollBarImageColor3 = C.borderHi
    page.Visible = false

    local pad = Instance.new("UIPadding", page)
    pad.PaddingBottom = UDim.new(0, 14)
    pad.PaddingRight = UDim.new(0, 8)

    local lay = Instance.new("UIListLayout", page)
    lay.SortOrder = Enum.SortOrder.LayoutOrder
    lay.Padding = UDim.new(0, 10)
    lay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, lay.AbsoluteContentSize.Y + 20)
    end)

    Tabs[key] = page

    b.MouseButton1Click:Connect(function()
        for name, pg in pairs(Tabs) do pg.Visible = (name == key) end
        TopTitle.Text = T(key)
        for _, other in pairs(TabList:GetChildren()) do
            if other:IsA("TextButton") then
                TweenService:Create(other, TweenInfo.new(0.18), {BackgroundTransparency = 1, TextColor3 = C.textDim}):Play()
                local ind = other:FindFirstChildWhichIsA("Frame")
                if ind then
                    TweenService:Create(ind, TweenInfo.new(0.18), {Size = UDim2.new(0, 3, 0, 0)}):Play()
                end
            end
        end
        TweenService:Create(b, TweenInfo.new(0.18), {
            BackgroundTransparency = 0, BackgroundColor3 = C.panel, TextColor3 = C.text
        }):Play()
        TweenService:Create(indicator, TweenInfo.new(0.18), {Size = UDim2.new(0, 3, 0, 22)}):Play()
    end)

    TabButtons[key] = b
    return b, page
end

local TabKeys = {"farm", "combat", "utility", "misc", "config", "credits"}
for i, k in ipairs(TabKeys) do makeTabButton(k, i) end

local NotifLayer = Instance.new("Frame", ScreenGui)
NotifLayer.Size = UDim2.new(0, 300, 0, 400)
NotifLayer.Position = UDim2.new(1, -320, 0, 20)
NotifLayer.BackgroundTransparency = 1
NotifLayer.ZIndex = 500

local NotifLayout = Instance.new("UIListLayout", NotifLayer)
NotifLayout.SortOrder = Enum.SortOrder.LayoutOrder
NotifLayout.Padding = UDim.new(0, 8)

local function notify(title, status)
    local card = Instance.new("Frame", NotifLayer)
    card.Size = UDim2.new(1, 0, 0, 54)
    card.BackgroundColor3 = C.panel
    card.BackgroundTransparency = 0.05
    card.BorderSizePixel = 0
    card.Position = UDim2.new(1, 320, 0, 0)
    corner(card, 12)
    stroke(card, C.borderHi, 1, 0.3)

    local dot = Instance.new("Frame", card)
    dot.Size = UDim2.new(0, 8, 0, 8)
    dot.Position = UDim2.new(0, 14, 0.5, -4)
    dot.BackgroundColor3 = status and C.green or C.red
    dot.BorderSizePixel = 0
    corner(dot, 4)

    local tLbl = Instance.new("TextLabel", card)
    tLbl.Size = UDim2.new(1, -60, 0, 16)
    tLbl.Position = UDim2.new(0, 32, 0, 10)
    tLbl.BackgroundTransparency = 1
    tLbl.Text = title
    tLbl.Font = Enum.Font.GothamBold
    tLbl.TextColor3 = C.text
    tLbl.TextSize = 11
    tLbl.TextXAlignment = Enum.TextXAlignment.Left

    local sLbl = Instance.new("TextLabel", card)
    sLbl.Size = UDim2.new(1, -60, 0, 14)
    sLbl.Position = UDim2.new(0, 32, 0, 28)
    sLbl.BackgroundTransparency = 1
    sLbl.Text = status and T("enabled") or T("disabled")
    sLbl.Font = Enum.Font.GothamMedium
    sLbl.TextColor3 = status and C.green or C.red
    sLbl.TextSize = 10
    sLbl.TextXAlignment = Enum.TextXAlignment.Left

    TweenService:Create(card, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 0)
    }):Play()

    task.delay(2.2, function()
        if card and card.Parent then
            TweenService:Create(card, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                Position = UDim2.new(1, 320, 0, 0), BackgroundTransparency = 1
            }):Play()
            task.wait(0.35)
            if card and card.Parent then card:Destroy() end
        end
    end)
end

local function makeCard(parent, title, order)
    local sec = Instance.new("Frame", parent)
    sec.Size = UDim2.new(1, 0, 0, 0)
    sec.AutomaticSize = Enum.AutomaticSize.Y
    sec.BackgroundColor3 = C.card
    sec.BorderSizePixel = 0
    sec.LayoutOrder = order
    corner(sec, 12)
    stroke(sec, C.border, 1, 0.3)

    local pad = Instance.new("UIPadding", sec)
    pad.PaddingTop = UDim.new(0, 12)
    pad.PaddingBottom = UDim.new(0, 12)
    pad.PaddingLeft = UDim.new(0, 14)
    pad.PaddingRight = UDim.new(0, 14)

    local lay = Instance.new("UIListLayout", sec)
    lay.SortOrder = Enum.SortOrder.LayoutOrder
    lay.Padding = UDim.new(0, 8)

    local lbl = Instance.new("TextLabel", sec)
    lbl.Size = UDim2.new(1, 0, 0, 14)
    lbl.BackgroundTransparency = 1
    lbl.Text = title
    lbl.Font = Enum.Font.GothamBold
    lbl.TextColor3 = C.accentHi
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.LayoutOrder = 1

    local line = Instance.new("Frame", sec)
    line.Size = UDim2.new(1, 0, 0, 1)
    line.BackgroundColor3 = C.border
    line.BorderSizePixel = 0
    line.LayoutOrder = 2
    line.BackgroundTransparency = 0.5

    return sec
end

local function makeToggle(parent, label, default, order, callback)
    local row = Instance.new("Frame", parent)
    row.Size = UDim2.new(1, 0, 0, 30)
    row.BackgroundTransparency = 1
    row.LayoutOrder = order

    local text = Instance.new("TextLabel", row)
    text.Size = UDim2.new(1, -60, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = label
    text.Font = Enum.Font.GothamMedium
    text.TextColor3 = C.text
    text.TextSize = 11
    text.TextXAlignment = Enum.TextXAlignment.Left

    local track = Instance.new("Frame", row)
    track.Size = UDim2.new(0, 44, 0, 24)
    track.Position = UDim2.new(1, -44, 0.5, -12)
    track.BackgroundColor3 = default and C.accentHi or C.panel2
    track.BorderSizePixel = 0
    corner(track, 12)

    local knob = Instance.new("Frame", track)
    knob.Size = UDim2.new(0, 18, 0, 18)
    knob.Position = default and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    corner(knob, 9)

    local btn = Instance.new("TextButton", row)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""

    local state = default
    local function apply(v, silent)
        state = v
        TweenService:Create(track, TweenInfo.new(0.2), {BackgroundColor3 = state and C.accentHi or C.panel2}):Play()
        TweenService:Create(knob, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
            Position = state and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
        }):Play()
        if callback then pcall(callback, state) end
        if not silent then pcall(notify, label, state) end
    end
    btn.MouseButton1Click:Connect(function() apply(not state) end)
    return row, function() return state end, apply
end

local function makeSlider(parent, label, minV, maxV, default, order, isFloat, callback)
    local row = Instance.new("Frame", parent)
    row.Size = UDim2.new(1, 0, 0, 44)
    row.BackgroundTransparency = 1
    row.LayoutOrder = order

    local text = Instance.new("TextLabel", row)
    text.Size = UDim2.new(1, -70, 0, 14)
    text.BackgroundTransparency = 1
    text.Text = label
    text.Font = Enum.Font.GothamMedium
    text.TextColor3 = C.text
    text.TextSize = 11
    text.TextXAlignment = Enum.TextXAlignment.Left

    local valueLbl = Instance.new("TextLabel", row)
    valueLbl.Size = UDim2.new(0, 60, 0, 14)
    valueLbl.Position = UDim2.new(1, -60, 0, 0)
    valueLbl.BackgroundTransparency = 1
    valueLbl.Text = isFloat and string.format("%.2f", default) or tostring(default)
    valueLbl.Font = Enum.Font.GothamBold
    valueLbl.TextColor3 = C.accentHi
    valueLbl.TextSize = 11
    valueLbl.TextXAlignment = Enum.TextXAlignment.Right

    local bar = Instance.new("Frame", row)
    bar.Size = UDim2.new(1, 0, 0, 6)
    bar.Position = UDim2.new(0, 0, 0, 28)
    bar.BackgroundColor3 = C.panel2
    bar.BorderSizePixel = 0
    corner(bar, 3)

    local fill = Instance.new("Frame", bar)
    fill.Size = UDim2.new((default - minV) / (maxV - minV), 0, 1, 0)
    fill.BackgroundColor3 = C.accentHi
    fill.BorderSizePixel = 0
    corner(fill, 3)
    gradient(fill, C.accent, C.accentHi, 0)

    local knob = Instance.new("Frame", bar)
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = UDim2.new((default - minV) / (maxV - minV), -7, 0.5, -7)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    corner(knob, 7)
    stroke(knob, C.accentHi, 2, 0)

    local hit = Instance.new("TextButton", row)
    hit.Size = UDim2.new(1, 0, 0, 38)
    hit.Position = UDim2.new(0, 0, 0, 18)
    hit.BackgroundTransparency = 1
    hit.Text = ""

    local isDragging = false
    local function setValue(p)
        p = math.clamp(p, 0, 1)
        local val = minV + (maxV - minV) * p
        if not isFloat then val = math.floor(val + 0.5) end
        fill.Size = UDim2.new(p, 0, 1, 0)
        knob.Position = UDim2.new(p, -7, 0.5, -7)
        valueLbl.Text = isFloat and string.format("%.2f", val) or tostring(val)
        if callback then pcall(callback, val) end
    end
    hit.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true
            local rel = (input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X
            setValue(rel)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if not isDragging then return end
        if input.UserInputType ~= Enum.UserInputType.MouseMovement
        and input.UserInputType ~= Enum.UserInputType.Touch then return end
        local rel = (input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X
        setValue(rel)
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = false
        end
    end)
    return row, function() return tonumber(valueLbl.Text) end, setValue
end

local function makeDropdown(parent, label, options, defaultIdx, order, callback)
    local row = Instance.new("Frame", parent)
    row.Size = UDim2.new(1, 0, 0, 32)
    row.BackgroundTransparency = 1
    row.LayoutOrder = order

    local text = Instance.new("TextLabel", row)
    text.Size = UDim2.new(1, -150, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = label
    text.Font = Enum.Font.GothamMedium
    text.TextColor3 = C.text
    text.TextSize = 11
    text.TextXAlignment = Enum.TextXAlignment.Left

    local btn = Instance.new("TextButton", row)
    btn.Size = UDim2.new(0, 140, 0, 26)
    btn.Position = UDim2.new(1, -140, 0.5, -13)
    btn.BackgroundColor3 = C.panel2
    btn.BorderSizePixel = 0
    btn.Text = options[defaultIdx] or "-"
    btn.Font = Enum.Font.GothamSemibold
    btn.TextColor3 = C.text
    btn.TextSize = 11
    btn.AutoButtonColor = false
    corner(btn, 8)
    stroke(btn, C.border, 1, 0.4)

    local list = Instance.new("Frame", ScreenGui)
    list.Size = UDim2.new(0, 140, 0, math.min(#options, 8) * 22 + 6)
    list.BackgroundColor3 = C.card
    list.BorderSizePixel = 0
    list.Visible = false
    list.ZIndex = 999
    corner(list, 10)
    stroke(list, C.borderHi, 1, 0.3)

    local scroll = Instance.new("ScrollingFrame", list)
    scroll.Size = UDim2.new(1, 0, 1, 0)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.ScrollBarThickness = 3
    scroll.ScrollBarImageColor3 = C.borderHi
    scroll.CanvasSize = UDim2.new(0, 0, 0, #options * 23 + 6)

    local lay = Instance.new("UIListLayout", scroll)
    lay.SortOrder = Enum.SortOrder.LayoutOrder
    lay.Padding = UDim.new(0, 1)

    local currentIdx = defaultIdx
    for i, opt in ipairs(options) do
        local ob = Instance.new("TextButton", scroll)
        ob.Size = UDim2.new(1, 0, 0, 22)
        ob.BackgroundColor3 = C.card
        ob.BackgroundTransparency = 1
        ob.BorderSizePixel = 0
        ob.Text = "  " .. opt
        ob.Font = Enum.Font.GothamMedium
        ob.TextColor3 = C.text
        ob.TextSize = 10
        ob.TextXAlignment = Enum.TextXAlignment.Left
        ob.AutoButtonColor = false
        ob.LayoutOrder = i
        corner(ob, 6)
        ob.MouseEnter:Connect(function()
            TweenService:Create(ob, TweenInfo.new(0.1), {BackgroundTransparency = 0, BackgroundColor3 = C.cardHi}):Play()
        end)
        ob.MouseLeave:Connect(function()
            TweenService:Create(ob, TweenInfo.new(0.1), {BackgroundTransparency = 1}):Play()
        end)
        ob.MouseButton1Click:Connect(function()
            currentIdx = i
            btn.Text = opt
            if callback then pcall(callback, opt, i) end
            list.Visible = false
        end)
    end

    btn.MouseButton1Click:Connect(function()
        if list.Visible then list.Visible = false return end
        local pos = btn.AbsolutePosition
        local sz = btn.AbsoluteSize
        list.Position = UDim2.new(0, pos.X, 0, pos.Y + sz.Y + 4)
        list.Visible = true
    end)
    return row, function() return options[currentIdx], currentIdx end
end

local function makeButton(parent, label, order, color, callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 34)
    b.BackgroundColor3 = color or C.cardHi
    b.BorderSizePixel = 0
    b.Text = label
    b.Font = Enum.Font.GothamBold
    b.TextColor3 = C.text
    b.TextSize = 11
    b.AutoButtonColor = false
    b.LayoutOrder = order
    corner(b, 9)
    stroke(b, C.border, 1, 0.4)

    b.MouseEnter:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.15), {BackgroundColor3 = C.accent2}):Play()
    end)
    b.MouseLeave:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.15), {BackgroundColor3 = color or C.cardHi}):Play()
    end)
    b.MouseButton1Click:Connect(function()
        if callback then pcall(callback) end
    end)
    return b
end

local function makeLabel(parent, text, order, color)
    local l = Instance.new("TextLabel", parent)
    l.Size = UDim2.new(1, 0, 0, 18)
    l.BackgroundTransparency = 1
    l.Text = text
    l.Font = Enum.Font.GothamMedium
    l.TextColor3 = color or C.textDim
    l.TextSize = 10
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.TextWrapped = true
    l.LayoutOrder = order
    return l
end

local FarmPage = Tabs.farm
local FarmGlass = Instance.new("Frame", FarmPage)
FarmGlass.Size = UDim2.new(1, 0, 0, 320)
FarmGlass.BackgroundColor3 = C.card
FarmGlass.BackgroundTransparency = 0.3
FarmGlass.BorderSizePixel = 0
FarmGlass.ZIndex = 5
corner(FarmGlass, 14)
stroke(FarmGlass, C.borderHi, 1.5, 0.2)

local GlassCard = Instance.new("Frame", FarmGlass)
GlassCard.AnchorPoint = Vector2.new(0.5, 0.5)
GlassCard.Position = UDim2.new(0.5, 0, 0.5, 0)
GlassCard.Size = UDim2.new(0, 340, 0, 180)
GlassCard.BackgroundColor3 = C.panel
GlassCard.BackgroundTransparency = 0.15
GlassCard.BorderSizePixel = 0
GlassCard.ZIndex = 6
corner(GlassCard, 16)
stroke(GlassCard, C.borderHi, 1.5, 0.2)

local GlassLogo = Instance.new("ImageLabel", GlassCard)
GlassLogo.Size = UDim2.new(0, 64, 0, 64)
GlassLogo.Position = UDim2.new(0.5, -32, 0, 20)
GlassLogo.BackgroundTransparency = 1
GlassLogo.Image = LOGO_ID
GlassLogo.ScaleType = Enum.ScaleType.Crop
GlassLogo.ZIndex = 7
corner(GlassLogo, 16)

local GlassTitle = Instance.new("TextLabel", GlassCard)
GlassTitle.Size = UDim2.new(1, -20, 0, 26)
GlassTitle.Position = UDim2.new(0, 10, 0, 96)
GlassTitle.BackgroundTransparency = 1
GlassTitle.Text = T("coming_soon")
GlassTitle.Font = Enum.Font.GothamBlack
GlassTitle.TextColor3 = C.accentHi
GlassTitle.TextSize = 20
GlassTitle.ZIndex = 7

local GlassSub = Instance.new("TextLabel", GlassCard)
GlassSub.Size = UDim2.new(1, -20, 0, 16)
GlassSub.Position = UDim2.new(0, 10, 0, 128)
GlassSub.BackgroundTransparency = 1
GlassSub.Text = T("farm_sub")
GlassSub.Font = Enum.Font.GothamMedium
GlassSub.TextColor3 = C.textDim
GlassSub.TextSize = 10
GlassSub.ZIndex = 7

local Combat = {
    aimbot = false, silent = true, target = "Head", fov = 150, smooth = 0.15,
    espEnabled = false, box = true, chams = true, name = true,
    health = true, distance = true, tracer = true,
    teamCheck = false, wallCheck = false, priority = "Nearest",
    drawings = {},
}

local targetParts = {"Head", "Torso", "UpperTorso", "LowerTorso", "HumanoidRootPart", "LeftFoot", "RightFoot", "LeftLeg", "RightLeg"}
local priorityList = {"Nearest", "Lowest HP", "Random", "Highest HP"}

local function getTargetPart(character)
    if not character then return nil end
    local map = {
        Head = character:FindFirstChild("Head"),
        Torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso"),
        UpperTorso = character:FindFirstChild("UpperTorso"),
        LowerTorso = character:FindFirstChild("LowerTorso"),
        HumanoidRootPart = character:FindFirstChild("HumanoidRootPart"),
        LeftFoot = character:FindFirstChild("LeftFoot"),
        RightFoot = character:FindFirstChild("RightFoot"),
        LeftLeg = character:FindFirstChild("LeftLeg") or character:FindFirstChild("LeftUpperLeg"),
        RightLeg = character:FindFirstChild("RightLeg") or character:FindFirstChild("RightUpperLeg"),
    }
    return map[Combat.target] or character:FindFirstChild("Head")
end

local function sameTeam(plr)
    if not Combat.teamCheck then return false end
    if not LocalPlayer.Team or not plr.Team then return false end
    return LocalPlayer.Team == plr.Team
end

local function isVisible(part)
    if not Combat.wallCheck then return true end
    local myChar = LocalPlayer.Character
    if not myChar then return true end
    local origin = Camera.CFrame.Position
    local dir = part.Position - origin
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = {myChar, part.Parent}
    local ray = Workspace:Raycast(origin, dir, params)
    return ray == nil
end

local function getClosestPlayer()
    local closest, best = nil, math.huge
    local myChar = LocalPlayer.Character
    if not myChar then return nil end
    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end
    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
            if plr.Character.Humanoid.Health > 0 and not sameTeam(plr) then
                local part = getTargetPart(plr.Character)
                if part and isVisible(part) then
                    local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local dist = (Vector2.new(pos.X, pos.Y) - screenCenter).Magnitude
                        if Combat.priority == "Lowest HP" then
                            local hp = plr.Character.Humanoid.Health
                            if hp < best then best = hp closest = plr end
                        elseif Combat.priority == "Highest HP" then
                            local hp = -plr.Character.Humanoid.Health
                            if hp < best then best = hp closest = plr end
                        elseif Combat.priority == "Random" then
                            if math.random(1, 3) == 1 then closest = plr end
                        else
                            if dist < Combat.fov and dist < best then best = dist closest = plr end
                        end
                    end
                end
            end
        end
    end
    return closest
end

local function clearESP(plr)
    if Combat.drawings[plr] then
        for _, v in pairs(Combat.drawings[plr]) do
            pcall(function() v:Remove() end)
        end
        Combat.drawings[plr] = nil
    end
end

local function newDrawing(class, props)
    local ok, obj = pcall(function() return Drawing.new(class) end)
    if not ok or not obj then return nil end
    for k, v in pairs(props) do obj[k] = v end
    return obj
end

local function setupESP(plr)
    clearESP(plr)
    if not Drawing then return end
    Combat.drawings[plr] = {
        box    = newDrawing("Square", {Thickness = 1.5, Color = C.accentHi, Filled = false, Transparency = 1}),
        name   = newDrawing("Text", {Size = 13, Center = true, Outline = true, Color = C.text, Transparency = 1}),
        hpText = newDrawing("Text", {Size = 11, Center = true, Outline = true, Color = C.green, Transparency = 1}),
        dist   = newDrawing("Text", {Size = 11, Center = true, Outline = true, Color = C.cyan, Transparency = 1}),
        tracer = newDrawing("Line", {Thickness = 1, Color = C.accentHi, Transparency = 1}),
    }
end

local function updateESP()
    if not Drawing then return end
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local char = plr.Character
            if not char or not char:FindFirstChild("Humanoid") then
                if Combat.drawings[plr] then clearESP(plr) end
            else
                if not Combat.drawings[plr] and Combat.espEnabled then setupESP(plr) end
                local d = Combat.drawings[plr]
                if d then
                    local hum = char:FindFirstChild("Humanoid")
                    local root = char:FindFirstChild("HumanoidRootPart")
                    local head = char:FindFirstChild("Head")
                    if not hum or not root or not head then
                        clearESP(plr)
                    else
                        local visible = Combat.espEnabled and hum.Health > 0 and not sameTeam(plr)
                        if not visible then
                            for _, v in pairs(d) do pcall(function() v.Visible = false end) end
                            for _, hl in ipairs(char:GetChildren()) do
                                if hl:IsA("Highlight") and hl.Name == "VertexCham" then hl.Enabled = false end
                            end
                        else
                            local top = head.Position + Vector3.new(0, head.Size.Y / 2 + 0.4, 0)
                            local bottom = root.Position - Vector3.new(0, 3, 0)
                            local tPos, tOn = Camera:WorldToViewportPoint(top)
                            local bPos, bOn = Camera:WorldToViewportPoint(bottom)
                            if tOn and bOn then
                                local height = (Vector2.new(tPos.X, tPos.Y) - Vector2.new(bPos.X, bPos.Y)).Magnitude
                                local width = height * 0.55
                                local centerX = (tPos.X + bPos.X) / 2
                                if d.box then
                                    d.box.Visible = Combat.box
                                    if Combat.box then
                                        d.box.Size = Vector2.new(width, height)
                                        d.box.Position = Vector2.new(centerX - width / 2, tPos.Y)
                                    end
                                end
                                if d.name then
                                    d.name.Visible = Combat.name
                                    if Combat.name then
                                        d.name.Position = Vector2.new(centerX, tPos.Y - 18)
                                        d.name.Text = plr.Name
                                    end
                                end
                                if d.hpText then
                                    d.hpText.Visible = Combat.health
                                    if Combat.health then
                                        d.hpText.Position = Vector2.new(centerX, bPos.Y + 2)
                                        d.hpText.Text = math.floor(hum.Health) .. " / " .. math.floor(hum.MaxHealth)
                                        local ratio = hum.Health / math.max(1, hum.MaxHealth)
                                        d.hpText.Color = Color3.fromRGB(255 * (1 - ratio) + 40, 200 * ratio + 55, 90 * ratio + 60)
                                    end
                                end
                                if d.dist then
                                    d.dist.Visible = Combat.distance
                                    if Combat.distance then
                                        local myChar = LocalPlayer.Character
                                        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
                                        if myRoot then
                                            local dist = math.floor((myRoot.Position - root.Position).Magnitude)
                                            d.dist.Position = Vector2.new(centerX, bPos.Y + 18)
                                            d.dist.Text = dist .. " studs"
                                        end
                                    end
                                end
                                if d.tracer then
                                    d.tracer.Visible = Combat.tracer
                                    if Combat.tracer then
                                        d.tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                                        d.tracer.To = Vector2.new(centerX, bPos.Y)
                                    end
                                end
                                local cham = char:FindFirstChild("VertexCham")
                                if Combat.chams then
                                    if not cham then
                                        cham = Instance.new("Highlight")
                                        cham.Name = "VertexCham"
                                        cham.FillColor = C.accent
                                        cham.OutlineColor = C.accentHi
                                        cham.FillTransparency = 0.6
                                        cham.OutlineTransparency = 0.1
                                        cham.Parent = char
                                    end
                                    cham.Enabled = true
                                    cham.Adornee = char
                                elseif cham then
                                    cham.Enabled = false
                                end
                            else
                                for _, v in pairs(d) do pcall(function() v.Visible = false end) end
                            end
                        end
                    end
                end
            end
        end
    end
end

local function clearAllESP()
    for plr in pairs(Combat.drawings) do clearESP(plr) end
    Combat.drawings = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Character then
            local c = plr.Character:FindFirstChild("VertexCham")
            if c then c:Destroy() end
        end
    end
end

RunService.RenderStepped:Connect(function()
    if Combat.espEnabled then pcall(updateESP) end
end)

Players.PlayerRemoving:Connect(function(plr) clearESP(plr) end)

pcall(function()
    local mt = getrawmetatable and getrawmetatable(game)
    if mt then
        local oldIndex = mt.__index
        local oldNamecall = mt.__namecall
        setreadonly(mt, false)
        mt.__index = newcclosure(function(self, key)
            if Combat.aimbot and Combat.silent and key == "Hit" then
                local target = getClosestPlayer()
                if target and target.Character then
                    local part = getTargetPart(target.Character)
                    if part then return part end
                end
            end
            return oldIndex(self, key)
        end)
        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod and getnamecallmethod()
            if Combat.aimbot and Combat.silent and (method == "FindPartOnRay" or method == "FindPartOnRayWithIgnoreList" or method == "FindPartOnRayWithWhitelist") then
                local target = getClosestPlayer()
                if target and target.Character then
                    local part = getTargetPart(target.Character)
                    if part then
                        local args = {...}
                        args[1] = Ray.new(Camera.CFrame.Position, (part.Position - Camera.CFrame.Position).Unit * 5000)
                        return oldNamecall(self, unpack(args))
                    end
                end
            end
            return oldNamecall(self, ...)
        end)
        setreadonly(mt, true)
    end
end)

local CombatSec = makeCard(Tabs.combat, "Silent Aim", 1)
makeToggle(CombatSec, T("aimbot"), false, 3, function(v) Combat.aimbot = v end)
makeToggle(CombatSec, "Silent Mode", true, 4, function(v) Combat.silent = v end)
makeDropdown(CombatSec, "Target Bone", targetParts, 1, 5, function(opt) Combat.target = opt end)
makeSlider(CombatSec, "FOV", 20, 800, 150, 6, false, function(v) Combat.fov = v end)
makeDropdown(CombatSec, T("target_prio"), priorityList, 1, 7, function(opt) Combat.priority = opt end)
makeToggle(CombatSec, T("team_check"), false, 8, function(v) Combat.teamCheck = v end)
makeToggle(CombatSec, T("wall_check"), false, 9, function(v) Combat.wallCheck = v end)
makeLabel(CombatSec, "Silent aim intercepts raycast. Camera aim is not moved.", 10)

local ESPSec = makeCard(Tabs.combat, "ESP Visual", 2)
makeToggle(ESPSec, "Enable ESP", false, 3, function(v) Combat.espEnabled = v if not v then clearAllESP() end end)
makeToggle(ESPSec, T("esp_box"), true, 4, function(v) Combat.box = v end)
makeToggle(ESPSec, T("esp_name"), true, 5, function(v) Combat.name = v end)
makeToggle(ESPSec, T("esp_health"), true, 6, function(v) Combat.health = v end)
makeToggle(ESPSec, T("esp_dist"), true, 7, function(v) Combat.distance = v end)
makeToggle(ESPSec, T("esp_tracer"), true, 8, function(v) Combat.tracer = v end)
makeToggle(ESPSec, T("esp_chams"), true, 9, function(v) Combat.chams = v end)

local UtilState = {
    speed = 16, jump = 50, noclip = false, infJump = false,
    fly = false, flySpeed = 60, antiAfk = false, fullbright = false,
    noFog = false, fov = 70, fpsBoost = false, gravity = 196.2,
}

local function applySpeed()
    local char = LocalPlayer.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.WalkSpeed = UtilState.speed
    end
end
local function applyJump()
    local char = LocalPlayer.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.JumpPower = UtilState.jump
        char.Humanoid.UseJumpPower = true
    end
end

local UtilSec = makeCard(Tabs.utility, "Character", 1)
makeSlider(UtilSec, T("walk_speed"), 16, 300, 16, 3, false, function(v) UtilState.speed = v applySpeed() end)
makeSlider(UtilSec, T("jump_power"), 50, 300, 50, 4, false, function(v) UtilState.jump = v applyJump() end)
makeToggle(UtilSec, T("noclip"), false, 5, function(v) UtilState.noclip = v end)
makeToggle(UtilSec, T("inf_jump"), false, 6, function(v) UtilState.infJump = v end)

local FlySec = makeCard(Tabs.utility, "Fly", 2)
makeToggle(FlySec, T("fly"), false, 3, function(v)
    UtilState.fly = v
    if v then
        DeviceOverlay.Visible = true
    else
        stopFly()
        FlyUI.Visible = false
    end
end)
makeSlider(FlySec, "Fly Speed", 20, 300, 60, 4, false, function(v) UtilState.flySpeed = v end)
makeDropdown(FlySec, "Device (change)", {"PC", "Laptop", "Tablet", "Handphone"}, 1, 5, function(opt)
    flyDevice = opt
    if UtilState.fly then
        if opt == "Tablet" or opt == "Handphone" then
            FlyUI.Visible = true
        else
            FlyUI.Visible = false
        end
    end
end)

local UtilSec2 = makeCard(Tabs.utility, "Visual", 3)
makeToggle(UtilSec2, T("fullbright"), false, 3, function(v)
    UtilState.fullbright = v
    Lighting.Brightness = v and 3 or 2
    Lighting.Ambient = v and Color3.fromRGB(200,200,200) or Color3.fromRGB(70,70,70)
    Lighting.OutdoorAmbient = v and Color3.fromRGB(180,180,180) or Color3.fromRGB(128,128,128)
end)
makeToggle(UtilSec2, T("remove_fog"), false, 4, function(v)
    UtilState.noFog = v
    Lighting.FogEnd = v and 100000 or 1000
    Lighting.FogStart = v and 0 or 0
end)
makeSlider(UtilSec2, T("fov_changer"), 40, 120, 70, 5, false, function(v)
    UtilState.fov = v
    Camera.FieldOfView = v
end)
makeToggle(UtilSec2, T("fps_boost"), false, 6, function(v)
    UtilState.fpsBoost = v
    Lighting.GlobalShadows = not v
end)

local UtilSec3 = makeCard(Tabs.utility, "Misc", 4)
makeToggle(UtilSec3, T("anti_afk"), false, 3, function(v) UtilState.antiAfk = v end)
makeSlider(UtilSec3, "Gravity", 20, 400, 196, 4, false, function(v)
    UtilState.gravity = v
    Workspace.Gravity = v
end)

RunService.RenderStepped:Connect(function()
    if UtilState.noclip then
        local char = LocalPlayer.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if UtilState.infJump then
        local char = LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(60)
        if UtilState.antiAfk then
            pcall(function() VirtualUser:CaptureController() end)
            pcall(function() VirtualUser:ClickButton2(Vector2.new()) end)
        end
    end
end)

local MiscState = {autoRejoin = false, hidePlayers = false, freezeSelf = false, godmode = false, dmgIndicator = false, clickTp = false}

local MiscSec = makeCard(Tabs.misc, "Server", 1)
makeToggle(MiscSec, T("auto_rejoin"), false, 3, function(v) MiscState.autoRejoin = v end)
makeButton(MiscSec, T("server_hop"), 4, C.cardHi, function()
    local ok, servers = pcall(function()
        local body = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=50")
        return HttpService:JSONDecode(body)
    end)
    if ok and servers and servers.data then
        for _, s in ipairs(servers.data) do
            if s.id ~= game.JobId then
                pcall(function()
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, LocalPlayer)
                end)
                break
            end
        end
    end
end)
makeButton(MiscSec, T("rejoin_same"), 5, C.cardHi, function()
    pcall(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
end)
makeButton(MiscSec, "Rejoin Lowest Server", 6, C.cardHi, function()
    local ok, servers = pcall(function()
        local body = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
        return HttpService:JSONDecode(body)
    end)
    if ok and servers and servers.data then
        local best, bestCount = nil, math.huge
        for _, s in ipairs(servers.data) do
            if s.id ~= game.JobId and s.playing < bestCount and s.playing < s.maxPlayers then
                best = s.id
                bestCount = s.playing
            end
        end
        if best then
            pcall(function()
                TeleportService:TeleportToPlaceInstance(game.PlaceId, best, LocalPlayer)
            end)
        end
    end
end)

local MiscSec2 = makeCard(Tabs.misc, "Character", 2)
makeToggle(MiscSec2, T("hide_players"), false, 3, function(v) MiscState.hidePlayers = v end)
makeToggle(MiscSec2, T("freeze_self"), false, 4, function(v)
    MiscState.freezeSelf = v
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.Anchored = v
    end
end)
makeToggle(MiscSec2, T("godmode"), false, 5, function(v) MiscState.godmode = v end)
makeToggle(MiscSec2, T("dmg_indicator"), false, 6, function(v) MiscState.dmgIndicator = v end)

local MiscSec3 = makeCard(Tabs.misc, "Player Tools", 3)
makeButton(MiscSec3, T("copy_jobid"), 3, C.cardHi, function()
    pcall(function() if setclipboard then setclipboard(game.JobId) end end)
    notify("JobID Copied", true)
end)
makeButton(MiscSec3, T("rejoin_jobid"), 4, C.cardHi, function()
    pcall(function()
        if getclipboard then
            local jid = getclipboard()
            if jid and #jid > 0 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, jid, LocalPlayer)
            end
        end
    end)
end)
makeButton(MiscSec3, T("player_info"), 5, C.cardHi, function()
    for _, plr in ipairs(Players:GetPlayers()) do
        print(plr.Name, plr.UserId, plr.DisplayName, plr.AccountAge)
    end
end)
makeButton(MiscSec3, "Reset Character", 6, C.cardHi, function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.Health = 0
    end
end)

RunService.RenderStepped:Connect(function()
    if MiscState.godmode then
        local char = LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char.Humanoid.Health = char.Humanoid.MaxHealth
        end
    end
    if MiscState.hidePlayers then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                for _, part in ipairs(plr.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.LocalTransparencyModifier = 1 end
                end
            end
        end
    end
end)

local DeviceOverlay = Instance.new("Frame", ScreenGui)
DeviceOverlay.Size = UDim2.new(1, 0, 1, 0)
DeviceOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DeviceOverlay.BackgroundTransparency = 0.55
DeviceOverlay.BorderSizePixel = 0
DeviceOverlay.Visible = false
DeviceOverlay.ZIndex = 200

local DeviceBox = Instance.new("Frame", DeviceOverlay)
DeviceBox.Size = UDim2.new(0, 460, 0, 330)
DeviceBox.Position = UDim2.new(0.5, -230, 0.5, -165)
DeviceBox.BackgroundColor3 = C.card
DeviceBox.BorderSizePixel = 0
DeviceBox.ZIndex = 201
corner(DeviceBox, 18)
stroke(DeviceBox, C.borderHi, 1.5, 0.2)

local DevTitle = Instance.new("TextLabel", DeviceBox)
DevTitle.Size = UDim2.new(1, -20, 0, 24)
DevTitle.Position = UDim2.new(0, 10, 0, 18)
DevTitle.BackgroundTransparency = 1
DevTitle.Text = T("device_pick")
DevTitle.Font = Enum.Font.GothamBlack
DevTitle.TextColor3 = C.text
DevTitle.TextSize = 16
DevTitle.ZIndex = 202

local DevSub = Instance.new("TextLabel", DeviceBox)
DevSub.Size = UDim2.new(1, -20, 0, 16)
DevSub.Position = UDim2.new(0, 10, 0, 44)
DevSub.BackgroundTransparency = 1
DevSub.Text = T("device_sub")
DevSub.Font = Enum.Font.GothamMedium
DevSub.TextColor3 = C.textDim
DevSub.TextSize = 10
DevSub.ZIndex = 202

local flyDevice = "PC"

local function deviceBtn(label, pos, key)
    local b = Instance.new("TextButton", DeviceBox)
    b.Size = UDim2.new(0, 210, 0, 95)
    b.Position = UDim2.new(0, pos.X, 0, pos.Y)
    b.BackgroundColor3 = C.panel2
    b.BorderSizePixel = 0
    b.Text = ""
    b.AutoButtonColor = false
    b.ZIndex = 202
    corner(b, 14)
    stroke(b, C.border, 1, 0.4)

    local lbl = Instance.new("TextLabel", b)
    lbl.Size = UDim2.new(1, 0, 0, 22)
    lbl.Position = UDim2.new(0, 0, 0.5, -11)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.Font = Enum.Font.GothamBold
    lbl.TextColor3 = C.text
    lbl.TextSize = 14
    lbl.ZIndex = 203

    b.MouseEnter:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.15), {BackgroundColor3 = C.cardHi}):Play()
    end)
    b.MouseLeave:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.15), {BackgroundColor3 = C.panel2}):Play()
    end)
    b.MouseButton1Click:Connect(function()
        flyDevice = key
        DeviceOverlay.Visible = false
        startFly()
        if key == "Tablet" or key == "Handphone" then
            FlyUI.Visible = true
        else
            FlyUI.Visible = false
        end
        notify("Fly " .. label, true)
    end)
end

deviceBtn(T("device_laptop"), Vector2.new(15, 80), "Laptop")
deviceBtn(T("device_pc"), Vector2.new(235, 80), "PC")
deviceBtn(T("device_tablet"), Vector2.new(15, 185), "Tablet")
deviceBtn(T("device_phone"), Vector2.new(235, 185), "Handphone")

local FlyUI = Instance.new("Frame", ScreenGui)
FlyUI.Size = UDim2.new(0, 170, 0, 220)
FlyUI.Position = UDim2.new(0.5, -85, 1, -250)
FlyUI.BackgroundColor3 = C.card
FlyUI.BackgroundTransparency = 0.15
FlyUI.BorderSizePixel = 0
FlyUI.Visible = false
FlyUI.ZIndex = 100
corner(FlyUI, 14)
stroke(FlyUI, C.borderHi, 1, 0.3)

local FlyTitle = Instance.new("TextLabel", FlyUI)
FlyTitle.Size = UDim2.new(1, 0, 0, 22)
FlyTitle.Position = UDim2.new(0, 0, 0, 8)
FlyTitle.BackgroundTransparency = 1
FlyTitle.Text = "FLY CONTROL"
FlyTitle.Font = Enum.Font.GothamBold
FlyTitle.TextColor3 = C.text
FlyTitle.TextSize = 11
FlyTitle.ZIndex = 101

local FlyUp = Instance.new("TextButton", FlyUI)
FlyUp.Size = UDim2.new(0, 70, 0, 42)
FlyUp.Position = UDim2.new(0.5, -35, 0, 36)
FlyUp.BackgroundColor3 = C.panel2
FlyUp.BorderSizePixel = 0
FlyUp.Text = "▲"
FlyUp.Font = Enum.Font.GothamBold
FlyUp.TextColor3 = C.text
FlyUp.TextSize = 16
FlyUp.AutoButtonColor = false
FlyUp.ZIndex = 101
corner(FlyUp, 10)

local JoyBack = Instance.new("Frame", FlyUI)
JoyBack.Size = UDim2.new(0, 130, 0, 130)
JoyBack.Position = UDim2.new(0.5, -65, 0, 84)
JoyBack.BackgroundColor3 = C.panel2
JoyBack.BorderSizePixel = 0
JoyBack.ZIndex = 101
corner(JoyBack, 65)

local JoyDot = Instance.new("Frame", JoyBack)
JoyDot.Size = UDim2.new(0, 54, 0, 54)
JoyDot.Position = UDim2.new(0.5, -27, 0.5, -27)
JoyDot.BackgroundColor3 = C.accentHi
JoyDot.BorderSizePixel = 0
JoyDot.ZIndex = 102
corner(JoyDot, 27)

local FlyDown = Instance.new("TextButton", FlyUI)
FlyDown.Size = UDim2.new(0, 70, 0, 42)
FlyDown.Position = UDim2.new(0.5, -35, 1, -50)
FlyDown.BackgroundColor3 = C.panel2
FlyDown.BorderSizePixel = 0
FlyDown.Text = "▼"
FlyDown.Font = Enum.Font.GothamBold
FlyDown.TextColor3 = C.text
FlyDown.TextSize = 16
FlyDown.AutoButtonColor = false
FlyDown.ZIndex = 101
corner(FlyDown, 10)

local flyMobileUp, flyMobileDown = false, false
local flyJoystick = {x = 0, y = 0}
local flyBodyVel, flyBodyGyro

local function stopFly()
    if flyBodyVel then flyBodyVel:Destroy() flyBodyVel = nil end
    if flyBodyGyro then flyBodyGyro:Destroy() flyBodyGyro = nil end
end

local function startFly()
    stopFly()
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    flyBodyVel = Instance.new("BodyVelocity")
    flyBodyVel.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    flyBodyVel.Velocity = Vector3.zero
    flyBodyVel.Parent = hrp
    flyBodyGyro = Instance.new("BodyGyro")
    flyBodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    flyBodyGyro.P = 1000
    flyBodyGyro.Parent = hrp
end

FlyUp.MouseButton1Down:Connect(function() flyMobileUp = true end)
FlyUp.MouseButton1Up:Connect(function() flyMobileUp = false end)
FlyUp.MouseLeave:Connect(function() flyMobileUp = false end)
FlyDown.MouseButton1Down:Connect(function() flyMobileDown = true end)
FlyDown.MouseButton1Up:Connect(function() flyMobileDown = false end)
FlyDown.MouseLeave:Connect(function() flyMobileDown = false end)

local joyDragging = false
JoyBack.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        joyDragging = true
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if not joyDragging then return end
    if input.UserInputType ~= Enum.UserInputType.MouseMovement
    and input.UserInputType ~= Enum.UserInputType.Touch then return end
    local center = JoyBack.AbsolutePosition + JoyBack.AbsoluteSize / 2
    local delta = Vector2.new(input.Position.X, input.Position.Y) - center
    local maxDist = 38
    if delta.Magnitude > maxDist then delta = delta.Unit * maxDist end
    JoyDot.Position = UDim2.new(0.5, delta.X - 27, 0.5, delta.Y - 27)
    flyJoystick.x = delta.X / maxDist
    flyJoystick.y = delta.Y / maxDist
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        joyDragging = false
        JoyDot.Position = UDim2.new(0.5, -27, 0.5, -27)
        flyJoystick.x = 0
        flyJoystick.y = 0
    end
end)

RunService.RenderStepped:Connect(function()
    if UtilState.fly and flyBodyVel and flyBodyGyro then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local move = Vector3.zero
            if flyDevice == "PC" or flyDevice == "Laptop" then
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then move += Camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then move -= Camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then move -= Camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then move += Camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move += Vector3.new(0, 1, 0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move -= Vector3.new(0, 1, 0) end
            else
                if flyJoystick.x ~= 0 or flyJoystick.y ~= 0 then
                    move += Camera.CFrame.LookVector * (-flyJoystick.y)
                    move += Camera.CFrame.RightVector * flyJoystick.x
                end
                if flyMobileUp then move += Vector3.new(0, 1, 0) end
                if flyMobileDown then move -= Vector3.new(0, 1, 0) end
            end
            flyBodyVel.Velocity = move * UtilState.flySpeed
            flyBodyGyro.CFrame = Camera.CFrame
        end
    end
end)

local ConfigState = {autoSave = false}
local ConfigSec = makeCard(Tabs.config, "Config File", 1)

makeButton(ConfigSec, T("save_config"), 3, C.cardHi, function()
    local data = {
        speed = UtilState.speed, jump = UtilState.jump,
        flySpeed = UtilState.flySpeed, fov = UtilState.fov,
        aimbotFov = Combat.fov, aimbotTarget = Combat.target,
        language = Lang.current,
    }
    pcall(function() writefile(CONFIG_FILE, HttpService:JSONEncode(data)) end)
    notify(T("save_config"), true)
end)
makeButton(ConfigSec, T("load_config"), 4, C.cardHi, function()
    pcall(function()
        if isfile(CONFIG_FILE) then
            local data = HttpService:JSONDecode(readfile(CONFIG_FILE))
            if data.speed then UtilState.speed = data.speed applySpeed() end
            if data.jump then UtilState.jump = data.jump applyJump() end
            if data.flySpeed then UtilState.flySpeed = data.flySpeed end
            if data.fov then UtilState.fov = data.fov Camera.FieldOfView = data.fov end
            if data.aimbotFov then Combat.fov = data.aimbotFov end
            if data.aimbotTarget then Combat.target = data.aimbotTarget end
        end
    end)
    notify(T("load_config"), true)
end)
makeButton(ConfigSec, T("delete_config"), 5, C.cardHi, function()
    pcall(function() if isfile(CONFIG_FILE) then delfile(CONFIG_FILE) end end)
    notify(T("delete_config"), true)
end)
makeButton(ConfigSec, T("reset_default"), 6, C.cardHi, function()
    UtilState.speed = 16 UtilState.jump = 50
    UtilState.fov = 70 Camera.FieldOfView = 70
    applySpeed() applyJump()
end)
makeToggle(ConfigSec, T("auto_save"), false, 7, function(v) ConfigState.autoSave = v end)
makeButton(ConfigSec, T("export_config"), 8, C.cardHi, function()
    pcall(function()
        if isfile(CONFIG_FILE) and setclipboard then setclipboard(readfile(CONFIG_FILE)) end
    end)
    notify(T("export_config"), true)
end)

local ColorSec = makeCard(Tabs.config, T("accent_color"), 2)
local colorOptions = {"Gray", "Blue", "Green", "Red", "Cyan", "Purple", "Pink", "Orange", "Yellow", "Lime"}
makeDropdown(ColorSec, T("accent_color"), colorOptions, 1, 3, function(opt)
    local palettes = {
        Gray   = {Color3.fromRGB(180,180,195), Color3.fromRGB(110,110,125), Color3.fromRGB(240,240,250)},
        Blue   = {Color3.fromRGB(100,140,230), Color3.fromRGB(60,90,180), Color3.fromRGB(160,190,255)},
        Green  = {Color3.fromRGB(80,190,130), Color3.fromRGB(50,140,90), Color3.fromRGB(140,230,180)},
        Red    = {Color3.fromRGB(220,100,110), Color3.fromRGB(160,60,70), Color3.fromRGB(255,150,160)},
        Cyan   = {Color3.fromRGB(80,180,220), Color3.fromRGB(50,130,180), Color3.fromRGB(150,220,250)},
        Purple = {Color3.fromRGB(160,110,240), Color3.fromRGB(110,70,200), Color3.fromRGB(210,170,255)},
        Pink   = {Color3.fromRGB(240,120,200), Color3.fromRGB(180,70,150), Color3.fromRGB(255,180,230)},
        Orange = {Color3.fromRGB(240,160,80), Color3.fromRGB(180,100,50), Color3.fromRGB(255,200,140)},
        Yellow = {Color3.fromRGB(230,200,100), Color3.fromRGB(170,140,60), Color3.fromRGB(255,230,150)},
        Lime   = {Color3.fromRGB(170,230,100), Color3.fromRGB(120,180,60), Color3.fromRGB(210,255,150)},
    }
    local p = palettes[opt]
    if p then
        C.accent, C.accent2, C.accentHi = p[1], p[2], p[3]
        for _, btn in pairs(TabButtons) do
            local ind = btn:FindFirstChildWhichIsA("Frame")
            if ind then ind.BackgroundColor3 = C.accentHi end
        end
        mainStroke.Color = C.accentHi
    end
end)

makeSlider(ColorSec, T("ui_scale"), 70, 130, 100, 4, false, function(v)
    local scale = v / 100
    Main.Size = UDim2.new(0, math.floor(680 * scale), 0, math.floor(480 * scale))
end)

local LangSec = makeCard(Tabs.config, T("language"), 3)
local langOptions = {"English", "Indonesia", "Chinese", "Japanese", "Russian"}
makeDropdown(LangSec, T("language"), langOptions, 1, 3, function(opt)
    if Lang.strings[opt] then
        Lang.current = opt
        for _, btn in pairs(TabButtons) do
            btn.Text = "   " .. T(btn.Name)
        end
        DevTitle.Text = T("device_pick")
        DevSub.Text = T("device_sub")
        GlassTitle.Text = T("coming_soon")
        GlassSub.Text = T("farm_sub")
        notify(T("language") .. ": " .. opt, true)
    end
end)

local CreditPage = Tabs.credits
local CreditCard = Instance.new("Frame", CreditPage)
CreditCard.Size = UDim2.new(1, 0, 0, 400)
CreditCard.BackgroundColor3 = C.card
CreditCard.BorderSizePixel = 0
CreditCard.LayoutOrder = 1
corner(CreditCard, 14)
stroke(CreditCard, C.border, 1, 0.3)

local CredGlow = Instance.new("ImageLabel", CreditCard)
CredGlow.Size = UDim2.new(0, 120, 0, 120)
CredGlow.Position = UDim2.new(0.5, -60, 0, 12)
CredGlow.BackgroundTransparency = 1
CredGlow.Image = "rbxassetid://5028857084"
CredGlow.ImageColor3 = C.accent
CredGlow.ImageTransparency = 0.4

local CredLogo = Instance.new("ImageLabel", CreditCard)
CredLogo.Size = UDim2.new(0, 84, 0, 84)
CredLogo.Position = UDim2.new(0.5, -42, 0, 30)
CredLogo.BackgroundTransparency = 1
CredLogo.Image = LOGO_ID
CredLogo.ScaleType = Enum.ScaleType.Crop
corner(CredLogo, 20)
stroke(CredLogo, C.borderHi, 1.5, 0.3)

local CredTitle = Instance.new("TextLabel", CreditCard)
CredTitle.Size = UDim2.new(1, -20, 0, 26)
CredTitle.Position = UDim2.new(0, 10, 0, 126)
CredTitle.BackgroundTransparency = 1
CredTitle.Text = "VERTEX HUB"
CredTitle.Font = Enum.Font.GothamBlack
CredTitle.TextColor3 = C.text
CredTitle.TextSize = 22

local CredVersion = Instance.new("TextLabel", CreditCard)
CredVersion.Size = UDim2.new(1, -20, 0, 14)
CredVersion.Position = UDim2.new(0, 10, 0, 156)
CredVersion.BackgroundTransparency = 1
CredVersion.Text = T("version") .. " 1.0.0"
CredVersion.Font = Enum.Font.GothamMedium
CredVersion.TextColor3 = C.textDim
CredVersion.TextSize = 10

local function creditRow(y, label, value)
    local row = Instance.new("Frame", CreditCard)
    row.Size = UDim2.new(1, -32, 0, 24)
    row.Position = UDim2.new(0, 16, 0, y)
    row.BackgroundTransparency = 1
    local l = Instance.new("TextLabel", row)
    l.Size = UDim2.new(0.5, 0, 1, 0)
    l.BackgroundTransparency = 1
    l.Text = label
    l.Font = Enum.Font.GothamMedium
    l.TextColor3 = C.textDim
    l.TextSize = 10
    l.TextXAlignment = Enum.TextXAlignment.Left
    local v = Instance.new("TextLabel", row)
    v.Size = UDim2.new(0.5, 0, 1, 0)
    v.Position = UDim2.new(0.5, 0, 0, 0)
    v.BackgroundTransparency = 1
    v.Text = value
    v.Font = Enum.Font.GothamBold
    v.TextColor3 = C.text
    v.TextSize = 10
    v.TextXAlignment = Enum.TextXAlignment.Right
end

creditRow(184, T("owner"), "Jar")
creditRow(212, T("made_by"), "Jar Local")
creditRow(240, T("country"), "Indonesia")
creditRow(268, T("ui_style"), "Vertex Gray")
creditRow(296, T("github"), "Jar-Anonymous")
creditRow(324, T("discord"), "-")
creditRow(352, T("thanks"), "Vertex Team")

local Float = Instance.new("ImageButton")
Float.Parent = ScreenGui
Float.Size = UDim2.new(0, 60, 0, 60)
Float.Position = UDim2.new(0, 30, 0.5, -30)
Float.BackgroundColor3 = C.panel
Float.BorderSizePixel = 0
Float.Image = LOGO_ID
Float.ScaleType = Enum.ScaleType.Crop
Float.AutoButtonColor = false
Float.Visible = false
Float.Active = true
corner(Float, 30)
local floatStroke = stroke(Float, C.borderHi, 2, 0.2)

task.spawn(function()
    while Float.Parent do
        if Float.Visible then
            TweenService:Create(floatStroke, TweenInfo.new(1.3), {Transparency = 0.8}):Play()
            task.wait(1.3)
            TweenService:Create(floatStroke, TweenInfo.new(1.3), {Transparency = 0.2}):Play()
            task.wait(1.3)
        else
            task.wait(0.5)
        end
    end
end)

local fDrag, fStart, fPos, fMoved, fDown = false, nil, nil, false, 0

Float.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        fDrag = true
        fMoved = false
        fStart = input.Position
        fPos = Float.Position
        fDown = tick()
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                fDrag = false
                if not fMoved and (tick() - fDown) < 0.5 then
                    Main.Position = UDim2.new(0.5, -340, 0.5, -240)
                    Main.Visible = true
                    Float.Visible = false
                    dragActive = false
                    dragStartInput = nil
                    dragStartPos = nil
                end
                fStart = nil
                fPos = nil
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if not fDrag then return end
    if input.UserInputType ~= Enum.UserInputType.MouseMovement
    and input.UserInputType ~= Enum.UserInputType.Touch then return end
    if not fStart or not fPos then return end
    local delta = input.Position - fStart
    if delta.Magnitude > 4 then
        fMoved = true
        Float.Position = UDim2.new(fPos.X.Scale, fPos.X.Offset + delta.X, fPos.Y.Scale, fPos.Y.Offset + delta.Y)
    end
end)

MinBtn.MouseButton1Click:Connect(function()
    Float.Visible = true
    Main.Visible = false
end)

local Overlay = Instance.new("Frame", ScreenGui)
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.55
Overlay.BorderSizePixel = 0
Overlay.Visible = false
Overlay.ZIndex = 600
Overlay.Active = true

local CBox = Instance.new("Frame", Overlay)
CBox.Size = UDim2.new(0, 320, 0, 175)
CBox.Position = UDim2.new(0.5, -160, 0.5, -88)
CBox.BackgroundColor3 = C.card
CBox.BorderSizePixel = 0
CBox.ZIndex = 601
corner(CBox, 16)
stroke(CBox, C.borderHi, 1.5, 0.3)

local CIcon = Instance.new("ImageLabel", CBox)
CIcon.Size = UDim2.new(0, 44, 0, 44)
CIcon.Position = UDim2.new(0.5, -22, 0, 18)
CIcon.BackgroundColor3 = C.panel
CIcon.BorderSizePixel = 0
CIcon.Image = LOGO_ID
CIcon.ScaleType = Enum.ScaleType.Crop
CIcon.ZIndex = 602
corner(CIcon, 12)

local CTitle = Instance.new("TextLabel", CBox)
CTitle.Size = UDim2.new(1, -24, 0, 18)
CTitle.Position = UDim2.new(0, 12, 0, 74)
CTitle.BackgroundTransparency = 1
CTitle.Text = "Are you sure you want to exit UI?"
CTitle.Font = Enum.Font.GothamBold
CTitle.TextColor3 = C.text
CTitle.TextSize = 12
CTitle.ZIndex = 602

local CSub = Instance.new("TextLabel", CBox)
CSub.Size = UDim2.new(1, -24, 0, 14)
CSub.Position = UDim2.new(0, 12, 0, 94)
CSub.BackgroundTransparency = 1
CSub.Text = "This will close Vertex Hub."
CSub.Font = Enum.Font.GothamMedium
CSub.TextColor3 = C.textDim
CSub.TextSize = 10
CSub.ZIndex = 602

local YesBtn = Instance.new("TextButton", CBox)
YesBtn.Size = UDim2.new(0, 134, 0, 38)
YesBtn.Position = UDim2.new(0, 20, 0, 122)
YesBtn.BackgroundColor3 = C.red
YesBtn.BorderSizePixel = 0
YesBtn.Text = "YES"
YesBtn.Font = Enum.Font.GothamBold
YesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
YesBtn.TextSize = 12
YesBtn.AutoButtonColor = false
YesBtn.ZIndex = 602
corner(YesBtn, 10)

local NoBtn = Instance.new("TextButton", CBox)
NoBtn.Size = UDim2.new(0, 134, 0, 38)
NoBtn.Position = UDim2.new(0, 166, 0, 122)
NoBtn.BackgroundColor3 = C.green
NoBtn.BorderSizePixel = 0
NoBtn.Text = "NO"
NoBtn.Font = Enum.Font.GothamBold
NoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NoBtn.TextSize = 12
NoBtn.AutoButtonColor = false
NoBtn.ZIndex = 602
corner(NoBtn, 10)

YesBtn.MouseButton1Click:Connect(function()
    pcall(clearAllESP)
    pcall(stopFly)
    ScreenGui:Destroy()
end)

NoBtn.MouseButton1Click:Connect(function()
    Overlay.Visible = false
end)

CloseBtn.MouseButton1Click:Connect(function()
    Overlay.Visible = true
end)

pcall(function()
    TabButtons.combat.MouseButton1Click:Fire()
end)

task.delay(0.5, function()
    pcall(function() notify("Vertex Hub", true) end)
end)

warn("[Vertex] Loaded OK")
