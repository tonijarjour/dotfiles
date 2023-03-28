;;; packages.el --- -*- lexical-binding: t -*-


;; display line and column numbers
(global-display-line-numbers-mode 1)
(column-number-mode 1)

;; highlight current line
(global-hl-line-mode 1)

(global-prettify-symbols-mode 1)
(defun add-pretty-lambda ()
  (setq prettify-symbols-alist
        '(("lambda" . 955)
          ("delta" . 120517)
          ("epsilon" . 120518)
          ("->" . 8594)
          ("<=" . 8804)
          (">=" . 8805))))
(add-hook 'prog-mode-hook 'add-pretty-lambda)
(add-hook 'org-mode-hook 'add-pretty-lambda)

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
  :init
  (custom-set-faces
  '(mode-line ((t (:family "Noto Sans" :height 1.0))))
  '(mode-line-inactive ((t (:family "Noto Sans" :height 1.0)))))
  (doom-modeline-mode 1))

(use-package rainbow-mode
  :hook (prog-mode org-mode text-mode))

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

(use-package savehist
  :init
  (savehist-mode))

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

(use-package consult)

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
