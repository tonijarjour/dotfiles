;;; prelude.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; General configurations that do not rely on packages.

;;; Code:

(setq user-full-name "Toni Jarjour")
(setq user-mail-address "tonijarjour@gmail.com")

(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq custom-file "~/.emacs.d/custom-file.el")

(setq mouse-wheel-progressive-speed nil)
(setq scroll-conservatively 101)
(setq recenter-positions '(middle))

(setq inhibit-startup-message t)
(setq initial-scratch-message "What happens here?")
(setq frame-title-format '("%b · Emacs"))
(setq initial-major-mode 'fundamental-mode)
(setq use-short-answers t)
(setq message-log-max nil)
(kill-buffer "*Messages*")

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'variable-pitch-mode)
(add-hook 'prog-mode-hook 'toggle-truncate-lines)
(add-hook 'prog-mode-hook 'hl-line-mode)

(recentf-mode 1)
(savehist-mode 1)
(electric-pair-mode 1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(global-prettify-symbols-mode 1)

(set-default-coding-systems  'utf-8)
(set-selection-coding-system 'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(prefer-coding-system        'utf-8)

(set-face-attribute 'default nil :font "Iosevka Nerd Font-15")
(set-face-attribute 'fixed-pitch nil :font "Iosevka Nerd Font-15")
(set-face-attribute 'variable-pitch nil :font "Noto Sans-15")

(setq-default fill-column 80)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default indent-line-function 'insert-tab)

(setq browse-url-generic-program
  (executable-find "/usr/bin/librewolf")
    browse-url-browser-function 'browse-url-generic)

(setq treesit-language-source-alist '(
  (bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
  (markdown . ("https://github.com/tree-sitter/tree-sitter-markdown"))
  (html . ("https://github.com/tree-sitter/tree-sitter-html"))
  (css . ("https://github.com/tree-sitter/tree-sitter-css"))
  (json . ("https://github.com/tree-sitter/tree-sitter-json/"))
  (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
  (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "typescript/src"))
  (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "tsx/src"))
  (rust . ("https://github.com/tree-sitter/tree-sitter-rust/"))
  (toml . ("https://github.com/tree-sitter/tree-sitter-toml/"))
))

;;; prelude.el ends here
