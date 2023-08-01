" Vim syntax file
" Language:     KCL
" Maintainer:   KusionStack

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'kcl'
endif

syntax match   kclNoise     /\%(:\|,\)/

hi def link kclNoise			Noise

" Module
syn keyword    kclImport      import 

hi def link     kclImport     Include

" String
syn match       kclStringMatch       /"\([^"]\|\\\"\)\+"\ze[[:blank:]\r\n]*[,}\]]/ contains=kclString
syn region      kclString           start=+\z(["']\)+  skip=+\\\%(\z1\|$\)+  end=+\z1+ end=+$+ 

hi def link     kclStringMatch         String
hi def link     kclString              String

" Keyword
syn keyword     kclConditional            if else elif                         
syn keyword     kclFor                    for in
syn keyword     kclOperator               and or
syn keyword     kclBoolean                True False
syn keyword     kclAssert                 assert

hi def link     kclConditional          Conditional
hi def link     kclFor                  Repeat
hi def link     kclOperator             Operator 
hi def link     kclBoolean              Boolean
hi def link     kclAssert               Conditional

" Number
syn match   kclNumber   /\c\<\%(\d\+\%(e[+-]\=\d\+\)\=\|0b[01]\+\|0o\o\+\|0x\%(\x\|_\)\+\)n\=\>/

hi def link     kclNumber             Number

" Escape 
syn match       kclEscapeOctal       contained "\\[0-7]\{3}"   
syn match       kclEscapeC           contained +\\[abfnrtv\\'"]+   
syn match       kclEscapeX           contained "\\x\x\{2}" 
syn match       kclEscapeU           contained "\\u\x\{4}" 
syn match       kclEscapeBigU        contained "\\U\x\{8}" 
syn match       kclEscapeError       contained +\\[^0-7xuUabfnrtv\\'"]+ 

hi def link     kclEscapeOctal       kclSpecialString
hi def link     kclEscapeC           kclSpecialString
hi def link     kclEscapeX           kclSpecialString
hi def link     kclEscapeU           kclSpecialString
hi def link     kclEscapeBigU        kclSpecialString
hi def link     kclSpecialString     Special
hi def link     kclEscapeError       Error

" Comment
syn region  kclComment      start=+#+ end=/$/ contains=kclCommentTodo,@Spell extend keepend

hi def link     kclComment    Comment


" Brace
syn region  kclFold matchgroup=kclBraces start="{" end=/}\(\_s\+\ze\("\|{\)\)\@!/ transparent fold
syn region  kclFold matchgroup=kclBraces start="\[" end=/]\(\_s\+\ze"\)\@!/ transparent fold

hi def link kclBraces		Delimiter

let b:current_syntax = "kcl"
if main_syntax == 'kcl'
  unlet main_syntax
endif