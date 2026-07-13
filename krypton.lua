local home = os.getenv("HOME")
local menu = "vicinae toggle"
local mainMod = "SUPER"

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("XDG_MENU_PREFIX", "arch-")


hl.on("hyprland.start", function()
  hl.exec_cmd("EMOJI_FONT=\"Apple Color Emoji\" vicinae server")
  hl.exec_cmd("hyprctl setcursor macOS 24")
  hl.exec_cmd("hyprpaper & hyprsunset & hypridle & dunst")
  hl.exec_cmd("qs --path " .. home .. "/krypton")
  hl.exec_cmd("sleep 3s; hyprctl plugin load " .. home .. "/.local/hyprselect/hyprselect.so")
  hl.exec_cmd(home .. "/krypton/scripts/watch_dir_changes.sh")
end)


-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = { top = 0, bottom = 5, left = 6, right = 6 },
        border_size = 2,
        col = {
            -- active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            active_border = "rgba(595959aa)",
            inactive_border = "rgba(595959aa)",
        }
    },

    decoration = {
        blur = {
            enabled   = true,
            size      = 9,
            passes    = 3,
            vibrancy  = 0.1696,
        }
    },
})

-- hl.window_rule({
--   match = {
--     class = "^Waydroid$"
--   },
--   float = true,
--   size = "440 920",
--   center = true
-- })


hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + Comma", hl.dsp.global("quickshell:wallpaper"))
hl.bind(mainMod .. " + S", hl.dsp.global("quickshell:screenshot"))
hl.bind(mainMod .. " + ESCAPE", hl.dsp.global("quickshell:powerMenu"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp -w 0)\" - | wl-copy"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))

hl.layer_rule({
  match = { namespace = "vicinae" },
  name = "vicinae-blur",
  blur = true,
  ignore_alpha = 0,
})

hl.window_rule({
    match = {
        class = ".*"
    },
    no_blur = true
})

hl.window_rule({
    match = {
        class = ".*[Zz]athura.*"
    },
    no_blur = false
})

hl.layer_rule({
  match = { namespace = "qsdock" },
  name = "dock-blur",
  blur = true,
  ignore_alpha = 0,
})

hl.layer_rule({
  match = { namespace = "wallpaper" },
  name = "wallpaper-blur",
  blur = true,
  ignore_alpha = 0,
})