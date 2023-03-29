;;; packages.el --- -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(defun tj/install-package (package)
  (unless (package-installed-p package)
  (package-install package)))

(tj/install-package 'all-the-icons)
(tj/install-package 'rainbow-mode)

(tj/install-package 'doom-themes)
(setq doom-themes-enable-bold t
  doom-themes-enable-italic t)
(load-theme 'doom-one t)
(doom-themes-org-config)

(tj/install-package 'doom-modeline)
(custom-set-faces '(mode-line ((t (:family "Noto Sans" :height 1.0))))
  '(mode-line-inactive ((t (:family "Noto Sans" :height 1.0)))))
(doom-modeline-mode 1)

(tj/install-package 'centaur-tabs)
(setq centaur-tabs-set-icons t
  centaur-tabs-set-close-button nil)
(defun centaur-tabs-hide-tab (x)
  (let ((name (format "%s" x))) (or
  (window-dedicated-p (selected-window))
  (string-prefix-p "*Compile-Log" name)
  (string-prefix-p "*dashboard" name)
  (string-prefix-p "*Help" name)
  (string-prefix-p "*help" name)
  (string-prefix-p "*company" name)
  (string-prefix-p "*scratch" name)
  (string-prefix-p "*temp" name)
  )))
(centaur-tabs-mode t)
(centaur-tabs-change-fonts "Noto Sans" 160)

(tj/install-package 'dashboard)
(setq dashboard-center-content t
  dashboard-items '((recents . 12))
  dashboard-banner-logo-title "Dark Wizard"
  dashboard-startup-banner
    "~/Images/Illustrations/small-alice.jpg")
(dashboard-setup-startup-hook)

(tj/install-package 'vertico)
(setq vertico-count 12)
(vertico-mode 1)

(tj/install-package 'marginalia)
(marginalia-mode 1)

(tj/install-package 'orderless)
(setq completion-styles '(orderless basic)
  completion-category-defaults nil
  completion-category-overrides
    '((file (styles partial-completion))))

(tj/install-package 'consult)

(tj/install-package 'corfu)
(custom-set-variables
 '(corfu-auto t))
(global-corfu-mode 1)

(tj/install-package 'evil)
(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)
(setq evil-shift-width 2)
(evil-mode 1)
(evil-set-undo-system 'undo-redo)

(tj/install-package 'evil-collection)
(with-eval-after-load 'evil
  (evil-collection-init))

(provide 'packages)

;;; packages.el ends here
