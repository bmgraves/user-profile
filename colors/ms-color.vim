" Name: Metashell vim Colorscheme
" Author: Brandon M. Graves
" URL: http://metashell.net
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

" First some initial cleanup and configurations. Default color set will be under dark background settings.
set background=light

" As we load t his color scheme we want vim to clear out existing highlighting settings.
hi clear
if exists("syntax_on")
  syntax reset
endif

" Name of the color scheme
let g:colors_name = 'ms-color'

" --------------------------------------

hi Normal ctermfg=white ctermbg=black
hi Comment cterm=bold ctermfg=DarkGreen ctermbg=black
