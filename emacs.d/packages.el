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
(load-theme 'ef-dark t)

(tj/install-package 'nano-modeline)
(setq nano-modeline-position 'bottom)
(nano-modeline-mode)
(custom-set-faces '(nano-modeline-active ((t (:family "Noto Sans" :height 1.0))))
  '(nano-modeline-inactive ((t (:family "Noto Sans" :height 1.0)))))

(tj/install-package 'centaur-tabs)
(setq centaur-tabs-set-close-button nil)
(centaur-tabs-mode t)
(centaur-tabs-change-fonts "Noto Sans" 160)

(tj/install-package 'dashboard)
(setq dashboard-center-content t
  dashboard-items '((recents . 7))
  dashboard-banner-logo-title "Dark Wizard"
  dashboard-display-icons-p nil
  dashboard-startup-banner
  "~/Images/Illustrations/small-alice.jpg")
(dashboard-setup-startup-hook)

(tj/install-package 'flycheck)
(global-flycheck-mode)

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
'(org-block
  org-block-begin-line
  org-block-end-line
  org-code
  org-document-info-keyword
  org-meta-line
  org-table
  org-verbatim
  markdown-code-face
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
