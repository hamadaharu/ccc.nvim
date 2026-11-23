local utils = require("ccc.utils")
local convert = require("ccc.utils.convert")

local pattern = {
  uppercase = {
    "0x%02X%02X%02X%02X",
    "0x%02X%02X%02X",
  },
  lowercase = {
    "0x%02x%02x%02x%02x",
    "0x%02x%02x%02x",
  },
}

---@class ccc.ColorOutput
local Hex0xOutput = {
  name = "HEX0x",
  pattern = pattern.lowercase,
}

---@param opt { uppercase?: boolean }
function Hex0xOutput.setup(opt)
  if opt.uppercase then
    Hex0xOutput.pattern = pattern.uppercase
  else
    Hex0xOutput.pattern = pattern.lowercase
  end
end

function Hex0xOutput.str(RGB, A)
  local R, G, B = convert.rgb_format(RGB)
  if A then
    A = utils.round(A * 255)
    return Hex0xOutput.pattern[1]:format(R, G, B, A)
  else
    return Hex0xOutput.pattern[2]:format(R, G, B)
  end
end

return Hex0xOutput
