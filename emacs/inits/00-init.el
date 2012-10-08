(setq inhibit-splash-screen t) 
(setq inhibit-startup-message t) 
(setq initial-scratch-message "")

;;; misc
(transient-mark-mode 1)

;;; backup
(setq make-backup-files t)
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))

;;; toolbar
(tool-bar-mode 0)
(column-number-mode 1)

;;; smart exit
(defun confirm-save-buffers-kill-emacs ()
  (interactive)
  (if (y-or-n-p "quit emacs? ")
    (save-buffers-kill-emacs)))

;;; common macro
(defmacro join (join-char &rest others) `(mapconcat 'identity ',others ,join-char))

(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))

(eval-when-compile (require 'cl))
(defun number-rectangle (start end format-string from)
  "Delete (don't save) text in the region-rectangle, then number it."
  (interactive
   (list (region-beginning) (region-end)
         (read-string "Number rectangle: " (if (looking-back "^ *") "%d. " "%d"))
         (read-number "From: " 1)))
  (save-excursion
    (goto-char start)
    (setq start (point-marker))
    (goto-char end)
    (setq end (point-marker))
    (delete-rectangle start end)
    (goto-char start)
    (loop with column = (current-column)
          while (<= (point) end)
          for i from from   do
          (insert (format format-string i))
          (forward-line 1)
          (move-to-column column)))
  (goto-char start))

(add-hook 'window-setup-hook
          (lambda ()
            (modify-frame-parameters (selected-frame) initial-frame-alist)))

