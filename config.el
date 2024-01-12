;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-


(load "/home/jordan/.config/doom/util.el")


(setq doom-leader-key ",")

;; (map! :leader
;;       :desc "Find file" "," #'find-file
;;       :desc "Save buffer" "s" #'save-buffer
;;       :desc "Open terminal" "t" #'+vterm/toggle
;;       ;; Add more keybindings according to your preferences
;;       )

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(load "~/.private/private.el")

(defun hello-world ()
  (interactive)
  (message "Hello, World!"))

(use-package! general
  :config


  (general-define-key ;; global, evil-normal-state - states: normal, visual, insert
     :states '(normal visual insert)
     :keymaps '(global-map evil-normal-state-map override)



     ;; "C-c C-c" 'evilnc-comment-or-uncomment-lines ;; TODO: find a new bind for commenting

     "H-C-=" 'increase-picom-transparency
     "H-C--" 'decrease-picom-transparency
     "C-=" 'text-scale-increase
     "C--" 'text-scale-decrease
     "C-'" 'popper-toggle
     "C-M-'" 'popper-toggle-type
     "C-w" 'tab-bar-close-tab
     "M-1" 'select-tab-first
     "M-2" 'select-tab-second
     "M-3" 'select-tab-third
     "M-4" 'select-tab-fourth
     "M-5" 'select-tab-fifth
     "M-6" 'select-tab-sixth
     "M-7" 'select-tab-seventh
     "M-8" 'select-tab-eighth
     "M-9" 'select-tab-ninth
     "M-C-j" 'evil-window-decrease-height
     "M-C-k" 'evil-window-increase-height
     "M-C-h" 'evil-window-decrease-width
     "M-C-l" 'evil-window-increase-width
     "M-l" 'evil-window-right
     "M-j" 'evil-window-down
     "M-k" 'evil-window-up
     "M-h" 'evil-window-left
     "M-d" 'evil-window-delete
     "M-r" 'tab-bar-rename-tab
     "M-s" 'evil-window-split
     "M-v" 'evil-window-vsplit
     "M-x" 'counsel-M-x
     "M-<iso-lefttab>" 'tab-bar-switch-to-prev-tab
     "M-<tab>" 'tab-bar-switch-to-next-tab
     "M-C-r" 'restart-emacs
     ;; "M-S-h" 'evil-window-delete
     ;; "M-S-l" 'evil-rotate-upwards
     ;; "M-H" 'evil-window-decrease-width
     ;; "M-L" 'evil-window-increase-width
     ;; "M-J" 'evil-window-increase-height
     ;; "M-K" 'evil-window-decrease-height
     ;; "M-H" 'evil-window-decrease-width
     ;; "M-L" 'evil-window-increase-width


     "M-H" 'misenplace/change-window-size-h
     "M-L" 'misenplace/change-window-size-l
     "M-J" 'misenplace/change-window-size-j
     "M-K" 'misenplace/change-window-size-k

     ;; "M-S-k" 'evil-rotate-downwards
     "M-S-<tab>" 'tab-bar-switch-to-prev-tab
     "M-q" 'evil-window-delete
     "C-q" 'evil-delete-buffer
     "C-Q" 'evil-quit
     ;; "C-o" 'gumshoe-persp-backtrack-back
     "C-t" 'tab-bar-new-tab
     ;; "C-i" 'gumshoe-persp-backtrack-forward
     ;; "C-<SPACE>" 'send-line-to-target-process
     "C-<return>" 'send-line-to-target-process
     "C-<tab>" 'tab-bar-switch-to-next-tab
     [(control shift iso-lefttab)] 'tab-bar-switch-to-prev-tab
     "ESC ESC ESC" 'evil-normal-state
     ;; "C-k" 'kill-word
     "C-k" 'projectile-compile-project
     )

  (general-define-key ;; Evil normal and visual mode bindings
     :states '(normal visual)
     :keymaps '(global-map evil-normal-state-map override)
     "q" 'keyboard-escape-quit
     "zj" 'origami-next-fold
     "gl" 'gptel-send
     "zM" 'hs-hide-level
     "zk" 'origami-previous-fold
     "zn" 'origami-next-fold
     "zp" 'origami-previous-fold
     ;; "C-o" 'gumshoe-persp-backtrack-back
     ;; "C-i" 'gumshoe-persp-backtrack-forward
     )

  ;; (general-create-definer my-leader-def
  ;;   :states '(normal insert emacs)
  ;;   :prefix "SPC"
  ;;   :non-normal-prefix "M-SPC")

  ;; (my-leader-def
  ;;   ;; Bind "SPC f" to open the file explorer
  ;;   "aa" 'hello-world
  ;;   ;; Add more keybindings here...
  ;;   )


    (general-define-key ;; global, evil-normal-state- states: normal, visual, insert
       :states '(normal)
       :keymaps '(global-map evil-normal-state-map)
       ;; "f" 'link-hint-open-link ;; TODO: move to org-mode override??
       ;; "C-o" 'gumshoe-persp-backtrack-back
       ;; "C-i" 'gumshoe-persp-backtrack-forward
       )

    (general-define-key ;; global, evil-normal-state - states: normal, visual, insert
       :states '(normal visual insert)
       :keymaps '(global-map evil-normal-state-map override)
       ;; "C-c C-c" 'evilnc-comment-or-uncomment-lines ;; TODO: find a new bind for commenting

     "H-C-=" 'increase-picom-transparency
     "H-C--" 'decrease-picom-transparency
     "C-=" 'text-scale-increase
     "C--" 'text-scale-decrease
     "C-'" 'popper-toggle
     "C-M-'" 'popper-toggle-type
     "C-w" 'tab-bar-close-tab
     "M-1" 'select-tab-first
     "M-2" 'select-tab-second
     "M-3" 'select-tab-third
     "M-4" 'select-tab-fourth
     "M-5" 'select-tab-fifth
     "M-6" 'select-tab-sixth
     "M-7" 'select-tab-seventh
     "M-8" 'select-tab-eighth
     "M-9" 'select-tab-ninth
     "M-C-j" 'evil-window-decrease-height
     "M-C-k" 'evil-window-increase-height
     "M-C-h" 'evil-window-decrease-width
     "M-C-l" 'evil-window-increase-width
     "M-l" 'evil-window-right
     "M-j" 'evil-window-down
     "M-k" 'evil-window-up
     "M-h" 'evil-window-left
     "M-d" 'evil-window-delete
     "M-r" 'tab-bar-rename-tab
     "M-s" 'evil-window-split
     "M-v" 'evil-window-vsplit
     "M-x" 'counsel-M-x
     "M-<iso-lefttab>" 'tab-bar-switch-to-prev-tab
     "M-<tab>" 'tab-bar-switch-to-next-tab
     "M-C-r" 'restart-emacs
     ;; "M-S-h" 'evil-window-delete
     ;; "M-S-l" 'evil-rotate-upwards

     ;; "M-H" 'evil-window-decrease-width
     ;; "M-L" 'evil-window-increase-width
     ;; "M-J" 'evil-window-increase-height
     ;; "M-K" 'evil-window-decrease-height

     "M-H" 'misenplace/change-window-size-h
     "M-L" 'misenplace/change-window-size-l
     "M-J" 'misenplace/change-window-size-j
     "M-K" 'misenplace/change-window-size-k

     ;; "M-S-k" 'evil-rotate-downwards
     "M-S-<tab>" 'tab-bar-switch-to-prev-tab
     "M-q" 'evil-window-delete
     "C-q" 'evil-delete-buffer
     "C-Q" 'evil-quit
     ;; "C-o" 'gumshoe-persp-backtrack-back
     "C-t" 'tab-bar-new-tab
     ;; "C-i" 'gumshoe-persp-backtrack-forward
     ;; "C-<SPACE>" 'send-line-to-target-process
     "C-<return>" 'send-line-to-target-process
     "C-<tab>" 'tab-bar-switch-to-next-tab
     [(control shift iso-lefttab)] 'tab-bar-switch-to-prev-tab
     "ESC ESC ESC" 'evil-normal-state
     ;; "C-k" 'kill-word
     "C-k" 'projectile-compile-project)

    ;; TODO: add override to keymaps?
    (general-define-key ;; evil insert-mode bindings
       :states '(insert)
       :keymaps '(global-map evil-normal-state-map)
       "<tab>" 'self-insert-command
       )

    ;; (global-set-key [(control shift iso-lefttab)] 'tab-previous))

    (general-define-key ;; Evil normal and visual mode bindings
       :states '(normal visual)
       :keymaps '(global-map evil-normal-state-map override)
       "q" 'keyboard-escape-quit
       "zj" 'origami-next-fold
       "gl" 'gptel-send
       "zM" 'hs-hide-level
       "zk" 'origami-previous-fold
       "zn" 'origami-next-fold
       "zp" 'origami-previous-fold
       ;; "C-o" 'gumshoe-persp-backtrack-back
       ;; "C-i" 'gumshoe-persp-backtrack-forward
       )

    (general-define-key ;; treemacs
       :states '(normal visual treemacs)
       :keymaps '(treemacs-mode-map)
       ;; "C-o" 'gumshoe-persp-backtrack-back
       ;; "C-i" 'gumshoe-persp-backtrack-forward
       "C-<tab>" 'tab-bar-switch-to-next-tab
       "M-<tab>" 'tab-bar-switch-to-next-tab
       "M-L" 'treemacs-increase-width
       "M-H" 'treemacs-decrease-width
       "a" 'find-file
       "r" 'treemacs-rename-file
       "l" 'treemacs-toggle-node
       "h" 'treemacs-collapse-parent-node
       "D" 'treemacs-delete-file
       "C-r" 'treemacs-refresh
    )

    (general-define-key ;; company
       :states '(normal visual company)
       :keymaps '(company-active-map company-search-map)
       "C-n" 'company-select-next
       "C-p" 'company-select-previous
       "C-t" 'company-search-toggle-filtering
       )


    (general-define-key ;; lisp interaction
       :states '(normal visual)
       :keymaps '(lisp-interaction-mode-map)
       "M-<RET>" 'eval-defun
       ;; "C-o" 'gumshoe-persp-backtrack-back
       ;; "C-i" 'gumshoe-persp-backtrack-forward
    )

    (general-define-key ;; Treemacs modemap bindings
       :states '(normal visual)
       :keymaps '(treemacs-mode-map)
       "M-l" 'evil-window-right
       "M-d" 'treemacs-quit
    )

    (general-define-key ;; Org-agenda modemap bindings
       :states '(normal visual)
       :keymaps '(org-agenda-mode-map)
       "j" 'org-agenda-next-line
       "k" 'org-agenda-previous-line
    )

    (general-define-key ;; org-super-agenda-header-map
       :states '(normal visual)
       :keymaps '(org-super-agenda-header-map)

       "j" 'org-agenda-next-line
       "k" 'org-agenda-previous-line
    )

    (general-define-key ;; python-mode-map
       :states '(normal visual)
       :keymaps '(sh-mode-map)
       "M-<RET>" '(bg-elpy-shell-send-statement-and-step :which-key "send")
       "C-c C-c" 'org-ctrl-c-ctrl-c
       ;; ",l" '(:ignore t :which-key "Python")
       ;; ",la" '(elpy-goto-assignment :which-key "goto-Assignment")
       )


    (general-define-key ;; python-mode-map
       :states '(normal visual)
       :keymaps '(pdf-view-mode-map)
       ;; "M-<RET>" '(bg-elpy-shell-send-statement-and-step :which-key "send")
       ",w" '(:ignore t :which-key "Window")
       ",wh" '(:ignore t :which-key "left")
       ",wl" '(:ignore t :which-key "right")
       ",wj" '(:ignore t :which-key "down")
       ",wk" '(:ignore t :which-key "up")
       )

    (general-define-key ;; python-mode-map
       :states '(normal visual)
       :keymaps '(image-mode-map)
       ;; "M-<RET>" '(bg-elpy-shell-send-statement-and-step :which-key "send")
       ",w" '(:ignore t :which-key "Window")
       ",wh" '(:ignore t :which-key "left")
       ",wl" '(:ignore t :which-key "right")
       ",wj" '(:ignore t :which-key "down")
       ",wk" '(:ignore t :which-key "up")
       )

    (general-define-key ;; python-mode-map
       :states '(normal visual)
       :keymaps '(c++-mode-map)
       "C-c C-c" 'org-ctrl-c-ctrl-c
       )

    (general-define-key ;; python-mode-map
       :states '(normal visual)
       :keymaps '(python-mode-map)
       ;; "M-<RET>" '(bg-elpy-shell-send-statement-and-step :which-key "send")
       "C-c C-c" 'org-ctrl-c-ctrl-c
       ",l" '(:ignore t :which-key "Python")
       ",la" '(elpy-goto-assignment :which-key "goto-Assignment")
       ",lc" '(elpy-shell-send-defclass-and-step :which-key "send defClass")
       ",ld" '(elpy-goto-definition :which-key "goto-Definition")
       ",le" '(conda-environment-activate :which-key "environment (conda)")
       ",lf" '(elpy-format-code :which-key "Format")
       ;; ",ldI" '(asb-ess-R-object-popup-interactive :which-key "interactive inspect")
       ;; ",ldc" '(asb-ess-R-object-popup-cls :which-key "class")
       ",lh" '(elpy-doc :which-key "Help")
       ",lk" '(elpy-shell-kill :which-key "Kill")
       ;; ",li" '(asb-ess-R-object-popup-str :which-key "inspect")
       ;; ",lI" '(ess-r-devtools-install-package :which-key "install package")
       ;; ",lL" '(ess-r-devtools-install-package :which-key "load package")
       ;; ",lo" '(ess-rdired :which-key "object")
       ;; ",lp" '(:ignore t :which-key "project")
       ;; ",lpb" '(ess-r-devtools-build :which-key "build")
       ;; ",lpc" '(ess-r-devtools-check-package :which-key "check")
       ;; ",lpt" '(ess-r-devtools-test-package :which-key "test")
       ;; ",lq" '(ess-watch-quit :which-key "quit")
       ;; ",lt" '(ess-eval-structure :which-key "structure")
       )


    (general-define-key ;; TeX mode
       :states '(normal visual)
       :keymaps '(TeX-mode-map)
       "C-c C-c" 'org-ctrl-c-ctrl-c
       ",hh" '(TeX-documentation-texdoc :which-key "documentation")
       )


    (general-define-key ;; Racket mode
       :states '(normal visual)
       :keymaps '(racket-mode-map)
       "C-c C-c" 'org-ctrl-c-ctrl-c
       "M-<RET>" 'racket-send-definition
       ",hh" '(racket-repl-describe :which-key "documentation")
       )

    (general-define-key ;; ESS R mode
       :states '(normal visual)
       :keymaps '(ess-r-mode-map)
       "C-c C-c" 'org-ctrl-c-ctrl-c
       "M-<RET>" 'ess-eval-region-or-line-and-step
       "<C-M-return>" 'ess-eval-function-or-paragraph-and-step

       ;; "M-<RET>" 'r-vterm-send-region-or-current-line
       ;; "<C-M-return>" 'r-vterm-send-region-or-current-line


       ",l" '(:ignore t :which-key "R")
       ",ldi" '(asb-ess-R-object-popup-str :which-key "inspect")
       ",ldI" '(asb-ess-R-object-popup-interactive :which-key "interactive inspect")
       ",ldc" '(asb-ess-R-object-popup-cls :which-key "class")
       ",lh" '(ess-display-help-on-object :which-key "help")
       ",li" '(asa-ess-R-object-popup-str :which-key "introspect")
       ",lI" '(ess-r-devtools-install-package :which-key "install package")
       ",lL" '(ess-r-devtools-install-package :which-key "load package")
       ",lo" '(ess-rdired :which-key "object")
       ",lp" '(:ignore t :which-key "project")
       ",lpb" '(ess-r-devtools-build :which-key "build")
       ",lpc" '(ess-r-devtools-check-package :which-key "check")
       ",lpt" '(ess-r-devtools-test-package :which-key "test")
       ",lq" '(ess-watch-quit :which-key "quit")
       ",lt" '(ess-eval-structure :which-key "structure")
       )

    (general-define-key ;; org-mode bindings
       :states '(normal visual)
       :keymaps '(org-mode-map)
       "M-C-<return>" 'org-babel-execute-src-block
       "M-C-e" 'org-latex-export-to-pdf
       "M-o" 'org-open-at-point
       "M-l" 'evil-window-right
       "M-j" 'evil-window-down
       "M-k" 'evil-window-up
       "M-h" 'evil-window-left
       "M-SPC" 'send-line-to-target-process
       )

    (general-define-key ;; python
       :states '(normal visual)
       :keymaps '(python-mode-map)
       "C-c C-c" 'org-ctrl-c-ctrl-c

       ;; General
       "M-<RET>" 'elpy-shell-send-statement-and-step
       )

    (general-define-key ;; python
       :states '(normal visual)
       :keymaps '(python-mode-map)
       :prefix ","

       "C-c C-c" 'org-ctrl-c-ctrl-c
       "c" '(:ignore t :which-key "Python")
       "ca" '(elpy-goto-assignment :which-key "goto-Assignment")
       "c <RET>" '(elpy-shell-send-defclass-and-step :which-key "send defClass")
       "cg" '(:ignore t :which-key "GoTo")
       "cgg" '(elpy-goto-definition :which-key "goto-Definition")
       "ce" '(conda-environment-activate :which-key "environment (conda)")
       "cf" '(elpy-format-code :which-key "Format")
       "ch" '(elpy-doc :which-key "Help")
       "ck" '(elpy-shell-kill :which-key "Kill")

       ;; Tests
       "x" '(:ignore t :which-key "tests")
       "hh" '(elpy-doc :which-key "docs")
       "xx" '(python-pytest-function-dwim :which-key "this")
       "xm" '(python-pytest-dispatch :which-key "menu")
       "xf" '(python-pytest-file :which-key "file"))







    (general-create-definer misenplace/leader-keys
                            :states '(normal insert visual emacs override)
                            :prefix "<SPC>"
                            :global-prefix "C-<SPC>")




(misenplace/leader-keys ;; Leader bindings
     ;; Agenda
     "a" '(:ignore t :which-key "agenda")
     "aa" '(org-agenda :which-key "agenda")
     "as" '(org-schedule :which-key "schedule")
     "an" '(org-projectile-capture-for-current-project :which-key "capture project")
     "ac" '(:ignore t :which-key "clock")
     "acc" '(counsel-org-clock-goto :which-key "clock goto")
     "aci" '(org-clock-in :which-key "clock in")
     "aco" '(org-clock-out :which-key "clock out")
     "ach" '(counsel-org-clock-history :which-key "clock history")
     "ag" '(:ignore t :which-key "goto")
     "agp" '(org-projectile-goto-location-for-project :which-key "project org")
     "at" '(org-todo :which-key "todo")
     "ap" '(org-pomodoro :which-key "pomodoro")

     ;; Buffers
     "b" '(:ignore t :which-key "buffers")
     "bb" '(persp-counsel-switch-buffer :which-key "find")
     "bB" '(switch-to-buffer :which-key "Find")
     "bc" '(evil-buffer-new :which-key "create")
     "bl" '(next-buffer :which-key "next")
     "bp" '(previous-buffer :which-key "previous")
     "bn" '(evil-next-buffer :which-key "next")
     "bp" '(evil-previous-buffer :which-key "previous")
     "bd" '(evil-delete-buffer :which-key "delete")
     "br" '(rename-buffer :which-key "rename")
     "bs" '(scratch-buffer :which-key "scratch")
     "bR" '(modi/revert-all-file-buffers :which-key "revert all")

     ;; Dumb-jump
     "c" '(:ignore t :which-key "code")
     "cc" '(counsel-imenu :which-key "go")

     ;; Dumb-jump
     "d" '(:ignore t :which-key "dumb-jump")
     "dd" '(evil-goto-definition :which-key "go")
     "db" '(dumb-jump-back :which-key "back")
     "do" '(dumb-jump-go-other-window :which-key "go other")
     "dq" '(dumb-jump-quick-look :which-key "quick-look")

     ;; Errors
     "e" '(:ignore t :which-key "errors")
     "ee" '(flycheck-list-errors :which-key "goto")
     "e/" '(counsel-flycheck :which-key "counsel")
     "ej" '(flycheck-next-error :which-key "next")
     "en" '(flycheck-next-error :which-key "next")
     "ek" '(flycheck-previous-error :which-key "previous")
     "ep" '(flycheck-previous-error :which-key "previous")

     ;; Files
     "f" '(:ignore t :which-key "files")
     "ff" '(treemacs :which-key "menu")
     "fc" '(treemacs-create-file :which-key "create file")
     "fC" '(treemacs-create-dir :which-key "create dir")
     "fd" '(treemacs-delete :which-key "delete")
     "fe" '(:ignore t :which-key "edit")
     "fea" '(edit-awesomerc :which-key "awesomerc")
     "feb" '(edit-bashrc :which-key "bashrc")
     "fee" '(edit-config :which-key "emacsrc")
     "feq" '(edit-qutebrowser :which-key "qutebrowserrc")
     "fer" '(reload-config :which-key "reload emacs")
     "fev" '(edit-vimrc :which-key "vimrc")
     "fey" '(edit-yas-config :which-key "yasrc")
     "fq" '(treemacs-quit :which-key "quit")
     "fs" '(treemacs-visit-node-horizontal-split :which-key "split")
     "fv" '(treemacs-visit-node-vertical-split :which-key "vsplit")

     ;; Git
     "g" '(:ignore t :which-key "git")
     "gb" '(magit-branch :which-key "branch-switch")
     "gB" '(magit-branch-create :which-key "branch-create")
     "gc" '(magit-commit :which-key "commit")
     "gj" '(git-gutter:next-diff :which-key "next-diff")
     "gg" '(magit-status :which-key "status")
     "gk" '(git-gutter:previous-diff :which-key "previous-diff")
     "gl" '(magit-log :which-key "log")
     "gn" '(git-gutter:next-diff :which-key "next-diff")
     "gp" '(git-gutter:previous-diff :which-key "previous-diff")
     "gs" '(git-gutter:stage-hunk :which-key "stage hunk")
     "gS" '(magit-stage :which-key "stage")
     "gU" '(magit-unstage :which-key "unstage")
     "g<" '(magit-pull :which-key "pull")
     "g>" '(magit-push :which-key "push")

     ;; Help
     "h" '(:ignore t :which-key "help")
     "hc" '(counsel-cheatsheets :which-key "cheatsheets")
     "hm" '(describe-mode :which-key "mode")
     "hk" '(describe-key :which-key "key")
     "hf" '(counsel-describe-function :which-key "function")
     "hv" '(counsel-describe-variable :which-key "variable")
     "hs" '(counsel-describe-symbol :which-key "symbol")

     ;; Imenu
     "i" '(:ignore t :which-key "imenu")
     "ii" '(imenu-list :which-key "list")

     ;; Jump
     "j" '(:ignore t :which-key "jump")
     "jb" '(counsel-cheatsheets :which-key "back")
     "jd" '(dumb-jump-go :which-key "definition")
     "jt" '(projectile-find-tag :which-key "tag")
     "jj" '(evil-ace-jump-char-mode :which-key "jump")
     "jw" '(evil-ace-jump-word-mode :which-key "word")
     "jl" '(evil-ace-jump-line-mode :which-key "line")

     "ll" '(lsp-ui-imenu :which-key "lsp imenu")
     "lL" '(lsp-ui-imenu--refresh :which-key "lsp imenu")

     "ml" '(hide-mode-line-mode :which-key "toggle mode line")

     ;; Org
     "o" '(:ignore t :which-key "org")
     "oa" '(:ignore t :which-key "agenda")
     "oas" '(org-schedule :which-key "schedule")
     "oad" '(org-deadline :which-key "deadline")
     "oap" '(org-set-property :which-key "property")
     "od" '(deft :which-key "deft")
     "oc" '(:ignore t :which-key "capture/clock")
     "occ" '(org-capture :which-key "capture")
     "oci" '(org-clock-in :which-key "clock-in")
     "oco" '(org-clock-out :which-key "clock-out")
     "or" '(:ignore t :which-key "ref")
     "orr" '(org-ref-insert-link :which-key "search")

     ;; Projects
     "p" '(:ignore t :which-key "projects")
     "pA" '(projectile-add-known-project :which-key "add")
     "pa" '(counsel-projectile-org-agenda :which-key "agenda")
     "pc" '(counsel-projectile-org-capture :which-key "capture")
     "pd" '(counsel-projectile-find-dir :which-key "directory")
     "pm" '(projectile-compile-project :which-key "compile")
     "po" '(projectile-persp-switch-project :which-key "open")
     "pp" '(persp-switch :which-key "switch")
     "pf" '(counsel-projectile-find-file :which-key "file")
     ;; "pq" '(projectile-kill-buffers :which-key "quit")
     "pq" '(persp-kill :which-key "quit")
     "pr" '(counsel-projectile-rg :which-key "ripgrep")
     "ps" '(projectile-run-vterm :which-key "shell")
     "pt" '(:ignore t :which-key "test")
     "ptt" '(projectile-test-project :which-key "test all")
     "ptt" '(projectile-find-test-file :which-key "file")
     "pT" '(:ignore t :which-key "tags")
     "pTT" '(projectile-find-tag :which-key "find")
     "pTr" '(projectile-tag-regenerate :which-key "regenerate")
     ;; (define-key my-leader-map "p[" 'projectile-previous-project-buffer)
     ;; (define-key my-leader-map "p]" 'projectile-next-project-buffer)


     "q" '(:ignore t :which-key "quit")
     "qq" '(save-buffers-kill-terminal :which-key "find-node")



     "r" '(:ignore t :which-key "roam")
     "rr" '(org-roam-node-find :which-key "find-node")
     "rc" '(org-roam-capture :which-key "capture")
     "ri" '(org-roam-node-insert :which-key "insert")
     "rg" '(org-roam-graph :which-key "graph")
     "rs" '(org-roam-db-sync :which-key "sync")
     "rd" '(:ignore t :which-key "dailies")
     "rdc" '(org-roam-dailies-capture-today :which-key "capture")
     "rdf" '(org-roam-dailies-find-today :which-key "find")

     ;; Todos
     "t" '(:ignore t :which-key "todos")
     "tt" '(ivy-magit-todos :which-key "goto")

     ;; Tabs
     "TAB" '(:ignore t :which-key "Tabs")
     "TAB TAB" '(tab-bar-select-tab-by-name :which-key "Goto")
     "TAB T" '(toggle-tab-bar-mode-from-frame :which-key "toggle from frame")
     "TAB d" '(tab-bar-close-tab :which-key "Delete")
     "TAB c" '(tab-bar-new-tab :which-key "Create")
     "TAB n" '(tab-bar-new-tab :which-key "New")
     "TAB l" '(tab-bar-switch-to-next-tab :which-key "Next")
     "TAB h" '(tab-bar-switch-to-prev-tab :which-key "Previous")
     "TAB r" '(tab-bar-rename-tab :which-key "Rename")
     "TAB L" '(tab-bar-move-tab :which-key "Move Right")

     ;; UI
     "u" '(:ignore t :which-key "ui")
     "ud" '(day :which-key "Day Theme")
     "uD" '(dusk :which-key "Dusk Theme")
     "ue" '(evening :which-key "Evening Theme")
     "un" '(night :which-key "Night Theme")
     "us" '(hydra-text-scale/body :which-key "scale text")
     "ut" '(:ignore t :which-key "toggle")
     "uT" '(counsel-load-theme :which-key "Theme")
     "utt" '(toggle-transparency :which-key "toggle transparency")
     "utm" '(hide-mode-line-mode :which-key "toggle mode line")
     "utM" '(toggle-menu-bar-from-frame :which-key "toggle menu bar")
     "uu" '(toggle-dark-mode :which-key "toggle dark mode")

     ;; Windows
     "w" '(:ignore t :which-key "window")
     "wd" '(evil-window-delete :which-key "delete")
     "wD" '(ace-delete-window :which-key "Delete")
     "wh" '(evil-window-left :which-key "left")
     "wn" '(evil-window-new :which-key "new")
     "wj" '(evil-window-down :which-key "down")
     "wk" '(evil-window-up :which-key "up")
     "wl" '(evil-window-right :which-key "right")
     "wm" '(maximize-window :which-key "maximize")
     "wM" '(minimize-window :which-key "minimize")
     ;; "wp" '(:ignore t :which-key "perspective")
     "wp" '(persp-switch :which-key "switch")
     "wu" '(winner-undo :which-key "winner-undo")
     "wv" '(evil-window-vsplit :which-key "vsplit")
     "wr" '(winner-redo :which-key "winner-redo")
     "ws" '(evil-window-split :which-key "split")
     "wS" '(ace-swap-window :which-key "swap")
     "ww" '(ace-window :which-key "window")
     "w-" '(evil-window-split :which-key "split")
     "w|" '(evil-window-vsplit :which-key "vsplit")
     "w|" '(balance-windows :which-key "balance")
     "w>" '(hydra-window-resize/body :which-key "hydra")

     ;; Snippets
     "y" '(:ignore t :which-key "yasnippets")
     "yy" '(yas-insert-snippet :which-key "insert snippet")
     "yc" '(yas-new-snippet :which-key "new snippet")
     "ye" '(yas-visit-snippet-file :which-key "new snippet")

     ;; Folds
     "z" '(:ignore t :which-key "folds")
     "zz" '(origami-toggle-node :which-key "toggle fold")
     "za" '(origami-toggle-node :which-key "toggle fold")
     "zj" '(origami-next-fold :which-key "next fold")
     "zk" '(origami-previous-fold :which-key "previous fold")
     "zn" '(origami-next-fold :which-key "next fold")
     "zp" '(origami-previous-fold :which-key "previous fold")
     "zr" '(origami-open-all-nodes :which-key "open all folds")
     "zm" '(origami-close-all-nodes :which-key "close all folds")
     "zM" '(hs-hide-level :which-key "close all at level")

     )
  )

(use-package! neotree
  :config)


;; (use-package! treemacs-projectile
;;   :after (:all treemacs projectile))

;; (use-package! treemacs-perspective
;;   :after (:all treemacs perspective)
;;   :config
;;   (treemacs-set-scope-type 'Perspectives))

;; (use-package persp-projectile
;   :after perspective, projectile, counsel-projectile
;   :config
;
;	(defun my-ignore-buffer-predicate (buffer)
;	"Predicate function to ignore specific buffers."
;	(let ((buffer-name (buffer-name buffer)))
;	    (or (string-match-p "^\\*.*\\*$" buffer-name) ; Ignore all buffers with names starting and ending with "*"
;		(string-match-p "\\.log\\'" buffer-name)))) ; Ignore buffers ending with ".log"
;
;	(setq persp-ignore-buffer-predicate 'my-ignore-buffer-predicate)
;
;
;
;; ; ; ; ; ; ; ; ; ; ; ; ; ; )
;; (use-package! perspective
;;   :custom
;;   (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
;;
;;   :config
;;   (persp-mode))


;; TODO: process these below
;; (use-package treemacs
;;    :straight '(treemacs
;;               :type git
;;               :host github
;;               :repo "Alexander-Miller/treemacs")
;;    :after perspective
;;    :config
;; (defun my-treemacs-hide-filetypes (file-path _)
;;   "Predicate function to hide specific filetypes in treemacs."
;;   (let ((file-ext (file-name-extension file-path)))
;;     (or (string-equal file-ext "elc") ;; Add any other treemacs hidden  here
;; 	)))
;; (add-to-list 'treemacs-ignored-file-predicates #'my-treemacs-hide-filetypes))
;;
;; (use-package treemacs-projectile
;;   :straight t
;;   :after (:all treemacs projectile)
;;   )
;; (use-package treemacs-perspective
;;   :straight t
;;   :after (:all treemacs perspective)
;;   :config
;;   (treemacs-set-scope-type 'Perspectives)
;;   )





;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
