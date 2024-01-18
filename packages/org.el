;;; packages/org.el -*- lexical-binding: t; -*-


;; TODO: investigate org-macs
;; after: org-macs
(use-package! org
   :after ess
   :config
(org-babel-do-load-languages
  'org-babel-load-languages
  '(
    ;; (emacs-lisp . nil)
    ;; (mermaid . t)
    ;; (shell . t)
    (python . t)
    ;; (scheme . t)
    ;; (julia . t)
    (coq . t)
    (C . t)
    (R . t))
    (ipython . t)
  )

)

;; TODO: do these in the above config
(after! org (load-library "ob-R"))
(after! org (load-library "ob-python"))
(after! org (load-library "ob-C"))
;; (after! org (load-library "ob-coq"))
(after! org (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0)))


(use-package! org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

;; TODO: diagnose what's going wrong with polymode...
;; maybe need configs?
(use-package! polymode
  :config
  )

;; (use-package! poly-R
;;   :after polymode
;;   :config
;;   )
;;
;; (use-package! poly-markdown
;;   :after polymode
;;   :config
;;   )
;;
;; (use-package! poly-org
;;   :after polymode
;;   :config
;;   )
