" Name: Metashell vim Colorscheme
" Author: Brandon M. Graves
" URL: http://metashell.net
" Last Edit: 30DEC2015 - Work In Progress
" License: Licensed under GPL v2
" COPYRIGHT (C) 2015, Brandon M. Graves, http://metashell.net
"
" This program is free software: you can redistribute it and/or modify
"    it under the terms of the GNU General Public License as published by
"    the Free Software Foundation, either version 2 of the License, or
"    (at your option) any later version.
"
"    This program is distributed in the hope that it will be useful,
"    but WITHOUT ANY WARRANTY; without even the implied warranty of
"    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"    GNU General Public License for more details.
"
"    You should have received a copy of the GNU General Public License
"    along with this program.  If not, see <http://www.gnu.org/licenses/>.

"-----------------------------------
" Begin configuration:
" --------------------------------

" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "ms-color"
" --------------------
"  Vim Environment
"  -------------------
hi LineNr ctermfg=166 ctermbg=8
hi ModeMsg term=bold cterm=bold ctermfg=50 ctermbg=52
hi StatusLine term=bold,reverse cterm=bold,reverse ctermfg=52 ctermbg=147
hi Cursor ctermfg=88 ctermbg=55 guifg=bg guibg=fg
hi Folded term=standout ctermfg=15 ctermbg=129
hi FoldColumn term=standout ctermfg=4 ctermbg=7 guifg=DarkBlue guibg=Gray80

" ---------------------
" Standard Colors
" --------------------
hi Normal ctermfg=white ctermbg=black guibg=white guifg=Black


" Colors for syntax highlighting
hi Comment term=bold ctermfg=93
hi Constant term=underline ctermfg=21
hi Special term=bold ctermfg=5
hi Identifier term=underline ctermfg=14 guifg=Cyan
hi Statement term=bold ctermfg=14 gui=bold
hi PreProc term=underline ctermfg=125 guifg=Magenta3
hi Type term=underline ctermfg=2 gui=bold guifg=SeaGreen
hi Ignore cterm=bold ctermfg=8 guifg=bg
hi Error term=reverse cterm=bold ctermfg=7 ctermbg=1 gui=bold guifg=White guibg=Red
hi Todo term=standout ctermfg=0 ctermbg=3 guifg=Blue guibg=Yellow

hi String ctermfg=24
hi Number ctermfg=1

" -----------
" WIP
" -----------
hi Visual term=reverse ctermfg=darkblue ctermbg=magenta gui=reverse guifg=Grey80 guibg=fg


" ----------------------
"  PENDING
"  ---------------------
hi SpecialKey term=bold ctermfg=4 guifg=Blue
hi NonText term=bold cterm=bold ctermfg=4 gui=bold guifg=Blue
hi Directory term=bold ctermfg=4 guifg=Blue
hi ErrorMsg term=standout cterm=bold ctermfg=7 ctermbg=1 gui=bold guifg=White guibg=Red
hi IncSearch term=reverse cterm=reverse gui=reverse
hi Search term=reverse ctermbg=3 guibg=Gold2
hi MoreMsg term=bold ctermfg=2 gui=bold guifg=SeaGreen
hi Question term=standout ctermfg=2 gui=bold guifg=SeaGreen
hi StatusLineNC term=reverse cterm=reverse gui=bold guifg=PeachPuff guibg=Gray45
hi VertSplit term=reverse cterm=reverse gui=bold
hi Title term=bold ctermfg=5 gui=bold guifg=DeepPink3

hi VisualNOS term=bold,underline cterm=bold,underline gui=bold,underline
hi WarningMsg term=standout ctermfg=1 gui=bold guifg=Red
hi WildMenu term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow
hi DiffAdd term=bold ctermbg=4 guibg=White
hi DiffChange term=bold ctermbg=5 guibg=#edb5cd
hi DiffDelete term=bold cterm=bold ctermfg=4 ctermbg=6 gui=bold guifg=LightBlue guibg=#f6e8d0
hi DiffText term=reverse cterm=bold ctermbg=1 gui=bold guibg=#ff8060
hi lCursor guifg=bg guibg=fg

