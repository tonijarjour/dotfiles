;;; packages.el --- -*- lexical-binding: t; eval: (flycheck-mode -1) -*-

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
(custom-set-variables '(ef-themes-mixed-fonts t)
  '(ef-themes-variable-pitch-ui t))
(load-theme 'ef-winter t)

(tj/install-package 'nano-modeline)
(custom-set-variables '(nano-modeline-position 'bottom)
  '(nano-modeline-mode t))

(tj/install-package 'centaur-tabs)
(custom-set-variables '(centaur-tabs-set-close-button nil)
  '(centaur-tabs-mode t))

(tj/install-package 'dashboard)
(custom-set-variables
  '(dashboard-center-content t)
  '(dashboard-items '((recents . 7)))
  '(dashboard-banner-logo-title "Dark Wizard")
  '(dashboard-display-icons-p nil)
  '(dashboard-startup-banner
  "~/Images/Illustrations/small-alice.jpg"))
(dashboard-setup-startup-hook)

(tj/install-package 'flycheck)
(custom-set-variables '(global-flycheck-mode t))

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

(tj/install-package 'org-modern)
(global-org-modern-mode)

(tj/install-package 'markdown-mode)
(require 'markdown-mode)

(dolist (face
'(markdown-code-face
  markdown-html-attr-name-face
  markdown-html-attr-value-face
  markdown-html-entity-face
  markdown-html-tag-delimiter-face
  markdown-html-tag-name-face
  markdown-inline-code-face
  markdown-language-info-face
  markdown-language-keyword-face
  markdown-pre-face
  markdown-table-face))
  (set-face-attribute face nil :inherit 'fixed-pitch))

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
