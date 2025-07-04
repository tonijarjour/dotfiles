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

(defun tj/black-format-buffer ()
  "Format the current Python file with Black and reload the buffer."
  (interactive)
  (when (eq major-mode 'python-mode)
    (let ((file (buffer-file-name)))
      (when file
        (save-buffer)  ;; Save before formatting
        (shell-command (format "black %s" (shell-quote-argument file)))
        (revert-buffer :ignore-auto :noconfirm)))))


(message "Terram novam et caelum a Deo")
(setq inhibit-startup-echo-area-message "toni")

;;; init.el ends here
