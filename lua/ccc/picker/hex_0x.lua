local HexPicker = require("ccc.picker.hex")

---@class ccc.ColorPicker.Hex0x: ccc.ColorPicker.Hex
local Hex0xPicker = setmetatable({}, { __index = HexPicker })

-- 0xRRGGBB
-- 0xRRGGBBAA
Hex0xPicker.pattern = {
  [=[\v%(^|[^[:keyword:]])\zs0[xX](\x\x)(\x\x)(\x\x)(\x\x)>]=],
  [=[\v%(^|[^[:keyword:]])\zs0[xX](\x\x)(\x\x)(\x\x)>]=],
}

return Hex0xPicker
