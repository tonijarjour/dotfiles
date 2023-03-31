;;; early-init.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; Early configurations to disable GUI elements, set a default font,
;; and speed up Emacs.

;;; Code:

(setq gc-cons-threshold 134217728)
(setq package-enable-at-startup nil)
(setq site-run-file nil)

(defvar file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

(add-hook 'emacs-startup-hook
  (lambda () (setq file-name-handler-alist file-name-handler-alist-original)
    (makunbound 'file-name-handler-alist-original)
    (if (boundp 'after-focus-change-function)
      (add-function :after after-focus-change-function
	(lambda () (unless (frame-focus-state) (garbage-collect))))
      (add-hook 'after-focus-change-function 'garbage-collect))))

(tooltip-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font-15"))

(provide 'early-init)

;;; early-init.el ends here
