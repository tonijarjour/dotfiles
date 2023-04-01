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

(setq inhibit-startup-message t)
(setq frame-title-format '("%b · Emacs"))
(setq use-short-answers t)
(setq message-log-max nil)
(kill-buffer "*Messages*")

(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system       'utf-8)

(set-face-attribute 'default nil :font "Iosevka Nerd Font-15")
(set-face-attribute 'fixed-pitch nil :font "Iosevka Nerd Font-15")
(set-face-attribute 'variable-pitch nil :font "Noto Sans-15")

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'variable-pitch-mode)
(add-hook 'prog-mode-hook 'toggle-truncate-lines)

(savehist-mode 1)
(electric-pair-mode 1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(global-prettify-symbols-mode 1)

(setq browse-url-generic-program
  (executable-find "/usr/bin/librewolf")
    browse-url-browser-function 'browse-url-generic)

;;; prelude.el ends here
