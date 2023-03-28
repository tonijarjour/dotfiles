;;; early-init.el --- -*- lexical-binding: t -*-

;; defer gc
(setq gc-cons-threshold 134217728)

;; package init is handled by init.el
(setq package-enable-at-startup nil)

;; don't load system default init
(setq site-run-file nil)

;; disable needless ui
(tooltip-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; set default font and size
(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font-15"))

;; file name handlers unneeded during startup
(defvar file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

(add-hook 'emacs-startup-hook
  (lambda ()
    (setq file-name-handler-alist file-name-handler-alist-original)
    (makunbound 'file-name-handler-alist-original)))
