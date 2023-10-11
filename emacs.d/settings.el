;;; settings.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; General configurations that do not rely on packages.

;;; Code:

(setq user-full-name "Toni Jarjour")
(setq user-mail-address "tonijarjour@gmail.com")

(setq custom-file "~/.emacs.d/custom-file.el")
(setq backup-directory-alist '(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq create-lockfiles nil)

(setq mouse-wheel-progressive-speed nil)
(setq scroll-conservatively 101)

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq frame-title-format '("%b · Emacs"))
(setq initial-major-mode 'fundamental-mode)
(setq use-short-answers t)
(setq use-dialog-box nil)
(setq message-log-max nil)
(kill-buffer "*Messages*")

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'variable-pitch-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)
(add-hook 'prog-mode-hook (lambda () (toggle-truncate-lines 1)))
(add-hook 'mhtml-mode-hook (lambda () (variable-pitch-mode -1)))

(recentf-mode 1)
(savehist-mode 1)
(electric-pair-mode 1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(global-prettify-symbols-mode 1)
(set-language-environment "UTF-8")

(set-face-attribute 'fixed-pitch nil :font "Iosevka Nerd Font-15")
(set-face-attribute 'variable-pitch nil :font "Noto Sans-15")

(setq-default fill-column 80)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default indent-line-function 'insert-tab)

(setq browse-url-generic-program (executable-find "/usr/bin/librewolf")
      browse-url-browser-function 'browse-url-generic)

(if (boundp 'after-focus-change-function)
    (add-function :after after-focus-change-function
                  (lambda () (unless (frame-focus-state) (garbage-collect))))
  (add-hook 'after-focus-change-function 'garbage-collect))

;;; settings.el ends here
