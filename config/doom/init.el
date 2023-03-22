;;; init.el -*- lexical-binding: t; -*-

;; NOTE  Remember to run 'doom sync' after modifying this file.

;; Press 'SPC h d h' for Doom's documentation.
;; Press 'K' over a module name to see its documentation.
;; Press 'gd' over a module name to browse its directory.

(doom! :completion
       company             ; the ultimate code completion backend
       vertico             ; the search engine of the future

       :ui
       doom                ; what makes DOOM look the way it does
       doom-dashboard      ; a nifty splash screen for Emacs
       doom-quit           ; DOOM quit-message prompts when you quit Emacs
       hl-todo             ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       modeline            ; snazzy, Atom-inspired modeline, plus API
       ophints             ; highlight the region an operation acts on
       tabs                ; a tab bar for Emacs
       vi-tilde-fringe     ; fringe tildes to mark beyond EOB
       workspaces          ; tab emulation, persistence & separate workspaces
       zen                 ; distraction-free coding or writing
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       (vc-gutter +pretty) ; vcs diff in the fringe
       (emoji +unicode +github +ascii)

       :editor
       file-templates      ; auto-snippets for empty files
       fold                ; (nigh) universal code folding
       snippets            ; my elves. They type so I don't have to
       (evil +everywhere)  ; come to the dark side, we have cookies

       :emacs
       dired               ; making dired pretty [functional]
       electric            ; smarter, keyword-based electric-indent
       undo                ; persistent, smarter undo for your inevitable mistakes
       vc                  ; version-control and Emacs, sitting in a tree
       (ibuffer +icons)    ; interactive buffer management

       :checkers
       grammar             ; tasing grammar mistake every you make
       (syntax +childframe); tasing you for every semicolon you forget
       (spell +flyspell +enchant)

       :tools
       lookup              ; navigate your code and its documentation
       magit               ; a git porcelain for Emacs
       tree-sitter         ; syntax and parsing, sitting in a tree...
       (eval +overlay)     ; run code, run (also, repls)
       (lsp +eglot)        ; M-x vscode
       ;;biblio            ; Writes a PhD for you (citation needed)
       ;;debugger          ; FIXME stepping through code, to help you add bugs
       ;;docker

       :lang
       org               ; organize your plain life in plain text
       markdown          ; writing docs for people to ignore
       emacs-lisp        ; drown in parentheses
       (latex +lsp)      ; writing papers in Emacs has never been so fun
       (rust +lsp +tree-sitter)
       (web +lsp +tree-sitter)
       (javascript +lsp +tree-sitter)

       :config
       (default +bindings +smartparens))
