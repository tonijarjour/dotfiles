;;; init.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; Load configuration modules.

;;; Code:

(defun tj/load-config-file (file)
  "Load elisp FILE."
  (load (expand-file-name file "~/.emacs.d/")))

(tj/load-config-file "settings")
(tj/load-config-file "packages")
(tj/load-config-file "keymaps")

(message "Terram novam et caelum a Deo")
(setq inhibit-startup-echo-area-message "toni")

;;; init.el ends here
