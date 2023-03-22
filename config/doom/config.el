;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Toni Jarjour"
      user-mail-address "")

;; - 'doom-big-font' -- used for 'doom-big-font-mode'
;; - 'doom-unicode-font'
(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 20)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 20)
      doom-serif-font (font-spec :family "Noto Serif" :size 20))

(setq doom-theme 'doom-one)

;; 't' | 'relative'.
(setq display-line-numbers-type t)

(setq org-directory "~/Projects/org/")
