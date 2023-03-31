;;; prelude.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; General configurations that do not rely on packages.

;;; Code:

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
(setq js-indent-level 2)

(setq use-dialog-box nil)
(fset 'yes-or-no-p 'y-or-n-p)

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

(add-to-list 'auto-mode-alist
  '("\\.\\(?:ts\\|tsx\\)\\'" . js-jsx-mode))

(provide 'prelude)

;;; prelude.el ends here
