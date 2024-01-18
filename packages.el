;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! gptel
  :recipe (:host github :repo "karthink/gptel"))

;; https://github.com/jaypei/emacs-neotree
(package! neotree
  :recipe (:host github :repo "jaypei/emacs-neotree"))

;; https://github.com/sabof/org-bullets
(package! org-bullets
  :recipe (:host github :repo "sabof/org-bullets"))

;; https://github.com/karthink/popper
(package! popper
  :recipe (:host github :repo "karthink/popper"))

;; https://github.com/polymode/polymode
(package! polymode
:recipe (:host github :repo "polymode/polymode"))
;; ;; NOTE: make sure to load polymode after org?

;; https://github.com/polymode/polymode-markdown
(package! poly-markdown
  :recipe (:host github :repo "polymode/poly-markdown"))

;; https://github.com/polymode/poly-org
(package! poly-org
  :recipe (:host github :repo "polymode/poly-org"))

;; https://github.com/polymode/poly-R
(package! poly-R
  :recipe (:host github :repo "polymode/poly-R"))

;; https://github.com/emacs-straight/org-mode
(package! org-mode
  :recipe (:host github :repo "emacs-straight/org-mode"))

(package! ess
  :recipe (:host github :repo "emacs-ess/ESS"))


(package! tree-sitter
  :recipe (:host github :repo "emacs-ess/ESS"))
