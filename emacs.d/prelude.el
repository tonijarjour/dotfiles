;;; prelude.el --- -*- lexical-binding: t -*-

(setq user-full-name "Toni Jarjour")
(setq user-mail-address "tonijarjour@gmail.com")

(setq inhibit-startup-message t)
(setq message-log-max nil)
(kill-buffer "*Messages*")

(setq mouse-wheel-progressive-speed nil)
(setq scroll-conservatively 101)

(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq custom-file "~/.emacs.d/custom-file.el")

(setq use-dialog-box nil)
(fset 'yes-or-no-p 'y-or-n-p)

(savehist-mode 1)
(electric-pair-mode 1)
(column-number-mode 1)
(global-hl-line-mode 1)
(global-prettify-symbols-mode 1)
(global-display-line-numbers-mode 1)

(provide 'prelude)

;;; prelude.el ends here
