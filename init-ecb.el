(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/ecb-2.40"))

(require 'ecb)

;fix bug: ECB 2.40 - Error: Can't use winner-mode functions in the ecb-frame.
(add-hook 'ecb-activate-hook 
      '(lambda ()
         (ecb-disable-advices 'ecb-winman-not-supported-function-advices t)))
;(ecb-activate)

(provide 'init-ecb)


