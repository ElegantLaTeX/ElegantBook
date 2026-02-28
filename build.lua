--[==========================================[--
   L3BUILD FILE FOR ELEGANTBOOK
     Check PDF File & Directory After Build
--]==========================================]--

--[==========================================[--
                Basic Information
             Do Check Before Upload
--]==========================================]--
module           = "elegantbook"
version          = "2.60"
maintainer       = "Ran Wang"
uploader         = maintainer
maintainid       = "ElegantLaTeX"
email            = "ranwang.osbert@outlook.com"
repository       = "https://github.com/" .. maintainid .. "/" .. module
announcement     = ""
note             = ""
summary          = "Elegant LaTeX Template for Books"
description      = [[
ElegantBook is designed for writing Books. This template is based on
the standard LaTeX book class. The goal of this template is
to make the writing process more elegant.
]]

--[==========================================[--
         Build, Pack and Upload To CTAN
         Do not Modify Unless Necessary
--]==========================================]--
ctanzip          = module
excludefiles     = {"*~"}
textfiles        = {"*.md", "LICENSE", "*.lua", "*.cls", "*.bib"}
typesetfiles     = {module .. "-cn.tex", module .. "-en.tex"}
typesetsuppfiles = {"*.cls", "*.bib"}
imagesuppdir     = "image"
figuresuppdir    = "figure"

uploadconfig = {
  pkg          = module,
  version      = version,
  author       = maintainer,
  uploader     = uploader,
  email        = email,
  summary      = summary,
  description  = description,
  announcement = announcement,
  note         = note,
  license      = "lppl1.3c",
  ctanPath     = "/macros/latex/contrib/" .. module .. "/",
  home         = repository,
  support      = repository .. "/issues",
  bugtracker   = repository .. "/issues",
  repository   = repository,
  development  = "https://github.com/" .. maintainid,
  update       = true
}

-- cn uses XeLaTeX, en uses pdfLaTeX
function typeset(file, dir, exe)
  dir = dir or typesetdir
  local cmd
  if string.match(file, "%-cn%.tex$") then
    cmd = "latexmk -pdfxe -interaction=nonstopmode "
  else
    cmd = "latexmk -pdf -interaction=nonstopmode "
  end
  return run(dir, cmd .. file)
end

-- Copy required files into the typeset build dir
function docinit_hook()
  -- Copy .cls, .bib support files
  for _, glob in pairs(typesetsuppfiles) do
    cp(glob, currentdir, typesetdir)
  end
  -- Copy image subdirectory
  for _, subdir in pairs({imagesuppdir, figuresuppdir}) do
    local dest = typesetdir .. "/" .. subdir
    mkdir(dest)
    cp("*", subdir, dest)
  end
  -- Copy tex source files
  for _, texfile in pairs(typesetfiles) do
    cp(texfile, currentdir, typesetdir)
  end
  return 0
end

-- Pack CTAN directory: cls, bib, tex sources, PDFs, and asset subdirs
function copyctan()
  local pkgdir = ctandir .. "/" .. ctanpkg
  mkdir(pkgdir)
  for _, glob in pairs(typesetsuppfiles) do
    cp(glob, currentdir, pkgdir)
  end
  for _, texfile in pairs(typesetfiles) do
    cp(texfile, currentdir, pkgdir)
  end
  for _, glob in pairs(pdffiles or {"*.pdf"}) do
    cp(glob, typesetdir, pkgdir)
  end
  for _, subdir in pairs({imagesuppdir, figuresuppdir}) do
    local dest = pkgdir .. "/" .. subdir
    mkdir(dest)
    cp("*", subdir, dest)
  end
end
