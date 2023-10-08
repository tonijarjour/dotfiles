;;; ephemeral.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; Opt-in configurations.

;;; Code:

(add-to-list 'auto-mode-alist '("\\.astro\\'" . mhtml-mode))

(tj/install-package 'rust-mode)

;;; ephemeral.el ends here
