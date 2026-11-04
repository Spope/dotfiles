-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 1
local omarchy_monitor_scale = 1.15

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Desk layout: two AOC monitors on the left, laptop on the right (bottom-aligned).
-- Positions are in scaled pixels: AOC 2560/1.0667 = 2400x1350, laptop 1920/1.2 = 1600x1000.
hl.monitor({ output = "desc:AOC Q2577W AHLHB9A000417", mode = "preferred", position = "0x0", scale = omarchy_monitor_scale })
hl.monitor({ output = "desc:AOC Q2577W AHLJ99A000374", mode = "preferred", position = "2400x0", scale = omarchy_monitor_scale })
hl.monitor({ output = "eDP-1", mode = "preferred", position = "4800x350", scale = omarchy_monitor_scale })

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })

-- Per-monitor workspaces (see bindings.lua): pin each block of 10 to its monitor.
hl.workspace_rule({ workspace = "r[1-10]", monitor = "desc:AOC Q2577W AHLHB9A000417" })
hl.workspace_rule({ workspace = "r[11-20]", monitor = "desc:AOC Q2577W AHLJ99A000374" })
hl.workspace_rule({ workspace = "r[21-30]", monitor = "eDP-1" })
