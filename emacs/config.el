;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Andrew Jose"
      user-mail-address "ajosedev@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Fira Code" :size 14))
(setq line-spacing 0.1)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)
(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(global-auto-revert-mode 1)

(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

;; (add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

;; (setq lsp-keep-workspace-alive nil)

;; Fix LSP not using prettier config in TS
(add-hook 'typescript-mode-hook #'format-all-mode)
(setq-hook! 'typescript-mode-hook +format-with-lsp nil)
(add-hook 'typescript-tsx-mode-hook #'format-all-mode)
(setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil)

;; Use goimports on save over gofmt
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;; lsp-doctor fixes
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; evil-multiedit
(map! :nv "s-d" #'evil-multiedit-match-symbol-and-next
      :nv "s-D" #'evil-multiedit-match-symbol-and-prev
      :nv "C-s-d" #'evil-multiedit-match-all)
(setq evil-multiedit-follow-matches 't)

;; fix external keyboard option key not being bound
(setq ns-right-option-modifier 'left)

;; re-open last search
(map! :leader "s ." (cmd! (+ivy/project-search nil (car counsel-git-grep-history))))

;; increase idle delay for company (autocomplete) in markdown-mode
(setq-hook! 'markdown-mode company-idle-delay 0.5)

;; fix flycheck init load times due to flycheck-perform-deferred-syntax-check
;; this in turn runs `eslint --print-config` which can be slow
(with-eval-after-load 'flycheck
  (advice-add 'flycheck-eslint-config-exists-p :override (lambda() t)))

;; dired-subtree
(use-package dired-subtree :ensure t
  :after dired
  :config
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))
