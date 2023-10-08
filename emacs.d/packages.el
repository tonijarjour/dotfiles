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

(tj/install-package 'ef-themes)
(setq ef-themes-mixed-fonts t
      ef-themes-variable-pitch-ui t
      ef-themes-headings '((1 1.728)
                           (2 1.44)
                           (3 1.2)))
(load-theme 'ef-symbiosis t)

;; M-x nerd-icons-install-fonts
(tj/install-package 'doom-modeline)
(doom-modeline-mode t)

(tj/install-package 'centaur-tabs)
(setq centaur-tabs-height 40
      centaur-tabs-set-close-button nil
      centaur-tabs-show-new-tab-button nil)
(centaur-tabs-mode t)

(tj/install-package 'dashboard)
(setq dashboard-center-content t
      dashboard-items nil
      dashboard-display-icons-p nil
      dashboard-startup-banner
      "~/Images/Illustrations/small-emacs-girl.jpg")
(dashboard-setup-startup-hook)

(tj/install-package 'vertico)
(setq vertico-count 12)
(vertico-mode t)

(tj/install-package 'marginalia)
(marginalia-mode t)

(tj/install-package 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-defaults nil
      completion-category-overrides
      '((file (styles partial-completion))))

(tj/install-package 'consult)
(setq consult-preview-key nil)

(tj/install-package 'corfu)
(setq corfu-auto t)
(global-corfu-mode t)

(tj/install-package 'markdown-mode)

(tj/install-package 'evil)
(setq evil-want-keybinding nil
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
