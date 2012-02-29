;the default emacs's settings

;remove toolbar
;(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;================全屏与最大化============================
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
(defun my-maximized-horz ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(defun my-maximized-vert ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
(defun my-maximized ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(my-maximized)

;====================定义C-l为新建一行，并且光标移到新行中====================
(defun my-new-line-and-indent (arg)
  (interactive "^p")
  (or arg (setq arg 1))
  (let (done)
    (while (not done)
      (let ((newpos
         (save-excursion
           (let ((goal-column 0)
             (line-move-visual nil))
         (and (line-move arg t)
              (not (bobp))
              (progn
            (while (and (not (bobp)) (invisible-p (1- (point))))
              (goto-char (previous-single-char-property-change
                                      (point) 'invisible)))
            (backward-char 1)))
         (point)))))
    (goto-char newpos)
    (if (and (> (point) newpos)
         (eq (preceding-char) ?\n))
        (backward-char 1)
      (if (and (> (point) newpos) (not (eobp))
           (not (eq (following-char) ?\n)))
          ;; If we skipped something intangible and now we're not
          ;; really at eol, keep going.
          (setq arg 1)
        (setq done t))))))
  (newline-and-indent))

(global-set-key (kbd "C-l") 'my-new-line-and-indent)

(provide 'init-emacs)

