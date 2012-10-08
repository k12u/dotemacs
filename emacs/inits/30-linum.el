(dolist (hook (list
              'c-mode-hook
              'cperl-mode-hook
              'emacs-lisp-mode-hook
              'lisp-interaction-mode-hook
              'lisp-mode-hook
              'java-mode-hook
              'sh-mode-hook
              ))
  (add-hook hook (lambda () (linum-mode t))))

