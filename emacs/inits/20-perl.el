;;; perl
(defalias 'perl-mode 'cperl-mode)

(defvar cperl-imenu-generic-expression
 '(;; Functions
   (nil "^sub\\s-+\\([-A-Za-z0-9+_:]+\\)" 1)
   ;;Variables
   ("Variables" "^\\([$@%][-A-Za-z0-9+_:]+\\)\\s-*=" 1)
   ("Packages" "^package\\s-+\\([-A-Za-z0-9+_:]+\\);" 1)
   ("Doc sections" "^=head[0-9][ \t]+\\(.*\\)" 1))
 "Imenu generic expression for Perl mode.  See `imenu-generic-expression'.")

(custom-set-variables
'(cperl-close-pattern-offset -4)
'(cperl-continued-statement-offset 4)
'(cperl-indent-level 4)
'(cperl-indent-parens-as-block t)
;'(cperl-tab-always-indent nil)
'(indent-tabs-mode nil)
)

(defun perl-eval(beg end)
  (interactive "r")
  (save-excursion
  (kill-ring-save beg end)
  (switch-to-buffer "*perl-eval*")
  (beginning-of-buffer)
  (end-of-buffer)
  (delete-region (mark) (point))
  (insert "use Data::Dumper;\n")
  (yank)
  (beginning-of-buffer)
  (end-of-buffer)
  (shell-command-on-region (mark) (point) "perl")
  (bury-buffer)
  ))

;; ;;; cperl-outline
;; ;;; http://www.emacswiki.org/emacs/CPerlModeOutlineMode
;; (require 'outline)
;; ; Outline-minor-mode key map
;; (define-prefix-command 'cm-map nil "Outline-")
;; ; HIDE
;; (define-key cm-map "q" 'hide-sublevels)    ; Hide everything but the top-level headings
;; (define-key cm-map "t" 'hide-body)         ; Hide everything but headings (all body lines)
;; (define-key cm-map "o" 'hide-other)        ; Hide other branches
;; (define-key cm-map "c" 'hide-entry)        ; Hide this entry's body
;; (define-key cm-map "l" 'hide-leaves)       ; Hide body lines in this entry and sub-entries
;; (define-key cm-map "d" 'hide-subtree)      ; Hide everything in this entry and sub-entries
;; ; SHOW
;; (define-key cm-map "a" 'show-all)          ; Show (expand) everything
;; (define-key cm-map "e" 'show-entry)        ; Show this heading's body
;; (define-key cm-map "i" 'show-children)     ; Show this heading's immediate child sub-headings
;; (define-key cm-map "k" 'show-branches)     ; Show all sub-headings under this heading
;; (define-key cm-map "s" 'show-subtree)      ; Show (expand) everything in this heading & below
;; ; MOVE
;; (define-key cm-map "u" 'outline-up-heading)                ; Up
;; (define-key cm-map "n" 'outline-next-visible-heading)      ; Next
;; (define-key cm-map "p" 'outline-previous-visible-heading)  ; Previous
;; (define-key cm-map "f" 'outline-forward-same-level)        ; Forward - same level
;; (define-key cm-map "b" 'outline-backward-same-level)       ; Backward - same level
;; (global-set-key "\M-o" cm-map)

;; (setq my-cperl-outline-regexp
;;       (concat
;;        "^"                              ; Start of line
;;        "[ \\t]*"                        ; Skip leading whitespace
;;        "\\("                            ; begin capture group \1
;;        (join "\\|"
;;              "=head[12]"                  ; POD header
;;              "package"                    ; package
;;              "=item"                      ; POD item
;;              "sub"                        ; subroutine definition
;;            )
;;        "\\)"                            ; end capture group \1
;;        "\\b"                            ; Word boundary
;;        ))

;; ;(add-hook cperl-mode-hook 'my-cperl-customizations)

(defun my-cperl-customizations ()
  "cperl-mode customizations that must be done after cperl-mode loads"
;  (outline-minor-mode)
  (abbrev-mode)

;;   (defun cperl-outline-level ()
;;     (looking-at outline-regexp)
;;     (let ((match (match-string 1)))
;;       (cond
;;        ((eq match "=head1" ) 1)
;;        ((eq match "package") 2)
;;        ((eq match "=head2" ) 3)
;;        ((eq match "=item"  ) 4)
;;        ((eq match "sub"    ) 5)
;;        (t 7)
;;        )))

;;   (setq cperl-outline-regexp  my-cperl-outline-regexp)
;;   (setq outline-regexp        cperl-outline-regexp)
;;   (setq outline-level        'cperl-outline-level)
  )

(add-hook 'cperl-mode-hook
          '(lambda ()
             (progn
               ;(setq indent-tabs-mode nil)
               (setq tab-width 4)
 
               ; perl-completion
                (require 'auto-complete)
                (require 'perl-completion)
		(my-cperl-customizations)
;;                (perl-completion-mode t)
;; 	       (add-to-list 'ac-sources 'ac-source-perl-completion)
;; 	       (set (make-local-variable 'imenu-generic-expression)
;; 		    cperl-imenu-generic-expression)
	       ;(define-key cperl-mode-map "\C-c\C-e" 'perl-eval)
              )))


(setq auto-mode-alist
      (append '(
                ("\\.t\\'" . cperl-mode)
                ("\\.conf\\'" . cperl-mode)
		)
              auto-mode-alist))
