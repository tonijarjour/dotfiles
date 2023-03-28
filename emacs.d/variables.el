;;; variables.el --- -*- lexical-binding: t -*-

(setq user-full-name "Toni Jarjour")
(setq user-mail-address "tonijarjour@gmail.com")

;; disable default startup buffer
(setq inhibit-startup-message t)

;; disable messages buffer
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; cursor always at edge after scroll
(setq scroll-conservatively 101)

;; no mouse scroll acceleration
(setq mouse-wheel-progressive-speed nil)

;; no making backup/lock files
(setq-default make-backup-files nil)
(setq-default create-lockfiles nil)

;; y and n instead of yes and no, no mouse menu
(fset 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)
