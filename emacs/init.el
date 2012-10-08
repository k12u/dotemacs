;; load-path
(setq debug-on-error nil)

(setq user-full-name "KAWAMOTO Minoru")
(setq line-move-visual nil)
(set-language-environment "Japanese")
;(setq add-log-iso8601-with-time-zone t)
(setq add-log-time-format 'current-time-string)
(setq exec-path
        (append
         (list "/usr/local/git/bin") exec-path))

(setenv "PATH"
  (concat
   "/usr/local/git/bin" ":"
   (getenv "PATH")
  )
)
(add-to-list 'load-path "~/.emacs.d/auto-install")

;;; init
(require 'init-loader)
(init-loader-load)

(defalias 'text-mode 'fundamental-mode)

;;; test

(defadvice find-tag (before c-tag-file activate)
  "Automatically create tags file."
  (let ((tag-file (concat default-directory "TAGS")))
    (unless (file-exists-p tag-file)
      (shell-command "etags *.pm .*.pl -o TAGS 2>/dev/null"))
    (visit-tags-table tag-file)))

(defun speedbar-expand-all-lines ()
   "Expand all items in the speedbar buffer.
 But be careful: this opens all the files to parse them."
   (interactive)
   (goto-char (point-min))
   (while (not (eobp))
          (forward-line)
          (speedbar-expand-line)))

(defun outtree ()
  "outline-tree
見出しを別ウィンドウで表示させる.
by yama @ Thu Mar 29 23:37:45 2007"
  (interactive)
  (if 'outline-mode (outline-mode))
  (hide-body)
  (let* ((basename (princ (buffer-name)))
         (newtmp (concat basename "-tree")))
    (if (get-buffer newtmp)
        (unless (get-buffer-window newtmp)
            (split-window-vertically 10)
            (switch-to-buffer newtmp)
            (other-window 1))
      (progn
        (make-indirect-buffer (current-buffer) newtmp)
        (split-window-vertically 10)
        (switch-to-buffer newtmp)
        (if 'outline-mode (outline-mode))
        (hide-sublevels 1)
        (other-window 1)))))

;(require 'ee-autoloads)
	

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cperl-close-pattern-offset -4)
 '(cperl-continued-statement-offset 4)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(indent-tabs-mode nil)
 '(safe-local-variable-values (quote ((c-indentation-style . bsd)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
