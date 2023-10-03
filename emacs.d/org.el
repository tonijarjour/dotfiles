;;; org.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; General configurations that do not rely on packages.

;;; Code:

(custom-set-faces '(org-level-1 ((t (:inherit outline-1 :height 2.074))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.728))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.44))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.2))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))

(setq org-directory "~/Projects/org"
  org-ellipsis " ›"
  org-hide-emphasis-markers t
  org-tags-column 1)

(evil-define-key 'normal 'global (kbd "<leader>oop") 'org-open-at-point)

;;; org.el ends here
