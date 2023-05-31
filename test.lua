-- Lua logo using Haru

local L = 500

local hpdf = require "hpdf"
local hello = "Hello from Haru " .. hpdf.VERSION_TEXT .. " for " .. _VERSION
print(hello)

-- new doc
local pdf = hpdf.New()
local page = hpdf.AddPage(pdf)
hpdf.Page_SetHeight(page, L)
hpdf.Page_SetWidth(page, L)

-- greeting
local font = hpdf.GetFont(pdf, "Helvetica")
hpdf.Page_SetFontAndSize(page, font, 14)
hpdf.Page_SetRGBFill(page, 0, 0, 0)
hpdf.Page_BeginText(page)
hpdf.Page_TextOut(page, 5, 5, hello)
hpdf.Page_EndText(page)

-- new coords
local scale = L/2/math.sqrt(2)
local shift = L/2
hpdf.Page_Concat(page, scale, 0, 0, scale, shift, shift);

-- planet
hpdf.Page_SetRGBFill(page, 0, 0, 0.5)
hpdf.Page_Circle(page, 0, 0, 1)
hpdf.Page_Fill(page)

-- hole
local r = 1-math.sqrt(2)/2
hpdf.Page_SetRGBFill(page, 1, 1, 1)
hpdf.Page_Circle(page, 1-2*r, 1-2*r, r)
hpdf.Page_Fill(page)

-- moon
hpdf.Page_SetRGBFill(page, 0, 0, 0.5)
hpdf.Page_Circle(page, 1, 1, r)
hpdf.Page_Fill(page)

-- logo
local font = hpdf.GetFont(pdf, "Helvetica")
hpdf.Page_SetFontAndSize(page, font, 0.9)
local text = "Lua"
local w = hpdf.Page_TextWidth(page, text)
hpdf.Page_SetRGBFill(page, 1, 1, 1, 0)
hpdf.Page_BeginText(page)
hpdf.Page_TextOut(page, -w/2, -0.5, text)
hpdf.Page_EndText(page)

-- orbit
local x = (1+r)*math.rad(5)
hpdf.Page_SetRGBStroke(page, 0.5, 0.5, 0.5)
hpdf.Page_SetLineWidth(page, 0.03)
hpdf.Page_SetDash(page, {x}, 2, 0)
hpdf.Page_Arc(page, 0, 0, 1+r, 90-57, 90-32-360)
hpdf.Page_Stroke(page)

-- save doc
local out = "test.pdf"
if hpdf.SaveToFile(pdf, out) ~= 0 then
	error('cannot write to '..out)
end

-- done
hpdf.Free(pdf)
