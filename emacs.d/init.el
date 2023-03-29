;;; init.el --- -*- lexical-binding: t -*-

(defun tj/load-config-file (file)
  (load-file (expand-file-name file "~/.emacs.d/")))

(tj/load-config-file "prelude.el")
(tj/load-config-file "packages.el")
(tj/load-config-file "keymaps.el")
