;;; options.el -*- lexical-binding: t; -*-


(setq initial-major-mode 'lisp-interaction-mode)
(setq initial-scratch-message nil)

(setq display-line-numbers-type t)
(setq org-directory "~/org/")

(menu-bar-mode -1)  ;; Menubar off
(tool-bar-mode -1)  ;; Toolbar off

  ;; Set Warning Level
  ;; (setq warning-minimum-level :emergency)


(global-auto-revert-mode t)


;; Functionality
(setq require-final-newline nil)
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves"))) ;; Set backups directory
(setq auto-save-file-name-transforms                   ;; Set autosave directory
`((".*" "~/.emacs.d/auto-saves/" t)))
(setq tab-bar-select-tab-modifiers "meta")

(generate-new-buffer "*std-err*")
