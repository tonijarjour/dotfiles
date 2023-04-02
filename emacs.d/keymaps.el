;;; keymaps.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; Personal keymaps for a comfortable experience.

;;; Code:

(defun tj/find-file-at (initial-path)
  "Choose a file at INITIAL-PATH."
  (let ((default-directory (expand-file-name initial-path)))
    (call-interactively #'find-file)))

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") (lambda () (interactive) (text-scale-set 0)))

(define-key org-agenda-mode-map (kbd "j") 'org-agenda-next-item)
(define-key org-agenda-mode-map (kbd "k") 'org-agenda-previous-item)

(evil-set-leader '(normal visual) (kbd "<SPC>"))

(evil-define-key '(normal visual) 'global (kbd "\C-u") "6k")
(evil-define-key '(normal visual) 'global (kbd "\C-d") "6j")

(evil-define-key 'normal 'global (kbd "<leader>:") 'eval-expression)
(evil-define-key 'normal 'global (kbd "<leader>x") 'execute-extended-command)

;; Orderless Corfu. Toggle Themes. Tempel.
(evil-define-key 'insert 'global (kbd "\M-SPC") 'corfu-insert-separator)
(evil-define-key 'normal 'global (kbd "<leader>tt") 'ef-themes-toggle)
(evil-define-key 'normal 'global (kbd "<leader>lx") 'tempel-complete)
(evil-define-key 'normal 'global (kbd "<leader>li") 'tempel-insert)

;; Search for a file. Search and jump to a location.
(evil-define-key 'normal 'global (kbd "<leader>ff") 'project-find-file)
(evil-define-key 'normal 'global (kbd "<leader>fl") 'consult-ripgrep)
(evil-define-key 'normal 'global (kbd "<leader>fo") 'consult-recent-file)
(evil-define-key 'normal 'global (kbd "<leader>fj") 'consult-outline)

;; Go to buffer/project. Close project. Go to the dashboard.
(evil-define-key 'normal 'global (kbd "<leader>bs") 'consult-buffer)
(evil-define-key 'normal 'global (kbd "<leader>ps") 'project-switch-project)
(evil-define-key 'normal 'global (kbd "<leader>pq")
  (lambda () (interactive) (delete-other-windows) (project-kill-buffers t)))
(evil-define-key 'normal 'global (kbd "<leader>gg")
  (lambda () (interactive) (switch-to-buffer "*dashboard*")))

;; Save or kill a buffer.
(evil-define-key 'normal 'global (kbd "<leader>ew") 'save-buffer)
(evil-define-key 'normal 'global (kbd "<leader>ek") 'kill-this-buffer)

;; Open/reload a file. Open an Emacs configuration file.
(evil-define-key 'normal 'global (kbd "<leader>e.") 'find-file)
(evil-define-key 'normal 'global (kbd "<leader>e,")
  (lambda () (interactive) (tj/find-file-at "~/")))
(evil-define-key 'normal 'global (kbd "<leader>er") 
  (lambda () (interactive) (revert-buffer t t)))
(evil-define-key 'normal 'global (kbd "<leader>el")
  (lambda () (interactive) (tj/find-file-at "~/.fn/emacs.d/")))

;; Access help documentation. Kill the help buffer.
(evil-define-key 'normal 'global (kbd "<leader>hf") 'describe-function)
(evil-define-key 'normal 'global (kbd "<leader>hk") 'describe-key)
(evil-define-key 'normal 'global (kbd "<leader>hv") 'describe-variable)
(evil-define-key 'normal 'global (kbd "<leader>kh")
  (lambda () (interactive) (kill-buffer "*Help*")))

;; Traverse windows and buffers.
(evil-define-key 'normal 'global (kbd "<leader>wq") 'evil-quit)
(evil-define-key 'normal 'global (kbd "<leader>wv") 'evil-window-vsplit)
(evil-define-key 'normal 'global (kbd "<leader>wh") 'evil-window-left)
(evil-define-key 'normal 'global (kbd "<leader>wj") 'evil-window-down)
(evil-define-key 'normal 'global (kbd "<leader>wk") 'evil-window-up)
(evil-define-key 'normal 'global (kbd "<leader>wl") 'evil-window-right)
(evil-define-key 'normal 'global (kbd "<leader>wn") 'centaur-tabs-forward-tab)
(evil-define-key 'normal 'global (kbd "<leader>wp") 'centaur-tabs-backward-tab)

;; Org Mode
(evil-define-key 'normal 'global (kbd "<leader>otl") 'org-agenda-list)

;; Quit Emacs.
(evil-define-key 'normal 'global (kbd "<leader>qQ") 'kill-emacs)
(evil-define-key 'normal 'global (kbd "<leader>qq") 'evil-quit-all)

;;; keymaps.el ends here
