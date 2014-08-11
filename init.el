;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require-package 'wgrep)
(require-package 'browse-kill-ring)
(require-package 'bbdb)
(require-package 'helm)
(require 'helm-config)
(helm-mode 1)

(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
(define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point)

(require-package 'auto-complete-clang)
(require-package 'keydef)
(require-package 'lua-mode)
(require-package 'mmm-mode)
(require 'mmm-auto)
(require-package 'oauth2)
(require-package 'session)
(require-package 'yasnippet)
(yas-global-mode)
(setq yas-snippet-dirs
      '("~/system-config/.emacs_d/yasnippet/snippets" "~/system-config/.emacs_d/yasnippet-snippets"))

(browse-kill-ring-default-keybindings)
(require-package 'project-local-variables)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'mwe-log-commands)

(require 'init-frame-hooks)
(require 'init-xterm)
; (require 'init-themes)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-maxframe)
(require 'init-proxies)
(require 'init-dired)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)

(require 'init-recentf)
; (require 'init-ido)
; (require 'init-hippie-expand)
(require 'init-auto-complete)
(require 'init-windows)
; (require 'init-sessions)
(require 'init-fonts)
(require 'init-mmm)

(require 'init-editing-utils)

(require 'init-darcs)
(require 'init-git)

(require 'init-crontab)
(require 'init-textile)
(require 'init-markdown)
(require 'init-csv)
(require 'init-erlang)
(require 'init-javascript)
(require 'init-php)
(require 'init-org)
(require 'init-nxml)
(require 'init-css)
(require 'init-haml)
(require 'init-python-mode)
(require 'init-haskell)
(require 'init-ruby-mode)
(require 'init-rails)
(require 'init-sql)

(require 'init-paredit)
(require 'init-lisp)
(require 'init-slime)
(require 'init-clojure)
(require 'init-common-lisp)

(when *spell-check-support-enabled*
  (require 'init-spelling))

(require 'init-marmalade)
(require 'init-misc)

;; Extra packages which don't require any configuration

(require-package 'gnuplot)
(require-package 'auto-complete-clang)
(require-package 'ac-helm)
(require-package 'lua-mode)
(require-package 'htmlize)
(require-package 'dsvn)
(when *is-a-mac*
  (require-package 'osx-location))
(require-package 'regex-tool)
;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(require 'init-local nil t)

(message "init completed in %.2fms"
         (sanityinc/time-subtract-millis (current-time) before-init-time))


(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End: