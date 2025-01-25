;;; settings.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; General configurations that do not rely on packages.

;;; Code:

(setq
 user-full-name "Toni Jarjour"
 user-mail-address "tonijarjour@posteo.com"

 custom-file "~/.emacs.d/custom-file.el"
 backup-directory-alist '(("." . "~/.saves"))
 backup-by-copying t
 version-control t
 delete-old-versions t
 create-lockfiles nil

 mouse-wheel-progressive-speed nil
 scroll-conservatively 101
 use-dialog-box nil
 use-short-answers t

 inhibit-startup-message t
 initial-scratch-message nil
 initial-major-mode 'fundamental-mode
 frame-title-format '("%b – Emacs")
 visible-bell 1

 browse-url-generic-program (executable-find "/usr/bin/firefox")
 browse-url-browser-function 'browse-url-generic)

(setq message-log-max nil)
(kill-buffer "*Messages*")

(setq-default
 fill-column 80
 tab-width 2
 indent-tabs-mode nil
 indent-line-function 'insert-tab)

(set-face-attribute 'fixed-pitch nil :font "Iosevka Nerd Font-20")
(set-face-attribute 'variable-pitch nil :font "Nimbus Sans-20")

(add-hook 'text-mode-hook 'variable-pitch-mode)
(add-hook 'prog-mode-hook (lambda () (toggle-truncate-lines 1)))
(add-hook 'mhtml-mode-hook (lambda () (variable-pitch-mode -1)))
(add-to-list 'auto-mode-alist '("\\.astro\\'" . mhtml-mode))

(recentf-mode 1)
(savehist-mode 1)
(electric-pair-mode 1)
(electric-indent-mode -1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(global-prettify-symbols-mode 1)
(set-language-environment "UTF-8")

(if (boundp 'after-focus-change-function)
    (add-function :after after-focus-change-function
                  (lambda () (unless (frame-focus-state) (garbage-collect))))
  (add-hook 'after-focus-change-function 'garbage-collect))

;;; settings.el ends here
