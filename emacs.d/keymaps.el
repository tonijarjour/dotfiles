;;; keymaps.el --- -*- lexical-binding: t -*-

;; escape to quit a partial command
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

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

(defun tj/open-file-in-directory (initial-path)
  (let ((default-directory (expand-file-name initial-path)))
    (call-interactively #'find-file)))

(evil-define-key '(normal visual) 'global (kbd "\C-u") "12k")
(evil-define-key '(normal visual) 'global (kbd "\C-d") "12j")

(evil-set-leader 'normal (kbd "<SPC>"))

(evil-define-key 'normal 'global (kbd "<leader>:") 'eval-expression)
(evil-define-key 'normal 'global (kbd "<leader>x") 'execute-extended-command)
(evil-define-key 'normal 'global (kbd "<leader>p") 'projectile-commander)

(evil-define-key 'normal 'global (kbd "<leader>hv") 'describe-variable)
(evil-define-key 'normal 'global (kbd "<leader>hf") 'describe-function)
(evil-define-key 'normal 'global (kbd "<leader>hk") 'describe-key)

(evil-define-key 'normal 'global (kbd "<leader>wq") 'evil-quit)
(evil-define-key 'normal 'global (kbd "<leader>wv") 'evil-window-vsplit)
(evil-define-key 'normal 'global (kbd "<leader>wl") 'evil-window-right)
(evil-define-key 'normal 'global (kbd "<leader>wh") 'evil-window-left)
(evil-define-key 'normal 'global (kbd "<leader>wk") 'evil-window-up)
(evil-define-key 'normal 'global (kbd "<leader>wj") 'evil-window-down)
(evil-define-key 'normal 'global (kbd "<leader>wn") 'centaur-tabs-forward)
(evil-define-key 'normal 'global (kbd "<leader>wp") 'centaur-tabs-backward)

(evil-define-key 'normal 'global (kbd "<leader>e.") 'find-file)
(evil-define-key 'normal 'global (kbd "<leader>e,")
  (lambda () (interactive) (tj/open-file-in-directory "~/")))
(evil-define-key 'normal 'global (kbd "<leader>ep")
  (lambda () (interactive) (tj/open-file-in-directory "~/.fn/emacs.d/")))
(evil-define-key 'normal 'global (kbd "<leader>ew") 'save-buffer)
(evil-define-key 'normal 'global (kbd "<leader>ek") 'evil-delete-buffer)

(evil-define-key 'normal 'global (kbd "<leader>qq") 'evil-quit-all)
(evil-define-key 'normal 'global (kbd "<leader>qQ") 'kill-emacs)
