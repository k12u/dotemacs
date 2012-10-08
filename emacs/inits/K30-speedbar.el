 (when window-system
    (speedbar t))
(setq speedbar-mode-hook '(lambda ()
    (interactive)
    (other-frame 0)))
