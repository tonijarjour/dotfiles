;;; org.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; Settings for org-mode.

;;; Code:

(custom-set-faces '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.05))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))

(setq org-ellipsis " ›"
      org-hide-emphasis-markers t)

(evil-define-key 'normal 'global (kbd "<leader>ocb") 'org-toggle-checkbox)
(evil-define-key 'normal 'global (kbd "<leader>oil") 'org-insert-link)
(evil-define-key 'normal 'global (kbd "<leader>ool") 'org-open-at-point)

;;; org.el ends here
