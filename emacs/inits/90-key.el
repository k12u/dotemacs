;;; global key bindings
(global-set-key "\C-m" 'reindent-then-newline-and-indent)
(global-unset-key "\C-j")
(global-set-key "\C-j" 'join-line)
;(global-set-key [?\C-;] 'iswitchb-buffer)
(define-key global-map [?(J\(B] [?\\])

;(define-key global-map [?(J\(B] [?(J\\(B])
(global-set-key (kbd "C-t") 'other-window-or-split)
(global-set-key [C-delete] '(lambda() (interactive)(kill-buffer (buffer-name))))
(global-set-key [C-kp-delete] '(lambda() (interactive)(kill-buffer (buffer-name))))
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key (kbd "C-1") 'other-frame)
(global-set-key "\C-z" 'scroll-down)
(global-set-key "\C-x." 'comment-dwim)
(global-set-key "\C-xs" '(lambda() (interactive)(switch-to-buffer "*scratch*")))
(global-set-key "\M-l" 'goto-line)
(global-set-key "\M-?" 'help)
(global-set-key "\C-x\C-o" '(lambda() (interactive)(other-window -1)))
(global-set-key "\C-x\C-t" 'magit-status)

;;; debug
(global-set-key "\C-x\C-l" '(lambda() (interactive)(insert-string "use GameConf;use MLog;MLog::write(\"$_::LOG_DIR/kawamoto.debug\", __FILE__ .\":\".__LINE__.\":\".join \"\\t\",);\n")))
(global-set-key "\C-x\C-d" '(lambda() (interactive)(insert-string "use Data::Dumper;\nopen W, \">> /tmp/kawamoto.debug\";\nprint W Dumper();\nclose W;\n")))

;;; kill-buffer
(global-set-key [C-backspace] '(lambda() (interactive)(kill-buffer (buffer-name))))
(define-key global-map "\C-x\C-k" 'kill-buffer)

(global-set-key "\M-m" 
              (lambda () 
                (interactive)
                (if (not (boundp 'my-mark-overlays)) 
                    (setq my-mark-overlays nil))
                (if my-mark-overlays
                    (while my-mark-overlays
                      (delete-overlay (car my-mark-overlays))
                      (setq my-mark-overlays (cdr my-mark-overlays)))
                  (mapcar 
                   '(lambda (m) 
                      (let ((ov (make-overlay (marker-position m) (1+ (marker-position m)))))
                        (overlay-put ov 'display (find-image '((:type xpm :file "right_arrow.xpm" :ascent center))))
                        (setq my-mark-overlays (cons ov my-mark-overlays)))) (cons (mark-marker) mark-ring)))))

(define-key minibuffer-local-completion-map "\C-w" 'backward-kill-word)


;;; windmove
(global-set-key [S-right] 'split-window-horizontally)
(global-set-key [S-left] 'split-window-horizontally)
(define-key global-map [S-up] 'split-window-vertically)
(define-key global-map [S-down] 'delete-other-windows)
(define-key global-map [(C shift n)] 'windmove-down)
(define-key global-map [(C shift p)] 'windmove-up)
(define-key global-map [(C shift b)] 'windmove-left)
(define-key global-map [(C shift f)] 'windmove-right)

(global-set-key [right] 'windmove-right)
(global-set-key [left] 'windmove-left)
(define-key global-map [up] 'windmove-up)
(define-key global-map [down] 'windmove-down)

;; smart exit
(global-set-key "\C-x\C-c" 'confirm-save-buffers-kill-emacs)
(global-set-key "\C-xrN" 'number-rectangle)

(setq ns-command-modifier (quote meta))
;(setq ns-alternate-modifier (quote super))
(setq mac-pass-control-to-system nil)
(setq mac-pass-command-to-system nil)
(setq mac-pass-option-to-system nil)
