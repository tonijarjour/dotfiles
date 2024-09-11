;;; keymaps.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; Personal keymaps for a comfortable experience.

;;; Code:

(defun tj/find-file-at (initial-path)
  "Choose a file at INITIAL-PATH."
  (let ((default-directory (expand-file-name initial-path)))
    (call-interactively #'find-file)))

(evil-set-leader '(normal visual) (kbd "SPC"))

(evil-define-motion evil/visual-down-six-lines ()
  (evil-next-visual-line 6))
(evil-define-motion evil/visual-up-six-lines ()
  (evil-previous-visual-line 6))
(evil-define-motion evil/normal-down-six-lines ()
  (evil-next-line 6))
(evil-define-motion evil/normal-up-six-lines ()
  (evil-previous-line 6))

(evil-define-key 'visual 'global
  (kbd "C-n")'evil/visual-down-six-lines
  (kbd "C-e") 'evil/visual-up-six-lines)
(evil-define-key 'normal 'global
  (kbd "C-n") 'evil/normal-down-six-lines
  (kbd "C-e") 'evil/normal-up-six-lines
  (kbd "C-f") 'evil-scroll-line-down
  (kbd "C-=") 'text-scale-increase
  (kbd "C--") 'text-scale-decrease
  (kbd "C-0") (lambda () (interactive) (text-scale-set 0))
  (kbd "<leader>:") 'eval-expression
  (kbd "<leader>x") 'execute-extended-command
  (kbd "<leader>gg") 'dashboard-open
  (kbd "<leader>mu") 'mu4e
  (kbd "<leader>wq") 'evil-quit
  (kbd "<leader>wv") 'evil-window-vsplit
  (kbd "<leader>wh") 'evil-window-left
  (kbd "<leader>wl") 'evil-window-right
  (kbd "<leader>wn") 'evil-window-down
  (kbd "<leader>we") 'evil-window-up
  (kbd "<leader>qq") 'evil-quit-all
  (kbd "<leader>qQ") 'kill-emacs
  (kbd "<leader>pq") (lambda () (interactive) (delete-other-windows) (project-kill-buffers t))
  (kbd "<leader>ps") 'project-switch-project
  (kbd "<leader>es") 'project-switch-to-buffer
  (kbd "<leader>bs") 'consult-buffer
  (kbd "<leader>en") 'evil-buffer-new
  (kbd "<leader>ew") 'save-buffer
  (kbd "<leader>ek") 'kill-buffer
  (kbd "<leader>er") (lambda () (interactive) (revert-buffer t t))
  (kbd "<leader>eo") 'consult-recent-file
  (kbd "<leader>ef") 'project-find-file
  (kbd "<leader>e.") 'find-file
  (kbd "<leader>e,") (lambda () (interactive) (tj/find-file-at "~/"))
  (kbd "<leader>ec") (lambda () (interactive) (tj/find-file-at "~/.fn/dot-emacs.d/"))
  (kbd "<leader>kh") (lambda () (interactive) (kill-buffer "*Help*"))
  (kbd "<leader>ks") (lambda () (interactive) (kill-matching-buffers "\*.*" nil t))
  (kbd "<leader>hf") 'describe-function
  (kbd "<leader>hk") 'describe-key
  (kbd "<leader>hv") 'describe-variable
  (kbd "<leader>hm") 'describe-mode)

;;; keymaps.el ends here
