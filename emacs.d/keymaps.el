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
(evil-define-key 'normal 'global (kbd "C-=") 'text-scale-increase
  (kbd "C--") 'text-scale-decrease
  (kbd "C-0") (lambda () (interactive) (text-scale-set 0)))

;; C-j and C-k traverse 6 lines
(evil-define-motion evil/visual-down-six-lines ()
  (evil-next-visual-line 6))
(evil-define-motion evil/visual-up-six-lines ()
  (evil-previous-visual-line 6))
(evil-define-motion evil/normal-down-six-lines ()
  (evil-next-line 6))
(evil-define-motion evil/normal-up-six-lines ()
  (evil-previous-line 6))

(evil-define-key 'normal 'global (kbd "C-j") 'evil/normal-down-six-lines
  (kbd "C-k") 'evil/normal-up-six-lines)
(evil-define-key 'visual 'global (kbd "C-j") 'evil/visual-down-six-lines
  (kbd "C-k") 'evil/visual-up-six-lines)

;; Corfu. Consult. Tempel. Go to dashboard. Toggle theme.
(evil-define-key 'insert 'global (kbd "\M-SPC") 'corfu-insert-separator)
(evil-define-key 'normal 'global
  (kbd "<leader>ff") 'project-find-file
  (kbd "<leader>fl") 'consult-ripgrep
  (kbd "<leader>fo") 'consult-recent-file
  (kbd "<leader>fj") 'consult-outline
  (kbd "<leader>bs") 'project-switch-to-buffer
  (kbd "<leader>ps") 'project-switch-project
  (kbd "<leader>pq") (lambda () (interactive) (delete-other-windows) (project-kill-buffers t))
  (kbd "<leader>gg") 'dashboard-open

;; Org Mode
  (kbd "<leader>op") 'org-open-at-point

;; Emacs. Open a config file.
  (kbd "<leader>:") 'eval-expression
  (kbd "<leader>x") 'execute-extended-command
  (kbd "<leader>ec") (lambda () (interactive) (tj/find-file-at "~/.fn/emacs.d/"))

  ;; Open/reload a file. Save/kill a buffer.
  (kbd "<leader>e.") 'find-file
  (kbd "<leader>e,") (lambda () (interactive) (tj/find-file-at "~/"))
  (kbd "<leader>er") (lambda () (interactive) (revert-buffer t t))
  (kbd "<leader>es") 'consult-buffer
  (kbd "<leader>en") 'evil-buffer-new
  (kbd "<leader>ew") 'save-buffer
  (kbd "<leader>ek") 'kill-buffer

  ;; Access help documentation. 
  (kbd "<leader>hf") 'describe-function
  (kbd "<leader>hk") 'describe-key
  (kbd "<leader>hv") 'describe-variable
  (kbd "<leader>hm") 'describe-mode

  ;; Kill the help buffer. Kill all star buffers.
  (kbd "<leader>kh") (lambda () (interactive) (kill-buffer "*Help*"))
  (kbd "<leader>ks") (lambda () (interactive) (kill-matching-buffers "\*.*" nil t))

  ;; Traverse windows.
  (kbd "<leader>wq") 'evil-quit
  (kbd "<leader>wv") 'evil-window-vsplit
  (kbd "<leader>wh") 'evil-window-left
  (kbd "<leader>wj") 'evil-window-down
  (kbd "<leader>wk") 'evil-window-up
  (kbd "<leader>wl") 'evil-window-right

  ;; Quit Emacs.
  (kbd "<leader>qQ") 'kill-emacs
  (kbd "<leader>qq") 'evil-quit-all)

;;; keymaps.el ends here
