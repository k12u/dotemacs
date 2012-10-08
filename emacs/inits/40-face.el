;;; color-theme
(setq color-theme-is-global t)
(require 'color-theme)
(set-face-italic-p 'font-lock-comment-face nil)
(setq color-theme-is-global t)
(if (fboundp 'color-theme-initialize) (color-theme-initialize))
;(color-theme-dark-laptop)  ; hashが見にくい
;(color-theme-tango)     ; commentが見にくい
(color-theme-midnight)     ; commentが見にくい
(setq color-theme-is-global t)
(set-face-italic-p 'font-lock-comment-face nil)
;(set-face-italic-p 'cperl-hash-face nil)

(defun apply-color-theme (frame)
  "Apply color theme to a frame based on whether its a 'real'
   window or a console window."
  (select-frame frame)
  (color-theme-midnight)
  (set-face-italic-p 'font-lock-comment-face nil)
  )

(setq color-theme-is-global nil)
(add-hook 'after-make-frame-functions 'apply-color-theme)

(when (boundp 'show-trailing-whitespace) (setq-default show-trailing-whitespace t))
;; タブ, 全角スペース、改行直前の半角スペースを表示する
(when (require 'jaspace nil t)
  (when (boundp 'jaspace-modes)
    (setq jaspace-modes (append jaspace-modes
                                (list 'php-mode
                                      'yaml-mode
                                      'javascript-mode
                                      'ruby-mode
                                      'text-mode
                                      'cperl-mode
                                      'conf-mode
                                      'lisp-mode
                                      'lisp-interaction-mode
                                      'fundamental-mode))))
  (when (boundp 'jaspace-alternate-jaspace-string)
    (setq jaspace-alternate-jaspace-string "□"))
  (when (boundp 'jaspace-highlight-tabs)
    (setq jaspace-highlight-tabs ?^))
  (add-hook 'jaspace-mode-off-hook
            (lambda()
              (when (boundp 'show-trailing-whitespace)
                (setq show-trailing-whitespace nil))))
  (add-hook 'jaspace-mode-hook
            (lambda()
              (progn
                (when (boundp 'show-trailing-whitespace)
                  (setq show-trailing-whitespace t))
                (face-spec-set 'jaspace-highlight-jaspace-face
                               '((((class color) (background light))
                                  (:foreground "blue"))
                                 (t (:foreground "green"))))
                (face-spec-set 'jaspace-highlight-tab-face
                               '((((class color) (background light))
                                  (:foreground "red"
                                   :background "unspecified"
                                   :strike-through nil
                                   :underline t))
                                 (t (:foreground "purple"
                                     :background "unspecified"
                                     :strike-through nil
                                     :underline t))))
                (face-spec-set 'trailing-whitespace
                               '((((class color) (background light))
                                  (:foreground "red"
                                   :background "unspecified"
                                   :strike-through nil
                                   :underline t))
                                 (t (:foreground "purple"
                                     :background "unspecified"
                                     :strike-through nil
                                     :underline t))))))))

(when (>= emacs-major-version 23)
 (set-face-attribute 'default nil
                     :family "monaco"
                     :height 140)
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0208
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0212
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'mule-unicode-0100-24ff
  '("monaco" . "iso10646-1"))
 (setq face-font-rescale-alist
      '(("^-apple-hiragino.*" . 1.2)
        (".*osaka-bold.*" . 1.2)
        (".*osaka-medium.*" . 1.2)
        (".*courier-bold-.*-mac-roman" . 1.0)
        (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
        (".*monaco-bold-.*-mac-roman" . 0.9)
        ("-cdac$" . 1.3))))


;(create-fontset-from-ascii-font "Inconsolata-14:weight=normal:slant=normal" nil "Inconsolata")
;(set-default-font "Inconsolata-14")
;(set-fontset-font (frame-parameter nil 'font)
;                  'japanese-jisx0208
;                  '("Hiragino Kaku Gothic ProN" . "unicode-bmp"))
