;;; keymaps.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; Personal keymaps for a comfortable experience.

;;; Code:

(defun tj/find-file-at (initial-path)
  "Choose a file at INITIAL-PATH."
  (let ((default-directory (expand-file-name initial-path)))
    (call-interactively #'find-file)))

(evil-set-leader '(normal visual) (kbd "SPC"))

;; increase/decrease text size
(evil-define-key 'normal 'global (kbd "C-=") 'text-scale-increase)
(evil-define-key 'normal 'global (kbd "C--") 'text-scale-decrease)
(evil-define-key 'normal 'global (kbd "C-0") (lambda () (interactive) (text-scale-set 0)))

;; C-j and C-k traverse 6 lines
(evil-define-motion evil/visual-down-six-lines ()
  (evil-next-visual-line 6))
(evil-define-motion evil/visual-up-six-lines ()
  (evil-previous-visual-line 6))
(evil-define-motion evil/normal-down-six-lines ()
  (evil-next-line 6))
(evil-define-motion evil/normal-up-six-lines ()
  (evil-previous-line 6))

(evil-define-key 'normal 'global (kbd "C-j") 'evil/normal-down-six-lines)
(evil-define-key 'normal 'global (kbd "C-k") 'evil/normal-up-six-lines)
(evil-define-key 'visual 'global (kbd "C-j") 'evil/visual-down-six-lines)
(evil-define-key 'visual 'global (kbd "C-k") 'evil/visual-up-six-lines)

;; Corfu. Consult. Tempel. Go to dashboard. Toggle theme.
(evil-define-key 'insert 'global (kbd "\M-SPC") 'corfu-insert-separator)
(evil-define-key 'normal 'global (kbd "<leader>ff") 'project-find-file)
(evil-define-key 'normal 'global (kbd "<leader>fl") 'consult-ripgrep)
(evil-define-key 'normal 'global (kbd "<leader>fo") 'consult-recent-file)
(evil-define-key 'normal 'global (kbd "<leader>fj") 'consult-outline)
(evil-define-key 'normal 'global (kbd "<leader>bs") 'project-switch-to-buffer)
(evil-define-key 'normal 'global (kbd "<leader>ps") 'project-switch-project)
(evil-define-key 'normal 'global (kbd "<leader>pq")
  (lambda () (interactive) (delete-other-windows) (project-kill-buffers t)))
(evil-define-key 'normal 'global (kbd "<leader>gg") 'dashboard-open)

;; Org Mode
(evil-define-key 'normal 'global (kbd "<leader>op") 'org-open-at-point)

;; Emacs. Open a config file.
(evil-define-key 'normal 'global (kbd "<leader>:") 'eval-expression)
(evil-define-key 'normal 'global (kbd "<leader>x") 'execute-extended-command)
(evil-define-key 'normal 'global (kbd "<leader>ec")
  (lambda () (interactive) (tj/find-file-at "~/.fn/emacs.d/")))

;; Open/reload a file. Save/kill a buffer.
(evil-define-key 'normal 'global (kbd "<leader>e.") 'find-file)
(evil-define-key 'normal 'global (kbd "<leader>e,")
  (lambda () (interactive) (tj/find-file-at "~/")))
(evil-define-key 'normal 'global (kbd "<leader>er") 
  (lambda () (interactive) (revert-buffer t t)))
(evil-define-key 'normal 'global (kbd "<leader>es") 'consult-buffer)
(evil-define-key 'normal 'global (kbd "<leader>en") 'evil-buffer-new)
(evil-define-key 'normal 'global (kbd "<leader>ew") 'save-buffer)
(evil-define-key 'normal 'global (kbd "<leader>ek") 'kill-buffer)

;; Access help documentation. 
(evil-define-key 'normal 'global (kbd "<leader>hf") 'describe-function)
(evil-define-key 'normal 'global (kbd "<leader>hk") 'describe-key)
(evil-define-key 'normal 'global (kbd "<leader>hv") 'describe-variable)
(evil-define-key 'normal 'global (kbd "<leader>hm") 'describe-mode)

;; Kill the help buffer. Kill all star buffers.
(evil-define-key 'normal 'global (kbd "<leader>kh")
  (lambda () (interactive) (kill-buffer "*Help*")))
(evil-define-key 'normal 'global (kbd "<leader>ks")
  (lambda () (interactive) (kill-matching-buffers "\*.*" nil t)))

;; Traverse windows.
(evil-define-key 'normal 'global (kbd "<leader>wq") 'evil-quit)
(evil-define-key 'normal 'global (kbd "<leader>wv") 'evil-window-vsplit)
(evil-define-key 'normal 'global (kbd "<leader>wh") 'evil-window-left)
(evil-define-key 'normal 'global (kbd "<leader>wj") 'evil-window-down)
(evil-define-key 'normal 'global (kbd "<leader>wk") 'evil-window-up)
(evil-define-key 'normal 'global (kbd "<leader>wl") 'evil-window-right)

;; Quit Emacs.
(evil-define-key 'normal 'global (kbd "<leader>qQ") 'kill-emacs)
(evil-define-key 'normal 'global (kbd "<leader>qq") 'evil-quit-all)

;;; keymaps.el ends here
