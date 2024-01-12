;;; util.el -*- lexical-binding: t; -*-

(defun misenplace/change-window-size-j ()
  "increases window height if window below, decreases otherwise"
  (interactive)
  (if (window-in-direction 'below)
      (evil-window-increase-height 1)
      (evil-window-decrease-height 1)
    )
)


(defun misenplace/change-window-size-k ()
  "decreases window height if window below, increases otherwise"
  (interactive)
  (if (window-in-direction 'below)
      (evil-window-decrease-height 1)
      (evil-window-increase-height 1)
    )
)


(defun misenplace/change-window-size-h ()
  "increases window height if window below, decreases otherwise"
  (interactive)
  (if (window-in-direction 'right)
      (evil-window-decrease-width 1)
      (evil-window-increase-width 1)
    )
)


(defun misenplace/change-window-size-l ()
  "increases window height if window below, decreases otherwise"
  (interactive)
  (if (window-in-direction 'right)
      (evil-window-increase-width 1)
      (evil-window-decrease-width 1)
    )
)




(defun misenplace/increase-treemacs-width ()
  (let ((treemacs-buffer (get-buffer "*Treemacs*")))
    (when (and treemacs-buffer (get-buffer-window treemacs-buffer))
      (let* ((current-width (window-width (get-buffer-window treemacs-buffer)))
             (new-width (+ current-width 10)))
        (enlarge-window-horizontally (- new-width current-width) t)))))




(defun misenplace/decrease-treemacs-width ()
  (let ((treemacs-buffer (get-buffer "*Treemacs*")))
    (when (and treemacs-buffer (get-buffer-window treemacs-buffer))
      (let* ((current-width (window-width (get-buffer-window treemacs-buffer)))
             (new-width (- current-width 10)))
        (enlarge-window-horizontally (- new-width current-width) t)))))









;; (if (window-in-direction 'below)
;;     (message "There is a window below.")
;;   (message "There is no window below."))
