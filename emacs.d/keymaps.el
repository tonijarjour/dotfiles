;;; keymaps.el --- -*- lexical-binding: t -*-

(defun tj/find-file-at (initial-path)
  (let ((default-directory (expand-file-name initial-path)))
  (call-interactively #'find-file)))

(global-set-key (kbd "<ESC>") 'keyboard-escape-quit)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(evil-set-leader 'normal (kbd "<SPC>"))

(evil-define-key '(normal visual) 'global (kbd "\C-u") "6k")
(evil-define-key '(normal visual) 'global (kbd "\C-d") "6j")

(evil-define-key 'normal 'global (kbd "<leader>:") 'eval-expression)
(evil-define-key 'normal 'global (kbd "<leader>x") 'execute-extended-command)

(evil-define-key 'normal 'global (kbd "<leader>hv") 'describe-variable)
(evil-define-key 'normal 'global (kbd "<leader>hf") 'describe-function)
(evil-define-key 'normal 'global (kbd "<leader>hk") 'describe-key)

(evil-define-key 'normal 'global (kbd "<leader>wq") 'evil-quit)
(evil-define-key 'normal 'global (kbd "<leader>wv") 'evil-window-vsplit)
(evil-define-key 'normal 'global (kbd "<leader>wl") 'evil-window-right)
(evil-define-key 'normal 'global (kbd "<leader>wh") 'evil-window-left)
(evil-define-key 'normal 'global (kbd "<leader>wk") 'evil-window-up)
(evil-define-key 'normal 'global (kbd "<leader>wj") 'evil-window-down)
(evil-define-key 'normal 'global (kbd "<leader>wn") 'centaur-tabs-forward-tab)
(evil-define-key 'normal 'global (kbd "<leader>wp") 'centaur-tabs-backward-tab)
(evil-define-key 'normal 'global (kbd "<leader>wg")
  '(lambda () (interactive) (switch-to-buffer "*dashboard*")))

(evil-define-key 'normal 'global (kbd "<leader>kh")
  '(lambda () (interactive) (kill-buffer "*Help*")))

(evil-define-key 'normal 'global (kbd "<leader>ps") 'project-switch-project)
(evil-define-key 'normal 'global (kbd "<leader>pq")
  '(lambda () (interactive) (delete-other-windows) (project-kill-buffers t)))

(evil-define-key 'normal 'global (kbd "<leader>fl") 'consult-ripgrep)
(evil-define-key 'normal 'global (kbd "<leader>fo") 'consult-recent-file)
(evil-define-key 'normal 'global (kbd "<leader>ff") 'consult-find)
(evil-define-key 'insert 'global (kbd "\M-SPC") 'corfu-insert-separator)

(evil-define-key 'normal 'global (kbd "<leader>e.") 'find-file)
(evil-define-key 'normal 'global (kbd "<leader>e,")
  (lambda () (interactive) (tj/find-file-at "~/")))
(evil-define-key 'normal 'global (kbd "<leader>el")
  (lambda () (interactive) (tj/find-file-at "~/.fn/emacs.d/")))
(evil-define-key 'normal 'global (kbd "<leader>ew") 'save-buffer)
(evil-define-key 'normal 'global (kbd "<leader>ek") 'kill-this-buffer)

(evil-define-key 'normal 'global (kbd "<leader>qq") 'evil-quit-all)
(evil-define-key 'normal 'global (kbd "<leader>qQ") 'kill-emacs)

(provide 'keymaps)

;;; keymaps.el ends here
