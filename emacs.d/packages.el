;;; packages.el --- -*- lexical-binding: t -*-

;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(setq use-package-expand-minimally t)

(require 'use-package)

(use-package doom-themes
  :config
  (doom-themes-org-config)
  (load-theme 'doom-one t))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

;; M-x all-the-icons-install-fonts
(use-package all-the-icons)

(use-package dashboard
  :init
  (setq dashboard-startup-banner "~/Images/Illustrations/small-alice.jpg")
  (setq dashboard-banner-logo-title "Dark Wizard")
  (setq dashboard-items '((recents . 12)))
  (setq dashboard-center-content t)
  :config
  (dashboard-setup-startup-hook))

(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-count 12))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package projectile
  :config
  (projectile-mode +1)
  (def-projectile-commander-method ?a
    "Search with ripgrep"
    (call-interactively 'projectile-ripgrep)))

(use-package rg)

(use-package centaur-tabs
  :demand
  :init
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-set-close-button nil)
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-change-fonts "Noto Sans" 160)

  (defun centaur-tabs-hide-tab (x)
    (let ((name (format "%s" x))) (or
    (window-dedicated-p (selected-window))
    (string-prefix-p "*Compile-Log" name)
    (string-prefix-p "*dashboard" name)
    (string-prefix-p "*Help" name)
    (string-prefix-p "*help" name)
    (string-prefix-p "*scratch" name)
    (string-prefix-p "*temp" name)
    ))))
