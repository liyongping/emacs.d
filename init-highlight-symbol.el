(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/highlight-symbol"))

(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
;(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)

(provide 'init-highlight-symbol)
