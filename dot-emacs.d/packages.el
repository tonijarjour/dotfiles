;;; packages.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; Install and configure some nice packages.

;;; Code:

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(defun tj/install-package (package)
  "Install PACKAGE."
  (unless (package-installed-p package)
    (package-install package)))

(setq modus-themes-mixed-fonts t
      modus-themes-variable-pitch-ui t
      modus-themes-italic-constructs t
      modus-themes-bold-constructs t
      modus-themes-headings '((1 1.728) (2 1.44) (3 1.2)))
(load-theme 'modus-vivendi)

;; M-x nerd-icons-install-fonts
(tj/install-package 'doom-modeline)
(doom-modeline-mode t)

(tj/install-package 'dashboard)
(setq dashboard-center-content t
      dashboard-items nil
      dashboard-display-icons-p nil
      dashboard-startup-banner "~/Images/.emacs.png")
(dashboard-setup-startup-hook)

(tj/install-package 'vertico)
(setq vertico-count 12)
(vertico-mode t)

(tj/install-package 'marginalia)
(marginalia-mode t)

(tj/install-package 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-defaults nil
      completion-category-overrides '((file (styles partial-completion))))

(tj/install-package 'consult)
(setq consult-preview-key nil)

(tj/install-package 'corfu)
(setq corfu-auto t)
(global-corfu-mode t)

(tj/install-package 'auctex)
(setq TeX-auto-save t
      TeX-parse-self t)

;;(require 'mu4e)
;;(setq mu4e-change-filenames-when-moving t
;;      mu4e-get-mail-command "mbsync -a"
;;      mu4e-update-interval (* 10 59)
;;      mu4e-drafts-folder "/Drafts"
;;      mu4e-sent-folder "/Sent"
;;      mu4e-trash-folder "/Trash"
;;      mu4e-refile-folder "/Archive"
;;
;;      auth-sources '("~/Other/.authinfo.gpg")
;;      smtpmail-smtp-server "posteo.de"
;;      smtpmail-smtp-service 465
;;      smtpmail-stream-type 'ssl
;;      message-send-mail-function 'smtpmail-send-it)

(tj/install-package 'evil)
(setq evil-want-keybinding nil
      evil-auto-indent nil
      evil-want-C-u-scroll t
      evil-shift-width 2
      evil-undo-system 'undo-redo
      evil-vsplit-window-right t)
(evil-mode t)

(tj/install-package 'evil-collection)
(setq evil-collection-key-blacklist '("SPC"))
(with-eval-after-load 'evil
  (evil-collection-init))

;;; packages.el ends here
