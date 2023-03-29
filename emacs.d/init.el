;;; init.el --- -*- lexical-binding: t -*-

(defun tj/load-config-file (file)
  (load (expand-file-name file "~/.emacs.d/")))

(tj/load-config-file "prelude")
(tj/load-config-file "packages")
(tj/load-config-file "keymaps")

(provide 'init)
;;; init.el ends here
