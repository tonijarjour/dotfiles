;;; early-init.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; Early configurations to disable GUI elements, set a default font,
;; and increase startup speed.

;;; Code:

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font-15"))

(setq gc-cons-threshold 134217728)
(add-hook 'emacs-startup-hook
  (lambda () (if (boundp 'after-focus-change-function)
            (add-function :after after-focus-change-function
                          (lambda () (unless (frame-focus-state) (garbage-collect))))
          (add-hook 'after-focus-change-function 'garbage-collect))))

;;; early-init.el ends here
