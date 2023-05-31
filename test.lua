local RESOLUTION = 500
local hpdf = require "hpdf"
--local hpdf = require("trace")(hpdf)
local hello = "Hello from Haru " .. hpdf.VERSION_TEXT .. " for " .. _VERSION
print(hello)

local pdf = hpdf.New()
local page = hpdf.AddPage(pdf)
hpdf.Page_SetHeight(page, RESOLUTION)
hpdf.Page_SetWidth(page, RESOLUTION)

local font = hpdf.GetFont(pdf, "Times-Roman")
font = hpdf.GetFont(pdf, "Helvetica")
hpdf.Page_SetFontAndSize(page, font, 14)
hpdf.Page_BeginText(page)
hpdf.Page_TextOut(page, 5, 5, hello)
hpdf.Page_EndText(page)

local scale = RESOLUTION/2/math.sqrt(2)
local shift = RESOLUTION/2
hpdf.Page_Concat(page, scale, 0, 0, scale, shift, shift);
hpdf.Page_SetRGBFill(page, 0, 0, 0.5)
hpdf.Page_Circle(page, 0, 0, 1)
hpdf.Page_Fill(page)

local r = 1-math.sqrt(2)/2
hpdf.Page_SetRGBFill(page, 1, 1, 1)
hpdf.Page_Circle(page, 1-2*r, 1-2*r, r)
hpdf.Page_Fill(page)

hpdf.Page_SetRGBFill(page, 0, 0, 0.5)
hpdf.Page_Circle(page, 1, 1, r)
hpdf.Page_Fill(page)

local font = hpdf.GetFont(pdf, "Helvetica")
hpdf.Page_SetFontAndSize(page, font, 0.9)
hpdf.Page_BeginText(page)
local x = hpdf.Page_TextWidth(page, "Lua")
hpdf.Page_SetRGBFill(page, 1, 1, 1, 0)
hpdf.Page_TextOut(page, -x/2, -0.5, "Lua")
hpdf.Page_EndText(page)

hpdf.Page_SetRGBStroke(page, 0.5, 0.5, 0.5)
hpdf.Page_SetLineWidth(page, 0.03)
local x = (1+r)*math.rad(5)
hpdf.Page_SetDash(page,{x,x},2,0)
hpdf.Page_Arc(page, 0, 0, 1+r, 90-57, 90-(360+32))
hpdf.Page_Stroke(page)

local out = "test.pdf"
if hpdf.SaveToFile(pdf, out) ~=0 then
	error('cannot write to '.. out)
end

hpdf.Free(pdf)
