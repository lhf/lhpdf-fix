local hpdf = require "hpdf"

local function save_to_file(pdf, script_name)
  script_name = string.gsub(script_name, "%.%w*$", "") .. ".pdf"
  if 0 ~= hpdf.SaveToFile(pdf, script_name) then
    io.stderr:write('Error writing to ', script_name, '\n')
  end
end

local pdf = hpdf.New()
if pdf then
print("Hello from Haru version " ..  hpdf.VERSION_TEXT .. " for " .. _VERSION )
  local page = hpdf.AddPage(pdf)
  local height = hpdf.Page_GetHeight(page)
  local width = hpdf.Page_GetWidth(page)
  local font = hpdf.GetFont(pdf, "Times-Roman")
  hpdf.Page_SetFontAndSize(page, font, 24)
  hpdf.Page_BeginText(page)
  hpdf.Page_TextOut(page, 60, height/2, "Hello from Haru version " ..
    hpdf.VERSION_TEXT .. " for " .. _VERSION )
  hpdf.Page_EndText(page)
  save_to_file(pdf, arg[0])
  hpdf.Free(pdf)
else
  io.write("Error creating PDF object\n")
end -- if

