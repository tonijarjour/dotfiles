;;; org.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; General configurations that do not rely on packages.

;;; Code:

(custom-set-faces '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.05))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))

(setq org-directory "~/Projects/org"
  org-agenda-files '("~/Projects/org/agenda")
  org-ellipsis " ›"
  org-hide-emphasis-markers t
  org-tags-column 1)

(require 'org-agenda)

(define-key org-agenda-mode-map (kbd "j") 'org-agenda-next-item)
(define-key org-agenda-mode-map (kbd "k") 'org-agenda-previous-item)
(define-key org-agenda-mode-map (kbd "d") 'org-agenda-goto-date)

(evil-define-key 'normal 'global (kbd "<leader>otl") 'org-agenda-list)
(evil-define-key 'normal 'global (kbd "<leader>ocb") 'org-toggle-checkbox)
(evil-define-key 'normal 'global (kbd "<leader>oop") 'org-open-at-point)

;;; org.el ends here
