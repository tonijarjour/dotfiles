; disable default startup buffer
(setq inhibit-startup-message t)

; disable messages buffer
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

; y and n instead of yes and no
(fset 'yes-or-no-p 'y-or-n-p)

; display line and column numbers
(setq column-number-mode t)
(global-display-line-numbers-mode)

; hide needless ui elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

; set default font and size
(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font-15"))

; escape to quit a partial command
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

; use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package doom-themes
  :config
  (load-theme 'doom-one t))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

; M-x all-the-icons-install-fonts
(use-package all-the-icons)

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-set-undo-system 'undo-redo)
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package ivy
  :config
  (setq ivy-initial-inputs-alist nil)
  (ivy-mode 1))

(use-package counsel
  :after ivy
  :config
  (counsel-mode 1))

(use-package ivy-rich
  :after counsel
  :config
  (ivy-rich-mode 1))

(use-package dashboard
  :init
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "Dark Wizard")
  (setq dashboard-startup-banner "~/.emacs.d/alice.jpg")
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents . 10)))
  :config
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text"))))

(use-package company
  :config (global-company-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook
  (typescript-mode . lsp-deferred)
  (rust-mode . lsp-deferred))

(use-package markdown-mode)
(use-package rust-mode)
(use-package typescript-mode
  :mode ("\\.js\\'" "\\.jsx\\'"))

(use-package general
  :config
  (general-evil-setup t))

(general-nmap :keymaps 'override :prefix "SPC"
  "f e"   'counsel-M-x

  "q l"   'save-buffers-kill-terminal
  "q L"   'kill-emacs

  "e l"   'kill-current-buffer
  "e L"   'kill-buffer-and-window

  "e ."   'find-file
  "e w"   'save-buffer

  "e n"   'next-buffer
  "e p"   'previous-buffer)