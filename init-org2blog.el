; @see http://blog.nethazard.net/post-to-wordpress-blogs-with-emacs-org-mode/
(require 'org2blog-autoloads)
; setup proxy
;(setq url-proxy-services '(("http" . "127.0.0.1:8580"))) ; fr*egate
;(setq url-proxy-services '(("http" . "127.0.0.1:8000"))) ; gae
;(setq url-proxy-services '(("http" . "127.0.0.1:8118"))) ; privoxy');
;(setq url-proxy-services '(("http" . "proxy.suzsoft.com:8080"))) ; suzsoft');
(setq org2blog/wp-blog-alist
      '(("wp"
         :url "http://emacsguru.wordpress.com/xmlrpc.php"
         :username "emacsguru"
         :default-title ""
         :default-categories ("Linux")
         :tags-as-categories nil
         )
        ("sinaapp"
         :url "http://liyongping.sinaapp.com/xmlrpc.php"
         :username "admin"
         :default-title ""
         :default-categories ("Linux")
         :tags-as-categories nil
         )
        ))
(define-skeleton iexp
  "Input #+BEGIN_EXAMPLE #+END_EXAMPLE in org-mode"
  ""
  "#+BEGIN_EXAMPLE\n"
  _ "\n"
  "#+END_EXAMPLE"
  )

(provide 'init-org2blog)
