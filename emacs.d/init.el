;;; init.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; Load configuration modules.

;;; Code:

(defun tj/load-config-file (file)
  "Load elisp FILE."
  (load (expand-file-name file "~/.emacs.d/")))

(tj/load-config-file "prelude")
(tj/load-config-file "packages")
(tj/load-config-file "keymaps")
(tj/load-config-file "org")

;;; init.el ends here
