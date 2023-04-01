;;; prelude.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; General configurations that do not rely on packages.

;;; Code:

(setq user-full-name "Toni Jarjour")
(setq user-mail-address "tonijarjour@gmail.com")

(setq inhibit-startup-message t)
(setq message-log-max nil)
(kill-buffer "*Messages*")

(setq frame-title-format '("%b · Emacs"))
(setq use-short-answers t)

(setq mouse-wheel-progressive-speed nil)
(setq scroll-conservatively 101)

(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq custom-file "~/.emacs.d/custom-file.el")

(setq js-indent-level 2)
(add-to-list 'auto-mode-alist
  '("\\.ts\\'" . js-mode))
(add-to-list 'auto-mode-alist
  '("\\.tsx\\'" . js-jsx-mode))

(setq browse-url-generic-program
  (executable-find "/usr/bin/librewolf")
    browse-url-browser-function 'browse-url-generic)

(set-face-attribute 'default nil :font "Iosevka Nerd Font-15")
(set-face-attribute 'fixed-pitch nil :font "Iosevka Nerd Font-15")
(set-face-attribute 'variable-pitch nil :font "Noto Sans-15")

(custom-set-faces '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.05))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))

(setq org-ellipsis " ›"
      org-hide-emphasis-markers t)

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'variable-pitch-mode)
(add-hook 'prog-mode-hook 'toggle-truncate-lines)

(savehist-mode 1)
(electric-pair-mode 1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(global-prettify-symbols-mode 1)

(provide 'prelude)

;;; prelude.el ends here
