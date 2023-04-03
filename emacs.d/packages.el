;;; packages.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; Install and configure some nice packages.

;;; Code:

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(defun tj/install-package (package)
  "Install PACKAGE."
  (unless (package-installed-p package)
    (package-install package)))

(tj/install-package 'ef-themes)
(setq ef-themes-to-toggle '(ef-winter ef-cyprus)
  ef-themes-mixed-fonts t
  ef-themes-variable-pitch-ui t)
(load-theme 'ef-winter t)

(tj/install-package 'nano-modeline)
(setq nano-modeline-position 'bottom)
(nano-modeline-mode t)

(tj/install-package 'centaur-tabs)
(setq centaur-tabs-height 40
  centaur-tabs-set-close-button nil
  centaur-tabs-show-new-tab-button nil)
(centaur-tabs-mode t)

(tj/install-package 'dashboard)
(setq dashboard-center-content t
  dashboard-items '((recents . 7))
  dashboard-banner-logo-title "Dark Wizard"
  dashboard-display-icons-p nil
  dashboard-startup-banner
  "~/Images/Illustrations/small-alice.jpg")
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

(tj/install-package 'tempel)
(tj/install-package 'tempel-collection)

(tj/install-package 'org-modern)
(global-org-modern-mode t)
(require 'org-agenda)

(tj/install-package 'markdown-mode)

(tj/install-package 'evil)
(setq evil-want-keybinding nil
  evil-want-C-u-scroll t
  evil-shift-width 2
  evil-undo-system 'undo-redo
  evil-vsplit-window-right t)
(evil-mode t)

(tj/install-package 'evil-collection)
(with-eval-after-load 'evil
  (evil-collection-init))

;;; packages.el ends here
