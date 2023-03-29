;;; early-init.el --- -*- lexical-binding: t -*-

(setq gc-cons-threshold 134217728)
(setq package-enable-at-startup nil)
(setq site-run-file nil)

(tooltip-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(defvar file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

(add-hook 'emacs-startup-hook
  (lambda ()
  (setq file-name-handler-alist file-name-handler-alist-original)
  (makunbound 'file-name-handler-alist-original)))

(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font-15"))

(provide 'early-init)

;;; early-init.el ends here
