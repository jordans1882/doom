;;; modes/init.el -*- lexical-binding: t; -*-

(load! "/home/jordan/.config/doom/modes/help.el")


;; TODO: process below

  ;; hide-show config
  ;; Mode hooks
  (add-hook 'python-mode-hook 'hs-minor-mode)

  ;; (add-to-list 'auto-mode-alist '("\\.tex\\'" . Tex-mode))
  ;;(dolist (hook '(Tex-latex-mode-hook))
  ;;(add-hook hook (lambda () (flyspell-mode 1))))

  ;; If you use tex-mode
  ;; (require 'tex-mode)`
  ;; (add-hook 'latex-mode-hook 'flyspell-mode)

  ;; If you use AUCTeX
  ;; (load "auctex.el" nil t t)`
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'python-mode-hook 'flyspell-prog-mode)



  (add-hook 'lisp-interaction-mode-hook 'company-mode)

  ;; Filetype modes
  (add-to-list 'auto-mode-alist '("\\.el\\'" . lisp-interaction-mode))


  ;; Tramp config
  (setq tramp-default-method "ssh")

  ;; Language mode configs - Java
  (add-hook 'java-mode-hook 'hs-minor-mode)
