

;;;;;;;;;;;;;;;;
;; Appearance ;;
;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;
;; Menubar settings ;;
;;;;;;;;;;;;;;;;;;;;;;

;; Visible? No by default.
(menu-bar-mode -1)  ;; TODO: make yes by default first

;; Divider settings for menubar
(menu-bar-bottom-and-right-window-divider)


;;;;;;;;;;;;;;;;;;;;;;
;; Toolbar settings ;;
;;;;;;;;;;;;;;;;;;;;;;

;; Visible? No by default.
(tool-bar-mode -1)                                     ;; Remove top toolbar

;;;;;;;;;;;;;;;;;;;
;; Text settings ;;
;;;;;;;;;;;;;;;;;;;

;; Font size
(set-face-attribute 'default nil :height 170)          ;; Font size

(scroll-bar-mode -1)                                   ;; Remove scrollbar
(display-line-numbers-mode)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
(column-number-mode t)
;; (set-frame-parameter (selected-frame) 'alpha '(95 50)) ;; Set native alpha transparency
;; (add-to-list 'default-frame-alist '(alpha 95 50))      ;; Is one of these unnecessary?

  ;; Tab bar settings
  (set-face-attribute 'tab-bar-tab nil :inherit 'doom-modeline-panel :foreground nil :background nil)
