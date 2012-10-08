(system-name)
;;; mac env.
(setq mac-option-modifier 'meta)

(define-key global-map [?¥] [?\\])
(if (boundp 'window-system)
    (setq initial-frame-alist
	  (cond 
	   ((string-equal system-name "51271-mac.dena.local")
	    
	    (append (list
;;                    '(foreground-color . "azure3") ;; 文字が白
;;                    '(background-color . "black") ;; 背景は黒
;;                    '(border-color     . "black")
;;                    '(mouse-color      . "white")
;;                    '(cursor-color     . "white")
;;                    '(cursor-type      . box)
		     '(vertical-scroll-bars . nil) ;;スクロールバーはいらない
		     '(width . 260) ;; ウィンドウ幅
		     '(height . 70) ;; ウィンドウの高さ
		     '(top . 20) ;;表示位置
                     '(left . 10) ;;表示位置
		     '(alpha . 80)
		     )
		    initial-frame-alist))
	   ((string-match "^58325-" system-name)
	    (append (list
;;                    '(foreground-color . "azure3") ;; 文字が白
;;                    '(background-color . "black") ;; 背景は黒
;;                    '(border-color     . "black")
;;                    '(mouse-color      . "white")
;;                    '(cursor-color     . "white")
;;                    '(cursor-type      . box)
		     '(vertical-scroll-bars . nil) ;;スクロールバーはいらない
		     '(width . 180) ;; ウィンドウ幅
		     '(height . 43) ;; ウィンドウの高さ
		     '(top . 20) ;;表示位置
		     '(left . 10) ;;表示位置
		     )
		    initial-frame-alist))
	   (t
	    (append (list
;;                    '(foreground-color . "azure3") ;; 文字が白
;;                    '(background-color . "black") ;; 背景は黒
;;                    '(border-color     . "black")
;;                    '(mouse-color      . "white")
;;                    '(cursor-color     . "white")
;;                    '(cursor-type      . box)
		     '(vertical-scroll-bars . nil) ;;スクロールバーはいらない
		     '(width . 180) ;; ウィンドウ幅
		     '(height . 30) ;; ウィンドウの高さ
		     '(top . 20) ;;表示位置
		     '(left . 10) ;;表示位置
		     )
		    initial-frame-alist)))))

(setq default-frame-alist initial-frame-alist)
